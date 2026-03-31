import 'package:drift/drift.dart';

/// Categories are not sensitive — stored in plain text.
class CategoryEntries extends Table {
  TextColumn get id => text()();
  TextColumn get name => text()();
  TextColumn get icon => text()();
  IntColumn get createdAt => integer()();

  @override
  Set<Column> get primaryKey => {id};
}
