// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'master_key_config.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$KdfParamsImpl _$$KdfParamsImplFromJson(Map<String, dynamic> json) =>
    _$KdfParamsImpl(
      memory: (json['memory'] as num).toInt(),
      iterations: (json['iterations'] as num).toInt(),
      parallelism: (json['parallelism'] as num).toInt(),
      keyLength: (json['keyLength'] as num).toInt(),
    );

Map<String, dynamic> _$$KdfParamsImplToJson(_$KdfParamsImpl instance) =>
    <String, dynamic>{
      'memory': instance.memory,
      'iterations': instance.iterations,
      'parallelism': instance.parallelism,
      'keyLength': instance.keyLength,
    };

_$MasterKeyConfigImpl _$$MasterKeyConfigImplFromJson(
  Map<String, dynamic> json,
) => _$MasterKeyConfigImpl(
  salt: json['salt'] as String,
  kdfAlgorithm: $enumDecode(_$KdfAlgorithmEnumMap, json['kdfAlgorithm']),
  kdfParams: KdfParams.fromJson(json['kdfParams'] as Map<String, dynamic>),
  verificationData: json['verificationData'] as String,
);

Map<String, dynamic> _$$MasterKeyConfigImplToJson(
  _$MasterKeyConfigImpl instance,
) => <String, dynamic>{
  'salt': instance.salt,
  'kdfAlgorithm': _$KdfAlgorithmEnumMap[instance.kdfAlgorithm]!,
  'kdfParams': instance.kdfParams,
  'verificationData': instance.verificationData,
};

const _$KdfAlgorithmEnumMap = {
  KdfAlgorithm.argon2id: 'argon2id',
  KdfAlgorithm.pbkdf2: 'pbkdf2',
};
