// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_detail_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(postDetail)
const postDetailProvider = PostDetailFamily._();

final class PostDetailProvider
    extends $FunctionalProvider<AsyncValue<Post>, Post, FutureOr<Post>>
    with $FutureModifier<Post>, $FutureProvider<Post> {
  const PostDetailProvider._(
      {required PostDetailFamily super.from,
      required (
        int,
        String,
        Post?,
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
  $FutureProviderElement<Post> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<Post> create(Ref ref) {
    final argument = this.argument as (
      int,
      String,
      Post?,
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

String _$postDetailHash() => r'e2db2f4a3cd3b276df00c0b2f0b1659cfab8f958';

final class PostDetailFamily extends $Family
    with
        $FunctionalFamilyOverride<
            FutureOr<Post>,
            (
              int,
              String,
              Post?,
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
    String draftType,
    Post? post,
  ) =>
      PostDetailProvider._(argument: (
        id,
        draftType,
        post,
      ), from: this);

  @override
  String toString() => r'postDetailProvider';
}
