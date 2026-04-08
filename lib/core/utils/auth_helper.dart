import 'package:flutter/material.dart';

import '../../app/di/injection.dart';
import '../services/biometric_auth_service.dart';

/// Funciones auxiliares para requerir autenticación contextual antes de acciones sensibles.
class AuthHelper {
  /// Solicita al servicio biométrico una validación.
  /// Si tiene éxito, devuelve true. De lo contrario, muestra un SnackBar de error y devuelve false.
  static Future<bool> requireAuth(
    BuildContext context, {
    String reason = 'Verifica tu identidad para continuar',
  }) async {
    final bioService = getIt<BiometricAuthService>();
    final success = await bioService.authenticate(reason: reason);

    if (!success) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Autenticación cancelada o fallida'),
            backgroundColor: Color(0xFFCF6679),
            behavior: SnackBarBehavior.floating,
          ),
        );
      }
    }
    return success;
  }
}
