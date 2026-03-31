import 'dart:convert';
import 'dart:isolate';
import 'dart:typed_data';

import 'package:injectable/injectable.dart';

import 'crypto_isolate.dart';
import 'i_security_service.dart';

@LazySingleton(as: ISecurityService)
class SecurityServiceImpl implements ISecurityService {
  @override
  Future<Uint8List> deriveKey({
    required String password,
    required String saltBase64,
    required int memory,
    required int iterations,
    required int parallelism,
  }) async {
    final saltBytes = Uint8List.fromList(base64Decode(saltBase64));
    return Isolate.run(
      () => deriveKeyIsolate(
        DeriveKeyParams(
          password: password,
          saltBytes: saltBytes,
          memory: memory,
          iterations: iterations,
          parallelism: parallelism,
        ),
      ),
    );
  }

  @override
  Future<Uint8List> encrypt(Uint8List plaintext, Uint8List keyBytes) =>
      Isolate.run(
        () => encryptIsolate(EncryptParams(plaintext: plaintext, keyBytes: keyBytes)),
      );

  @override
  Future<Uint8List> decrypt(Uint8List cipherBlob, Uint8List keyBytes) =>
      Isolate.run(
        () => decryptIsolate(DecryptParams(cipherBlob: cipherBlob, keyBytes: keyBytes)),
      );

  @override
  Future<String> generateSaltBase64() =>
      Isolate.run(() => generateSaltBase64Isolate(null));

  @override
  Future<String> createVerificationData(Uint8List keyBytes) =>
      Isolate.run(() => createVerificationDataIsolate(keyBytes));

  @override
  Future<bool> verifyKey(Uint8List keyBytes, String verificationData) =>
      Isolate.run(
        () => verifyKeyIsolate(
          (keyBytes: keyBytes, verificationDataBase64: verificationData),
        ),
      );

  @override
  Future<Uint8List> sha256(Uint8List data) =>
      Isolate.run(() => sha256Isolate(data));
}
