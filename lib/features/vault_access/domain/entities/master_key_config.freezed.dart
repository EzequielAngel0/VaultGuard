// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'master_key_config.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

KdfParams _$KdfParamsFromJson(Map<String, dynamic> json) {
  return _KdfParams.fromJson(json);
}

/// @nodoc
mixin _$KdfParams {
  int get memory =>
      throw _privateConstructorUsedError; // KB — Argon2id memory cost
  int get iterations => throw _privateConstructorUsedError; // time cost
  int get parallelism =>
      throw _privateConstructorUsedError; // degree of parallelism
  int get keyLength => throw _privateConstructorUsedError;

  /// Serializes this KdfParams to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of KdfParams
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $KdfParamsCopyWith<KdfParams> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $KdfParamsCopyWith<$Res> {
  factory $KdfParamsCopyWith(KdfParams value, $Res Function(KdfParams) then) =
      _$KdfParamsCopyWithImpl<$Res, KdfParams>;
  @useResult
  $Res call({int memory, int iterations, int parallelism, int keyLength});
}

/// @nodoc
class _$KdfParamsCopyWithImpl<$Res, $Val extends KdfParams>
    implements $KdfParamsCopyWith<$Res> {
  _$KdfParamsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of KdfParams
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? memory = null,
    Object? iterations = null,
    Object? parallelism = null,
    Object? keyLength = null,
  }) {
    return _then(
      _value.copyWith(
            memory: null == memory
                ? _value.memory
                : memory // ignore: cast_nullable_to_non_nullable
                      as int,
            iterations: null == iterations
                ? _value.iterations
                : iterations // ignore: cast_nullable_to_non_nullable
                      as int,
            parallelism: null == parallelism
                ? _value.parallelism
                : parallelism // ignore: cast_nullable_to_non_nullable
                      as int,
            keyLength: null == keyLength
                ? _value.keyLength
                : keyLength // ignore: cast_nullable_to_non_nullable
                      as int,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$KdfParamsImplCopyWith<$Res>
    implements $KdfParamsCopyWith<$Res> {
  factory _$$KdfParamsImplCopyWith(
    _$KdfParamsImpl value,
    $Res Function(_$KdfParamsImpl) then,
  ) = __$$KdfParamsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int memory, int iterations, int parallelism, int keyLength});
}

/// @nodoc
class __$$KdfParamsImplCopyWithImpl<$Res>
    extends _$KdfParamsCopyWithImpl<$Res, _$KdfParamsImpl>
    implements _$$KdfParamsImplCopyWith<$Res> {
  __$$KdfParamsImplCopyWithImpl(
    _$KdfParamsImpl _value,
    $Res Function(_$KdfParamsImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of KdfParams
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? memory = null,
    Object? iterations = null,
    Object? parallelism = null,
    Object? keyLength = null,
  }) {
    return _then(
      _$KdfParamsImpl(
        memory: null == memory
            ? _value.memory
            : memory // ignore: cast_nullable_to_non_nullable
                  as int,
        iterations: null == iterations
            ? _value.iterations
            : iterations // ignore: cast_nullable_to_non_nullable
                  as int,
        parallelism: null == parallelism
            ? _value.parallelism
            : parallelism // ignore: cast_nullable_to_non_nullable
                  as int,
        keyLength: null == keyLength
            ? _value.keyLength
            : keyLength // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$KdfParamsImpl implements _KdfParams {
  const _$KdfParamsImpl({
    required this.memory,
    required this.iterations,
    required this.parallelism,
    required this.keyLength,
  });

  factory _$KdfParamsImpl.fromJson(Map<String, dynamic> json) =>
      _$$KdfParamsImplFromJson(json);

  @override
  final int memory;
  // KB — Argon2id memory cost
  @override
  final int iterations;
  // time cost
  @override
  final int parallelism;
  // degree of parallelism
  @override
  final int keyLength;

  @override
  String toString() {
    return 'KdfParams(memory: $memory, iterations: $iterations, parallelism: $parallelism, keyLength: $keyLength)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$KdfParamsImpl &&
            (identical(other.memory, memory) || other.memory == memory) &&
            (identical(other.iterations, iterations) ||
                other.iterations == iterations) &&
            (identical(other.parallelism, parallelism) ||
                other.parallelism == parallelism) &&
            (identical(other.keyLength, keyLength) ||
                other.keyLength == keyLength));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, memory, iterations, parallelism, keyLength);

  /// Create a copy of KdfParams
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$KdfParamsImplCopyWith<_$KdfParamsImpl> get copyWith =>
      __$$KdfParamsImplCopyWithImpl<_$KdfParamsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$KdfParamsImplToJson(this);
  }
}

abstract class _KdfParams implements KdfParams {
  const factory _KdfParams({
    required final int memory,
    required final int iterations,
    required final int parallelism,
    required final int keyLength,
  }) = _$KdfParamsImpl;

  factory _KdfParams.fromJson(Map<String, dynamic> json) =
      _$KdfParamsImpl.fromJson;

  @override
  int get memory; // KB — Argon2id memory cost
  @override
  int get iterations; // time cost
  @override
  int get parallelism; // degree of parallelism
  @override
  int get keyLength;

  /// Create a copy of KdfParams
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$KdfParamsImplCopyWith<_$KdfParamsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

MasterKeyConfig _$MasterKeyConfigFromJson(Map<String, dynamic> json) {
  return _MasterKeyConfig.fromJson(json);
}

/// @nodoc
mixin _$MasterKeyConfig {
  /// Random salt generated once at vault creation (base64-encoded).
  String get salt => throw _privateConstructorUsedError;
  KdfAlgorithm get kdfAlgorithm => throw _privateConstructorUsedError;
  KdfParams get kdfParams => throw _privateConstructorUsedError;

  /// Encrypted verification token used to confirm the master password
  /// without storing the key. Format: base64(iv + ciphertext + tag).
  String get verificationData => throw _privateConstructorUsedError;

  /// Serializes this MasterKeyConfig to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MasterKeyConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MasterKeyConfigCopyWith<MasterKeyConfig> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MasterKeyConfigCopyWith<$Res> {
  factory $MasterKeyConfigCopyWith(
    MasterKeyConfig value,
    $Res Function(MasterKeyConfig) then,
  ) = _$MasterKeyConfigCopyWithImpl<$Res, MasterKeyConfig>;
  @useResult
  $Res call({
    String salt,
    KdfAlgorithm kdfAlgorithm,
    KdfParams kdfParams,
    String verificationData,
  });

  $KdfParamsCopyWith<$Res> get kdfParams;
}

/// @nodoc
class _$MasterKeyConfigCopyWithImpl<$Res, $Val extends MasterKeyConfig>
    implements $MasterKeyConfigCopyWith<$Res> {
  _$MasterKeyConfigCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MasterKeyConfig
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? salt = null,
    Object? kdfAlgorithm = null,
    Object? kdfParams = null,
    Object? verificationData = null,
  }) {
    return _then(
      _value.copyWith(
            salt: null == salt
                ? _value.salt
                : salt // ignore: cast_nullable_to_non_nullable
                      as String,
            kdfAlgorithm: null == kdfAlgorithm
                ? _value.kdfAlgorithm
                : kdfAlgorithm // ignore: cast_nullable_to_non_nullable
                      as KdfAlgorithm,
            kdfParams: null == kdfParams
                ? _value.kdfParams
                : kdfParams // ignore: cast_nullable_to_non_nullable
                      as KdfParams,
            verificationData: null == verificationData
                ? _value.verificationData
                : verificationData // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }

  /// Create a copy of MasterKeyConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $KdfParamsCopyWith<$Res> get kdfParams {
    return $KdfParamsCopyWith<$Res>(_value.kdfParams, (value) {
      return _then(_value.copyWith(kdfParams: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$MasterKeyConfigImplCopyWith<$Res>
    implements $MasterKeyConfigCopyWith<$Res> {
  factory _$$MasterKeyConfigImplCopyWith(
    _$MasterKeyConfigImpl value,
    $Res Function(_$MasterKeyConfigImpl) then,
  ) = __$$MasterKeyConfigImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String salt,
    KdfAlgorithm kdfAlgorithm,
    KdfParams kdfParams,
    String verificationData,
  });

  @override
  $KdfParamsCopyWith<$Res> get kdfParams;
}

/// @nodoc
class __$$MasterKeyConfigImplCopyWithImpl<$Res>
    extends _$MasterKeyConfigCopyWithImpl<$Res, _$MasterKeyConfigImpl>
    implements _$$MasterKeyConfigImplCopyWith<$Res> {
  __$$MasterKeyConfigImplCopyWithImpl(
    _$MasterKeyConfigImpl _value,
    $Res Function(_$MasterKeyConfigImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of MasterKeyConfig
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? salt = null,
    Object? kdfAlgorithm = null,
    Object? kdfParams = null,
    Object? verificationData = null,
  }) {
    return _then(
      _$MasterKeyConfigImpl(
        salt: null == salt
            ? _value.salt
            : salt // ignore: cast_nullable_to_non_nullable
                  as String,
        kdfAlgorithm: null == kdfAlgorithm
            ? _value.kdfAlgorithm
            : kdfAlgorithm // ignore: cast_nullable_to_non_nullable
                  as KdfAlgorithm,
        kdfParams: null == kdfParams
            ? _value.kdfParams
            : kdfParams // ignore: cast_nullable_to_non_nullable
                  as KdfParams,
        verificationData: null == verificationData
            ? _value.verificationData
            : verificationData // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$MasterKeyConfigImpl implements _MasterKeyConfig {
  const _$MasterKeyConfigImpl({
    required this.salt,
    required this.kdfAlgorithm,
    required this.kdfParams,
    required this.verificationData,
  });

  factory _$MasterKeyConfigImpl.fromJson(Map<String, dynamic> json) =>
      _$$MasterKeyConfigImplFromJson(json);

  /// Random salt generated once at vault creation (base64-encoded).
  @override
  final String salt;
  @override
  final KdfAlgorithm kdfAlgorithm;
  @override
  final KdfParams kdfParams;

  /// Encrypted verification token used to confirm the master password
  /// without storing the key. Format: base64(iv + ciphertext + tag).
  @override
  final String verificationData;

  @override
  String toString() {
    return 'MasterKeyConfig(salt: $salt, kdfAlgorithm: $kdfAlgorithm, kdfParams: $kdfParams, verificationData: $verificationData)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MasterKeyConfigImpl &&
            (identical(other.salt, salt) || other.salt == salt) &&
            (identical(other.kdfAlgorithm, kdfAlgorithm) ||
                other.kdfAlgorithm == kdfAlgorithm) &&
            (identical(other.kdfParams, kdfParams) ||
                other.kdfParams == kdfParams) &&
            (identical(other.verificationData, verificationData) ||
                other.verificationData == verificationData));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, salt, kdfAlgorithm, kdfParams, verificationData);

  /// Create a copy of MasterKeyConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MasterKeyConfigImplCopyWith<_$MasterKeyConfigImpl> get copyWith =>
      __$$MasterKeyConfigImplCopyWithImpl<_$MasterKeyConfigImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$MasterKeyConfigImplToJson(this);
  }
}

abstract class _MasterKeyConfig implements MasterKeyConfig {
  const factory _MasterKeyConfig({
    required final String salt,
    required final KdfAlgorithm kdfAlgorithm,
    required final KdfParams kdfParams,
    required final String verificationData,
  }) = _$MasterKeyConfigImpl;

  factory _MasterKeyConfig.fromJson(Map<String, dynamic> json) =
      _$MasterKeyConfigImpl.fromJson;

  /// Random salt generated once at vault creation (base64-encoded).
  @override
  String get salt;
  @override
  KdfAlgorithm get kdfAlgorithm;
  @override
  KdfParams get kdfParams;

  /// Encrypted verification token used to confirm the master password
  /// without storing the key. Format: base64(iv + ciphertext + tag).
  @override
  String get verificationData;

  /// Create a copy of MasterKeyConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MasterKeyConfigImplCopyWith<_$MasterKeyConfigImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
