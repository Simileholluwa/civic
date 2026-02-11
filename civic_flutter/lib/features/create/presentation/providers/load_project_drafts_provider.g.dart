// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'load_project_drafts_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(loaddraftProjects)
final loaddraftProjectsProvider = LoaddraftProjectsProvider._();

final class LoaddraftProjectsProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<Project>>,
          List<Project>,
          FutureOr<List<Project>>
        >
    with $FutureModifier<List<Project>>, $FutureProvider<List<Project>> {
  LoaddraftProjectsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'loaddraftProjectsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$loaddraftProjectsHash();

  @$internal
  @override
  $FutureProviderElement<List<Project>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<Project>> create(Ref ref) {
    return loaddraftProjects(ref);
  }
}

String _$loaddraftProjectsHash() => r'cd263b12b13c62e5594c480fd6c37105994602da';
