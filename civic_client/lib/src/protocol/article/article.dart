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

abstract class Article implements _i1.SerializableModel {
  Article._({
    this.id,
    required this.ownerId,
    this.owner,
    String? content,
    String? banner,
    this.tag,
  })  : content = content ?? '',
        banner = banner ?? '';

  factory Article({
    int? id,
    required int ownerId,
    _i2.UserRecord? owner,
    String? content,
    String? banner,
    List<String>? tag,
  }) = _ArticleImpl;

  factory Article.fromJson(Map<String, dynamic> jsonSerialization) {
    return Article(
      id: jsonSerialization['id'] as int?,
      ownerId: jsonSerialization['ownerId'] as int,
      owner: jsonSerialization['owner'] == null
          ? null
          : _i2.UserRecord.fromJson(
              (jsonSerialization['owner'] as Map<String, dynamic>)),
      content: jsonSerialization['content'] as String?,
      banner: jsonSerialization['banner'] as String?,
      tag:
          (jsonSerialization['tag'] as List?)?.map((e) => e as String).toList(),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int ownerId;

  _i2.UserRecord? owner;

  String? content;

  String? banner;

  List<String>? tag;

  /// Returns a shallow copy of this [Article]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  Article copyWith({
    int? id,
    int? ownerId,
    _i2.UserRecord? owner,
    String? content,
    String? banner,
    List<String>? tag,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'ownerId': ownerId,
      if (owner != null) 'owner': owner?.toJson(),
      if (content != null) 'content': content,
      if (banner != null) 'banner': banner,
      if (tag != null) 'tag': tag?.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _ArticleImpl extends Article {
  _ArticleImpl({
    int? id,
    required int ownerId,
    _i2.UserRecord? owner,
    String? content,
    String? banner,
    List<String>? tag,
  }) : super._(
          id: id,
          ownerId: ownerId,
          owner: owner,
          content: content,
          banner: banner,
          tag: tag,
        );

  /// Returns a shallow copy of this [Article]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  Article copyWith({
    Object? id = _Undefined,
    int? ownerId,
    Object? owner = _Undefined,
    Object? content = _Undefined,
    Object? banner = _Undefined,
    Object? tag = _Undefined,
  }) {
    return Article(
      id: id is int? ? id : this.id,
      ownerId: ownerId ?? this.ownerId,
      owner: owner is _i2.UserRecord? ? owner : this.owner?.copyWith(),
      content: content is String? ? content : this.content,
      banner: banner is String? ? banner : this.banner,
      tag: tag is List<String>? ? tag : this.tag?.map((e0) => e0).toList(),
    );
  }
}
