import 'package:freezed_annotation/freezed_annotation.dart';

part 'credential.freezed.dart';
part 'credential.g.dart';

enum CredentialType {
  password,
  apiKey,
  secureNote,
  totp,
}

@freezed
class CustomField with _$CustomField {
  const factory CustomField({
    required String label,
    required String value,   // stored encrypted
    @Default(false) bool isSecret,
  }) = _CustomField;

  factory CustomField.fromJson(Map<String, dynamic> json) =>
      _$CustomFieldFromJson(json);
}

@freezed
class Credential with _$Credential {
  const factory Credential({
    required String id,
    required CredentialType type,
    required String title,
    String? username,
    String? password,    // stored encrypted
    String? website,
    String? notes,       // stored encrypted
    @Default([]) List<CustomField> customFields,
    String? categoryId,
    @Default(false) bool isFavorite,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _Credential;

  factory Credential.fromJson(Map<String, dynamic> json) =>
      _$CredentialFromJson(json);
}
