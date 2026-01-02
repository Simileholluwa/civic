/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters
// ignore_for_file: invalid_use_of_internal_member

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;
import '../post/post.dart' as _i2;
import '../user/user_record.dart' as _i3;
import 'package:civic_client/src/protocol/protocol.dart' as _i4;

abstract class PostImpression implements _i1.SerializableModel {
  PostImpression._({
    this.id,
    required this.postId,
    this.post,
    required this.viewerId,
    this.viewer,
    this.sessionId,
    this.source,
    this.hourBucket,
    DateTime? createdAt,
  }) : createdAt = createdAt ?? DateTime.now();

  factory PostImpression({
    int? id,
    required int postId,
    _i2.Post? post,
    required int viewerId,
    _i3.UserRecord? viewer,
    String? sessionId,
    String? source,
    DateTime? hourBucket,
    DateTime? createdAt,
  }) = _PostImpressionImpl;

  factory PostImpression.fromJson(Map<String, dynamic> jsonSerialization) {
    return PostImpression(
      id: jsonSerialization['id'] as int?,
      postId: jsonSerialization['postId'] as int,
      post: jsonSerialization['post'] == null
          ? null
          : _i4.Protocol().deserialize<_i2.Post>(jsonSerialization['post']),
      viewerId: jsonSerialization['viewerId'] as int,
      viewer: jsonSerialization['viewer'] == null
          ? null
          : _i4.Protocol().deserialize<_i3.UserRecord>(
              jsonSerialization['viewer'],
            ),
      sessionId: jsonSerialization['sessionId'] as String?,
      source: jsonSerialization['source'] as String?,
      hourBucket: jsonSerialization['hourBucket'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['hourBucket']),
      createdAt: jsonSerialization['createdAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int postId;

  _i2.Post? post;

  int viewerId;

  _i3.UserRecord? viewer;

  String? sessionId;

  String? source;

  DateTime? hourBucket;

  DateTime? createdAt;

  /// Returns a shallow copy of this [PostImpression]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  PostImpression copyWith({
    int? id,
    int? postId,
    _i2.Post? post,
    int? viewerId,
    _i3.UserRecord? viewer,
    String? sessionId,
    String? source,
    DateTime? hourBucket,
    DateTime? createdAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'PostImpression',
      if (id != null) 'id': id,
      'postId': postId,
      if (post != null) 'post': post?.toJson(),
      'viewerId': viewerId,
      if (viewer != null) 'viewer': viewer?.toJson(),
      if (sessionId != null) 'sessionId': sessionId,
      if (source != null) 'source': source,
      if (hourBucket != null) 'hourBucket': hourBucket?.toJson(),
      if (createdAt != null) 'createdAt': createdAt?.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _PostImpressionImpl extends PostImpression {
  _PostImpressionImpl({
    int? id,
    required int postId,
    _i2.Post? post,
    required int viewerId,
    _i3.UserRecord? viewer,
    String? sessionId,
    String? source,
    DateTime? hourBucket,
    DateTime? createdAt,
  }) : super._(
         id: id,
         postId: postId,
         post: post,
         viewerId: viewerId,
         viewer: viewer,
         sessionId: sessionId,
         source: source,
         hourBucket: hourBucket,
         createdAt: createdAt,
       );

  /// Returns a shallow copy of this [PostImpression]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  PostImpression copyWith({
    Object? id = _Undefined,
    int? postId,
    Object? post = _Undefined,
    int? viewerId,
    Object? viewer = _Undefined,
    Object? sessionId = _Undefined,
    Object? source = _Undefined,
    Object? hourBucket = _Undefined,
    Object? createdAt = _Undefined,
  }) {
    return PostImpression(
      id: id is int? ? id : this.id,
      postId: postId ?? this.postId,
      post: post is _i2.Post? ? post : this.post?.copyWith(),
      viewerId: viewerId ?? this.viewerId,
      viewer: viewer is _i3.UserRecord? ? viewer : this.viewer?.copyWith(),
      sessionId: sessionId is String? ? sessionId : this.sessionId,
      source: source is String? ? source : this.source,
      hourBucket: hourBucket is DateTime? ? hourBucket : this.hourBucket,
      createdAt: createdAt is DateTime? ? createdAt : this.createdAt,
    );
  }
}
