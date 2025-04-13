// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verify_user_proximity_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$verifyUserProximityHash() =>
    r'49bd94d249ea06b36bd2aa7458fba816f9e1f5fe';

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

/// See also [verifyUserProximity].
@ProviderFor(verifyUserProximity)
const verifyUserProximityProvider = VerifyUserProximityFamily();

/// See also [verifyUserProximity].
class VerifyUserProximityFamily
    extends Family<AsyncValue<Map<String, dynamic>>> {
  /// See also [verifyUserProximity].
  const VerifyUserProximityFamily();

  /// See also [verifyUserProximity].
  VerifyUserProximityProvider call({
    double maxDistance = 1000,
    required List<AWSPlaces> projectLocations,
  }) {
    return VerifyUserProximityProvider(
      maxDistance: maxDistance,
      projectLocations: projectLocations,
    );
  }

  @override
  VerifyUserProximityProvider getProviderOverride(
    covariant VerifyUserProximityProvider provider,
  ) {
    return call(
      maxDistance: provider.maxDistance,
      projectLocations: provider.projectLocations,
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
  String? get name => r'verifyUserProximityProvider';
}

/// See also [verifyUserProximity].
class VerifyUserProximityProvider
    extends AutoDisposeFutureProvider<Map<String, dynamic>> {
  /// See also [verifyUserProximity].
  VerifyUserProximityProvider({
    double maxDistance = 1000,
    required List<AWSPlaces> projectLocations,
  }) : this._internal(
          (ref) => verifyUserProximity(
            ref as VerifyUserProximityRef,
            maxDistance: maxDistance,
            projectLocations: projectLocations,
          ),
          from: verifyUserProximityProvider,
          name: r'verifyUserProximityProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$verifyUserProximityHash,
          dependencies: VerifyUserProximityFamily._dependencies,
          allTransitiveDependencies:
              VerifyUserProximityFamily._allTransitiveDependencies,
          maxDistance: maxDistance,
          projectLocations: projectLocations,
        );

  VerifyUserProximityProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.maxDistance,
    required this.projectLocations,
  }) : super.internal();

  final double maxDistance;
  final List<AWSPlaces> projectLocations;

  @override
  Override overrideWith(
    FutureOr<Map<String, dynamic>> Function(VerifyUserProximityRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: VerifyUserProximityProvider._internal(
        (ref) => create(ref as VerifyUserProximityRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        maxDistance: maxDistance,
        projectLocations: projectLocations,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Map<String, dynamic>> createElement() {
    return _VerifyUserProximityProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is VerifyUserProximityProvider &&
        other.maxDistance == maxDistance &&
        other.projectLocations == projectLocations;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, maxDistance.hashCode);
    hash = _SystemHash.combine(hash, projectLocations.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin VerifyUserProximityRef
    on AutoDisposeFutureProviderRef<Map<String, dynamic>> {
  /// The parameter `maxDistance` of this provider.
  double get maxDistance;

  /// The parameter `projectLocations` of this provider.
  List<AWSPlaces> get projectLocations;
}

class _VerifyUserProximityProviderElement
    extends AutoDisposeFutureProviderElement<Map<String, dynamic>>
    with VerifyUserProximityRef {
  _VerifyUserProximityProviderElement(super.provider);

  @override
  double get maxDistance => (origin as VerifyUserProximityProvider).maxDistance;
  @override
  List<AWSPlaces> get projectLocations =>
      (origin as VerifyUserProximityProvider).projectLocations;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
