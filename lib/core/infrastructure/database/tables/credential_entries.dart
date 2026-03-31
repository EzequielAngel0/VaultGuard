import 'package:drift/drift.dart';

/// Drift table for credentials.
/// Only non-sensitive metadata is stored in plain text.
/// All sensitive fields (username, password, website, notes, customFields)
/// are serialised to JSON and stored as a single AES-256-GCM encrypted blob.
class CredentialEntries extends Table {
  /// Unique credential ID (UUID v4).
  TextColumn get id => text()();

  /// Human-readable title — not considered a secret (shown in vault list).
  TextColumn get title => text()();

  /// Credential type enum string (password, apiKey, secureNote, cryptoWallet).
  TextColumn get type => text()();

  /// Optional category ID — unencrypted for filtering.
  TextColumn get categoryId => text().nullable()();

  /// Favourite flag — unencrypted for quick access.
  BoolColumn get isFavorite =>
      boolean().withDefault(const Constant(false))();

  /// AES-256-GCM blob: nonce(12) || ciphertext || tag(16).
  /// Contains JSON-encoded sensitive payload.
  BlobColumn get encryptedPayload => blob()();

  /// Unix timestamp in milliseconds.
  IntColumn get createdAt => integer()();

  /// Unix timestamp in milliseconds.
  IntColumn get updatedAt => integer()();

  @override
  Set<Column> get primaryKey => {id};
}
