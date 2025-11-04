// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'load_project_drafts_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(loaddraftProjects)
const loaddraftProjectsProvider = LoaddraftProjectsProvider._();

final class LoaddraftProjectsProvider extends $FunctionalProvider<
        AsyncValue<List<Project>>, List<Project>, FutureOr<List<Project>>>
    with $FutureModifier<List<Project>>, $FutureProvider<List<Project>> {
  const LoaddraftProjectsProvider._()
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
          $ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<List<Project>> create(Ref ref) {
    return loaddraftProjects(ref);
  }
}

String _$loaddraftProjectsHash() => r'74817d54ed792310c61b2f89fbfb1d3dbf4f621f';
