// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_detail_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(postDetail)
final postDetailProvider = PostDetailFamily._();

final class PostDetailProvider
    extends
        $FunctionalProvider<
          AsyncValue<PostWithUserState>,
          PostWithUserState,
          FutureOr<PostWithUserState>
        >
    with
        $FutureModifier<PostWithUserState>,
        $FutureProvider<PostWithUserState> {
  PostDetailProvider._({
    required PostDetailFamily super.from,
    required (int, Post?, PostType) super.argument,
  }) : super(
         retry: null,
         name: r'postDetailProvider',
         isAutoDispose: false,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$postDetailHash();

  @override
  String toString() {
    return r'postDetailProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $FutureProviderElement<PostWithUserState> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<PostWithUserState> create(Ref ref) {
    final argument = this.argument as (int, Post?, PostType);
    return postDetail(ref, argument.$1, argument.$2, argument.$3);
  }

  @override
  bool operator ==(Object other) {
    return other is PostDetailProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$postDetailHash() => r'bb6d21c12358c6efc6c84997888b5be1f3d95b1d';

final class PostDetailFamily extends $Family
    with
        $FunctionalFamilyOverride<
          FutureOr<PostWithUserState>,
          (int, Post?, PostType)
        > {
  PostDetailFamily._()
    : super(
        retry: null,
        name: r'postDetailProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: false,
      );

  PostDetailProvider call(int id, Post? post, PostType postType) =>
      PostDetailProvider._(argument: (id, post, postType), from: this);

  @override
  String toString() => r'postDetailProvider';
}
