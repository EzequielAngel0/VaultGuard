import 'package:drift/drift.dart';

import '../app_database.dart';
import '../tables/category_entries.dart';

part 'category_dao.g.dart';

@DriftAccessor(tables: [CategoryEntries])
class CategoryDao extends DatabaseAccessor<AppDatabase>
    with _$CategoryDaoMixin {
  CategoryDao(super.db);

  Future<List<CategoryEntry>> getAll() =>
      select(categoryEntries).get();

  Future<CategoryEntry?> getById(String id) =>
      (select(categoryEntries)..where((t) => t.id.equals(id)))
          .getSingleOrNull();

  Future<void> upsert(CategoryEntriesCompanion entry) =>
      into(categoryEntries).insertOnConflictUpdate(entry);

  Future<int> deleteById(String id) =>
      (delete(categoryEntries)..where((t) => t.id.equals(id))).go();
}
