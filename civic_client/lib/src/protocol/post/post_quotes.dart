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

abstract class PostQuotes implements _i1.SerializableModel {
  PostQuotes._({
    this.id,
    required this.postId,
    this.post,
    required this.ownerId,
    this.owner,
    DateTime? dateCreated,
  }) : dateCreated = dateCreated ?? DateTime.now();

  factory PostQuotes({
    int? id,
    required int postId,
    _i2.Post? post,
    required int ownerId,
    _i3.UserRecord? owner,
    DateTime? dateCreated,
  }) = _PostQuotesImpl;

  factory PostQuotes.fromJson(Map<String, dynamic> jsonSerialization) {
    return PostQuotes(
      id: jsonSerialization['id'] as int?,
      postId: jsonSerialization['postId'] as int,
      post: jsonSerialization['post'] == null
          ? null
          : _i4.Protocol().deserialize<_i2.Post>(jsonSerialization['post']),
      ownerId: jsonSerialization['ownerId'] as int,
      owner: jsonSerialization['owner'] == null
          ? null
          : _i4.Protocol().deserialize<_i3.UserRecord>(
              jsonSerialization['owner'],
            ),
      dateCreated: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['dateCreated'],
      ),
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

  DateTime dateCreated;

  /// Returns a shallow copy of this [PostQuotes]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  PostQuotes copyWith({
    int? id,
    int? postId,
    _i2.Post? post,
    int? ownerId,
    _i3.UserRecord? owner,
    DateTime? dateCreated,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'PostQuotes',
      if (id != null) 'id': id,
      'postId': postId,
      if (post != null) 'post': post?.toJson(),
      'ownerId': ownerId,
      if (owner != null) 'owner': owner?.toJson(),
      'dateCreated': dateCreated.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _PostQuotesImpl extends PostQuotes {
  _PostQuotesImpl({
    int? id,
    required int postId,
    _i2.Post? post,
    required int ownerId,
    _i3.UserRecord? owner,
    DateTime? dateCreated,
  }) : super._(
         id: id,
         postId: postId,
         post: post,
         ownerId: ownerId,
         owner: owner,
         dateCreated: dateCreated,
       );

  /// Returns a shallow copy of this [PostQuotes]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  PostQuotes copyWith({
    Object? id = _Undefined,
    int? postId,
    Object? post = _Undefined,
    int? ownerId,
    Object? owner = _Undefined,
    DateTime? dateCreated,
  }) {
    return PostQuotes(
      id: id is int? ? id : this.id,
      postId: postId ?? this.postId,
      post: post is _i2.Post? ? post : this.post?.copyWith(),
      ownerId: ownerId ?? this.ownerId,
      owner: owner is _i3.UserRecord? ? owner : this.owner?.copyWith(),
      dateCreated: dateCreated ?? this.dateCreated,
    );
  }
}
