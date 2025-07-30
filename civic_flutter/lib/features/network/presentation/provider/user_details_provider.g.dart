// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_details_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getUserDetailsHash() => r'6d11e0481969addd0505b94243c225d625e057a2';

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

/// See also [getUserDetails].
@ProviderFor(getUserDetails)
const getUserDetailsProvider = GetUserDetailsFamily();

/// See also [getUserDetails].
class GetUserDetailsFamily extends Family<AsyncValue<UserRecord>> {
  /// See also [getUserDetails].
  const GetUserDetailsFamily();

  /// See also [getUserDetails].
  GetUserDetailsProvider call(
    int userId,
  ) {
    return GetUserDetailsProvider(
      userId,
    );
  }

  @override
  GetUserDetailsProvider getProviderOverride(
    covariant GetUserDetailsProvider provider,
  ) {
    return call(
      provider.userId,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'getUserDetailsProvider';
}

/// See also [getUserDetails].
class GetUserDetailsProvider extends AutoDisposeFutureProvider<UserRecord> {
  /// See also [getUserDetails].
  GetUserDetailsProvider(
    int userId,
  ) : this._internal(
          (ref) => getUserDetails(
            ref as GetUserDetailsRef,
            userId,
          ),
          from: getUserDetailsProvider,
          name: r'getUserDetailsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getUserDetailsHash,
          dependencies: GetUserDetailsFamily._dependencies,
          allTransitiveDependencies:
              GetUserDetailsFamily._allTransitiveDependencies,
          userId: userId,
        );

  GetUserDetailsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.userId,
  }) : super.internal();

  final int userId;

  @override
  Override overrideWith(
    FutureOr<UserRecord> Function(GetUserDetailsRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetUserDetailsProvider._internal(
        (ref) => create(ref as GetUserDetailsRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        userId: userId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<UserRecord> createElement() {
    return _GetUserDetailsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetUserDetailsProvider && other.userId == userId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, userId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin GetUserDetailsRef on AutoDisposeFutureProviderRef<UserRecord> {
  /// The parameter `userId` of this provider.
  int get userId;
}

class _GetUserDetailsProviderElement
    extends AutoDisposeFutureProviderElement<UserRecord>
    with GetUserDetailsRef {
  _GetUserDetailsProviderElement(super.provider);

  @override
  int get userId => (origin as GetUserDetailsProvider).userId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
