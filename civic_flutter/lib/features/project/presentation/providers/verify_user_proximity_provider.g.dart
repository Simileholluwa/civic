// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verify_user_proximity_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(verifyUserProximity)
const verifyUserProximityProvider = VerifyUserProximityFamily._();

final class VerifyUserProximityProvider
    extends $FunctionalProvider<AsyncValue<double>, double, FutureOr<double>>
    with $FutureModifier<double>, $FutureProvider<double> {
  const VerifyUserProximityProvider._(
      {required VerifyUserProximityFamily super.from,
      required (
        List<AWSPlaces>?,
        int?,
      )
          super.argument})
      : super(
          retry: null,
          name: r'verifyUserProximityProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$verifyUserProximityHash();

  @override
  String toString() {
    return r'verifyUserProximityProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $FutureProviderElement<double> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<double> create(Ref ref) {
    final argument = this.argument as (
      List<AWSPlaces>?,
      int?,
    );
    return verifyUserProximity(
      ref,
      argument.$1,
      argument.$2,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is VerifyUserProximityProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$verifyUserProximityHash() =>
    r'ee354f6475baedd1514f8313058a6b2a8b80d2d4';

final class VerifyUserProximityFamily extends $Family
    with
        $FunctionalFamilyOverride<
            FutureOr<double>,
            (
              List<AWSPlaces>?,
              int?,
            )> {
  const VerifyUserProximityFamily._()
      : super(
          retry: null,
          name: r'verifyUserProximityProvider',
          dependencies: null,
          $allTransitiveDependencies: null,
          isAutoDispose: true,
        );

  VerifyUserProximityProvider call(
    List<AWSPlaces>? projectLocations,
    int? projectId,
  ) =>
      VerifyUserProximityProvider._(argument: (
        projectLocations,
        projectId,
      ), from: this);

  @override
  String toString() => r'verifyUserProximityProvider';
}
