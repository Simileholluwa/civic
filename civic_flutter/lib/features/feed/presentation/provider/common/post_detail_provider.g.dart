// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_detail_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(postDetail)
const postDetailProvider = PostDetailFamily._();

final class PostDetailProvider extends $FunctionalProvider<
        AsyncValue<PostWithUserState>,
        PostWithUserState,
        FutureOr<PostWithUserState>>
    with
        $FutureModifier<PostWithUserState>,
        $FutureProvider<PostWithUserState> {
  const PostDetailProvider._(
      {required PostDetailFamily super.from,
      required (
        int,
        Post?,
        PostType,
      )
          super.argument})
      : super(
          retry: null,
          name: r'postDetailProvider',
          isAutoDispose: true,
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
          $ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<PostWithUserState> create(Ref ref) {
    final argument = this.argument as (
      int,
      Post?,
      PostType,
    );
    return postDetail(
      ref,
      argument.$1,
      argument.$2,
      argument.$3,
    );
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

String _$postDetailHash() => r'c46797e14cab797e64920306040f4957e727b38f';

final class PostDetailFamily extends $Family
    with
        $FunctionalFamilyOverride<
            FutureOr<PostWithUserState>,
            (
              int,
              Post?,
              PostType,
            )> {
  const PostDetailFamily._()
      : super(
          retry: null,
          name: r'postDetailProvider',
          dependencies: null,
          $allTransitiveDependencies: null,
          isAutoDispose: true,
        );

  PostDetailProvider call(
    int id,
    Post? post,
    PostType postType,
  ) =>
      PostDetailProvider._(argument: (
        id,
        post,
        postType,
      ), from: this);

  @override
  String toString() => r'postDetailProvider';
}
