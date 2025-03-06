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
import '../user/user_record.dart' as _i3;
import '../post/post_comment.dart' as _i4;

abstract class PostComment implements _i1.SerializableModel {
  PostComment._({
    this.id,
    required this.postId,
    this.post,
    required this.ownerId,
    this.owner,
    this.text,
    this.dateCreated,
    this.dateUpdated,
    this.imageUrls,
    this.videoUrl,
    this.likedBy,
    this.replyBy,
    this.parentId,
    this.parent,
  });

  factory PostComment({
    int? id,
    required int postId,
    _i2.Post? post,
    required int ownerId,
    _i3.UserRecord? owner,
    String? text,
    DateTime? dateCreated,
    DateTime? dateUpdated,
    List<String>? imageUrls,
    String? videoUrl,
    List<int>? likedBy,
    List<int>? replyBy,
    int? parentId,
    _i4.PostComment? parent,
  }) = _PostCommentImpl;

  factory PostComment.fromJson(Map<String, dynamic> jsonSerialization) {
    return PostComment(
      id: jsonSerialization['id'] as int?,
      postId: jsonSerialization['postId'] as int,
      post: jsonSerialization['post'] == null
          ? null
          : _i2.Post.fromJson(
              (jsonSerialization['post'] as Map<String, dynamic>)),
      ownerId: jsonSerialization['ownerId'] as int,
      owner: jsonSerialization['owner'] == null
          ? null
          : _i3.UserRecord.fromJson(
              (jsonSerialization['owner'] as Map<String, dynamic>)),
      text: jsonSerialization['text'] as String?,
      dateCreated: jsonSerialization['dateCreated'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(
              jsonSerialization['dateCreated']),
      dateUpdated: jsonSerialization['dateUpdated'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(
              jsonSerialization['dateUpdated']),
      imageUrls: (jsonSerialization['imageUrls'] as List?)
          ?.map((e) => e as String)
          .toList(),
      videoUrl: jsonSerialization['videoUrl'] as String?,
      likedBy: (jsonSerialization['likedBy'] as List?)
          ?.map((e) => e as int)
          .toList(),
      replyBy: (jsonSerialization['replyBy'] as List?)
          ?.map((e) => e as int)
          .toList(),
      parentId: jsonSerialization['parentId'] as int?,
      parent: jsonSerialization['parent'] == null
          ? null
          : _i4.PostComment.fromJson(
              (jsonSerialization['parent'] as Map<String, dynamic>)),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int postId;

  _i2.Post? post;

  int ownerId;

  _i3.UserRecord? owner;

  String? text;

  DateTime? dateCreated;

  DateTime? dateUpdated;

  List<String>? imageUrls;

  String? videoUrl;

  List<int>? likedBy;

  List<int>? replyBy;

  int? parentId;

  _i4.PostComment? parent;

  /// Returns a shallow copy of this [PostComment]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  PostComment copyWith({
    int? id,
    int? postId,
    _i2.Post? post,
    int? ownerId,
    _i3.UserRecord? owner,
    String? text,
    DateTime? dateCreated,
    DateTime? dateUpdated,
    List<String>? imageUrls,
    String? videoUrl,
    List<int>? likedBy,
    List<int>? replyBy,
    int? parentId,
    _i4.PostComment? parent,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'postId': postId,
      if (post != null) 'post': post?.toJson(),
      'ownerId': ownerId,
      if (owner != null) 'owner': owner?.toJson(),
      if (text != null) 'text': text,
      if (dateCreated != null) 'dateCreated': dateCreated?.toJson(),
      if (dateUpdated != null) 'dateUpdated': dateUpdated?.toJson(),
      if (imageUrls != null) 'imageUrls': imageUrls?.toJson(),
      if (videoUrl != null) 'videoUrl': videoUrl,
      if (likedBy != null) 'likedBy': likedBy?.toJson(),
      if (replyBy != null) 'replyBy': replyBy?.toJson(),
      if (parentId != null) 'parentId': parentId,
      if (parent != null) 'parent': parent?.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _PostCommentImpl extends PostComment {
  _PostCommentImpl({
    int? id,
    required int postId,
    _i2.Post? post,
    required int ownerId,
    _i3.UserRecord? owner,
    String? text,
    DateTime? dateCreated,
    DateTime? dateUpdated,
    List<String>? imageUrls,
    String? videoUrl,
    List<int>? likedBy,
    List<int>? replyBy,
    int? parentId,
    _i4.PostComment? parent,
  }) : super._(
          id: id,
          postId: postId,
          post: post,
          ownerId: ownerId,
          owner: owner,
          text: text,
          dateCreated: dateCreated,
          dateUpdated: dateUpdated,
          imageUrls: imageUrls,
          videoUrl: videoUrl,
          likedBy: likedBy,
          replyBy: replyBy,
          parentId: parentId,
          parent: parent,
        );

  /// Returns a shallow copy of this [PostComment]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  PostComment copyWith({
    Object? id = _Undefined,
    int? postId,
    Object? post = _Undefined,
    int? ownerId,
    Object? owner = _Undefined,
    Object? text = _Undefined,
    Object? dateCreated = _Undefined,
    Object? dateUpdated = _Undefined,
    Object? imageUrls = _Undefined,
    Object? videoUrl = _Undefined,
    Object? likedBy = _Undefined,
    Object? replyBy = _Undefined,
    Object? parentId = _Undefined,
    Object? parent = _Undefined,
  }) {
    return PostComment(
      id: id is int? ? id : this.id,
      postId: postId ?? this.postId,
      post: post is _i2.Post? ? post : this.post?.copyWith(),
      ownerId: ownerId ?? this.ownerId,
      owner: owner is _i3.UserRecord? ? owner : this.owner?.copyWith(),
      text: text is String? ? text : this.text,
      dateCreated: dateCreated is DateTime? ? dateCreated : this.dateCreated,
      dateUpdated: dateUpdated is DateTime? ? dateUpdated : this.dateUpdated,
      imageUrls: imageUrls is List<String>?
          ? imageUrls
          : this.imageUrls?.map((e0) => e0).toList(),
      videoUrl: videoUrl is String? ? videoUrl : this.videoUrl,
      likedBy: likedBy is List<int>?
          ? likedBy
          : this.likedBy?.map((e0) => e0).toList(),
      replyBy: replyBy is List<int>?
          ? replyBy
          : this.replyBy?.map((e0) => e0).toList(),
      parentId: parentId is int? ? parentId : this.parentId,
      parent: parent is _i4.PostComment? ? parent : this.parent?.copyWith(),
    );
  }
}
