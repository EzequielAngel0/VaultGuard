// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'password_generator.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$PasswordConfig {
  int get length => throw _privateConstructorUsedError;
  bool get useUppercase => throw _privateConstructorUsedError;
  bool get useLowercase => throw _privateConstructorUsedError;
  bool get useNumbers => throw _privateConstructorUsedError;
  bool get useSymbols => throw _privateConstructorUsedError;
  String get symbolSet => throw _privateConstructorUsedError;

  /// Create a copy of PasswordConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PasswordConfigCopyWith<PasswordConfig> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PasswordConfigCopyWith<$Res> {
  factory $PasswordConfigCopyWith(
    PasswordConfig value,
    $Res Function(PasswordConfig) then,
  ) = _$PasswordConfigCopyWithImpl<$Res, PasswordConfig>;
  @useResult
  $Res call({
    int length,
    bool useUppercase,
    bool useLowercase,
    bool useNumbers,
    bool useSymbols,
    String symbolSet,
  });
}

/// @nodoc
class _$PasswordConfigCopyWithImpl<$Res, $Val extends PasswordConfig>
    implements $PasswordConfigCopyWith<$Res> {
  _$PasswordConfigCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PasswordConfig
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? length = null,
    Object? useUppercase = null,
    Object? useLowercase = null,
    Object? useNumbers = null,
    Object? useSymbols = null,
    Object? symbolSet = null,
  }) {
    return _then(
      _value.copyWith(
            length: null == length
                ? _value.length
                : length // ignore: cast_nullable_to_non_nullable
                      as int,
            useUppercase: null == useUppercase
                ? _value.useUppercase
                : useUppercase // ignore: cast_nullable_to_non_nullable
                      as bool,
            useLowercase: null == useLowercase
                ? _value.useLowercase
                : useLowercase // ignore: cast_nullable_to_non_nullable
                      as bool,
            useNumbers: null == useNumbers
                ? _value.useNumbers
                : useNumbers // ignore: cast_nullable_to_non_nullable
                      as bool,
            useSymbols: null == useSymbols
                ? _value.useSymbols
                : useSymbols // ignore: cast_nullable_to_non_nullable
                      as bool,
            symbolSet: null == symbolSet
                ? _value.symbolSet
                : symbolSet // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$PasswordConfigImplCopyWith<$Res>
    implements $PasswordConfigCopyWith<$Res> {
  factory _$$PasswordConfigImplCopyWith(
    _$PasswordConfigImpl value,
    $Res Function(_$PasswordConfigImpl) then,
  ) = __$$PasswordConfigImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int length,
    bool useUppercase,
    bool useLowercase,
    bool useNumbers,
    bool useSymbols,
    String symbolSet,
  });
}

/// @nodoc
class __$$PasswordConfigImplCopyWithImpl<$Res>
    extends _$PasswordConfigCopyWithImpl<$Res, _$PasswordConfigImpl>
    implements _$$PasswordConfigImplCopyWith<$Res> {
  __$$PasswordConfigImplCopyWithImpl(
    _$PasswordConfigImpl _value,
    $Res Function(_$PasswordConfigImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PasswordConfig
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? length = null,
    Object? useUppercase = null,
    Object? useLowercase = null,
    Object? useNumbers = null,
    Object? useSymbols = null,
    Object? symbolSet = null,
  }) {
    return _then(
      _$PasswordConfigImpl(
        length: null == length
            ? _value.length
            : length // ignore: cast_nullable_to_non_nullable
                  as int,
        useUppercase: null == useUppercase
            ? _value.useUppercase
            : useUppercase // ignore: cast_nullable_to_non_nullable
                  as bool,
        useLowercase: null == useLowercase
            ? _value.useLowercase
            : useLowercase // ignore: cast_nullable_to_non_nullable
                  as bool,
        useNumbers: null == useNumbers
            ? _value.useNumbers
            : useNumbers // ignore: cast_nullable_to_non_nullable
                  as bool,
        useSymbols: null == useSymbols
            ? _value.useSymbols
            : useSymbols // ignore: cast_nullable_to_non_nullable
                  as bool,
        symbolSet: null == symbolSet
            ? _value.symbolSet
            : symbolSet // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$PasswordConfigImpl implements _PasswordConfig {
  const _$PasswordConfigImpl({
    this.length = 16,
    this.useUppercase = true,
    this.useLowercase = true,
    this.useNumbers = true,
    this.useSymbols = true,
    this.symbolSet = '!@#\$%^&*()-_=+[]{}|;:,.<>?',
  });

  @override
  @JsonKey()
  final int length;
  @override
  @JsonKey()
  final bool useUppercase;
  @override
  @JsonKey()
  final bool useLowercase;
  @override
  @JsonKey()
  final bool useNumbers;
  @override
  @JsonKey()
  final bool useSymbols;
  @override
  @JsonKey()
  final String symbolSet;

  @override
  String toString() {
    return 'PasswordConfig(length: $length, useUppercase: $useUppercase, useLowercase: $useLowercase, useNumbers: $useNumbers, useSymbols: $useSymbols, symbolSet: $symbolSet)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PasswordConfigImpl &&
            (identical(other.length, length) || other.length == length) &&
            (identical(other.useUppercase, useUppercase) ||
                other.useUppercase == useUppercase) &&
            (identical(other.useLowercase, useLowercase) ||
                other.useLowercase == useLowercase) &&
            (identical(other.useNumbers, useNumbers) ||
                other.useNumbers == useNumbers) &&
            (identical(other.useSymbols, useSymbols) ||
                other.useSymbols == useSymbols) &&
            (identical(other.symbolSet, symbolSet) ||
                other.symbolSet == symbolSet));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    length,
    useUppercase,
    useLowercase,
    useNumbers,
    useSymbols,
    symbolSet,
  );

  /// Create a copy of PasswordConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PasswordConfigImplCopyWith<_$PasswordConfigImpl> get copyWith =>
      __$$PasswordConfigImplCopyWithImpl<_$PasswordConfigImpl>(
        this,
        _$identity,
      );
}

abstract class _PasswordConfig implements PasswordConfig {
  const factory _PasswordConfig({
    final int length,
    final bool useUppercase,
    final bool useLowercase,
    final bool useNumbers,
    final bool useSymbols,
    final String symbolSet,
  }) = _$PasswordConfigImpl;

  @override
  int get length;
  @override
  bool get useUppercase;
  @override
  bool get useLowercase;
  @override
  bool get useNumbers;
  @override
  bool get useSymbols;
  @override
  String get symbolSet;

  /// Create a copy of PasswordConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PasswordConfigImplCopyWith<_$PasswordConfigImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
