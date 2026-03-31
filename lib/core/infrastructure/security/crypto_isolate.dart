// Top-level functions required by Isolate.run() — no closures, no platform channels.
// All operations are pure Dart (cryptography package, no native bindings in isolate).

import 'dart:convert';
import 'dart:math';
import 'dart:typed_data';

import 'package:cryptography/cryptography.dart';

// ── Verification constant ─────────────────────────────────────────────────────
const _kVerificationPlaintext = 'VaultGuard::v1::verify';

// ─────────────────────────────────────────────────────────────────────────────
// Message models (must be sendable across isolate boundary — simple data only)
// ─────────────────────────────────────────────────────────────────────────────

final class DeriveKeyParams {
  const DeriveKeyParams({
    required this.password,
    required this.saltBytes,
    required this.memory,
    required this.iterations,
    required this.parallelism,
  });
  final String password;
  final Uint8List saltBytes;
  final int memory;
  final int iterations;
  final int parallelism;
}

final class EncryptParams {
  const EncryptParams({required this.plaintext, required this.keyBytes});
  final Uint8List plaintext;
  final Uint8List keyBytes;
}

final class DecryptParams {
  const DecryptParams({required this.cipherBlob, required this.keyBytes});
  final Uint8List cipherBlob;
  final Uint8List keyBytes;
}

// ─────────────────────────────────────────────────────────────────────────────
// Isolate-safe top-level functions
// ─────────────────────────────────────────────────────────────────────────────

/// Derives a 256-bit key using Argon2id. Heavy CPU — runs in background isolate.
Future<Uint8List> deriveKeyIsolate(DeriveKeyParams p) async {
  final argon2 = Argon2id(
    memory: p.memory,
    parallelism: p.parallelism,
    iterations: p.iterations,
    hashLength: 32,
  );
  final secretKey = await argon2.deriveKeyFromPassword(
    password: p.password,
    nonce: p.saltBytes,
  );
  return Uint8List.fromList(await secretKey.extractBytes());
}

/// Encrypts [p.plaintext] with AES-256-GCM.
/// Returns nonce(12) || ciphertext || tag(16) as a single Uint8List.
Future<Uint8List> encryptIsolate(EncryptParams p) async {
  final aesGcm = AesGcm.with256bits();
  final secretKey = SecretKeyData(p.keyBytes);
  final nonce = aesGcm.newNonce();
  final secretBox = await aesGcm.encrypt(
    p.plaintext,
    secretKey: secretKey,
    nonce: nonce,
  );
  return Uint8List.fromList(secretBox.concatenation());
}

/// Decrypts a blob produced by [encryptIsolate].
Future<Uint8List> decryptIsolate(DecryptParams p) async {
  final aesGcm = AesGcm.with256bits();
  const nonceLen = 12;
  const tagLen = 16;

  final nonce = p.cipherBlob.sublist(0, nonceLen);
  final ciphertext = p.cipherBlob.sublist(nonceLen, p.cipherBlob.length - tagLen);
  final mac = p.cipherBlob.sublist(p.cipherBlob.length - tagLen);

  final secretBox = SecretBox(
    ciphertext,
    nonce: nonce,
    mac: Mac(mac),
  );
  final secretKey = SecretKeyData(p.keyBytes);
  final plaintext = await aesGcm.decrypt(secretBox, secretKey: secretKey);
  return Uint8List.fromList(plaintext);
}

/// Generates a 32-byte cryptographically random salt, returns base64.
Future<String> generateSaltBase64Isolate(Null _) async {
  final random = Random.secure();
  final bytes = Uint8List.fromList(
    List.generate(32, (_) => random.nextInt(256)),
  );
  return base64Encode(bytes);
}

/// Creates the base64 verification blob for the given key.
Future<String> createVerificationDataIsolate(Uint8List keyBytes) async {
  final plaintext = utf8.encode(_kVerificationPlaintext);
  final blob = await encryptIsolate(
    EncryptParams(plaintext: Uint8List.fromList(plaintext), keyBytes: keyBytes),
  );
  return base64Encode(blob);
}

/// Returns true if [keyBytes] decrypts [verificationDataBase64] to the constant.
Future<bool> verifyKeyIsolate(
    ({Uint8List keyBytes, String verificationDataBase64}) p) async {
  try {
    final blob = base64Decode(p.verificationDataBase64);
    final decrypted = await decryptIsolate(
      DecryptParams(cipherBlob: blob, keyBytes: p.keyBytes),
    );
    final text = utf8.decode(decrypted);
    return text == _kVerificationPlaintext;
  } catch (_) {
    return false;
  }
}

/// Computes SHA-256 of [data].
Future<Uint8List> sha256Isolate(Uint8List data) async {
  final sha = Sha256();
  final hash = await sha.hash(data);
  return Uint8List.fromList(hash.bytes);
}
