// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fcm_services_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(fcmServiceImpl)
const fcmServiceImplProvider = FcmServiceImplProvider._();

final class FcmServiceImplProvider
    extends $FunctionalProvider<FcmServiceImpl, FcmServiceImpl, FcmServiceImpl>
    with $Provider<FcmServiceImpl> {
  const FcmServiceImplProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'fcmServiceImplProvider',
          isAutoDispose: false,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$fcmServiceImplHash();

  @$internal
  @override
  $ProviderElement<FcmServiceImpl> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  FcmServiceImpl create(Ref ref) {
    return fcmServiceImpl(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(FcmServiceImpl value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<FcmServiceImpl>(value),
    );
  }
}

String _$fcmServiceImplHash() => r'694eaffab1bc44585531aa13a15f8e1cf0ad0e8b';
