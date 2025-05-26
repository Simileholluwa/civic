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

abstract class PostReposts implements _i1.SerializableModel {
  PostReposts._({
    this.id,
    required this.postId,
    this.post,
    required this.parentId,
    this.parent,
    required this.ownerId,
    this.owner,
    DateTime? dateCreated,
  }) : dateCreated = dateCreated ?? DateTime.now();

  factory PostReposts({
    int? id,
    required int postId,
    _i2.Post? post,
    required int parentId,
    _i2.Post? parent,
    required int ownerId,
    _i3.UserRecord? owner,
    DateTime? dateCreated,
  }) = _PostRepostsImpl;

  factory PostReposts.fromJson(Map<String, dynamic> jsonSerialization) {
    return PostReposts(
      id: jsonSerialization['id'] as int?,
      postId: jsonSerialization['postId'] as int,
      post: jsonSerialization['post'] == null
          ? null
          : _i2.Post.fromJson(
              (jsonSerialization['post'] as Map<String, dynamic>)),
      parentId: jsonSerialization['parentId'] as int,
      parent: jsonSerialization['parent'] == null
          ? null
          : _i2.Post.fromJson(
              (jsonSerialization['parent'] as Map<String, dynamic>)),
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

  int postId;

  _i2.Post? post;

  int parentId;

  _i2.Post? parent;

  int ownerId;

  _i3.UserRecord? owner;

  DateTime? dateCreated;

  /// Returns a shallow copy of this [PostReposts]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  PostReposts copyWith({
    int? id,
    int? postId,
    _i2.Post? post,
    int? parentId,
    _i2.Post? parent,
    int? ownerId,
    _i3.UserRecord? owner,
    DateTime? dateCreated,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'postId': postId,
      if (post != null) 'post': post?.toJson(),
      'parentId': parentId,
      if (parent != null) 'parent': parent?.toJson(),
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

class _PostRepostsImpl extends PostReposts {
  _PostRepostsImpl({
    int? id,
    required int postId,
    _i2.Post? post,
    required int parentId,
    _i2.Post? parent,
    required int ownerId,
    _i3.UserRecord? owner,
    DateTime? dateCreated,
  }) : super._(
          id: id,
          postId: postId,
          post: post,
          parentId: parentId,
          parent: parent,
          ownerId: ownerId,
          owner: owner,
          dateCreated: dateCreated,
        );

  /// Returns a shallow copy of this [PostReposts]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  PostReposts copyWith({
    Object? id = _Undefined,
    int? postId,
    Object? post = _Undefined,
    int? parentId,
    Object? parent = _Undefined,
    int? ownerId,
    Object? owner = _Undefined,
    Object? dateCreated = _Undefined,
  }) {
    return PostReposts(
      id: id is int? ? id : this.id,
      postId: postId ?? this.postId,
      post: post is _i2.Post? ? post : this.post?.copyWith(),
      parentId: parentId ?? this.parentId,
      parent: parent is _i2.Post? ? parent : this.parent?.copyWith(),
      ownerId: ownerId ?? this.ownerId,
      owner: owner is _i3.UserRecord? ? owner : this.owner?.copyWith(),
      dateCreated: dateCreated is DateTime? ? dateCreated : this.dateCreated,
    );
  }
}
