import 'package:password_manager/features/settings/domain/entities/app_security_settings.dart';

abstract interface class ISettingsRepository {
  Future<AppSecuritySettings> getSettings();
  Future<void> saveSettings(AppSecuritySettings settings);
}
