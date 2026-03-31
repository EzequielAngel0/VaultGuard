// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'failures.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$Failure {
  String get message => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) cryptographic,
    required TResult Function(String message) storage,
    required TResult Function(String message) authentication,
    required TResult Function(String message) biometric,
    required TResult Function(String message) unexpected,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? cryptographic,
    TResult? Function(String message)? storage,
    TResult? Function(String message)? authentication,
    TResult? Function(String message)? biometric,
    TResult? Function(String message)? unexpected,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? cryptographic,
    TResult Function(String message)? storage,
    TResult Function(String message)? authentication,
    TResult Function(String message)? biometric,
    TResult Function(String message)? unexpected,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CryptographicFailure value) cryptographic,
    required TResult Function(StorageFailure value) storage,
    required TResult Function(AuthenticationFailure value) authentication,
    required TResult Function(BiometricFailure value) biometric,
    required TResult Function(UnexpectedFailure value) unexpected,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CryptographicFailure value)? cryptographic,
    TResult? Function(StorageFailure value)? storage,
    TResult? Function(AuthenticationFailure value)? authentication,
    TResult? Function(BiometricFailure value)? biometric,
    TResult? Function(UnexpectedFailure value)? unexpected,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CryptographicFailure value)? cryptographic,
    TResult Function(StorageFailure value)? storage,
    TResult Function(AuthenticationFailure value)? authentication,
    TResult Function(BiometricFailure value)? biometric,
    TResult Function(UnexpectedFailure value)? unexpected,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FailureCopyWith<Failure> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FailureCopyWith<$Res> {
  factory $FailureCopyWith(Failure value, $Res Function(Failure) then) =
      _$FailureCopyWithImpl<$Res, Failure>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class _$FailureCopyWithImpl<$Res, $Val extends Failure>
    implements $FailureCopyWith<$Res> {
  _$FailureCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? message = null}) {
    return _then(
      _value.copyWith(
            message: null == message
                ? _value.message
                : message // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$CryptographicFailureImplCopyWith<$Res>
    implements $FailureCopyWith<$Res> {
  factory _$$CryptographicFailureImplCopyWith(
    _$CryptographicFailureImpl value,
    $Res Function(_$CryptographicFailureImpl) then,
  ) = __$$CryptographicFailureImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$CryptographicFailureImplCopyWithImpl<$Res>
    extends _$FailureCopyWithImpl<$Res, _$CryptographicFailureImpl>
    implements _$$CryptographicFailureImplCopyWith<$Res> {
  __$$CryptographicFailureImplCopyWithImpl(
    _$CryptographicFailureImpl _value,
    $Res Function(_$CryptographicFailureImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? message = null}) {
    return _then(
      _$CryptographicFailureImpl(
        message: null == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$CryptographicFailureImpl implements CryptographicFailure {
  const _$CryptographicFailureImpl({required this.message});

  @override
  final String message;

  @override
  String toString() {
    return 'Failure.cryptographic(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CryptographicFailureImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CryptographicFailureImplCopyWith<_$CryptographicFailureImpl>
  get copyWith =>
      __$$CryptographicFailureImplCopyWithImpl<_$CryptographicFailureImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) cryptographic,
    required TResult Function(String message) storage,
    required TResult Function(String message) authentication,
    required TResult Function(String message) biometric,
    required TResult Function(String message) unexpected,
  }) {
    return cryptographic(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? cryptographic,
    TResult? Function(String message)? storage,
    TResult? Function(String message)? authentication,
    TResult? Function(String message)? biometric,
    TResult? Function(String message)? unexpected,
  }) {
    return cryptographic?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? cryptographic,
    TResult Function(String message)? storage,
    TResult Function(String message)? authentication,
    TResult Function(String message)? biometric,
    TResult Function(String message)? unexpected,
    required TResult orElse(),
  }) {
    if (cryptographic != null) {
      return cryptographic(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CryptographicFailure value) cryptographic,
    required TResult Function(StorageFailure value) storage,
    required TResult Function(AuthenticationFailure value) authentication,
    required TResult Function(BiometricFailure value) biometric,
    required TResult Function(UnexpectedFailure value) unexpected,
  }) {
    return cryptographic(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CryptographicFailure value)? cryptographic,
    TResult? Function(StorageFailure value)? storage,
    TResult? Function(AuthenticationFailure value)? authentication,
    TResult? Function(BiometricFailure value)? biometric,
    TResult? Function(UnexpectedFailure value)? unexpected,
  }) {
    return cryptographic?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CryptographicFailure value)? cryptographic,
    TResult Function(StorageFailure value)? storage,
    TResult Function(AuthenticationFailure value)? authentication,
    TResult Function(BiometricFailure value)? biometric,
    TResult Function(UnexpectedFailure value)? unexpected,
    required TResult orElse(),
  }) {
    if (cryptographic != null) {
      return cryptographic(this);
    }
    return orElse();
  }
}

abstract class CryptographicFailure implements Failure {
  const factory CryptographicFailure({required final String message}) =
      _$CryptographicFailureImpl;

  @override
  String get message;

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CryptographicFailureImplCopyWith<_$CryptographicFailureImpl>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$StorageFailureImplCopyWith<$Res>
    implements $FailureCopyWith<$Res> {
  factory _$$StorageFailureImplCopyWith(
    _$StorageFailureImpl value,
    $Res Function(_$StorageFailureImpl) then,
  ) = __$$StorageFailureImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$StorageFailureImplCopyWithImpl<$Res>
    extends _$FailureCopyWithImpl<$Res, _$StorageFailureImpl>
    implements _$$StorageFailureImplCopyWith<$Res> {
  __$$StorageFailureImplCopyWithImpl(
    _$StorageFailureImpl _value,
    $Res Function(_$StorageFailureImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? message = null}) {
    return _then(
      _$StorageFailureImpl(
        message: null == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$StorageFailureImpl implements StorageFailure {
  const _$StorageFailureImpl({required this.message});

  @override
  final String message;

  @override
  String toString() {
    return 'Failure.storage(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StorageFailureImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StorageFailureImplCopyWith<_$StorageFailureImpl> get copyWith =>
      __$$StorageFailureImplCopyWithImpl<_$StorageFailureImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) cryptographic,
    required TResult Function(String message) storage,
    required TResult Function(String message) authentication,
    required TResult Function(String message) biometric,
    required TResult Function(String message) unexpected,
  }) {
    return storage(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? cryptographic,
    TResult? Function(String message)? storage,
    TResult? Function(String message)? authentication,
    TResult? Function(String message)? biometric,
    TResult? Function(String message)? unexpected,
  }) {
    return storage?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? cryptographic,
    TResult Function(String message)? storage,
    TResult Function(String message)? authentication,
    TResult Function(String message)? biometric,
    TResult Function(String message)? unexpected,
    required TResult orElse(),
  }) {
    if (storage != null) {
      return storage(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CryptographicFailure value) cryptographic,
    required TResult Function(StorageFailure value) storage,
    required TResult Function(AuthenticationFailure value) authentication,
    required TResult Function(BiometricFailure value) biometric,
    required TResult Function(UnexpectedFailure value) unexpected,
  }) {
    return storage(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CryptographicFailure value)? cryptographic,
    TResult? Function(StorageFailure value)? storage,
    TResult? Function(AuthenticationFailure value)? authentication,
    TResult? Function(BiometricFailure value)? biometric,
    TResult? Function(UnexpectedFailure value)? unexpected,
  }) {
    return storage?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CryptographicFailure value)? cryptographic,
    TResult Function(StorageFailure value)? storage,
    TResult Function(AuthenticationFailure value)? authentication,
    TResult Function(BiometricFailure value)? biometric,
    TResult Function(UnexpectedFailure value)? unexpected,
    required TResult orElse(),
  }) {
    if (storage != null) {
      return storage(this);
    }
    return orElse();
  }
}

abstract class StorageFailure implements Failure {
  const factory StorageFailure({required final String message}) =
      _$StorageFailureImpl;

  @override
  String get message;

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StorageFailureImplCopyWith<_$StorageFailureImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AuthenticationFailureImplCopyWith<$Res>
    implements $FailureCopyWith<$Res> {
  factory _$$AuthenticationFailureImplCopyWith(
    _$AuthenticationFailureImpl value,
    $Res Function(_$AuthenticationFailureImpl) then,
  ) = __$$AuthenticationFailureImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$AuthenticationFailureImplCopyWithImpl<$Res>
    extends _$FailureCopyWithImpl<$Res, _$AuthenticationFailureImpl>
    implements _$$AuthenticationFailureImplCopyWith<$Res> {
  __$$AuthenticationFailureImplCopyWithImpl(
    _$AuthenticationFailureImpl _value,
    $Res Function(_$AuthenticationFailureImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? message = null}) {
    return _then(
      _$AuthenticationFailureImpl(
        message: null == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$AuthenticationFailureImpl implements AuthenticationFailure {
  const _$AuthenticationFailureImpl({required this.message});

  @override
  final String message;

  @override
  String toString() {
    return 'Failure.authentication(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthenticationFailureImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthenticationFailureImplCopyWith<_$AuthenticationFailureImpl>
  get copyWith =>
      __$$AuthenticationFailureImplCopyWithImpl<_$AuthenticationFailureImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) cryptographic,
    required TResult Function(String message) storage,
    required TResult Function(String message) authentication,
    required TResult Function(String message) biometric,
    required TResult Function(String message) unexpected,
  }) {
    return authentication(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? cryptographic,
    TResult? Function(String message)? storage,
    TResult? Function(String message)? authentication,
    TResult? Function(String message)? biometric,
    TResult? Function(String message)? unexpected,
  }) {
    return authentication?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? cryptographic,
    TResult Function(String message)? storage,
    TResult Function(String message)? authentication,
    TResult Function(String message)? biometric,
    TResult Function(String message)? unexpected,
    required TResult orElse(),
  }) {
    if (authentication != null) {
      return authentication(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CryptographicFailure value) cryptographic,
    required TResult Function(StorageFailure value) storage,
    required TResult Function(AuthenticationFailure value) authentication,
    required TResult Function(BiometricFailure value) biometric,
    required TResult Function(UnexpectedFailure value) unexpected,
  }) {
    return authentication(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CryptographicFailure value)? cryptographic,
    TResult? Function(StorageFailure value)? storage,
    TResult? Function(AuthenticationFailure value)? authentication,
    TResult? Function(BiometricFailure value)? biometric,
    TResult? Function(UnexpectedFailure value)? unexpected,
  }) {
    return authentication?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CryptographicFailure value)? cryptographic,
    TResult Function(StorageFailure value)? storage,
    TResult Function(AuthenticationFailure value)? authentication,
    TResult Function(BiometricFailure value)? biometric,
    TResult Function(UnexpectedFailure value)? unexpected,
    required TResult orElse(),
  }) {
    if (authentication != null) {
      return authentication(this);
    }
    return orElse();
  }
}

abstract class AuthenticationFailure implements Failure {
  const factory AuthenticationFailure({required final String message}) =
      _$AuthenticationFailureImpl;

  @override
  String get message;

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AuthenticationFailureImplCopyWith<_$AuthenticationFailureImpl>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$BiometricFailureImplCopyWith<$Res>
    implements $FailureCopyWith<$Res> {
  factory _$$BiometricFailureImplCopyWith(
    _$BiometricFailureImpl value,
    $Res Function(_$BiometricFailureImpl) then,
  ) = __$$BiometricFailureImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$BiometricFailureImplCopyWithImpl<$Res>
    extends _$FailureCopyWithImpl<$Res, _$BiometricFailureImpl>
    implements _$$BiometricFailureImplCopyWith<$Res> {
  __$$BiometricFailureImplCopyWithImpl(
    _$BiometricFailureImpl _value,
    $Res Function(_$BiometricFailureImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? message = null}) {
    return _then(
      _$BiometricFailureImpl(
        message: null == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$BiometricFailureImpl implements BiometricFailure {
  const _$BiometricFailureImpl({required this.message});

  @override
  final String message;

  @override
  String toString() {
    return 'Failure.biometric(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BiometricFailureImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BiometricFailureImplCopyWith<_$BiometricFailureImpl> get copyWith =>
      __$$BiometricFailureImplCopyWithImpl<_$BiometricFailureImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) cryptographic,
    required TResult Function(String message) storage,
    required TResult Function(String message) authentication,
    required TResult Function(String message) biometric,
    required TResult Function(String message) unexpected,
  }) {
    return biometric(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? cryptographic,
    TResult? Function(String message)? storage,
    TResult? Function(String message)? authentication,
    TResult? Function(String message)? biometric,
    TResult? Function(String message)? unexpected,
  }) {
    return biometric?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? cryptographic,
    TResult Function(String message)? storage,
    TResult Function(String message)? authentication,
    TResult Function(String message)? biometric,
    TResult Function(String message)? unexpected,
    required TResult orElse(),
  }) {
    if (biometric != null) {
      return biometric(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CryptographicFailure value) cryptographic,
    required TResult Function(StorageFailure value) storage,
    required TResult Function(AuthenticationFailure value) authentication,
    required TResult Function(BiometricFailure value) biometric,
    required TResult Function(UnexpectedFailure value) unexpected,
  }) {
    return biometric(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CryptographicFailure value)? cryptographic,
    TResult? Function(StorageFailure value)? storage,
    TResult? Function(AuthenticationFailure value)? authentication,
    TResult? Function(BiometricFailure value)? biometric,
    TResult? Function(UnexpectedFailure value)? unexpected,
  }) {
    return biometric?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CryptographicFailure value)? cryptographic,
    TResult Function(StorageFailure value)? storage,
    TResult Function(AuthenticationFailure value)? authentication,
    TResult Function(BiometricFailure value)? biometric,
    TResult Function(UnexpectedFailure value)? unexpected,
    required TResult orElse(),
  }) {
    if (biometric != null) {
      return biometric(this);
    }
    return orElse();
  }
}

abstract class BiometricFailure implements Failure {
  const factory BiometricFailure({required final String message}) =
      _$BiometricFailureImpl;

  @override
  String get message;

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BiometricFailureImplCopyWith<_$BiometricFailureImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UnexpectedFailureImplCopyWith<$Res>
    implements $FailureCopyWith<$Res> {
  factory _$$UnexpectedFailureImplCopyWith(
    _$UnexpectedFailureImpl value,
    $Res Function(_$UnexpectedFailureImpl) then,
  ) = __$$UnexpectedFailureImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$UnexpectedFailureImplCopyWithImpl<$Res>
    extends _$FailureCopyWithImpl<$Res, _$UnexpectedFailureImpl>
    implements _$$UnexpectedFailureImplCopyWith<$Res> {
  __$$UnexpectedFailureImplCopyWithImpl(
    _$UnexpectedFailureImpl _value,
    $Res Function(_$UnexpectedFailureImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? message = null}) {
    return _then(
      _$UnexpectedFailureImpl(
        message: null == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$UnexpectedFailureImpl implements UnexpectedFailure {
  const _$UnexpectedFailureImpl({required this.message});

  @override
  final String message;

  @override
  String toString() {
    return 'Failure.unexpected(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UnexpectedFailureImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UnexpectedFailureImplCopyWith<_$UnexpectedFailureImpl> get copyWith =>
      __$$UnexpectedFailureImplCopyWithImpl<_$UnexpectedFailureImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) cryptographic,
    required TResult Function(String message) storage,
    required TResult Function(String message) authentication,
    required TResult Function(String message) biometric,
    required TResult Function(String message) unexpected,
  }) {
    return unexpected(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? cryptographic,
    TResult? Function(String message)? storage,
    TResult? Function(String message)? authentication,
    TResult? Function(String message)? biometric,
    TResult? Function(String message)? unexpected,
  }) {
    return unexpected?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? cryptographic,
    TResult Function(String message)? storage,
    TResult Function(String message)? authentication,
    TResult Function(String message)? biometric,
    TResult Function(String message)? unexpected,
    required TResult orElse(),
  }) {
    if (unexpected != null) {
      return unexpected(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CryptographicFailure value) cryptographic,
    required TResult Function(StorageFailure value) storage,
    required TResult Function(AuthenticationFailure value) authentication,
    required TResult Function(BiometricFailure value) biometric,
    required TResult Function(UnexpectedFailure value) unexpected,
  }) {
    return unexpected(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CryptographicFailure value)? cryptographic,
    TResult? Function(StorageFailure value)? storage,
    TResult? Function(AuthenticationFailure value)? authentication,
    TResult? Function(BiometricFailure value)? biometric,
    TResult? Function(UnexpectedFailure value)? unexpected,
  }) {
    return unexpected?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CryptographicFailure value)? cryptographic,
    TResult Function(StorageFailure value)? storage,
    TResult Function(AuthenticationFailure value)? authentication,
    TResult Function(BiometricFailure value)? biometric,
    TResult Function(UnexpectedFailure value)? unexpected,
    required TResult orElse(),
  }) {
    if (unexpected != null) {
      return unexpected(this);
    }
    return orElse();
  }
}

abstract class UnexpectedFailure implements Failure {
  const factory UnexpectedFailure({required final String message}) =
      _$UnexpectedFailureImpl;

  @override
  String get message;

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UnexpectedFailureImplCopyWith<_$UnexpectedFailureImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
