import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';

import '../../../core/constants/app_constants.dart';
import '../domain/entities/master_key_config.dart';
import '../domain/entities/vault.dart';
import '../domain/repositories/i_vault_repository.dart';

@LazySingleton(as: IVaultRepository)
class VaultRepositoryImpl implements IVaultRepository {
  const VaultRepositoryImpl(this._storage);

  final FlutterSecureStorage _storage;

  @override
  Future<bool> isVaultInitialized() async {
    final value = await _storage.read(key: AppConstants.kVaultMetadata);
    return value != null;
  }

  @override
  Future<Vault?> getVault() async {
    final json = await _storage.read(key: AppConstants.kVaultMetadata);
    if (json == null) return null;
    return Vault.fromJson(jsonDecode(json) as Map<String, dynamic>);
  }

  @override
  Future<void> saveVault(Vault vault) => _storage.write(
        key: AppConstants.kVaultMetadata,
        value: jsonEncode(vault.toJson()),
      );

  @override
  Future<MasterKeyConfig?> getMasterKeyConfig() async {
    final json = await _storage.read(key: AppConstants.kMasterKeyConfig);
    if (json == null) return null;
    return MasterKeyConfig.fromJson(jsonDecode(json) as Map<String, dynamic>);
  }

  @override
  Future<void> saveMasterKeyConfig(MasterKeyConfig config) =>
      _storage.write(
        key: AppConstants.kMasterKeyConfig,
        value: jsonEncode(config.toJson()),
      );
}
