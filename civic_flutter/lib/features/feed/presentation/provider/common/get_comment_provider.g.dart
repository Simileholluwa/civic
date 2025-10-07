// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_comment_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(getComment)
const getCommentProvider = GetCommentFamily._();

final class GetCommentProvider
    extends $FunctionalProvider<AsyncValue<Post>, Post, FutureOr<Post>>
    with $FutureModifier<Post>, $FutureProvider<Post> {
  const GetCommentProvider._(
      {required GetCommentFamily super.from,
      required (
        int,
        bool,
      )
          super.argument})
      : super(
          retry: null,
          name: r'getCommentProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$getCommentHash();

  @override
  String toString() {
    return r'getCommentProvider'
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
      bool,
    );
    return getComment(
      ref,
      argument.$1,
      argument.$2,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is GetCommentProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$getCommentHash() => r'b7bd071ba93305193cd7de075dc1c31b2f6ae489';

final class GetCommentFamily extends $Family
    with
        $FunctionalFamilyOverride<
            FutureOr<Post>,
            (
              int,
              bool,
            )> {
  const GetCommentFamily._()
      : super(
          retry: null,
          name: r'getCommentProvider',
          dependencies: null,
          $allTransitiveDependencies: null,
          isAutoDispose: true,
        );

  GetCommentProvider call(
    int commentId,
    bool isComment,
  ) =>
      GetCommentProvider._(argument: (
        commentId,
        isComment,
      ), from: this);

  @override
  String toString() => r'getCommentProvider';
}
