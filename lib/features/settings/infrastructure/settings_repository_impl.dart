import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';

import '../../../core/constants/app_constants.dart';
import '../domain/entities/app_security_settings.dart';
import '../domain/repositories/i_settings_repository.dart';

@LazySingleton(as: ISettingsRepository)
class SettingsRepositoryImpl implements ISettingsRepository {
  const SettingsRepositoryImpl(this._storage);

  final FlutterSecureStorage _storage;

  @override
  Future<AppSecuritySettings> getSettings() async {
    final json = await _storage.read(key: AppConstants.kSecuritySettings);
    if (json == null) return AppSecuritySettings.defaults();
    return AppSecuritySettings.fromJson(
      jsonDecode(json) as Map<String, dynamic>,
    );
  }

  @override
  Future<void> saveSettings(AppSecuritySettings settings) =>
      _storage.write(
        key: AppConstants.kSecuritySettings,
        value: jsonEncode(settings.toJson()),
      );
}
