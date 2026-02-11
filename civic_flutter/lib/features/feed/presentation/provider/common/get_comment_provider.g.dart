// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_comment_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(getComment)
final getCommentProvider = GetCommentFamily._();

final class GetCommentProvider
    extends
        $FunctionalProvider<
          AsyncValue<PostWithUserState>,
          PostWithUserState,
          FutureOr<PostWithUserState>
        >
    with
        $FutureModifier<PostWithUserState>,
        $FutureProvider<PostWithUserState> {
  GetCommentProvider._({
    required GetCommentFamily super.from,
    required (int, bool) super.argument,
  }) : super(
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
  $FutureProviderElement<PostWithUserState> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<PostWithUserState> create(Ref ref) {
    final argument = this.argument as (int, bool);
    return getComment(ref, argument.$1, argument.$2);
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

String _$getCommentHash() => r'f47b28a49788fe5d62f5b2148d70fe7cc1ae30a6';

final class GetCommentFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<PostWithUserState>, (int, bool)> {
  GetCommentFamily._()
    : super(
        retry: null,
        name: r'getCommentProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  GetCommentProvider call(int commentId, bool isComment) =>
      GetCommentProvider._(argument: (commentId, isComment), from: this);

  @override
  String toString() => r'getCommentProvider';
}
