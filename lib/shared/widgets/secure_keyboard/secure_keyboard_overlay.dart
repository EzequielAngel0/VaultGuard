import 'package:flutter/material.dart';

import 'secure_keyboard.dart';

/// Shows a [SecureKeyboard] as a non-dismissible bottom sheet.
///
/// The returned [Future] completes with the entered value, or `null`
/// if the user cancelled.
///
/// Example:
/// ```dart
/// final password = await SecureKeyboardOverlay.show(context);
/// if (password != null) { /* use password */ }
/// ```
class SecureKeyboardOverlay {
  SecureKeyboardOverlay._();

  static Future<String?> show(
    BuildContext context, {
    SecureKeyboardMode mode = SecureKeyboardMode.password,
    String hintText = 'Ingresa tu contraseña',
    String confirmLabel = 'Confirmar',
    int maxLength = 64,
  }) {
    return showModalBottomSheet<String>(
      context: context,
      // Prevent swipe-down dismissal so user must explicitly cancel
      isDismissible: false,
      enableDrag: false,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (sheetContext) {
        String? result;
        return PopScope(
          canPop: false, // block back-button dismissal
          child: Padding(
            // Respect the keyboard / system bar insets
            padding: MediaQuery.of(sheetContext).viewInsets,
            child: SecureKeyboard(
              mode: mode,
              hintText: hintText,
              confirmLabel: confirmLabel,
              maxLength: maxLength,
              onComplete: (value) {
                result = value;
                Navigator.of(sheetContext).pop(result);
              },
              onCancel: () => Navigator.of(sheetContext).pop(null),
            ),
          ),
        );
      },
    );
  }
}
