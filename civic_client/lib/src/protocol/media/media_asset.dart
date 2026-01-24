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
import '../user/user_record.dart' as _i2;
import '../post/post.dart' as _i3;
import '../media/media_kind.dart' as _i4;
import 'package:civic_client/src/protocol/protocol.dart' as _i5;

abstract class MediaAsset implements _i1.SerializableModel {
  MediaAsset._({
    this.id,
    required this.ownerId,
    this.owner,
    this.postId,
    this.post,
    required this.objectKey,
    this.publicUrl,
    this.contentType,
    this.size,
    this.width,
    this.height,
    this.durationMs,
    required this.kind,
    DateTime? createdAt,
    this.deletedAt,
  }) : createdAt = createdAt ?? DateTime.now();

  factory MediaAsset({
    int? id,
    required int ownerId,
    _i2.UserRecord? owner,
    int? postId,
    _i3.Post? post,
    required String objectKey,
    String? publicUrl,
    String? contentType,
    int? size,
    int? width,
    int? height,
    int? durationMs,
    required _i4.MediaKind kind,
    DateTime? createdAt,
    DateTime? deletedAt,
  }) = _MediaAssetImpl;

  factory MediaAsset.fromJson(Map<String, dynamic> jsonSerialization) {
    return MediaAsset(
      id: jsonSerialization['id'] as int?,
      ownerId: jsonSerialization['ownerId'] as int,
      owner: jsonSerialization['owner'] == null
          ? null
          : _i5.Protocol().deserialize<_i2.UserRecord>(
              jsonSerialization['owner'],
            ),
      postId: jsonSerialization['postId'] as int?,
      post: jsonSerialization['post'] == null
          ? null
          : _i5.Protocol().deserialize<_i3.Post>(jsonSerialization['post']),
      objectKey: jsonSerialization['objectKey'] as String,
      publicUrl: jsonSerialization['publicUrl'] as String?,
      contentType: jsonSerialization['contentType'] as String?,
      size: jsonSerialization['size'] as int?,
      width: jsonSerialization['width'] as int?,
      height: jsonSerialization['height'] as int?,
      durationMs: jsonSerialization['durationMs'] as int?,
      kind: _i4.MediaKind.fromJson((jsonSerialization['kind'] as String)),
      createdAt: jsonSerialization['createdAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
      deletedAt: jsonSerialization['deletedAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['deletedAt']),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int ownerId;

  _i2.UserRecord? owner;

  int? postId;

  _i3.Post? post;

  String objectKey;

  String? publicUrl;

  String? contentType;

  int? size;

  int? width;

  int? height;

  int? durationMs;

  _i4.MediaKind kind;

  DateTime? createdAt;

  DateTime? deletedAt;

  /// Returns a shallow copy of this [MediaAsset]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  MediaAsset copyWith({
    int? id,
    int? ownerId,
    _i2.UserRecord? owner,
    int? postId,
    _i3.Post? post,
    String? objectKey,
    String? publicUrl,
    String? contentType,
    int? size,
    int? width,
    int? height,
    int? durationMs,
    _i4.MediaKind? kind,
    DateTime? createdAt,
    DateTime? deletedAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'MediaAsset',
      if (id != null) 'id': id,
      'ownerId': ownerId,
      if (owner != null) 'owner': owner?.toJson(),
      if (postId != null) 'postId': postId,
      if (post != null) 'post': post?.toJson(),
      'objectKey': objectKey,
      if (publicUrl != null) 'publicUrl': publicUrl,
      if (contentType != null) 'contentType': contentType,
      if (size != null) 'size': size,
      if (width != null) 'width': width,
      if (height != null) 'height': height,
      if (durationMs != null) 'durationMs': durationMs,
      'kind': kind.toJson(),
      if (createdAt != null) 'createdAt': createdAt?.toJson(),
      if (deletedAt != null) 'deletedAt': deletedAt?.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _MediaAssetImpl extends MediaAsset {
  _MediaAssetImpl({
    int? id,
    required int ownerId,
    _i2.UserRecord? owner,
    int? postId,
    _i3.Post? post,
    required String objectKey,
    String? publicUrl,
    String? contentType,
    int? size,
    int? width,
    int? height,
    int? durationMs,
    required _i4.MediaKind kind,
    DateTime? createdAt,
    DateTime? deletedAt,
  }) : super._(
         id: id,
         ownerId: ownerId,
         owner: owner,
         postId: postId,
         post: post,
         objectKey: objectKey,
         publicUrl: publicUrl,
         contentType: contentType,
         size: size,
         width: width,
         height: height,
         durationMs: durationMs,
         kind: kind,
         createdAt: createdAt,
         deletedAt: deletedAt,
       );

  /// Returns a shallow copy of this [MediaAsset]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  MediaAsset copyWith({
    Object? id = _Undefined,
    int? ownerId,
    Object? owner = _Undefined,
    Object? postId = _Undefined,
    Object? post = _Undefined,
    String? objectKey,
    Object? publicUrl = _Undefined,
    Object? contentType = _Undefined,
    Object? size = _Undefined,
    Object? width = _Undefined,
    Object? height = _Undefined,
    Object? durationMs = _Undefined,
    _i4.MediaKind? kind,
    Object? createdAt = _Undefined,
    Object? deletedAt = _Undefined,
  }) {
    return MediaAsset(
      id: id is int? ? id : this.id,
      ownerId: ownerId ?? this.ownerId,
      owner: owner is _i2.UserRecord? ? owner : this.owner?.copyWith(),
      postId: postId is int? ? postId : this.postId,
      post: post is _i3.Post? ? post : this.post?.copyWith(),
      objectKey: objectKey ?? this.objectKey,
      publicUrl: publicUrl is String? ? publicUrl : this.publicUrl,
      contentType: contentType is String? ? contentType : this.contentType,
      size: size is int? ? size : this.size,
      width: width is int? ? width : this.width,
      height: height is int? ? height : this.height,
      durationMs: durationMs is int? ? durationMs : this.durationMs,
      kind: kind ?? this.kind,
      createdAt: createdAt is DateTime? ? createdAt : this.createdAt,
      deletedAt: deletedAt is DateTime? ? deletedAt : this.deletedAt,
    );
  }
}
