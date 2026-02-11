// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'initial_dependencies_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(BootStrap)
final bootStrapProvider = BootStrapProvider._();

final class BootStrapProvider extends $AsyncNotifierProvider<BootStrap, void> {
  BootStrapProvider._()
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

String _$bootStrapHash() => r'a9647e59bcc0ee59da50e0d553c30d5f03dc42e8';

abstract class _$BootStrap extends $AsyncNotifier<void> {
  FutureOr<void> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<void>, void>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<void>, void>,
              AsyncValue<void>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
