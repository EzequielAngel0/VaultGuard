// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'folder.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FolderImpl _$$FolderImplFromJson(Map<String, dynamic> json) => _$FolderImpl(
  id: json['id'] as String,
  parentId: json['parentId'] as String?,
  name: json['name'] as String,
  icon: json['icon'] as String? ?? 'folder',
  colorHex: json['colorHex'] as String? ?? '#6C63FF',
  isFavorite: json['isFavorite'] as bool? ?? false,
  createdAt: DateTime.parse(json['createdAt'] as String),
);

Map<String, dynamic> _$$FolderImplToJson(_$FolderImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'parentId': instance.parentId,
      'name': instance.name,
      'icon': instance.icon,
      'colorHex': instance.colorHex,
      'isFavorite': instance.isFavorite,
      'createdAt': instance.createdAt.toIso8601String(),
    };
