import 'dart:typed_data';

import 'package:injectable/injectable.dart';

import '../../../core/infrastructure/database/app_database.dart';
import '../../../core/infrastructure/database/daos/category_dao.dart';
import '../../../core/infrastructure/database/daos/credential_dao.dart';
import '../../../core/infrastructure/security/i_security_service.dart';
import '../../../core/infrastructure/security/session_manager.dart';
import '../domain/entities/category.dart';
import '../domain/entities/credential.dart';
import '../domain/repositories/i_credential_repository.dart';
import 'credential_dto.dart';

@LazySingleton(as: ICredentialRepository)
class CredentialRepositoryImpl implements ICredentialRepository {
  const CredentialRepositoryImpl(
    this._credentialDao,
    this._securityService,
    this._sessionManager,
  );

  final CredentialDao _credentialDao;
  final ISecurityService _securityService;
  final SessionManager _sessionManager;

  Uint8List get _keyBytes {
    final key = _sessionManager.getKeyCopy();
    if (key == null) throw StateError('Vault is locked');
    return key;
  }

  Future<Credential> _decryptEntry(dynamic entry) async {
    final key = _keyBytes;
    final plainBytes = await _securityService.decrypt(
      Uint8List.fromList(entry.encryptedPayload),
      key,
    );
    final payload = CredentialSensitivePayload.fromBytes(plainBytes);
    return CredentialDto.fromEntry(entry: entry, payload: payload);
  }

  @override
  Future<List<Credential>> getAll() async {
    final entries = await _credentialDao.getAll();
    return Future.wait(entries.map(_decryptEntry));
  }

  @override
  Future<Credential?> getById(String id) async {
    final entry = await _credentialDao.getById(id);
    if (entry == null) return null;
    return _decryptEntry(entry);
  }

  @override
  Future<void> save(Credential credential) async {
    final key = _keyBytes;
    final payload = CredentialDto.toPayload(credential);
    final encrypted = await _securityService.encrypt(payload.toBytes(), key);
    await _credentialDao.upsert(
      CredentialDto.toCompanion(
        credential: credential,
        encryptedPayload: encrypted,
      ),
    );
  }

  @override
  Future<void> update(Credential credential) => save(credential);

  @override
  Future<void> delete(String id) => _credentialDao.deleteById(id);

  @override
  Future<List<Credential>> getByCategory(String categoryId) async {
    final entries = await _credentialDao.getByCategory(categoryId);
    return Future.wait(entries.map(_decryptEntry));
  }

  @override
  Future<List<Credential>> getFavorites() async {
    final entries = await _credentialDao.getFavorites();
    return Future.wait(entries.map(_decryptEntry));
  }

  @override
  Future<List<Credential>> search(String query) async {
    final entries = await _credentialDao.searchByTitle(query);
    return Future.wait(entries.map(_decryptEntry));
  }
}

@LazySingleton(as: ICategoryRepository)
class CategoryRepositoryImpl implements ICategoryRepository {
  const CategoryRepositoryImpl(this._categoryDao);

  final CategoryDao _categoryDao;

  @override
  Future<List<Category>> getAll() async {
    final entries = await _categoryDao.getAll();
    return entries.map<Category>(_fromEntry).toList();
  }

  @override
  Future<Category?> getById(String id) async {
    final entry = await _categoryDao.getById(id);
    return entry == null ? null : _fromEntry(entry);
  }

  @override
  Future<void> save(Category category) =>
      _categoryDao.upsert(_toCompanion(category));

  @override
  Future<void> delete(String id) => _categoryDao.deleteById(id);

  Category _fromEntry(CategoryEntry e) => Category(
        id: e.id,
        name: e.name,
        icon: e.icon,
        createdAt: DateTime.fromMillisecondsSinceEpoch(e.createdAt),
      );

  CategoryEntriesCompanion _toCompanion(Category c) =>
      CategoryEntriesCompanion.insert(
        id: c.id,
        name: c.name,
        icon: c.icon,
        createdAt: c.createdAt.millisecondsSinceEpoch,
      );
}
