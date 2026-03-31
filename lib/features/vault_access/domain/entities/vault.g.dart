// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vault.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$VaultImpl _$$VaultImplFromJson(Map<String, dynamic> json) => _$VaultImpl(
  id: json['id'] as String,
  createdAt: DateTime.parse(json['createdAt'] as String),
  updatedAt: DateTime.parse(json['updatedAt'] as String),
  isInitialized: json['isInitialized'] as bool,
);

Map<String, dynamic> _$$VaultImplToJson(_$VaultImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      'isInitialized': instance.isInitialized,
    };
