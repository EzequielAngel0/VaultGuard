import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:local_auth/local_auth.dart';

import '../../../app/di/injection.dart';
import '../../../router/app_router.dart';
import '../../../shared/widgets/secure_text_field.dart';
import '../../settings/domain/repositories/i_settings_repository.dart';
import '../application/vault_state_provider.dart';

class UnlockScreen extends ConsumerStatefulWidget {
  const UnlockScreen({super.key});

  @override
  ConsumerState<UnlockScreen> createState() => _UnlockScreenState();
}

class _UnlockScreenState extends ConsumerState<UnlockScreen> {
  final _formKey = GlobalKey<FormState>();
  final _passCtrl = TextEditingController();
  final _localAuth = LocalAuthentication();
  bool _biometricAvailable = false;

  @override
  void initState() {
    super.initState();
    _checkBiometrics();
  }

  @override
  void dispose() {
    _passCtrl.dispose();
    super.dispose();
  }

  Future<void> _checkBiometrics() async {
    final available = await _localAuth.canCheckBiometrics;
    if (mounted) setState(() => _biometricAvailable = available);
    if (!available) return;

    final settings = await getIt<ISettingsRepository>().getSettings();
    if (settings.biometricEnabled) _tryBiometric();
  }

  Future<void> _tryBiometric() async {
    try {
      final authenticated = await _localAuth.authenticate(
        localizedReason: 'Desbloquea tu bóveda',
        options: const AuthenticationOptions(biometricOnly: true),
      );
      if (!authenticated || !mounted) return;

      // Inyectar la clave AES real en la sesión desde SecureStorage
      await ref.read(vaultNotifierProvider.notifier).unlockWithBiometrics();
      if (!mounted) return;

      ref.read(vaultNotifierProvider).maybeWhen(
            unlocked: (_) => _navigateHome(),
            error: (msg) => _showError(msg),
            orElse: () {},
          );
    } catch (_) {
      // Biometría cancelada o no disponible — silenciar
    }
  }

  Future<void> _submitPassword() async {
    if (!_formKey.currentState!.validate()) return;
    // SEC-003: Capturar el texto y limpiar el controlador inmediatamente
    // para minimizar el tiempo que el String vive en la pila de la UI.
    final password = _passCtrl.text;
    _passCtrl.clear();
    await ref.read(vaultNotifierProvider.notifier).unlock(password);
    if (!mounted) return;
    ref.read(vaultNotifierProvider).maybeWhen(
          unlocked: (_) => _navigateHome(),
          error: (msg) => _showError(msg),
          orElse: () {},
        );
  }

  void _navigateHome() => context.go(AppRoutes.home);

  void _showError(String msg) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(msg),
        backgroundColor: const Color(0xFFCF6679),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isLoading = ref.watch(vaultNotifierProvider).maybeWhen(
          loading: () => true,
          orElse: () => false,
        );

    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          physics: const ClampingScrollPhysics(),
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 40),
                child: Form(
                  key: _formKey,
                  child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Spacer(),
                Center(
                  child: Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: const RadialGradient(
                        colors: [Color(0xFF6C63FF), Color(0xFF3A3080)],
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xFF6C63FF).withValues(alpha: 0.4),
                          blurRadius: 28,
                          spreadRadius: 4,
                        ),
                      ],
                    ),
                    child: const Icon(
                      Icons.lock_rounded,
                      color: Colors.white,
                      size: 40,
                    ),
                  ),
                ),
                const SizedBox(height: 32),
                const Center(
                  child: Text(
                    'VaultGuard',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w800,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                const Center(
                  child: Text(
                    'Introduce tu contraseña maestra',
                    style: TextStyle(color: Color(0xFF9E9EBF), fontSize: 14),
                  ),
                ),
                const Spacer(),
                SecureTextField(
                  controller: _passCtrl,
                  label: 'Contraseña maestra',
                  autofocus: true,
                  textInputAction: TextInputAction.done,
                  validator: (v) =>
                      (v == null || v.isEmpty) ? 'Campo requerido' : null,
                  onSubmitted: (_) => _submitPassword(),
                ),
                const SizedBox(height: 20),
                AnimatedSwitcher(
                  duration: const Duration(milliseconds: 200),
                  child: isLoading
                      ? const Center(
                          child: CircularProgressIndicator(
                            color: Color(0xFF6C63FF),
                          ),
                        )
                      : ElevatedButton(
                          onPressed: _submitPassword,
                          child: const Text('Desbloquear'),
                        ),
                ),
                if (_biometricAvailable) ...[
                  const SizedBox(height: 16),
                  Center(
                    child: TextButton.icon(
                      onPressed: _tryBiometric,
                      icon: const Icon(
                        Icons.fingerprint_rounded,
                        color: Color(0xFF6C63FF),
                      ),
                      label: const Text(
                        'Usar biometría',
                        style: TextStyle(color: Color(0xFF6C63FF)),
                      ),
                    ),
                  ),
                ],
                const SizedBox(height: 12),
                Center(
                  child: TextButton(
                    onPressed: () => context.push(AppRoutes.recovery),
                    child: const Text(
                      '¿Olvidaste tu contraseña maestra?',
                      style: TextStyle(
                        color: Color(0xFF9E9EBF),
                        fontSize: 13,
                        decoration: TextDecoration.underline,
                        decorationColor: Color(0xFF9E9EBF),
                      ),
                    ),
                  ),
                ),
                const Spacer(),
              ],
            ),
          ),
        ),
      ),
            ],
          ),
        ),
      );
  }
}
