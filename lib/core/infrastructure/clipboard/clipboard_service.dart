import 'dart:async';

import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';

import '../../../features/settings/domain/repositories/i_settings_repository.dart';

/// Copies text to the clipboard and schedules an automatic clear after
/// [AppSecuritySettings.clearClipboardSeconds] seconds.
///
/// Zero-Print policy: this service never logs the copied value.
@lazySingleton
class ClipboardService {
  ClipboardService(this._settingsRepo);

  final ISettingsRepository _settingsRepo;

  Timer? _clearTimer;

  /// Copies [value] and returns the number of seconds until auto-clear.
  Future<int> copySecure(String value) async {
    _clearTimer?.cancel();

    await Clipboard.setData(ClipboardData(text: value));

    final settings = await _settingsRepo.getSettings();
    final seconds = settings.clearClipboardSeconds;

    _clearTimer = Timer(Duration(seconds: seconds), _clear);
    return seconds;
  }

  Future<void> _clear() async {
    await Clipboard.setData(const ClipboardData(text: ''));
    _clearTimer = null;
  }

  /// Immediately clears the clipboard (e.g. when vault locks).
  Future<void> clearNow() async {
    _clearTimer?.cancel();
    _clearTimer = null;
    await _clear();
  }
}
