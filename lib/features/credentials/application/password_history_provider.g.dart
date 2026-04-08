// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'password_history_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$passwordHistoryHash() => r'491464f5da831256f7733261835a60cd114745cb';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [passwordHistory].
@ProviderFor(passwordHistory)
const passwordHistoryProvider = PasswordHistoryFamily();

/// See also [passwordHistory].
class PasswordHistoryFamily extends Family<AsyncValue<List<PasswordHistory>>> {
  /// See also [passwordHistory].
  const PasswordHistoryFamily();

  /// See also [passwordHistory].
  PasswordHistoryProvider call(String credentialId) {
    return PasswordHistoryProvider(credentialId);
  }

  @override
  PasswordHistoryProvider getProviderOverride(
    covariant PasswordHistoryProvider provider,
  ) {
    return call(provider.credentialId);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'passwordHistoryProvider';
}

/// See also [passwordHistory].
class PasswordHistoryProvider
    extends AutoDisposeFutureProvider<List<PasswordHistory>> {
  /// See also [passwordHistory].
  PasswordHistoryProvider(String credentialId)
    : this._internal(
        (ref) => passwordHistory(ref as PasswordHistoryRef, credentialId),
        from: passwordHistoryProvider,
        name: r'passwordHistoryProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$passwordHistoryHash,
        dependencies: PasswordHistoryFamily._dependencies,
        allTransitiveDependencies:
            PasswordHistoryFamily._allTransitiveDependencies,
        credentialId: credentialId,
      );

  PasswordHistoryProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.credentialId,
  }) : super.internal();

  final String credentialId;

  @override
  Override overrideWith(
    FutureOr<List<PasswordHistory>> Function(PasswordHistoryRef provider)
    create,
  ) {
    return ProviderOverride(
      origin: this,
      override: PasswordHistoryProvider._internal(
        (ref) => create(ref as PasswordHistoryRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        credentialId: credentialId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<PasswordHistory>> createElement() {
    return _PasswordHistoryProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is PasswordHistoryProvider &&
        other.credentialId == credentialId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, credentialId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin PasswordHistoryRef
    on AutoDisposeFutureProviderRef<List<PasswordHistory>> {
  /// The parameter `credentialId` of this provider.
  String get credentialId;
}

class _PasswordHistoryProviderElement
    extends AutoDisposeFutureProviderElement<List<PasswordHistory>>
    with PasswordHistoryRef {
  _PasswordHistoryProviderElement(super.provider);

  @override
  String get credentialId => (origin as PasswordHistoryProvider).credentialId;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
