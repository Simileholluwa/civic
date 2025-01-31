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
import '../post/post_comment.dart' as _i2;
import '../user/user_record.dart' as _i3;

abstract class PostCommentLikes implements _i1.SerializableModel {
  PostCommentLikes._({
    this.id,
    required this.postCommentId,
    this.postComment,
    required this.ownerId,
    this.owner,
    this.dateCreated,
  });

  factory PostCommentLikes({
    int? id,
    required int postCommentId,
    _i2.PostComment? postComment,
    required int ownerId,
    _i3.UserRecord? owner,
    DateTime? dateCreated,
  }) = _PostCommentLikesImpl;

  factory PostCommentLikes.fromJson(Map<String, dynamic> jsonSerialization) {
    return PostCommentLikes(
      id: jsonSerialization['id'] as int?,
      postCommentId: jsonSerialization['postCommentId'] as int,
      postComment: jsonSerialization['postComment'] == null
          ? null
          : _i2.PostComment.fromJson(
              (jsonSerialization['postComment'] as Map<String, dynamic>)),
      ownerId: jsonSerialization['ownerId'] as int,
      owner: jsonSerialization['owner'] == null
          ? null
          : _i3.UserRecord.fromJson(
              (jsonSerialization['owner'] as Map<String, dynamic>)),
      dateCreated: jsonSerialization['dateCreated'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(
              jsonSerialization['dateCreated']),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int postCommentId;

  _i2.PostComment? postComment;

  int ownerId;

  _i3.UserRecord? owner;

  DateTime? dateCreated;

  PostCommentLikes copyWith({
    int? id,
    int? postCommentId,
    _i2.PostComment? postComment,
    int? ownerId,
    _i3.UserRecord? owner,
    DateTime? dateCreated,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'postCommentId': postCommentId,
      if (postComment != null) 'postComment': postComment?.toJson(),
      'ownerId': ownerId,
      if (owner != null) 'owner': owner?.toJson(),
      if (dateCreated != null) 'dateCreated': dateCreated?.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _PostCommentLikesImpl extends PostCommentLikes {
  _PostCommentLikesImpl({
    int? id,
    required int postCommentId,
    _i2.PostComment? postComment,
    required int ownerId,
    _i3.UserRecord? owner,
    DateTime? dateCreated,
  }) : super._(
          id: id,
          postCommentId: postCommentId,
          postComment: postComment,
          ownerId: ownerId,
          owner: owner,
          dateCreated: dateCreated,
        );

  @override
  PostCommentLikes copyWith({
    Object? id = _Undefined,
    int? postCommentId,
    Object? postComment = _Undefined,
    int? ownerId,
    Object? owner = _Undefined,
    Object? dateCreated = _Undefined,
  }) {
    return PostCommentLikes(
      id: id is int? ? id : this.id,
      postCommentId: postCommentId ?? this.postCommentId,
      postComment: postComment is _i2.PostComment?
          ? postComment
          : this.postComment?.copyWith(),
      ownerId: ownerId ?? this.ownerId,
      owner: owner is _i3.UserRecord? ? owner : this.owner?.copyWith(),
      dateCreated: dateCreated is DateTime? ? dateCreated : this.dateCreated,
    );
  }
}
