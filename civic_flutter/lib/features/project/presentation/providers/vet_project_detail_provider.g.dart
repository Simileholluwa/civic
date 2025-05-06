// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vet_project_detail_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getVettedProjectDetailHash() =>
    r'f5a894dd861bfae370e124a668594f2ef62dab4e';

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

/// See also [getVettedProjectDetail].
@ProviderFor(getVettedProjectDetail)
const getVettedProjectDetailProvider = GetVettedProjectDetailFamily();

/// See also [getVettedProjectDetail].
class GetVettedProjectDetailFamily extends Family<AsyncValue<ProjectVetting?>> {
  /// See also [getVettedProjectDetail].
  const GetVettedProjectDetailFamily();

  /// See also [getVettedProjectDetail].
  GetVettedProjectDetailProvider call(
    int id,
  ) {
    return GetVettedProjectDetailProvider(
      id,
    );
  }

  @override
  GetVettedProjectDetailProvider getProviderOverride(
    covariant GetVettedProjectDetailProvider provider,
  ) {
    return call(
      provider.id,
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
  String? get name => r'getVettedProjectDetailProvider';
}

/// See also [getVettedProjectDetail].
class GetVettedProjectDetailProvider
    extends AutoDisposeFutureProvider<ProjectVetting?> {
  /// See also [getVettedProjectDetail].
  GetVettedProjectDetailProvider(
    int id,
  ) : this._internal(
          (ref) => getVettedProjectDetail(
            ref as GetVettedProjectDetailRef,
            id,
          ),
          from: getVettedProjectDetailProvider,
          name: r'getVettedProjectDetailProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getVettedProjectDetailHash,
          dependencies: GetVettedProjectDetailFamily._dependencies,
          allTransitiveDependencies:
              GetVettedProjectDetailFamily._allTransitiveDependencies,
          id: id,
        );

  GetVettedProjectDetailProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
  }) : super.internal();

  final int id;

  @override
  Override overrideWith(
    FutureOr<ProjectVetting?> Function(GetVettedProjectDetailRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetVettedProjectDetailProvider._internal(
        (ref) => create(ref as GetVettedProjectDetailRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<ProjectVetting?> createElement() {
    return _GetVettedProjectDetailProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetVettedProjectDetailProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin GetVettedProjectDetailRef
    on AutoDisposeFutureProviderRef<ProjectVetting?> {
  /// The parameter `id` of this provider.
  int get id;
}

class _GetVettedProjectDetailProviderElement
    extends AutoDisposeFutureProviderElement<ProjectVetting?>
    with GetVettedProjectDetailRef {
  _GetVettedProjectDetailProviderElement(super.provider);

  @override
  int get id => (origin as GetVettedProjectDetailProvider).id;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
