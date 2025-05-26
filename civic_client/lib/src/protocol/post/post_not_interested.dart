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
import '../user/user_record.dart' as _i2;
import '../post/post.dart' as _i3;

abstract class PostNotInterested implements _i1.SerializableModel {
  PostNotInterested._({
    this.id,
    required this.userId,
    this.user,
    required this.postId,
    this.post,
    DateTime? dateMarked,
  }) : dateMarked = dateMarked ?? DateTime.now();

  factory PostNotInterested({
    int? id,
    required int userId,
    _i2.UserRecord? user,
    required int postId,
    _i3.Post? post,
    DateTime? dateMarked,
  }) = _PostNotInterestedImpl;

  factory PostNotInterested.fromJson(Map<String, dynamic> jsonSerialization) {
    return PostNotInterested(
      id: jsonSerialization['id'] as int?,
      userId: jsonSerialization['userId'] as int,
      user: jsonSerialization['user'] == null
          ? null
          : _i2.UserRecord.fromJson(
              (jsonSerialization['user'] as Map<String, dynamic>)),
      postId: jsonSerialization['postId'] as int,
      post: jsonSerialization['post'] == null
          ? null
          : _i3.Post.fromJson(
              (jsonSerialization['post'] as Map<String, dynamic>)),
      dateMarked: jsonSerialization['dateMarked'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['dateMarked']),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int userId;

  _i2.UserRecord? user;

  int postId;

  _i3.Post? post;

  DateTime? dateMarked;

  /// Returns a shallow copy of this [PostNotInterested]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  PostNotInterested copyWith({
    int? id,
    int? userId,
    _i2.UserRecord? user,
    int? postId,
    _i3.Post? post,
    DateTime? dateMarked,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'userId': userId,
      if (user != null) 'user': user?.toJson(),
      'postId': postId,
      if (post != null) 'post': post?.toJson(),
      if (dateMarked != null) 'dateMarked': dateMarked?.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _PostNotInterestedImpl extends PostNotInterested {
  _PostNotInterestedImpl({
    int? id,
    required int userId,
    _i2.UserRecord? user,
    required int postId,
    _i3.Post? post,
    DateTime? dateMarked,
  }) : super._(
          id: id,
          userId: userId,
          user: user,
          postId: postId,
          post: post,
          dateMarked: dateMarked,
        );

  /// Returns a shallow copy of this [PostNotInterested]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  PostNotInterested copyWith({
    Object? id = _Undefined,
    int? userId,
    Object? user = _Undefined,
    int? postId,
    Object? post = _Undefined,
    Object? dateMarked = _Undefined,
  }) {
    return PostNotInterested(
      id: id is int? ? id : this.id,
      userId: userId ?? this.userId,
      user: user is _i2.UserRecord? ? user : this.user?.copyWith(),
      postId: postId ?? this.postId,
      post: post is _i3.Post? ? post : this.post?.copyWith(),
      dateMarked: dateMarked is DateTime? ? dateMarked : this.dateMarked,
    );
  }
}
