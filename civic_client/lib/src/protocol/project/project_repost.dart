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
import '../project/project.dart' as _i3;
import '../post/post.dart' as _i4;

abstract class ProjectRepost implements _i1.SerializableModel {
  ProjectRepost._({
    this.id,
    required this.ownerId,
    this.owner,
    required this.projectId,
    this.project,
    required this.postId,
    this.post,
    DateTime? repostedAt,
  }) : repostedAt = repostedAt ?? DateTime.now();

  factory ProjectRepost({
    int? id,
    required int ownerId,
    _i2.UserRecord? owner,
    required int projectId,
    _i3.Project? project,
    required int postId,
    _i4.Post? post,
    DateTime? repostedAt,
  }) = _ProjectRepostImpl;

  factory ProjectRepost.fromJson(Map<String, dynamic> jsonSerialization) {
    return ProjectRepost(
      id: jsonSerialization['id'] as int?,
      ownerId: jsonSerialization['ownerId'] as int,
      owner: jsonSerialization['owner'] == null
          ? null
          : _i2.UserRecord.fromJson(
              (jsonSerialization['owner'] as Map<String, dynamic>)),
      projectId: jsonSerialization['projectId'] as int,
      project: jsonSerialization['project'] == null
          ? null
          : _i3.Project.fromJson(
              (jsonSerialization['project'] as Map<String, dynamic>)),
      postId: jsonSerialization['postId'] as int,
      post: jsonSerialization['post'] == null
          ? null
          : _i4.Post.fromJson(
              (jsonSerialization['post'] as Map<String, dynamic>)),
      repostedAt: jsonSerialization['repostedAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['repostedAt']),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int ownerId;

  _i2.UserRecord? owner;

  int projectId;

  _i3.Project? project;

  int postId;

  _i4.Post? post;

  DateTime? repostedAt;

  /// Returns a shallow copy of this [ProjectRepost]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  ProjectRepost copyWith({
    int? id,
    int? ownerId,
    _i2.UserRecord? owner,
    int? projectId,
    _i3.Project? project,
    int? postId,
    _i4.Post? post,
    DateTime? repostedAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'ownerId': ownerId,
      if (owner != null) 'owner': owner?.toJson(),
      'projectId': projectId,
      if (project != null) 'project': project?.toJson(),
      'postId': postId,
      if (post != null) 'post': post?.toJson(),
      if (repostedAt != null) 'repostedAt': repostedAt?.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _ProjectRepostImpl extends ProjectRepost {
  _ProjectRepostImpl({
    int? id,
    required int ownerId,
    _i2.UserRecord? owner,
    required int projectId,
    _i3.Project? project,
    required int postId,
    _i4.Post? post,
    DateTime? repostedAt,
  }) : super._(
          id: id,
          ownerId: ownerId,
          owner: owner,
          projectId: projectId,
          project: project,
          postId: postId,
          post: post,
          repostedAt: repostedAt,
        );

  /// Returns a shallow copy of this [ProjectRepost]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  ProjectRepost copyWith({
    Object? id = _Undefined,
    int? ownerId,
    Object? owner = _Undefined,
    int? projectId,
    Object? project = _Undefined,
    int? postId,
    Object? post = _Undefined,
    Object? repostedAt = _Undefined,
  }) {
    return ProjectRepost(
      id: id is int? ? id : this.id,
      ownerId: ownerId ?? this.ownerId,
      owner: owner is _i2.UserRecord? ? owner : this.owner?.copyWith(),
      projectId: projectId ?? this.projectId,
      project: project is _i3.Project? ? project : this.project?.copyWith(),
      postId: postId ?? this.postId,
      post: post is _i4.Post? ? post : this.post?.copyWith(),
      repostedAt: repostedAt is DateTime? ? repostedAt : this.repostedAt,
    );
  }
}
