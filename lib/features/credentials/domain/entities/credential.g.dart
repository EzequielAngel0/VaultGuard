// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'credential.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CustomFieldImpl _$$CustomFieldImplFromJson(Map<String, dynamic> json) =>
    _$CustomFieldImpl(
      label: json['label'] as String,
      value: json['value'] as String,
      isSecret: json['isSecret'] as bool? ?? false,
    );

Map<String, dynamic> _$$CustomFieldImplToJson(_$CustomFieldImpl instance) =>
    <String, dynamic>{
      'label': instance.label,
      'value': instance.value,
      'isSecret': instance.isSecret,
    };

_$CredentialImpl _$$CredentialImplFromJson(Map<String, dynamic> json) =>
    _$CredentialImpl(
      id: json['id'] as String,
      type: $enumDecode(_$CredentialTypeEnumMap, json['type']),
      title: json['title'] as String,
      username: json['username'] as String?,
      password: json['password'] as String?,
      website: json['website'] as String?,
      notes: json['notes'] as String?,
      customFields:
          (json['customFields'] as List<dynamic>?)
              ?.map((e) => CustomField.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      categoryId: json['categoryId'] as String?,
      isFavorite: json['isFavorite'] as bool? ?? false,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$CredentialImplToJson(_$CredentialImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': _$CredentialTypeEnumMap[instance.type]!,
      'title': instance.title,
      'username': instance.username,
      'password': instance.password,
      'website': instance.website,
      'notes': instance.notes,
      'customFields': instance.customFields,
      'categoryId': instance.categoryId,
      'isFavorite': instance.isFavorite,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
    };

const _$CredentialTypeEnumMap = {
  CredentialType.password: 'password',
  CredentialType.apiKey: 'apiKey',
  CredentialType.secureNote: 'secureNote',
  CredentialType.totp: 'totp',
};
