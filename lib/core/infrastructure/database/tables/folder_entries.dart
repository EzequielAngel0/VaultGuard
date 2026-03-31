import 'package:drift/drift.dart';

/// Folders / Collections for grouping credentials.
/// Not sensitive — stored in plain text.
class FolderEntries extends Table {
  TextColumn get id => text()();
  TextColumn get parentId => text().nullable()();
  TextColumn get name => text()();
  TextColumn get icon => text().withDefault(const Constant('folder'))();
  TextColumn get colorHex =>
      text().withDefault(const Constant('#6C63FF'))();
  BoolColumn get isFavorite =>
      boolean().withDefault(const Constant(false))();
  IntColumn get createdAt => integer()();

  @override
  Set<Column> get primaryKey => {id};
}
