/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;
import '../post/post.dart' as _i2;

abstract class PostWithUserState
    implements _i1.SerializableModel, _i1.ProtocolSerialization {
  PostWithUserState._({
    required this.post,
    bool? hasLiked,
    bool? hasBookmarked,
    bool? isSubscribed,
    this.selectedPollOptionId,
  })  : hasLiked = hasLiked ?? false,
        hasBookmarked = hasBookmarked ?? false,
        isSubscribed = isSubscribed ?? false;

  factory PostWithUserState({
    required _i2.Post post,
    bool? hasLiked,
    bool? hasBookmarked,
    bool? isSubscribed,
    int? selectedPollOptionId,
  }) = _PostWithUserStateImpl;

  factory PostWithUserState.fromJson(Map<String, dynamic> jsonSerialization) {
    return PostWithUserState(
      post: _i2.Post.fromJson(
          (jsonSerialization['post'] as Map<String, dynamic>)),
      hasLiked: jsonSerialization['hasLiked'] as bool?,
      hasBookmarked: jsonSerialization['hasBookmarked'] as bool?,
      isSubscribed: jsonSerialization['isSubscribed'] as bool?,
      selectedPollOptionId: jsonSerialization['selectedPollOptionId'] as int?,
    );
  }

  _i2.Post post;

  bool? hasLiked;

  bool? hasBookmarked;

  bool? isSubscribed;

  int? selectedPollOptionId;

  /// Returns a shallow copy of this [PostWithUserState]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  PostWithUserState copyWith({
    _i2.Post? post,
    bool? hasLiked,
    bool? hasBookmarked,
    bool? isSubscribed,
    int? selectedPollOptionId,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      'post': post.toJson(),
      if (hasLiked != null) 'hasLiked': hasLiked,
      if (hasBookmarked != null) 'hasBookmarked': hasBookmarked,
      if (isSubscribed != null) 'isSubscribed': isSubscribed,
      if (selectedPollOptionId != null)
        'selectedPollOptionId': selectedPollOptionId,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      'post': post.toJsonForProtocol(),
      if (hasLiked != null) 'hasLiked': hasLiked,
      if (hasBookmarked != null) 'hasBookmarked': hasBookmarked,
      if (isSubscribed != null) 'isSubscribed': isSubscribed,
      if (selectedPollOptionId != null)
        'selectedPollOptionId': selectedPollOptionId,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _PostWithUserStateImpl extends PostWithUserState {
  _PostWithUserStateImpl({
    required _i2.Post post,
    bool? hasLiked,
    bool? hasBookmarked,
    bool? isSubscribed,
    int? selectedPollOptionId,
  }) : super._(
          post: post,
          hasLiked: hasLiked,
          hasBookmarked: hasBookmarked,
          isSubscribed: isSubscribed,
          selectedPollOptionId: selectedPollOptionId,
        );

  /// Returns a shallow copy of this [PostWithUserState]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  PostWithUserState copyWith({
    _i2.Post? post,
    Object? hasLiked = _Undefined,
    Object? hasBookmarked = _Undefined,
    Object? isSubscribed = _Undefined,
    Object? selectedPollOptionId = _Undefined,
  }) {
    return PostWithUserState(
      post: post ?? this.post.copyWith(),
      hasLiked: hasLiked is bool? ? hasLiked : this.hasLiked,
      hasBookmarked:
          hasBookmarked is bool? ? hasBookmarked : this.hasBookmarked,
      isSubscribed: isSubscribed is bool? ? isSubscribed : this.isSubscribed,
      selectedPollOptionId: selectedPollOptionId is int?
          ? selectedPollOptionId
          : this.selectedPollOptionId,
    );
  }
}
