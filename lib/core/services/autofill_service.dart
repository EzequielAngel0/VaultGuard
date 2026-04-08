import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';

import '../../features/credentials/domain/entities/credential.dart';
import '../../features/credentials/domain/repositories/i_credential_repository.dart';
import '../infrastructure/security/session_manager.dart';

/// Handles the Flutter side of the Autofill OS integration.
///
/// Two responsibilities:
///  1. [AutofillSettingsService] — opens the system settings page so the
///     user can activate SoloKey as the default autofill provider.
///  2. [AutofillQueryHandler] — responds to the [SoloKeyAutofillService]
///     Kotlin class when it queries credentials for a given caller app.
@lazySingleton
class AutofillSettingsService {
  static const _channel = MethodChannel('com.solokey/autofill_settings');

  /// Opens Android system autofill settings where the user can set
  /// SoloKey as the default autofill provider.
  /// Returns `true` if the intent was launched successfully.
  Future<bool> openAutofillSettings() async {
    try {
      final result = await _channel.invokeMethod<bool>('openAutofillSettings');
      return result ?? false;
    } on PlatformException {
      return false;
    }
  }

  /// Returns `true` if SoloKey is currently the active autofill service
  /// on this device.
  Future<bool> isAutofillEnabled() async {
    try {
      final result = await _channel.invokeMethod<bool>('isAutofillEnabled');
      return result ?? false;
    } on PlatformException {
      return false;
    }
  }
}

/// Registers a MethodChannel handler so the native [SoloKeyAutofillService]
/// can query the Dart vault for matching credentials.
///
/// Call [AutofillQueryHandler.register] early in app startup (after the
/// vault session is available).
@lazySingleton
class AutofillQueryHandler {
  AutofillQueryHandler(this._credRepo, this._session);

  final ICredentialRepository _credRepo;
  final SessionManager _session;

  static const _channel = MethodChannel('com.solokey/autofill');

  /// Registers the channel handler. Should be called from [main.dart] or
  /// the DI setup, once the app is initialized.
  void register() {
    _channel.setMethodCallHandler(_handleMethodCall);
  }

  Future<dynamic> _handleMethodCall(MethodCall call) async {
    if (call.method != 'queryCredentials') return null;

    // Only serve credentials when the vault is unlocked
    if (_session.getKeyCopy() == null) return <Map<String, dynamic>>[];

    final args = call.arguments as Map<dynamic, dynamic>;
    final callerPackage = args['package'] as String? ?? '';
    final callerDomain  = args['domain']  as String? ?? '';

    final all = await _credRepo.getAll();

    // Filter credentials that match either the calling package or domain.
    // We do a fuzzy match: check if the stored website contains the domain,
    // or if the credential's website domain is contained within the caller domain.
    final matches = all.where((c) {
      if (c.type != CredentialType.password) return false;
      final site = c.website?.toLowerCase() ?? '';
      if (site.isEmpty) return false;

      final domain = callerDomain.toLowerCase();
      final pkg    = callerPackage.toLowerCase();

      return site.contains(domain) ||
             domain.contains(_extractDomain(site)) ||
             site.contains(pkg.split('.').lastOrNull ?? '');
    }).take(5).toList();

    return matches.map((c) => {
      'title':    c.title,
      'username': c.username,
      // NOTE: password is passed here in plaintext because the Autofill
      // framework fills it directly into the target app's password field.
      // The vault must be unlocked for this path to execute.
      'password': c.password,
    }).toList();
  }

  String _extractDomain(String url) {
    try {
      final uri = Uri.parse(url.startsWith('http') ? url : 'https://$url');
      return uri.host.replaceFirst('www.', '');
    } catch (_) {
      return url;
    }
  }
}
