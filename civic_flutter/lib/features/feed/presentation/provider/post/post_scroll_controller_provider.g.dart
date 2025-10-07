// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_scroll_controller_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(PostScrollController)
const postScrollControllerProvider = PostScrollControllerProvider._();

final class PostScrollControllerProvider
    extends $NotifierProvider<PostScrollController, Raw<ScrollController>> {
  const PostScrollControllerProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'postScrollControllerProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$postScrollControllerHash();

  @$internal
  @override
  PostScrollController create() => PostScrollController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Raw<ScrollController> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Raw<ScrollController>>(value),
    );
  }
}

String _$postScrollControllerHash() =>
    r'f04594fe24bf4b0ccc4ed7e6d98ad80abd20dacc';

abstract class _$PostScrollController extends $Notifier<Raw<ScrollController>> {
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
