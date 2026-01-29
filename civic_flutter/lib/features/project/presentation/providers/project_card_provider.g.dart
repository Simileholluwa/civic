// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project_card_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ProjectCardWidget)
const projectCardWidgetProvider = ProjectCardWidgetFamily._();

final class ProjectCardWidgetProvider
    extends $NotifierProvider<ProjectCardWidget, ProjectCardState> {
  const ProjectCardWidgetProvider._({
    required ProjectCardWidgetFamily super.from,
    required ProjectWithUserStateKey? super.argument,
  }) : super(
         retry: null,
         name: r'projectCardWidgetProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$projectCardWidgetHash();

  @override
  String toString() {
    return r'projectCardWidgetProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  ProjectCardWidget create() => ProjectCardWidget();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ProjectCardState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ProjectCardState>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is ProjectCardWidgetProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$projectCardWidgetHash() => r'546b606f8df993167ea995601145041219ee61b2';

final class ProjectCardWidgetFamily extends $Family
    with
        $ClassFamilyOverride<
          ProjectCardWidget,
          ProjectCardState,
          ProjectCardState,
          ProjectCardState,
          ProjectWithUserStateKey?
        > {
  const ProjectCardWidgetFamily._()
    : super(
        retry: null,
        name: r'projectCardWidgetProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  ProjectCardWidgetProvider call(ProjectWithUserStateKey? key) =>
      ProjectCardWidgetProvider._(argument: key, from: this);

  @override
  String toString() => r'projectCardWidgetProvider';
}

abstract class _$ProjectCardWidget extends $Notifier<ProjectCardState> {
  late final _$args = ref.$arg as ProjectWithUserStateKey?;
  ProjectWithUserStateKey? get key => _$args;

  ProjectCardState build(ProjectWithUserStateKey? key);
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(_$args);
    final ref = this.ref as $Ref<ProjectCardState, ProjectCardState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<ProjectCardState, ProjectCardState>,
              ProjectCardState,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
