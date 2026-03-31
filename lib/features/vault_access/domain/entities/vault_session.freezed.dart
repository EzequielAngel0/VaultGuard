// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'vault_session.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

VaultSession _$VaultSessionFromJson(Map<String, dynamic> json) {
  return _VaultSession.fromJson(json);
}

/// @nodoc
mixin _$VaultSession {
  bool get isUnlocked => throw _privateConstructorUsedError;
  DateTime get unlockedAt => throw _privateConstructorUsedError;
  DateTime get expiresAt => throw _privateConstructorUsedError;

  /// Serializes this VaultSession to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of VaultSession
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $VaultSessionCopyWith<VaultSession> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VaultSessionCopyWith<$Res> {
  factory $VaultSessionCopyWith(
    VaultSession value,
    $Res Function(VaultSession) then,
  ) = _$VaultSessionCopyWithImpl<$Res, VaultSession>;
  @useResult
  $Res call({bool isUnlocked, DateTime unlockedAt, DateTime expiresAt});
}

/// @nodoc
class _$VaultSessionCopyWithImpl<$Res, $Val extends VaultSession>
    implements $VaultSessionCopyWith<$Res> {
  _$VaultSessionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of VaultSession
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isUnlocked = null,
    Object? unlockedAt = null,
    Object? expiresAt = null,
  }) {
    return _then(
      _value.copyWith(
            isUnlocked: null == isUnlocked
                ? _value.isUnlocked
                : isUnlocked // ignore: cast_nullable_to_non_nullable
                      as bool,
            unlockedAt: null == unlockedAt
                ? _value.unlockedAt
                : unlockedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            expiresAt: null == expiresAt
                ? _value.expiresAt
                : expiresAt // ignore: cast_nullable_to_non_nullable
                      as DateTime,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$VaultSessionImplCopyWith<$Res>
    implements $VaultSessionCopyWith<$Res> {
  factory _$$VaultSessionImplCopyWith(
    _$VaultSessionImpl value,
    $Res Function(_$VaultSessionImpl) then,
  ) = __$$VaultSessionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isUnlocked, DateTime unlockedAt, DateTime expiresAt});
}

/// @nodoc
class __$$VaultSessionImplCopyWithImpl<$Res>
    extends _$VaultSessionCopyWithImpl<$Res, _$VaultSessionImpl>
    implements _$$VaultSessionImplCopyWith<$Res> {
  __$$VaultSessionImplCopyWithImpl(
    _$VaultSessionImpl _value,
    $Res Function(_$VaultSessionImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of VaultSession
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isUnlocked = null,
    Object? unlockedAt = null,
    Object? expiresAt = null,
  }) {
    return _then(
      _$VaultSessionImpl(
        isUnlocked: null == isUnlocked
            ? _value.isUnlocked
            : isUnlocked // ignore: cast_nullable_to_non_nullable
                  as bool,
        unlockedAt: null == unlockedAt
            ? _value.unlockedAt
            : unlockedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        expiresAt: null == expiresAt
            ? _value.expiresAt
            : expiresAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$VaultSessionImpl extends _VaultSession {
  const _$VaultSessionImpl({
    required this.isUnlocked,
    required this.unlockedAt,
    required this.expiresAt,
  }) : super._();

  factory _$VaultSessionImpl.fromJson(Map<String, dynamic> json) =>
      _$$VaultSessionImplFromJson(json);

  @override
  final bool isUnlocked;
  @override
  final DateTime unlockedAt;
  @override
  final DateTime expiresAt;

  @override
  String toString() {
    return 'VaultSession(isUnlocked: $isUnlocked, unlockedAt: $unlockedAt, expiresAt: $expiresAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VaultSessionImpl &&
            (identical(other.isUnlocked, isUnlocked) ||
                other.isUnlocked == isUnlocked) &&
            (identical(other.unlockedAt, unlockedAt) ||
                other.unlockedAt == unlockedAt) &&
            (identical(other.expiresAt, expiresAt) ||
                other.expiresAt == expiresAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, isUnlocked, unlockedAt, expiresAt);

  /// Create a copy of VaultSession
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$VaultSessionImplCopyWith<_$VaultSessionImpl> get copyWith =>
      __$$VaultSessionImplCopyWithImpl<_$VaultSessionImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$VaultSessionImplToJson(this);
  }
}

abstract class _VaultSession extends VaultSession {
  const factory _VaultSession({
    required final bool isUnlocked,
    required final DateTime unlockedAt,
    required final DateTime expiresAt,
  }) = _$VaultSessionImpl;
  const _VaultSession._() : super._();

  factory _VaultSession.fromJson(Map<String, dynamic> json) =
      _$VaultSessionImpl.fromJson;

  @override
  bool get isUnlocked;
  @override
  DateTime get unlockedAt;
  @override
  DateTime get expiresAt;

  /// Create a copy of VaultSession
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$VaultSessionImplCopyWith<_$VaultSessionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
