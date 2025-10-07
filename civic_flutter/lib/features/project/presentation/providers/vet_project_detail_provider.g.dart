// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vet_project_detail_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(getVettedProjectDetail)
const getVettedProjectDetailProvider = GetVettedProjectDetailFamily._();

final class GetVettedProjectDetailProvider extends $FunctionalProvider<
        AsyncValue<ProjectVetting?>, ProjectVetting?, FutureOr<ProjectVetting?>>
    with $FutureModifier<ProjectVetting?>, $FutureProvider<ProjectVetting?> {
  const GetVettedProjectDetailProvider._(
      {required GetVettedProjectDetailFamily super.from,
      required int super.argument})
      : super(
          retry: null,
          name: r'getVettedProjectDetailProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$getVettedProjectDetailHash();

  @override
  String toString() {
    return r'getVettedProjectDetailProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<ProjectVetting?> $createElement(
          $ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<ProjectVetting?> create(Ref ref) {
    final argument = this.argument as int;
    return getVettedProjectDetail(
      ref,
      argument,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is GetVettedProjectDetailProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$getVettedProjectDetailHash() =>
    r'a178313568f656443452b0315f8f41fcca4627be';

final class GetVettedProjectDetailFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<ProjectVetting?>, int> {
  const GetVettedProjectDetailFamily._()
      : super(
          retry: null,
          name: r'getVettedProjectDetailProvider',
          dependencies: null,
          $allTransitiveDependencies: null,
          isAutoDispose: true,
        );

  GetVettedProjectDetailProvider call(
    int id,
  ) =>
      GetVettedProjectDetailProvider._(argument: id, from: this);

  @override
  String toString() => r'getVettedProjectDetailProvider';
}
