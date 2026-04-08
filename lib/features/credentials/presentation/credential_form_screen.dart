import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:uuid/uuid.dart';

import '../../../shared/widgets/secure_text_field.dart';
import '../../../shared/widgets/vault_app_bar.dart';
import '../application/credentials_provider.dart';
import '../../folders/application/folders_provider.dart';
import '../domain/entities/credential.dart';
import '../../folders/domain/entities/folder.dart';
import 'qr_scanner_screen.dart';
import 'widgets/password_generator_widget.dart';

class CredentialFormScreen extends ConsumerStatefulWidget {
  const CredentialFormScreen({super.key, this.existingId});
  final String? existingId;

  @override
  ConsumerState<CredentialFormScreen> createState() =>
      _CredentialFormScreenState();
}

class _CredentialFormScreenState extends ConsumerState<CredentialFormScreen> {
  final _formKey = GlobalKey<FormState>();

  // Shared controllers
  final _titleCtrl    = TextEditingController();
  final _notesCtrl    = TextEditingController();

  // Password / Login
  final _usernameCtrl = TextEditingController();
  final _passwordCtrl = TextEditingController();
  final _websiteCtrl  = TextEditingController();

  // API Key
  final _serviceCtrl  = TextEditingController();
  final _apiKeyCtrl   = TextEditingController();
  final _endpointCtrl = TextEditingController();
  final _scopesCtrl   = TextEditingController();

  // TOTP
  final _totpSecretCtrl = TextEditingController();
  final _totpIssuerCtrl = TextEditingController();

  CredentialType _type = CredentialType.password;
  String? _folderId;
  bool _isFavorite = false;
  bool _isLoading  = false;
  bool _showGenerator = false;
  Credential? _existing;

  @override
  void initState() {
    super.initState();
    if (widget.existingId != null) _loadExisting();
  }

  void _loadExisting() {
    final creds = ref.read(credentialsNotifierProvider).valueOrNull;
    _existing = creds?.where((c) => c.id == widget.existingId).firstOrNull;
    if (_existing != null) {
      _titleCtrl.text = _existing!.title;
      _notesCtrl.text = _existing!.notes ?? '';
      _type = _existing!.type;
      _isFavorite = _existing!.isFavorite;
      _folderId = _existing!.categoryId;

      // Populate type-specific fields from customFields map
      final cf = {for (final f in _existing!.customFields) f.label: f.value};
      _usernameCtrl.text = _existing!.username ?? '';
      _passwordCtrl.text = _existing!.password ?? '';
      _websiteCtrl.text  = _existing!.website ?? '';
      _serviceCtrl.text  = cf['service'] ?? '';
      _apiKeyCtrl.text   = _existing!.password ?? '';
      _endpointCtrl.text = cf['endpoint'] ?? '';
      _scopesCtrl.text   = cf['scopes'] ?? '';
      _totpSecretCtrl.text = _existing!.password ?? '';
      _totpIssuerCtrl.text = cf['issuer'] ?? '';
    }
  }

  @override
  void dispose() {
    for (final c in [
      _titleCtrl, _notesCtrl, _usernameCtrl, _passwordCtrl, _websiteCtrl,
      _serviceCtrl, _apiKeyCtrl, _endpointCtrl, _scopesCtrl,
      _totpSecretCtrl, _totpIssuerCtrl,
    ]) {
      c.dispose();
    }
    super.dispose();
  }

  Credential _buildCredential() {
    final now = DateTime.now();
    switch (_type) {
      case CredentialType.password:
        return Credential(
          id: _existing?.id ?? const Uuid().v4(),
          type: _type,
          title: _titleCtrl.text.trim(),
          username: _usernameCtrl.text.trim().isEmpty ? null : _usernameCtrl.text.trim(),
          password: _passwordCtrl.text.isEmpty ? null : _passwordCtrl.text,
          website:  _websiteCtrl.text.trim().isEmpty ? null : _websiteCtrl.text.trim(),
          notes: _notesCtrl.text.trim().isEmpty ? null : _notesCtrl.text.trim(),
          isFavorite: _isFavorite,
          categoryId: _folderId,
          createdAt: _existing?.createdAt ?? now,
          updatedAt: now,
        );

      case CredentialType.apiKey:
        return Credential(
          id: _existing?.id ?? const Uuid().v4(),
          type: _type,
          title: _titleCtrl.text.trim(),
          username: _serviceCtrl.text.trim().isEmpty ? null : _serviceCtrl.text.trim(),
          password: _apiKeyCtrl.text.isEmpty ? null : _apiKeyCtrl.text,
          website: _endpointCtrl.text.trim().isEmpty ? null : _endpointCtrl.text.trim(),
          notes: _notesCtrl.text.trim().isEmpty ? null : _notesCtrl.text.trim(),
          customFields: _scopesCtrl.text.trim().isEmpty
              ? []
              : [CustomField(label: 'scopes', value: _scopesCtrl.text.trim())],
          isFavorite: _isFavorite,
          categoryId: _folderId,
          createdAt: _existing?.createdAt ?? now,
          updatedAt: now,
        );

      case CredentialType.secureNote:
        return Credential(
          id: _existing?.id ?? const Uuid().v4(),
          type: _type,
          title: _titleCtrl.text.trim(),
          notes: _notesCtrl.text.trim().isEmpty ? null : _notesCtrl.text.trim(),
          isFavorite: _isFavorite,
          categoryId: _folderId,
          createdAt: _existing?.createdAt ?? now,
          updatedAt: now,
        );

      case CredentialType.totp:
        return Credential(
          id: _existing?.id ?? const Uuid().v4(),
          type: _type,
          title: _titleCtrl.text.trim(),
          password: _totpSecretCtrl.text.isEmpty ? null : _totpSecretCtrl.text.trim(),
          notes: _notesCtrl.text.trim().isEmpty ? null : _notesCtrl.text.trim(),
          customFields: _totpIssuerCtrl.text.trim().isEmpty
              ? []
              : [CustomField(label: 'issuer', value: _totpIssuerCtrl.text.trim())],
          isFavorite: _isFavorite,
          categoryId: _folderId,
          createdAt: _existing?.createdAt ?? now,
          updatedAt: now,
        );

      // Passkeys are registered via the platform FIDO2 API, not via this form.
      // Existing passkey credentials are read-only here.
      case CredentialType.passkey:
        return _existing!.copyWith(updatedAt: now);
    }
  }

  Future<void> _save() async {
    if (!_formKey.currentState!.validate()) return;
    setState(() => _isLoading = true);
    final credential = _buildCredential();
    try {
      if (_existing == null) {
        await ref.read(credentialsNotifierProvider.notifier).save(credential);
      } else {
        await ref.read(credentialsNotifierProvider.notifier).updateCredential(credential);
      }
      if (mounted) context.pop();
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error: $e'),
            backgroundColor: const Color(0xFFCF6679),
            behavior: SnackBarBehavior.floating,
          ),
        );
      }
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  Future<void> _scanQr() async {
    final code = await Navigator.of(context).push<String>(
      MaterialPageRoute(builder: (_) => const QrScannerScreen()),
    );
    if (code == null) return;
    
    try {
      final uri = Uri.parse(code);
      if (uri.scheme.toLowerCase() != 'otpauth') {
        _showError('El código QR no es un TOTP válido.');
        return;
      }
      
      String? titleFromPath;
      if (uri.pathSegments.isNotEmpty) {
        titleFromPath = uri.pathSegments.first;
        if (titleFromPath.contains(':')) {
          titleFromPath = titleFromPath.split(':').last;
        }
      }

      final secret = uri.queryParameters['secret'];
      final issuer = uri.queryParameters['issuer'] ??
          (uri.pathSegments.isNotEmpty && uri.pathSegments.first.contains(':')
              ? Uri.decodeComponent(uri.pathSegments.first.split(':').first)
              : null);

      if (secret != null && secret.isNotEmpty) {
        setState(() {
          _totpSecretCtrl.text = secret;
          if (issuer != null && _totpIssuerCtrl.text.isEmpty) {
            _totpIssuerCtrl.text = issuer;
          }
          if (titleFromPath != null && _titleCtrl.text.isEmpty) {
            _titleCtrl.text = Uri.decodeComponent(titleFromPath);
          }
        });
        if (!mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Código QR escaneado con éxito'),
            backgroundColor: Color(0xFF4CAF50),
            behavior: SnackBarBehavior.floating,
          ),
        );
      } else {
        _showError('No se encontró una clave secreta en el QR.');
      }
    } catch (e) {
      _showError('Error al leer el código QR.');
    }
  }

  void _showError(String msg) {
    if (!mounted) return;
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
    final isEdit = _existing != null;
    return Scaffold(
      appBar: VaultAppBar(
        title: isEdit ? 'Editar credencial' : 'Nueva credencial',
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            // ── Type selector ────────────────────────────────────────
            _TypeSelector(
              selected: _type,
              onChanged: (t) => setState(() {
                _type = t;
                _showGenerator = false;
              }),
            ),
            const SizedBox(height: 20),

            // ── Title (common) ───────────────────────────────────────
            TextFormField(
              controller: _titleCtrl,
              style: const TextStyle(color: Colors.white),
              decoration: const InputDecoration(labelText: 'Título *'),
              validator: (v) =>
                  v == null || v.trim().isEmpty ? 'Campo requerido' : null,
            ),
            const SizedBox(height: 14),

            // ── Type-specific fields ─────────────────────────────────
            _buildFieldsByType(),

            // ── Notes (common except TOTP) ────────────────────────────
            if (_type != CredentialType.totp) ...[
              const SizedBox(height: 14),
              TextFormField(
                controller: _notesCtrl,
                style: const TextStyle(color: Colors.white),
                maxLines: _type == CredentialType.secureNote ? 10 : 4,
                decoration: InputDecoration(
                  labelText: _type == CredentialType.secureNote
                      ? 'Contenido *'
                      : 'Notas',
                  alignLabelWithHint: true,
                ),
                validator: _type == CredentialType.secureNote
                    ? (v) => v == null || v.trim().isEmpty
                        ? 'El contenido es requerido'
                        : null
                    : null,
              ),
            ],

            // ── Folder Picker ────────────────────────────────────────
            const SizedBox(height: 14),
            Consumer(
              builder: (context, ref, _) {
                final folders = ref.watch(foldersNotifierProvider).valueOrNull ?? [];
                final currentFolder = folders.where((f) => f.id == _folderId).firstOrNull;
                
                return InkWell(
                  onTap: () async {
                    FocusScope.of(context).unfocus();
                    final List<String?>? selection = await showModalBottomSheet<List<String?>>(
                      context: context,
                      isScrollControlled: true,
                      backgroundColor: const Color(0xFF1A1A2E),
                      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
                      builder: (_) => _FolderPickerSheet(selectedFolderId: _folderId),
                    );
                    if (selection != null) {
                      setState(() => _folderId = selection.first);
                    }
                  },
                  borderRadius: BorderRadius.circular(12),
                  child: InputDecorator(
                    decoration: const InputDecoration(
                      labelText: 'Carpeta',
                      prefixIcon: Icon(Icons.folder_outlined, color: Color(0xFF9E9EBF)),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          currentFolder?.name ?? 'Bóveda principal',
                          style: TextStyle(
                            color: currentFolder == null ? const Color(0xFF9E9EBF) : Colors.white,
                          ),
                        ),
                        const Icon(Icons.arrow_drop_down_rounded, color: Color(0xFF9E9EBF)),
                      ],
                    ),
                  ),
                );
              },
            ),

            // ── Favorite toggle ────────────────────────────────────
            const SizedBox(height: 20),
            _FavoriteToggle(
              value: _isFavorite,
              onChanged: (v) => setState(() => _isFavorite = v),
            ),
            const SizedBox(height: 32),

            // ── Save button ─────────────────────────────────────────
            _isLoading
                ? const Center(
                    child: CircularProgressIndicator(color: Color(0xFF6C63FF)),
                  )
                : ElevatedButton(
                    onPressed: _save,
                    child: Text(isEdit ? 'Guardar cambios' : 'Crear credencial'),
                  ),
          ],
        ),
      ),
    );
  }

  Widget _buildFieldsByType() {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 250),
      child: KeyedSubtree(
        key: ValueKey(_type),
        child: switch (_type) {
          CredentialType.password => Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextFormField(
                  controller: _usernameCtrl,
                  style: const TextStyle(color: Colors.white),
                  decoration: const InputDecoration(
                    labelText: 'Usuario / Email',
                    prefixIcon: Icon(Icons.person_outline_rounded,
                        size: 18, color: Color(0xFF9E9EBF)),
                  ),
                ),
                const SizedBox(height: 14),
                _PasswordRow(
                  ctrl: _passwordCtrl,
                  label: 'Contraseña',
                  showGenerator: _showGenerator,
                  onToggleGenerator: (v) => setState(() => _showGenerator = v),
                ),
                const SizedBox(height: 14),
                TextFormField(
                  controller: _websiteCtrl,
                  style: const TextStyle(color: Colors.white),
                  keyboardType: TextInputType.url,
                  decoration: const InputDecoration(
                    labelText: 'Sitio web / URL',
                    prefixIcon: Icon(Icons.language_rounded,
                        size: 18, color: Color(0xFF9E9EBF)),
                  ),
                ),
              ],
            ),

          CredentialType.apiKey => Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextFormField(
                  controller: _serviceCtrl,
                  style: const TextStyle(color: Colors.white),
                  decoration: const InputDecoration(
                    labelText: 'Nombre del servicio *',
                    prefixIcon: Icon(Icons.cloud_rounded,
                        size: 18, color: Color(0xFF9E9EBF)),
                  ),
                  validator: (v) =>
                      v == null || v.trim().isEmpty ? 'Campo requerido' : null,
                ),
                const SizedBox(height: 14),
                _PasswordRow(
                  ctrl: _apiKeyCtrl,
                  label: 'API Key / Token *',
                  showGenerator: _showGenerator,
                  onToggleGenerator: (v) => setState(() => _showGenerator = v),
                  validator: (v) =>
                      v == null || v.isEmpty ? 'Campo requerido' : null,
                ),
                const SizedBox(height: 14),
                TextFormField(
                  controller: _endpointCtrl,
                  style: const TextStyle(color: Colors.white),
                  keyboardType: TextInputType.url,
                  decoration: const InputDecoration(
                    labelText: 'Endpoint URL (opcional)',
                    prefixIcon: Icon(Icons.link_rounded,
                        size: 18, color: Color(0xFF9E9EBF)),
                  ),
                ),
                const SizedBox(height: 14),
                TextFormField(
                  controller: _scopesCtrl,
                  style: const TextStyle(color: Colors.white),
                  decoration: const InputDecoration(
                    labelText: 'Permisos / Scopes (opcional)',
                    hintText: 'read:user, write:repo…',
                    prefixIcon: Icon(Icons.security_rounded,
                        size: 18, color: Color(0xFF9E9EBF)),
                  ),
                ),
              ],
            ),

          CredentialType.secureNote => const SizedBox.shrink(),

          CredentialType.totp => Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: const Color(0xFFE91E8C).withValues(alpha: 0.08),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: const Color(0xFFE91E8C).withValues(alpha: 0.3),
                    ),
                  ),
                  child: const Row(
                    children: [
                      Icon(Icons.info_outline_rounded,
                          size: 16, color: Color(0xFFE91E8C)),
                      SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          'Ingresa la clave secreta TOTP (Base32) de tu cuenta. '
                          'La encontrarás al activar 2FA en el sitio web.',
                          style: TextStyle(
                            color: Color(0xFFE91E8C),
                            fontSize: 11,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 14),
                ElevatedButton.icon(
                  onPressed: _scanQr,
                  icon: const Icon(Icons.qr_code_scanner_rounded),
                  label: const Text('Escanear QR de cuenta'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFE91E8C).withValues(alpha: 0.1),
                    foregroundColor: const Color(0xFFE91E8C),
                    elevation: 0,
                    side: BorderSide(
                      color: const Color(0xFFE91E8C).withValues(alpha: 0.3),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 14),
                  ),
                ),
                const SizedBox(height: 14),
                TextFormField(
                  controller: _totpIssuerCtrl,
                  style: const TextStyle(color: Colors.white),
                  decoration: const InputDecoration(
                    labelText: 'Cuenta / Emisor',
                    hintText: 'ej. GitHub, Google, AWS',
                    prefixIcon: Icon(Icons.account_circle_outlined,
                        size: 18, color: Color(0xFF9E9EBF)),
                  ),
                ),
                const SizedBox(height: 14),
                SecureTextField(
                  controller: _totpSecretCtrl,
                  label: 'Clave secreta TOTP *',
                  validator: (v) =>
                      v == null || v.trim().isEmpty ? 'Campo requerido' : null,
                ),
              ],
            ),

          // Passkeys are platform-managed via FIDO2 — show read-only info
          CredentialType.passkey => Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFF4CAF50).withValues(alpha: 0.08),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: const Color(0xFF4CAF50).withValues(alpha: 0.3),
                ),
              ),
              child: const Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(Icons.fingerprint_rounded, color: Color(0xFF4CAF50), size: 20),
                  SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      'Las Passkeys se registran directamente con la plataforma '
                      'FIDO2 del dispositivo. Usa la pantalla de Passkeys en '
                      'Ajustes para registrar o gestionar tus passkeys.',
                      style: TextStyle(color: Color(0xFF4CAF50), fontSize: 12, height: 1.5),
                    ),
                  ),
                ],
              ),
            ),
        },
      ),
    );
  }
}

// ── Password row with embedded generator ─────────────────────────────────────

class _PasswordRow extends StatelessWidget {
  const _PasswordRow({
    required this.ctrl,
    required this.label,
    required this.showGenerator,
    required this.onToggleGenerator,
    this.validator,
  });

  final TextEditingController ctrl;
  final String label;
  final bool showGenerator;
  final ValueChanged<bool> onToggleGenerator;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: SecureTextField(
                controller: ctrl,
                label: label,
                validator: validator,
              ),
            ),
            const SizedBox(width: 8),
            Container(
              margin: const EdgeInsets.only(top: 8),
              decoration: BoxDecoration(
                color: showGenerator
                    ? const Color(0xFF6C63FF).withValues(alpha: 0.2)
                    : const Color(0xFF16213E),
                borderRadius: BorderRadius.circular(12),
              ),
              child: IconButton(
                icon: Icon(
                  Icons.auto_fix_high_rounded,
                  color: showGenerator
                      ? const Color(0xFF6C63FF)
                      : Colors.white54,
                ),
                onPressed: () {
                  FocusScope.of(context).unfocus();
                  onToggleGenerator(!showGenerator);
                },
                tooltip: 'Generador de claves',
              ),
            ),
          ],
        ),
        AnimatedSize(
          duration: const Duration(milliseconds: 300),
          curve: Curves.fastOutSlowIn,
          alignment: Alignment.topCenter,
          child: showGenerator
              ? PasswordGeneratorWidget(
                  onApplyPassword: (pass) {
                    ctrl.text = pass;
                    onToggleGenerator(false);
                  },
                )
              : const SizedBox.shrink(),
        ),
      ],
    );
  }
}

// ── Favorite toggle ───────────────────────────────────────────────────────────

class _FavoriteToggle extends StatelessWidget {
  const _FavoriteToggle({required this.value, required this.onChanged});
  final bool value;
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onChanged(!value),
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: const Color(0xFF16213E),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Icon(
              value ? Icons.star_rounded : Icons.star_border_rounded,
              color: value ? const Color(0xFFFFB74D) : const Color(0xFF9E9EBF),
              size: 22,
            ),
            const SizedBox(width: 12),
            const Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Marcar como favorita',
                      style: TextStyle(color: Colors.white, fontSize: 14)),
                  Text('Aparecerá destacada en tu bóveda',
                      style: TextStyle(
                          color: Color(0xFF9E9EBF), fontSize: 11)),
                ],
              ),
            ),
            Switch(
              value: value,
              onChanged: onChanged,
              activeTrackColor: const Color(0xFFFFB74D),
            ),
          ],
        ),
      ),
    );
  }
}

// ── Type selector ─────────────────────────────────────────────────────────────

class _TypeSelector extends StatelessWidget {
  const _TypeSelector({required this.selected, required this.onChanged});
  final CredentialType selected;
  final ValueChanged<CredentialType> onChanged;

  static const _items = [
    (type: CredentialType.password,   label: 'Contraseña', icon: Icons.lock_rounded),
    (type: CredentialType.apiKey,     label: 'API Key',    icon: Icons.key_rounded),
    (type: CredentialType.secureNote, label: 'Nota',       icon: Icons.note_rounded),
    (type: CredentialType.totp,       label: 'TOTP 2FA',   icon: Icons.access_time_rounded),
    (type: CredentialType.passkey,    label: 'Passkey',    icon: Icons.fingerprint_rounded),
  ];

  @override
  Widget build(BuildContext context) {
    return Row(
      children: _items.map((item) {
        final isSelected = item.type == selected;
        final color = switch (item.type) {
          CredentialType.password   => const Color(0xFF6C63FF),
          CredentialType.apiKey     => const Color(0xFF03DAC6),
          CredentialType.secureNote => const Color(0xFFFFB74D),
          CredentialType.totp       => const Color(0xFFE91E8C),
          CredentialType.passkey    => const Color(0xFF4CAF50),
        };
        return Expanded(
          child: GestureDetector(
            onTap: () => onChanged(item.type),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              margin: const EdgeInsets.only(right: 8),
              padding: const EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                color: isSelected
                    ? color.withValues(alpha: 0.15)
                    : const Color(0xFF16213E),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: isSelected ? color : Colors.transparent,
                  width: 1.5,
                ),
              ),
              child: Column(
                children: [
                  Icon(
                    item.icon,
                    color: isSelected ? color : const Color(0xFF5C5C7A),
                    size: 20,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    item.label,
                    style: TextStyle(
                      color: isSelected ? color : const Color(0xFF5C5C7A),
                      fontSize: 10,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}

class _FolderPickerSheet extends ConsumerWidget {
  const _FolderPickerSheet({this.selectedFolderId});
  final String? selectedFolderId;

  Color _hexToColor(String hex) {
    try {
      return Color(int.parse('FF${hex.replaceFirst('#', '')}', radix: 16));
    } catch (_) {
      return const Color(0xFF6C63FF);
    }
  }

  Future<void> _createNewFolder(BuildContext context, WidgetRef ref, String? parentId) async {
    final ctrl = TextEditingController();
    final name = await showDialog<String>(
      context: context,
      builder: (_) => AlertDialog(
        backgroundColor: const Color(0xFF1A1A2E),
        title: const Text('Nueva carpeta', style: TextStyle(color: Colors.white)),
        content: TextField(
          controller: ctrl,
          autofocus: true,
          style: const TextStyle(color: Colors.white),
          decoration: const InputDecoration(labelText: 'Nombre de la carpeta'),
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: const Text('Cancelar')),
          TextButton(onPressed: () => Navigator.pop(context, ctrl.text.trim()), child: const Text('Crear')),
        ],
      ),
    );
    if (name != null && name.isNotEmpty) {
      final newFolder = await ref.read(foldersNotifierProvider.notifier).createFolder(name: name, parentId: parentId);
      if (context.mounted) Navigator.pop(context, <String?>[newFolder.id]);
    }
  }

  Widget _buildNode(BuildContext context, WidgetRef ref, List<Folder> all, Folder f, int depth) {
    final sub = all.where((sub) => sub.parentId == f.id).toList();
    final isSelected = selectedFolderId == f.id;
    return Theme(
      data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
      child: ExpansionTile(
        tilePadding: EdgeInsets.only(left: 16 + depth * 16.0, right: 16),
        title: GestureDetector(
          onTap: () => Navigator.pop(context, <String?>[f.id]),
          child: Row(
            children: [
              Icon(f.isFavorite ? Icons.folder_special_rounded : Icons.folder_rounded, color: _hexToColor(f.colorHex)),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  f.name,
                  style: TextStyle(
                    color: isSelected ? const Color(0xFF6C63FF) : Colors.white,
                    fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                  ),
                ),
              ),
              if (isSelected) ...[
                const SizedBox(width: 8),
                const Icon(Icons.check_circle_rounded, color: Color(0xFF6C63FF), size: 16),
              ]
            ],
          ),
        ),
        childrenPadding: EdgeInsets.zero,
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: const Icon(Icons.create_new_folder_outlined, color: Color(0xFF9E9EBF)),
              onPressed: () => _createNewFolder(context, ref, f.id),
              tooltip: 'Añadir subcarpeta',
            ),
            if (sub.isNotEmpty)
              const Icon(Icons.expand_more, color: Color(0xFF5C5C7A))
            else
              const SizedBox(width: 24),
          ],
        ),
        children: sub.map((sf) => _buildNode(context, ref, all, sf, depth + 1)).toList(),
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final folders = ref.watch(foldersNotifierProvider).valueOrNull ?? [];
    final roots = folders.where((f) => f.parentId == null).toList();

    return Container(
      padding: const EdgeInsets.only(top: 16),
      constraints: BoxConstraints(maxHeight: MediaQuery.of(context).size.height * 0.8),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Seleccionar Carpeta', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
                TextButton.icon(
                  onPressed: () => _createNewFolder(context, ref, null),
                  icon: const Icon(Icons.create_new_folder_rounded, color: Color(0xFF6C63FF)),
                  label: const Text('Nueva raíz', style: TextStyle(color: Color(0xFF6C63FF))),
                ),
              ],
            ),
          ),
          const Divider(color: Color(0xFF2A2A4A)),
          Expanded(
            child: ListView(
              children: [
                ListTile(
                  leading: const Icon(Icons.inventory_2_outlined, color: Color(0xFF9E9EBF)),
                  title: Text('Ninguna (Bóveda principal)', style: TextStyle(color: selectedFolderId == null ? const Color(0xFF6C63FF) : Colors.white, fontWeight: selectedFolderId == null ? FontWeight.bold : FontWeight.normal)),
                  trailing: selectedFolderId == null ? const Icon(Icons.check_circle_rounded, color: Color(0xFF6C63FF)) : null,
                  onTap: () => Navigator.pop(context, <String?>[null]),
                ),
                ...roots.map((r) => _buildNode(context, ref, folders, r, 0)),
              ],
            ),
          )
        ],
      ),
    );
  }
}
