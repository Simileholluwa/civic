// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project_scroll_controller_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ProjectScrollController)
const projectScrollControllerProvider = ProjectScrollControllerProvider._();

final class ProjectScrollControllerProvider
    extends $NotifierProvider<ProjectScrollController, Raw<ScrollController>> {
  const ProjectScrollControllerProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'projectScrollControllerProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$projectScrollControllerHash();

  @$internal
  @override
  ProjectScrollController create() => ProjectScrollController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Raw<ScrollController> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Raw<ScrollController>>(value),
    );
  }
}

String _$projectScrollControllerHash() =>
    r'd6d68e76d56bfeebc22dcfc2407f4f30e8af2412';

abstract class _$ProjectScrollController
    extends $Notifier<Raw<ScrollController>> {
  Raw<ScrollController> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<Raw<ScrollController>, Raw<ScrollController>>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<Raw<ScrollController>, Raw<ScrollController>>,
        Raw<ScrollController>,
        Object?,
        Object?>;
    element.handleValue(ref, created);
  }
}
