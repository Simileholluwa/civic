// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project_paginated_review_list_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$paginatedProjectReviewListHash() =>
    r'0974ec401849b6231f21a66160018f410a69f064';

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

abstract class _$PaginatedProjectReviewList
    extends BuildlessNotifier<PagingStatus> {
  late final int projectId;

  PagingStatus build(
    int projectId,
  );
}

/// See also [PaginatedProjectReviewList].
@ProviderFor(PaginatedProjectReviewList)
const paginatedProjectReviewListProvider = PaginatedProjectReviewListFamily();

/// See also [PaginatedProjectReviewList].
class PaginatedProjectReviewListFamily extends Family<PagingStatus> {
  /// See also [PaginatedProjectReviewList].
  const PaginatedProjectReviewListFamily();

  /// See also [PaginatedProjectReviewList].
  PaginatedProjectReviewListProvider call(
    int projectId,
  ) {
    return PaginatedProjectReviewListProvider(
      projectId,
    );
  }

  @override
  PaginatedProjectReviewListProvider getProviderOverride(
    covariant PaginatedProjectReviewListProvider provider,
  ) {
    return call(
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
  String? get name => r'paginatedProjectReviewListProvider';
}

/// See also [PaginatedProjectReviewList].
class PaginatedProjectReviewListProvider
    extends NotifierProviderImpl<PaginatedProjectReviewList, PagingStatus> {
  /// See also [PaginatedProjectReviewList].
  PaginatedProjectReviewListProvider(
    int projectId,
  ) : this._internal(
          () => PaginatedProjectReviewList()..projectId = projectId,
          from: paginatedProjectReviewListProvider,
          name: r'paginatedProjectReviewListProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$paginatedProjectReviewListHash,
          dependencies: PaginatedProjectReviewListFamily._dependencies,
          allTransitiveDependencies:
              PaginatedProjectReviewListFamily._allTransitiveDependencies,
          projectId: projectId,
        );

  PaginatedProjectReviewListProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.projectId,
  }) : super.internal();

  final int projectId;

  @override
  PagingStatus runNotifierBuild(
    covariant PaginatedProjectReviewList notifier,
  ) {
    return notifier.build(
      projectId,
    );
  }

  @override
  Override overrideWith(PaginatedProjectReviewList Function() create) {
    return ProviderOverride(
      origin: this,
      override: PaginatedProjectReviewListProvider._internal(
        () => create()..projectId = projectId,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        projectId: projectId,
      ),
    );
  }

  @override
  NotifierProviderElement<PaginatedProjectReviewList, PagingStatus>
      createElement() {
    return _PaginatedProjectReviewListProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is PaginatedProjectReviewListProvider &&
        other.projectId == projectId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, projectId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin PaginatedProjectReviewListRef on NotifierProviderRef<PagingStatus> {
  /// The parameter `projectId` of this provider.
  int get projectId;
}

class _PaginatedProjectReviewListProviderElement
    extends NotifierProviderElement<PaginatedProjectReviewList, PagingStatus>
    with PaginatedProjectReviewListRef {
  _PaginatedProjectReviewListProviderElement(super.provider);

  @override
  int get projectId => (origin as PaginatedProjectReviewListProvider).projectId;
}

String _$projectReviewListQueryHash() =>
    r'f3afaeae241e7d4bdc5df0971cd269d5f9308ba1';

/// See also [ProjectReviewListQuery].
@ProviderFor(ProjectReviewListQuery)
final projectReviewListQueryProvider =
    NotifierProvider<ProjectReviewListQuery, ProjectReviewQueryState>.internal(
  ProjectReviewListQuery.new,
  name: r'projectReviewListQueryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$projectReviewListQueryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ProjectReviewListQuery = Notifier<ProjectReviewQueryState>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
