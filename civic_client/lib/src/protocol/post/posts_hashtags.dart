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
import '../post/hashtags.dart' as _i3;

abstract class PostsHashtags implements _i1.SerializableModel {
  PostsHashtags._({
    this.id,
    required this.postId,
    this.post,
    required this.hashtagId,
    this.hashtag,
  });

  factory PostsHashtags({
    int? id,
    required int postId,
    _i2.Post? post,
    required int hashtagId,
    _i3.Hashtag? hashtag,
  }) = _PostsHashtagsImpl;

  factory PostsHashtags.fromJson(Map<String, dynamic> jsonSerialization) {
    return PostsHashtags(
      id: jsonSerialization['id'] as int?,
      postId: jsonSerialization['postId'] as int,
      post: jsonSerialization['post'] == null
          ? null
          : _i2.Post.fromJson(
              (jsonSerialization['post'] as Map<String, dynamic>)),
      hashtagId: jsonSerialization['hashtagId'] as int,
      hashtag: jsonSerialization['hashtag'] == null
          ? null
          : _i3.Hashtag.fromJson(
              (jsonSerialization['hashtag'] as Map<String, dynamic>)),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int postId;

  _i2.Post? post;

  int hashtagId;

  _i3.Hashtag? hashtag;

  PostsHashtags copyWith({
    int? id,
    int? postId,
    _i2.Post? post,
    int? hashtagId,
    _i3.Hashtag? hashtag,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'postId': postId,
      if (post != null) 'post': post?.toJson(),
      'hashtagId': hashtagId,
      if (hashtag != null) 'hashtag': hashtag?.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _PostsHashtagsImpl extends PostsHashtags {
  _PostsHashtagsImpl({
    int? id,
    required int postId,
    _i2.Post? post,
    required int hashtagId,
    _i3.Hashtag? hashtag,
  }) : super._(
          id: id,
          postId: postId,
          post: post,
          hashtagId: hashtagId,
          hashtag: hashtag,
        );

  @override
  PostsHashtags copyWith({
    Object? id = _Undefined,
    int? postId,
    Object? post = _Undefined,
    int? hashtagId,
    Object? hashtag = _Undefined,
  }) {
    return PostsHashtags(
      id: id is int? ? id : this.id,
      postId: postId ?? this.postId,
      post: post is _i2.Post? ? post : this.post?.copyWith(),
      hashtagId: hashtagId ?? this.hashtagId,
      hashtag: hashtag is _i3.Hashtag? ? hashtag : this.hashtag?.copyWith(),
    );
  }
}
