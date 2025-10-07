// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'initial_dependencies_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(BootStrap)
const bootStrapProvider = BootStrapProvider._();

final class BootStrapProvider extends $NotifierProvider<BootStrap, bool> {
  const BootStrapProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'bootStrapProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$bootStrapHash();

  @$internal
  @override
  BootStrap create() => BootStrap();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }
}

String _$bootStrapHash() => r'0f0752d3495ade76cc06af937a2c5c348672d4af';

abstract class _$BootStrap extends $Notifier<bool> {
  bool build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<bool, bool>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<bool, bool>, bool, Object?, Object?>;
    element.handleValue(ref, created);
  }
}
