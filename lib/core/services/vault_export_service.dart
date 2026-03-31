import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
import 'package:injectable/injectable.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';

import '../../features/credentials/domain/entities/credential.dart';
import '../../features/credentials/domain/repositories/i_credential_repository.dart';
import '../../features/folders/domain/entities/folder.dart';
import '../../features/folders/domain/repositories/i_folder_repository.dart';
import '../infrastructure/security/i_security_service.dart';
import '../infrastructure/security/session_manager.dart';

/// Encrypted vault export/import service.
/// Format: AES-256-GCM( JSON({ credentials, folders, exportedAt }) )
/// File extension: .vgvault
@lazySingleton
class VaultExportService {
  VaultExportService(
    this._credRepo,
    this._folderRepo,
    this._security,
    this._session,
  );

  final ICredentialRepository _credRepo;
  final IFolderRepository _folderRepo;
  final ISecurityService _security;
  final SessionManager _session;

  static const _magic = 'VGVAULT1';

  /// Exports all credentials and folders to an encrypted .vgvault file.
  /// Returns the file path shared.
  Future<void> exportVault() async {
    final key = _session.getKeyCopy();
    if (key == null) throw StateError('Vault is locked');

    final credentials = await _credRepo.getAll();
    final folders = await _folderRepo.getAll();

    final payload = jsonEncode({
      'exportedAt': DateTime.now().toIso8601String(),
      'credentials': credentials.map((c) => c.toJson()).toList(),
      'folders': folders.map((f) => f.toJson()).toList(),
    });

    final encrypted = await _security.encrypt(
      Uint8List.fromList(utf8.encode(payload)),
      key,
    );

    // Prepend magic bytes so we can validate on import
    final magic = utf8.encode(_magic);
    final fileBytes = Uint8List(magic.length + encrypted.length);
    fileBytes.setAll(0, magic);
    fileBytes.setAll(magic.length, encrypted);

    final dir = await getTemporaryDirectory();
    final ts = DateTime.now().millisecondsSinceEpoch;
    final file = File('${dir.path}/vaultguard_$ts.vgvault');
    await file.writeAsBytes(fileBytes);

    // SEC-002: Eliminar el archivo temporal tras compartirlo para no
    // dejar datos cifrados accesibles en el sistema de archivos.
    try {
      await SharePlus.instance.share(
        ShareParams(
          files: [XFile(file.path)],
          subject: 'VaultGuard Backup',
        ),
      );
    } finally {
      if (await file.exists()) await file.delete();
    }
  }

  /// Imports credentials from a .vgvault file.
  /// [mode]: 'merge' (keep existing, add new) or 'replace' (wipe then import).
  Future<ImportResult> importVault({String mode = 'merge'}) async {
    final key = _session.getKeyCopy();
    if (key == null) throw StateError('Vault is locked');

    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['vgvault'],
      withData: true,
    );
    if (result == null || result.files.isEmpty) {
      return ImportResult(success: false, message: 'Importación cancelada');
    }

    final fileBytes = result.files.first.bytes;
    if (fileBytes == null || fileBytes.length < _magic.length) {
      return ImportResult(success: false, message: 'Archivo inválido');
    }

    // Validate magic
    final magic = utf8.decode(fileBytes.sublist(0, _magic.length));
    if (magic != _magic) {
      return ImportResult(
          success: false, message: 'El archivo no es un backup de VaultGuard');
    }

    final encrypted = fileBytes.sublist(_magic.length);
    late Uint8List decrypted;
    try {
      decrypted = await _security.decrypt(encrypted, key);
    } catch (_) {
      return ImportResult(
          success: false,
          message: 'No se pudo descifrar. ¿Es el backup de esta bóveda?');
    }

    final json = jsonDecode(utf8.decode(decrypted)) as Map<String, dynamic>;
    final credentials = (json['credentials'] as List)
        .map((e) => Credential.fromJson(e as Map<String, dynamic>))
        .toList();
    final folders = (json['folders'] as List)
        .map((e) => Folder.fromJson(e as Map<String, dynamic>))
        .toList();

    for (final f in folders) {
      await _folderRepo.save(f);
    }
    for (final c in credentials) {
      await _credRepo.save(c);
    }

    return ImportResult(
      success: true,
      message:
          'Importados ${credentials.length} credenciales y ${folders.length} carpetas',
      credentialsImported: credentials.length,
      foldersImported: folders.length,
    );
  }
}

class ImportResult {
  const ImportResult({
    required this.success,
    required this.message,
    this.credentialsImported = 0,
    this.foldersImported = 0,
  });
  final bool success;
  final String message;
  final int credentialsImported;
  final int foldersImported;
}
