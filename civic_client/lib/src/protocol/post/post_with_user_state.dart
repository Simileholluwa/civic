/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;
import '../post/post.dart' as _i2;

abstract class PostWithUserState implements _i1.SerializableModel {
  PostWithUserState._({
    required this.post,
    bool? hasLiked,
    bool? hasBookmarked,
    bool? hasReposted,
    bool? isSubscribed,
    bool? isFollower,
    this.selectedPollOptionId,
  })  : hasLiked = hasLiked ?? false,
        hasBookmarked = hasBookmarked ?? false,
        hasReposted = hasReposted ?? false,
        isSubscribed = isSubscribed ?? false,
        isFollower = isFollower ?? false;

  factory PostWithUserState({
    required _i2.Post post,
    bool? hasLiked,
    bool? hasBookmarked,
    bool? hasReposted,
    bool? isSubscribed,
    bool? isFollower,
    int? selectedPollOptionId,
  }) = _PostWithUserStateImpl;

  factory PostWithUserState.fromJson(Map<String, dynamic> jsonSerialization) {
    return PostWithUserState(
      post: _i2.Post.fromJson(
          (jsonSerialization['post'] as Map<String, dynamic>)),
      hasLiked: jsonSerialization['hasLiked'] as bool?,
      hasBookmarked: jsonSerialization['hasBookmarked'] as bool?,
      hasReposted: jsonSerialization['hasReposted'] as bool?,
      isSubscribed: jsonSerialization['isSubscribed'] as bool?,
      isFollower: jsonSerialization['isFollower'] as bool?,
      selectedPollOptionId: jsonSerialization['selectedPollOptionId'] as int?,
    );
  }

  _i2.Post post;

  bool? hasLiked;

  bool? hasBookmarked;

  bool? hasReposted;

  bool? isSubscribed;

  bool? isFollower;

  int? selectedPollOptionId;

  /// Returns a shallow copy of this [PostWithUserState]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  PostWithUserState copyWith({
    _i2.Post? post,
    bool? hasLiked,
    bool? hasBookmarked,
    bool? hasReposted,
    bool? isSubscribed,
    bool? isFollower,
    int? selectedPollOptionId,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      'post': post.toJson(),
      if (hasLiked != null) 'hasLiked': hasLiked,
      if (hasBookmarked != null) 'hasBookmarked': hasBookmarked,
      if (hasReposted != null) 'hasReposted': hasReposted,
      if (isSubscribed != null) 'isSubscribed': isSubscribed,
      if (isFollower != null) 'isFollower': isFollower,
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
    bool? hasReposted,
    bool? isSubscribed,
    bool? isFollower,
    int? selectedPollOptionId,
  }) : super._(
          post: post,
          hasLiked: hasLiked,
          hasBookmarked: hasBookmarked,
          hasReposted: hasReposted,
          isSubscribed: isSubscribed,
          isFollower: isFollower,
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
    Object? hasReposted = _Undefined,
    Object? isSubscribed = _Undefined,
    Object? isFollower = _Undefined,
    Object? selectedPollOptionId = _Undefined,
  }) {
    return PostWithUserState(
      post: post ?? this.post.copyWith(),
      hasLiked: hasLiked is bool? ? hasLiked : this.hasLiked,
      hasBookmarked:
          hasBookmarked is bool? ? hasBookmarked : this.hasBookmarked,
      hasReposted: hasReposted is bool? ? hasReposted : this.hasReposted,
      isSubscribed: isSubscribed is bool? ? isSubscribed : this.isSubscribed,
      isFollower: isFollower is bool? ? isFollower : this.isFollower,
      selectedPollOptionId: selectedPollOptionId is int?
          ? selectedPollOptionId
          : this.selectedPollOptionId,
    );
  }
}
