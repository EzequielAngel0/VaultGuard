import 'package:drift/drift.dart';
import 'package:injectable/injectable.dart';

import '../app_database.dart';
import '../tables/password_history_entries.dart';

part 'password_history_dao.g.dart';

@lazySingleton
@DriftAccessor(tables: [PasswordHistoryEntries])
class PasswordHistoryDao extends DatabaseAccessor<AppDatabase>
    with _$PasswordHistoryDaoMixin {
  PasswordHistoryDao(super.db);

  Future<List<PasswordHistoryEntry>> getByCredential(
    String credentialId, {
    int limit = 10,
  }) =>
      (select(passwordHistoryEntries)
            ..where((t) => t.credentialId.equals(credentialId))
            ..orderBy([(t) => OrderingTerm.desc(t.createdAt)])
            ..limit(limit))
          .get();

  Future<void> insert(PasswordHistoryEntriesCompanion companion) =>
      into(passwordHistoryEntries).insert(companion);

  Future<void> pruneOld(String credentialId, {int keep = 10}) async {
    final all = await getByCredential(credentialId, limit: 100);
    if (all.length > keep) {
      final toDelete = all.sublist(keep);
      for (final e in toDelete) {
        await (delete(passwordHistoryEntries)
              ..where((t) => t.id.equals(e.id)))
            .go();
      }
    }
  }
}
