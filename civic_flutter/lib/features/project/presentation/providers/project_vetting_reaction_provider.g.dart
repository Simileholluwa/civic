// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project_vetting_reaction_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$vettingReactionHash() => r'3fbc0c8fe695af757f8c27bedc3112273149c008';

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

abstract class _$VettingReaction
    extends BuildlessAutoDisposeNotifier<ProjectVettingReactionState> {
  late final ProjectVetting projectVetting;

  ProjectVettingReactionState build(
    ProjectVetting projectVetting,
  );
}

/// See also [VettingReaction].
@ProviderFor(VettingReaction)
const vettingReactionProvider = VettingReactionFamily();

/// See also [VettingReaction].
class VettingReactionFamily extends Family<ProjectVettingReactionState> {
  /// See also [VettingReaction].
  const VettingReactionFamily();

  /// See also [VettingReaction].
  VettingReactionProvider call(
    ProjectVetting projectVetting,
  ) {
    return VettingReactionProvider(
      projectVetting,
    );
  }

  @override
  VettingReactionProvider getProviderOverride(
    covariant VettingReactionProvider provider,
  ) {
    return call(
      provider.projectVetting,
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
  String? get name => r'vettingReactionProvider';
}

/// See also [VettingReaction].
class VettingReactionProvider extends AutoDisposeNotifierProviderImpl<
    VettingReaction, ProjectVettingReactionState> {
  /// See also [VettingReaction].
  VettingReactionProvider(
    ProjectVetting projectVetting,
  ) : this._internal(
          () => VettingReaction()..projectVetting = projectVetting,
          from: vettingReactionProvider,
          name: r'vettingReactionProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$vettingReactionHash,
          dependencies: VettingReactionFamily._dependencies,
          allTransitiveDependencies:
              VettingReactionFamily._allTransitiveDependencies,
          projectVetting: projectVetting,
        );

  VettingReactionProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.projectVetting,
  }) : super.internal();

  final ProjectVetting projectVetting;

  @override
  ProjectVettingReactionState runNotifierBuild(
    covariant VettingReaction notifier,
  ) {
    return notifier.build(
      projectVetting,
    );
  }

  @override
  Override overrideWith(VettingReaction Function() create) {
    return ProviderOverride(
      origin: this,
      override: VettingReactionProvider._internal(
        () => create()..projectVetting = projectVetting,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        projectVetting: projectVetting,
      ),
    );
  }

  @override
  AutoDisposeNotifierProviderElement<VettingReaction,
      ProjectVettingReactionState> createElement() {
    return _VettingReactionProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is VettingReactionProvider &&
        other.projectVetting == projectVetting;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, projectVetting.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin VettingReactionRef
    on AutoDisposeNotifierProviderRef<ProjectVettingReactionState> {
  /// The parameter `projectVetting` of this provider.
  ProjectVetting get projectVetting;
}

class _VettingReactionProviderElement
    extends AutoDisposeNotifierProviderElement<VettingReaction,
        ProjectVettingReactionState> with VettingReactionRef {
  _VettingReactionProviderElement(super.provider);

  @override
  ProjectVetting get projectVetting =>
      (origin as VettingReactionProvider).projectVetting;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
