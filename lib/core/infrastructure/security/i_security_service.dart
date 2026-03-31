import 'dart:typed_data';

abstract interface class ISecurityService {
  /// Derives a 256-bit key from [password] + [saltBase64] using Argon2id.
  /// MUST be called from a background isolate to avoid blocking the UI thread.
  Future<Uint8List> deriveKey({
    required String password,
    required String saltBase64,
    required int memory,
    required int iterations,
    required int parallelism,
  });

  /// Encrypts [plaintext] with AES-256-GCM.
  /// Returns a single blob: nonce (12 B) || ciphertext || GCM tag (16 B).
  Future<Uint8List> encrypt(Uint8List plaintext, Uint8List keyBytes);

  /// Decrypts a blob produced by [encrypt].
  Future<Uint8List> decrypt(Uint8List cipherBlob, Uint8List keyBytes);

  /// Returns a cryptographically random base64-encoded salt (32 bytes).
  Future<String> generateSaltBase64();

  /// Encrypts a well-known constant with [keyBytes] and returns the base64
  /// blob stored as [MasterKeyConfig.verificationData].
  Future<String> createVerificationData(Uint8List keyBytes);

  /// Returns true if [keyBytes] successfully decrypts [verificationData].
  Future<bool> verifyKey(Uint8List keyBytes, String verificationData);

  /// Returns SHA-256 hash of [data].
  Future<Uint8List> sha256(Uint8List data);
}
