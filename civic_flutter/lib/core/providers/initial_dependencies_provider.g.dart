// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'initial_dependencies_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(BootStrap)
const bootStrapProvider = BootStrapProvider._();

final class BootStrapProvider extends $AsyncNotifierProvider<BootStrap, void> {
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
}

String _$bootStrapHash() => r'432d38eec0a5eb2e828c8dd8d940ec786429a870';

abstract class _$BootStrap extends $AsyncNotifier<void> {
  FutureOr<void> build();
  @$mustCallSuper
  @override
  void runBuild() {
    build();
    final ref = this.ref as $Ref<AsyncValue<void>, void>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<AsyncValue<void>, void>,
        AsyncValue<void>,
        Object?,
        Object?>;
    element.handleValue(ref, null);
  }
}
