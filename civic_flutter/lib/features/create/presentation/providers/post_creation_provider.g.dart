// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_creation_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(PostCreation)
const postCreationProvider = PostCreationFamily._();

final class PostCreationProvider
    extends $NotifierProvider<PostCreation, PostCreationState> {
  const PostCreationProvider._(
      {required PostCreationFamily super.from, required Post? super.argument})
      : super(
          retry: null,
          name: r'postCreationProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$postCreationHash();

  @override
  String toString() {
    return r'postCreationProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  PostCreation create() => PostCreation();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(PostCreationState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<PostCreationState>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is PostCreationProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$postCreationHash() => r'63089bb62adfce2a2e22d5fba06b3c06776a642d';

final class PostCreationFamily extends $Family
    with
        $ClassFamilyOverride<PostCreation, PostCreationState, PostCreationState,
            PostCreationState, Post?> {
  const PostCreationFamily._()
      : super(
          retry: null,
          name: r'postCreationProvider',
          dependencies: null,
          $allTransitiveDependencies: null,
          isAutoDispose: true,
        );

  PostCreationProvider call(
    Post? post,
  ) =>
      PostCreationProvider._(argument: post, from: this);

  @override
  String toString() => r'postCreationProvider';
}

abstract class _$PostCreation extends $Notifier<PostCreationState> {
  late final _$args = ref.$arg as Post?;
  Post? get post => _$args;

  PostCreationState build(
    Post? post,
  );
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(
      _$args,
    );
    final ref = this.ref as $Ref<PostCreationState, PostCreationState>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<PostCreationState, PostCreationState>,
        PostCreationState,
        Object?,
        Object?>;
    element.handleValue(ref, created);
  }
}
