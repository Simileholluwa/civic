// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verify_user_proximity_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$verifyUserProximityHash() =>
    r'4fa1456495774d5816689af08bdd900cb68bb64c';

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
class VerifyUserProximityFamily extends Family<AsyncValue<double>> {
  /// See also [verifyUserProximity].
  const VerifyUserProximityFamily();

  /// See also [verifyUserProximity].
  VerifyUserProximityProvider call(
    List<AWSPlaces>? projectLocations,
    int? projectId,
  ) {
    return VerifyUserProximityProvider(
      projectLocations,
      projectId,
    );
  }

  @override
  VerifyUserProximityProvider getProviderOverride(
    covariant VerifyUserProximityProvider provider,
  ) {
    return call(
      provider.projectLocations,
      provider.projectId,
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
class VerifyUserProximityProvider extends AutoDisposeFutureProvider<double> {
  /// See also [verifyUserProximity].
  VerifyUserProximityProvider(
    List<AWSPlaces>? projectLocations,
    int? projectId,
  ) : this._internal(
          (ref) => verifyUserProximity(
            ref as VerifyUserProximityRef,
            projectLocations,
            projectId,
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
          projectLocations: projectLocations,
          projectId: projectId,
        );

  VerifyUserProximityProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.projectLocations,
    required this.projectId,
  }) : super.internal();

  final List<AWSPlaces>? projectLocations;
  final int? projectId;

  @override
  Override overrideWith(
    FutureOr<double> Function(VerifyUserProximityRef provider) create,
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
        projectLocations: projectLocations,
        projectId: projectId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<double> createElement() {
    return _VerifyUserProximityProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is VerifyUserProximityProvider &&
        other.projectLocations == projectLocations &&
        other.projectId == projectId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, projectLocations.hashCode);
    hash = _SystemHash.combine(hash, projectId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin VerifyUserProximityRef on AutoDisposeFutureProviderRef<double> {
  /// The parameter `projectLocations` of this provider.
  List<AWSPlaces>? get projectLocations;

  /// The parameter `projectId` of this provider.
  int? get projectId;
}

class _VerifyUserProximityProviderElement
    extends AutoDisposeFutureProviderElement<double>
    with VerifyUserProximityRef {
  _VerifyUserProximityProviderElement(super.provider);

  @override
  List<AWSPlaces>? get projectLocations =>
      (origin as VerifyUserProximityProvider).projectLocations;
  @override
  int? get projectId => (origin as VerifyUserProximityProvider).projectId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
