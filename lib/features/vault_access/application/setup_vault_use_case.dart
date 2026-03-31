import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';

import '../../../app/di/injection.dart';
import 'package:uuid/uuid.dart';

import '../../../core/infrastructure/security/i_security_service.dart';
import '../../../core/infrastructure/security/session_manager.dart';
import '../domain/entities/master_key_config.dart';
import '../domain/entities/vault.dart';
import '../domain/entities/vault_session.dart';
import '../domain/repositories/i_vault_repository.dart';
import '../../../features/settings/domain/repositories/i_settings_repository.dart';

@lazySingleton
class SetupVaultUseCase {
  const SetupVaultUseCase(
    this._vaultRepo,
    this._settingsRepo,
    this._security,
    this._session,
  );

  final IVaultRepository _vaultRepo;
  final ISettingsRepository _settingsRepo;
  final ISecurityService _security;
  final SessionManager _session;

  Future<VaultSession> execute(String masterPassword) async {
    final saltBase64 = await _security.generateSaltBase64();
    final params = KdfParams.argon2idDefaults();

    // SEC-003: Convertir a bytes inmediatamente y borrar el buffer tras el KDF
    // para minimizar el tiempo que la contraseña en texto plano ocupa el heap.
    final passwordBytes = Uint8List.fromList(utf8.encode(masterPassword));

    late final Uint8List keyBytes;
    try {
      keyBytes = await _security.deriveKey(
        password: String.fromCharCodes(passwordBytes),
        saltBase64: saltBase64,
        memory: params.memory,
        iterations: params.iterations,
        parallelism: params.parallelism,
      );
    } finally {
      passwordBytes.fillRange(0, passwordBytes.length, 0);
    }

    final verificationData = await _security.createVerificationData(keyBytes);

    final config = MasterKeyConfig(
      salt: saltBase64,
      kdfAlgorithm: KdfAlgorithm.argon2id,
      kdfParams: params,
      verificationData: verificationData,
    );

    final now = DateTime.now();
    final vault = Vault(
      id: const Uuid().v4(),
      createdAt: now,
      updatedAt: now,
      isInitialized: true,
    );

    await _vaultRepo.saveMasterKeyConfig(config);
    await _vaultRepo.saveVault(vault);

    final settings = await _settingsRepo.getSettings();
    _session.storeKey(keyBytes);

    if (settings.biometricEnabled) {
      await getIt<FlutterSecureStorage>()
          .write(key: 'bio_master_key', value: base64Encode(keyBytes));
    }

    return VaultSession.unlocked(
      autoLockMinutes: settings.autoLockMinutes,
    );
  }
}
