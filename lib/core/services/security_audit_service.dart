import 'package:injectable/injectable.dart';

import '../../features/credentials/domain/entities/credential.dart';
import '../../features/credentials/domain/repositories/i_credential_repository.dart';

enum AuditSeverity { critical, warning, info }

class AuditIssue {
  const AuditIssue({
    required this.credential,
    required this.severity,
    required this.title,
    required this.description,
  });
  final Credential credential;
  final AuditSeverity severity;
  final String title;
  final String description;
}

@lazySingleton
class SecurityAuditService {
  SecurityAuditService(this._credRepo);

  final ICredentialRepository _credRepo;

  Future<List<AuditIssue>> runAudit() async {
    final credentials = await _credRepo.getAll();
    final issues = <AuditIssue>[];

    // Build frequency map for password reuse detection
    final passwordCount = <String, int>{};
    for (final c in credentials) {
      if (c.password != null && c.password!.isNotEmpty) {
        passwordCount[c.password!] = (passwordCount[c.password!] ?? 0) + 1;
      }
    }

    for (final c in credentials) {
      if (c.type == CredentialType.secureNote || c.type == CredentialType.totp) {
        continue;
      }

      final pwd = c.password;

      // Weak password check
      if (pwd != null && pwd.isNotEmpty) {
        if (pwd.length < 8) {
          issues.add(AuditIssue(
            credential: c,
            severity: AuditSeverity.critical,
            title: 'Contraseña demasiado corta',
            description: 'Tiene menos de 8 caracteres.',
          ));
        } else if (_isOnlyLetters(pwd)) {
          issues.add(AuditIssue(
            credential: c,
            severity: AuditSeverity.warning,
            title: 'Contraseña débil',
            description: 'Solo letras, sin números ni símbolos.',
          ));
        } else if (_isOnlyNumbers(pwd)) {
          issues.add(AuditIssue(
            credential: c,
            severity: AuditSeverity.warning,
            title: 'Contraseña débil',
            description: 'Solo números.',
          ));
        }

        // Reuse check
        if ((passwordCount[pwd] ?? 0) > 1) {
          issues.add(AuditIssue(
            credential: c,
            severity: AuditSeverity.warning,
            title: 'Contraseña reutilizada',
            description: 'Esta contraseña está usada en múltiples cuentas.',
          ));
        }
      } else if (c.type == CredentialType.password) {
        // Without password
        issues.add(AuditIssue(
          credential: c,
          severity: AuditSeverity.critical,
          title: 'Sin contraseña guardada',
          description: 'Esta credencial no tiene contraseña registrada.',
        ));
      }

      // Staleness check — not updated in 90+ days
      final daysSinceUpdate =
          DateTime.now().difference(c.updatedAt).inDays;
      if (daysSinceUpdate >= 90) {
        issues.add(AuditIssue(
          credential: c,
          severity: AuditSeverity.info,
          title: 'Contraseña antigua',
          description: 'No se ha actualizado en $daysSinceUpdate días.',
        ));
      }
    }

    // Sort: critical → warning → info
    issues.sort((a, b) => a.severity.index.compareTo(b.severity.index));
    return issues;
  }

  bool _isOnlyLetters(String s) => RegExp(r'^[a-zA-Z]+$').hasMatch(s);
  bool _isOnlyNumbers(String s) => RegExp(r'^\d+$').hasMatch(s);
}
