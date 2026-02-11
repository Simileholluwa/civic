// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project_screen_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ProjectScreenWidgets)
final projectScreenWidgetsProvider = ProjectScreenWidgetsProvider._();

final class ProjectScreenWidgetsProvider
    extends $NotifierProvider<ProjectScreenWidgets, ProjectScreenState> {
  ProjectScreenWidgetsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'projectScreenWidgetsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$projectScreenWidgetsHash();

  @$internal
  @override
  ProjectScreenWidgets create() => ProjectScreenWidgets();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ProjectScreenState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ProjectScreenState>(value),
    );
  }
}

String _$projectScreenWidgetsHash() =>
    r'0bad9cd9a7d344024edbb8b226d622edb5264936';

abstract class _$ProjectScreenWidgets extends $Notifier<ProjectScreenState> {
  ProjectScreenState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<ProjectScreenState, ProjectScreenState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<ProjectScreenState, ProjectScreenState>,
              ProjectScreenState,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

@ProviderFor(projectVsync)
final projectVsyncProvider = ProjectVsyncProvider._();

final class ProjectVsyncProvider
    extends $FunctionalProvider<TickerProvider, TickerProvider, TickerProvider>
    with $Provider<TickerProvider> {
  ProjectVsyncProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'projectVsyncProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$projectVsyncHash();

  @$internal
  @override
  $ProviderElement<TickerProvider> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  TickerProvider create(Ref ref) {
    return projectVsync(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(TickerProvider value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<TickerProvider>(value),
    );
  }
}

String _$projectVsyncHash() => r'53dc07f00685291f9ff2218ba8a82e87c06a06be';

@ProviderFor(projectCardVsync)
final projectCardVsyncProvider = ProjectCardVsyncProvider._();

final class ProjectCardVsyncProvider
    extends $FunctionalProvider<TickerProvider, TickerProvider, TickerProvider>
    with $Provider<TickerProvider> {
  ProjectCardVsyncProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'projectCardVsyncProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$projectCardVsyncHash();

  @$internal
  @override
  $ProviderElement<TickerProvider> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  TickerProvider create(Ref ref) {
    return projectCardVsync(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(TickerProvider value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<TickerProvider>(value),
    );
  }
}

String _$projectCardVsyncHash() => r'97c42cc37d6e81e13ee416c489b1fa13aa1d6063';

@ProviderFor(projectScreenTab)
final projectScreenTabProvider = ProjectScreenTabProvider._();

final class ProjectScreenTabProvider
    extends
        $FunctionalProvider<
          Raw<TabController>,
          Raw<TabController>,
          Raw<TabController>
        >
    with $Provider<Raw<TabController>> {
  ProjectScreenTabProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'projectScreenTabProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$projectScreenTabHash();

  @$internal
  @override
  $ProviderElement<Raw<TabController>> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  Raw<TabController> create(Ref ref) {
    return projectScreenTab(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Raw<TabController> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Raw<TabController>>(value),
    );
  }
}

String _$projectScreenTabHash() => r'd64cbbe97676a69578ab6382451985a4a6449c90';
