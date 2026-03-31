import 'package:drift/drift.dart';

/// Password history log — stores previous encrypted payloads.
class PasswordHistoryEntries extends Table {
  TextColumn get id => text()();

  /// FK to credential.
  TextColumn get credentialId => text()();

  /// AES-256-GCM encrypted password snapshot.
  BlobColumn get encryptedPayload => blob()();

  IntColumn get createdAt => integer()();

  @override
  Set<Column> get primaryKey => {id};
}
