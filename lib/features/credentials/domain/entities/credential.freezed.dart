// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'credential.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

CustomField _$CustomFieldFromJson(Map<String, dynamic> json) {
  return _CustomField.fromJson(json);
}

/// @nodoc
mixin _$CustomField {
  String get label => throw _privateConstructorUsedError;
  String get value => throw _privateConstructorUsedError; // stored encrypted
  bool get isSecret => throw _privateConstructorUsedError;

  /// Serializes this CustomField to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CustomField
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CustomFieldCopyWith<CustomField> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CustomFieldCopyWith<$Res> {
  factory $CustomFieldCopyWith(
    CustomField value,
    $Res Function(CustomField) then,
  ) = _$CustomFieldCopyWithImpl<$Res, CustomField>;
  @useResult
  $Res call({String label, String value, bool isSecret});
}

/// @nodoc
class _$CustomFieldCopyWithImpl<$Res, $Val extends CustomField>
    implements $CustomFieldCopyWith<$Res> {
  _$CustomFieldCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CustomField
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? label = null,
    Object? value = null,
    Object? isSecret = null,
  }) {
    return _then(
      _value.copyWith(
            label: null == label
                ? _value.label
                : label // ignore: cast_nullable_to_non_nullable
                      as String,
            value: null == value
                ? _value.value
                : value // ignore: cast_nullable_to_non_nullable
                      as String,
            isSecret: null == isSecret
                ? _value.isSecret
                : isSecret // ignore: cast_nullable_to_non_nullable
                      as bool,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$CustomFieldImplCopyWith<$Res>
    implements $CustomFieldCopyWith<$Res> {
  factory _$$CustomFieldImplCopyWith(
    _$CustomFieldImpl value,
    $Res Function(_$CustomFieldImpl) then,
  ) = __$$CustomFieldImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String label, String value, bool isSecret});
}

/// @nodoc
class __$$CustomFieldImplCopyWithImpl<$Res>
    extends _$CustomFieldCopyWithImpl<$Res, _$CustomFieldImpl>
    implements _$$CustomFieldImplCopyWith<$Res> {
  __$$CustomFieldImplCopyWithImpl(
    _$CustomFieldImpl _value,
    $Res Function(_$CustomFieldImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CustomField
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? label = null,
    Object? value = null,
    Object? isSecret = null,
  }) {
    return _then(
      _$CustomFieldImpl(
        label: null == label
            ? _value.label
            : label // ignore: cast_nullable_to_non_nullable
                  as String,
        value: null == value
            ? _value.value
            : value // ignore: cast_nullable_to_non_nullable
                  as String,
        isSecret: null == isSecret
            ? _value.isSecret
            : isSecret // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$CustomFieldImpl implements _CustomField {
  const _$CustomFieldImpl({
    required this.label,
    required this.value,
    this.isSecret = false,
  });

  factory _$CustomFieldImpl.fromJson(Map<String, dynamic> json) =>
      _$$CustomFieldImplFromJson(json);

  @override
  final String label;
  @override
  final String value;
  // stored encrypted
  @override
  @JsonKey()
  final bool isSecret;

  @override
  String toString() {
    return 'CustomField(label: $label, value: $value, isSecret: $isSecret)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CustomFieldImpl &&
            (identical(other.label, label) || other.label == label) &&
            (identical(other.value, value) || other.value == value) &&
            (identical(other.isSecret, isSecret) ||
                other.isSecret == isSecret));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, label, value, isSecret);

  /// Create a copy of CustomField
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CustomFieldImplCopyWith<_$CustomFieldImpl> get copyWith =>
      __$$CustomFieldImplCopyWithImpl<_$CustomFieldImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CustomFieldImplToJson(this);
  }
}

abstract class _CustomField implements CustomField {
  const factory _CustomField({
    required final String label,
    required final String value,
    final bool isSecret,
  }) = _$CustomFieldImpl;

  factory _CustomField.fromJson(Map<String, dynamic> json) =
      _$CustomFieldImpl.fromJson;

  @override
  String get label;
  @override
  String get value; // stored encrypted
  @override
  bool get isSecret;

  /// Create a copy of CustomField
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CustomFieldImplCopyWith<_$CustomFieldImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Credential _$CredentialFromJson(Map<String, dynamic> json) {
  return _Credential.fromJson(json);
}

/// @nodoc
mixin _$Credential {
  String get id => throw _privateConstructorUsedError;
  CredentialType get type => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String? get username => throw _privateConstructorUsedError;
  String? get password =>
      throw _privateConstructorUsedError; // stored encrypted
  String? get website => throw _privateConstructorUsedError;
  String? get notes => throw _privateConstructorUsedError; // stored encrypted
  List<CustomField> get customFields => throw _privateConstructorUsedError;
  String? get categoryId => throw _privateConstructorUsedError;
  bool get isFavorite => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this Credential to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Credential
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CredentialCopyWith<Credential> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CredentialCopyWith<$Res> {
  factory $CredentialCopyWith(
    Credential value,
    $Res Function(Credential) then,
  ) = _$CredentialCopyWithImpl<$Res, Credential>;
  @useResult
  $Res call({
    String id,
    CredentialType type,
    String title,
    String? username,
    String? password,
    String? website,
    String? notes,
    List<CustomField> customFields,
    String? categoryId,
    bool isFavorite,
    DateTime createdAt,
    DateTime updatedAt,
  });
}

/// @nodoc
class _$CredentialCopyWithImpl<$Res, $Val extends Credential>
    implements $CredentialCopyWith<$Res> {
  _$CredentialCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Credential
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? type = null,
    Object? title = null,
    Object? username = freezed,
    Object? password = freezed,
    Object? website = freezed,
    Object? notes = freezed,
    Object? customFields = null,
    Object? categoryId = freezed,
    Object? isFavorite = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            type: null == type
                ? _value.type
                : type // ignore: cast_nullable_to_non_nullable
                      as CredentialType,
            title: null == title
                ? _value.title
                : title // ignore: cast_nullable_to_non_nullable
                      as String,
            username: freezed == username
                ? _value.username
                : username // ignore: cast_nullable_to_non_nullable
                      as String?,
            password: freezed == password
                ? _value.password
                : password // ignore: cast_nullable_to_non_nullable
                      as String?,
            website: freezed == website
                ? _value.website
                : website // ignore: cast_nullable_to_non_nullable
                      as String?,
            notes: freezed == notes
                ? _value.notes
                : notes // ignore: cast_nullable_to_non_nullable
                      as String?,
            customFields: null == customFields
                ? _value.customFields
                : customFields // ignore: cast_nullable_to_non_nullable
                      as List<CustomField>,
            categoryId: freezed == categoryId
                ? _value.categoryId
                : categoryId // ignore: cast_nullable_to_non_nullable
                      as String?,
            isFavorite: null == isFavorite
                ? _value.isFavorite
                : isFavorite // ignore: cast_nullable_to_non_nullable
                      as bool,
            createdAt: null == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            updatedAt: null == updatedAt
                ? _value.updatedAt
                : updatedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$CredentialImplCopyWith<$Res>
    implements $CredentialCopyWith<$Res> {
  factory _$$CredentialImplCopyWith(
    _$CredentialImpl value,
    $Res Function(_$CredentialImpl) then,
  ) = __$$CredentialImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    CredentialType type,
    String title,
    String? username,
    String? password,
    String? website,
    String? notes,
    List<CustomField> customFields,
    String? categoryId,
    bool isFavorite,
    DateTime createdAt,
    DateTime updatedAt,
  });
}

/// @nodoc
class __$$CredentialImplCopyWithImpl<$Res>
    extends _$CredentialCopyWithImpl<$Res, _$CredentialImpl>
    implements _$$CredentialImplCopyWith<$Res> {
  __$$CredentialImplCopyWithImpl(
    _$CredentialImpl _value,
    $Res Function(_$CredentialImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Credential
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? type = null,
    Object? title = null,
    Object? username = freezed,
    Object? password = freezed,
    Object? website = freezed,
    Object? notes = freezed,
    Object? customFields = null,
    Object? categoryId = freezed,
    Object? isFavorite = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(
      _$CredentialImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        type: null == type
            ? _value.type
            : type // ignore: cast_nullable_to_non_nullable
                  as CredentialType,
        title: null == title
            ? _value.title
            : title // ignore: cast_nullable_to_non_nullable
                  as String,
        username: freezed == username
            ? _value.username
            : username // ignore: cast_nullable_to_non_nullable
                  as String?,
        password: freezed == password
            ? _value.password
            : password // ignore: cast_nullable_to_non_nullable
                  as String?,
        website: freezed == website
            ? _value.website
            : website // ignore: cast_nullable_to_non_nullable
                  as String?,
        notes: freezed == notes
            ? _value.notes
            : notes // ignore: cast_nullable_to_non_nullable
                  as String?,
        customFields: null == customFields
            ? _value._customFields
            : customFields // ignore: cast_nullable_to_non_nullable
                  as List<CustomField>,
        categoryId: freezed == categoryId
            ? _value.categoryId
            : categoryId // ignore: cast_nullable_to_non_nullable
                  as String?,
        isFavorite: null == isFavorite
            ? _value.isFavorite
            : isFavorite // ignore: cast_nullable_to_non_nullable
                  as bool,
        createdAt: null == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        updatedAt: null == updatedAt
            ? _value.updatedAt
            : updatedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$CredentialImpl implements _Credential {
  const _$CredentialImpl({
    required this.id,
    required this.type,
    required this.title,
    this.username,
    this.password,
    this.website,
    this.notes,
    final List<CustomField> customFields = const [],
    this.categoryId,
    this.isFavorite = false,
    required this.createdAt,
    required this.updatedAt,
  }) : _customFields = customFields;

  factory _$CredentialImpl.fromJson(Map<String, dynamic> json) =>
      _$$CredentialImplFromJson(json);

  @override
  final String id;
  @override
  final CredentialType type;
  @override
  final String title;
  @override
  final String? username;
  @override
  final String? password;
  // stored encrypted
  @override
  final String? website;
  @override
  final String? notes;
  // stored encrypted
  final List<CustomField> _customFields;
  // stored encrypted
  @override
  @JsonKey()
  List<CustomField> get customFields {
    if (_customFields is EqualUnmodifiableListView) return _customFields;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_customFields);
  }

  @override
  final String? categoryId;
  @override
  @JsonKey()
  final bool isFavorite;
  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;

  @override
  String toString() {
    return 'Credential(id: $id, type: $type, title: $title, username: $username, password: $password, website: $website, notes: $notes, customFields: $customFields, categoryId: $categoryId, isFavorite: $isFavorite, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CredentialImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.website, website) || other.website == website) &&
            (identical(other.notes, notes) || other.notes == notes) &&
            const DeepCollectionEquality().equals(
              other._customFields,
              _customFields,
            ) &&
            (identical(other.categoryId, categoryId) ||
                other.categoryId == categoryId) &&
            (identical(other.isFavorite, isFavorite) ||
                other.isFavorite == isFavorite) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    type,
    title,
    username,
    password,
    website,
    notes,
    const DeepCollectionEquality().hash(_customFields),
    categoryId,
    isFavorite,
    createdAt,
    updatedAt,
  );

  /// Create a copy of Credential
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CredentialImplCopyWith<_$CredentialImpl> get copyWith =>
      __$$CredentialImplCopyWithImpl<_$CredentialImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CredentialImplToJson(this);
  }
}

abstract class _Credential implements Credential {
  const factory _Credential({
    required final String id,
    required final CredentialType type,
    required final String title,
    final String? username,
    final String? password,
    final String? website,
    final String? notes,
    final List<CustomField> customFields,
    final String? categoryId,
    final bool isFavorite,
    required final DateTime createdAt,
    required final DateTime updatedAt,
  }) = _$CredentialImpl;

  factory _Credential.fromJson(Map<String, dynamic> json) =
      _$CredentialImpl.fromJson;

  @override
  String get id;
  @override
  CredentialType get type;
  @override
  String get title;
  @override
  String? get username;
  @override
  String? get password; // stored encrypted
  @override
  String? get website;
  @override
  String? get notes; // stored encrypted
  @override
  List<CustomField> get customFields;
  @override
  String? get categoryId;
  @override
  bool get isFavorite;
  @override
  DateTime get createdAt;
  @override
  DateTime get updatedAt;

  /// Create a copy of Credential
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CredentialImplCopyWith<_$CredentialImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
