import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../app/di/injection.dart';
import '../../../router/app_router.dart';
import '../../../core/services/security_audit_service.dart';
import '../../../shared/widgets/vault_app_bar.dart';

part 'security_audit_screen.g.dart';

@riverpod
Future<List<AuditIssue>> auditResults(Ref ref) =>
    getIt<SecurityAuditService>().runAudit();

class SecurityAuditScreen extends ConsumerWidget {
  const SecurityAuditScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final auditAsync = ref.watch(auditResultsProvider);

    return Scaffold(
      appBar: VaultAppBar(title: 'Auditoría de seguridad'),
      body: auditAsync.when(
        loading: () => const Center(
          child: CircularProgressIndicator(color: Color(0xFF6C63FF)),
        ),
        error: (e, _) => Center(
          child: Text('Error: $e',
              style: const TextStyle(color: Color(0xFFCF6679))),
        ),
        data: (issues) {
          if (issues.isEmpty) {
            return const _AllGood();
          }
          return ListView.separated(
            padding: const EdgeInsets.all(16),
            itemCount: issues.length,
            separatorBuilder: (_, _) => const SizedBox(height: 10),
            itemBuilder: (_, i) => _IssueCard(issue: issues[i]),
          );
        },
      ),
    );
  }
}

class _AllGood extends StatelessWidget {
  const _AllGood();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: const Color(0xFF4CAF50).withValues(alpha: 0.12),
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.verified_rounded,
                color: Color(0xFF4CAF50), size: 60),
          ),
          const SizedBox(height: 20),
          const Text('¡Todo en orden!',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          const Text(
            'No se encontraron problemas en tu bóveda.',
            style: TextStyle(color: Color(0xFF9E9EBF), fontSize: 14),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

class _IssueCard extends StatelessWidget {
  const _IssueCard({required this.issue});
  final AuditIssue issue;

  static const _severityData = {
    AuditSeverity.critical: (
      color: Color(0xFFCF6679),
      icon: Icons.error_rounded,
      label: 'Crítico',
    ),
    AuditSeverity.warning: (
      color: Color(0xFFFFB74D),
      icon: Icons.warning_rounded,
      label: 'Advertencia',
    ),
    AuditSeverity.info: (
      color: Color(0xFF6C63FF),
      icon: Icons.info_rounded,
      label: 'Info',
    ),
  };

  @override
  Widget build(BuildContext context) {
    final data = _severityData[issue.severity]!;
    return GestureDetector(
      onTap: () => context.push(AppRoutes.credentialEdit.replaceFirst(':id', issue.credential.id)),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: const Color(0xFF16213E),
          borderRadius: BorderRadius.circular(14),
          border: Border.all(
            color: data.color.withValues(alpha: 0.3),
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(data.icon, color: data.color, size: 22),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 6, vertical: 2),
                        decoration: BoxDecoration(
                          color: data.color.withValues(alpha: 0.15),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Text(
                          data.label,
                          style: TextStyle(
                            color: data.color,
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          issue.credential.title,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 6),
                  Text(
                    issue.title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    issue.description,
                    style: const TextStyle(
                      color: Color(0xFF9E9EBF),
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
