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
    this.title,
    this.content,
    this.banner,
    this.dateCreated,
    this.updatedAt,
    this.numberOfComments,
    this.numberOfLikes,
    this.numberOfViews,
  });

  factory Article({
    int? id,
    required int ownerId,
    _i2.UserRecord? owner,
    String? title,
    String? content,
    String? banner,
    DateTime? dateCreated,
    DateTime? updatedAt,
    int? numberOfComments,
    int? numberOfLikes,
    int? numberOfViews,
  }) = _ArticleImpl;

  factory Article.fromJson(Map<String, dynamic> jsonSerialization) {
    return Article(
      id: jsonSerialization['id'] as int?,
      ownerId: jsonSerialization['ownerId'] as int,
      owner: jsonSerialization['owner'] == null
          ? null
          : _i2.UserRecord.fromJson(
              (jsonSerialization['owner'] as Map<String, dynamic>)),
      title: jsonSerialization['title'] as String?,
      content: jsonSerialization['content'] as String?,
      banner: jsonSerialization['banner'] as String?,
      dateCreated: jsonSerialization['dateCreated'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(
              jsonSerialization['dateCreated']),
      updatedAt: jsonSerialization['updatedAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['updatedAt']),
      numberOfComments: jsonSerialization['numberOfComments'] as int?,
      numberOfLikes: jsonSerialization['numberOfLikes'] as int?,
      numberOfViews: jsonSerialization['numberOfViews'] as int?,
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int ownerId;

  _i2.UserRecord? owner;

  String? title;

  String? content;

  String? banner;

  DateTime? dateCreated;

  DateTime? updatedAt;

  int? numberOfComments;

  int? numberOfLikes;

  int? numberOfViews;

  /// Returns a shallow copy of this [Article]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  Article copyWith({
    int? id,
    int? ownerId,
    _i2.UserRecord? owner,
    String? title,
    String? content,
    String? banner,
    DateTime? dateCreated,
    DateTime? updatedAt,
    int? numberOfComments,
    int? numberOfLikes,
    int? numberOfViews,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'ownerId': ownerId,
      if (owner != null) 'owner': owner?.toJson(),
      if (title != null) 'title': title,
      if (content != null) 'content': content,
      if (banner != null) 'banner': banner,
      if (dateCreated != null) 'dateCreated': dateCreated?.toJson(),
      if (updatedAt != null) 'updatedAt': updatedAt?.toJson(),
      if (numberOfComments != null) 'numberOfComments': numberOfComments,
      if (numberOfLikes != null) 'numberOfLikes': numberOfLikes,
      if (numberOfViews != null) 'numberOfViews': numberOfViews,
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
    String? title,
    String? content,
    String? banner,
    DateTime? dateCreated,
    DateTime? updatedAt,
    int? numberOfComments,
    int? numberOfLikes,
    int? numberOfViews,
  }) : super._(
          id: id,
          ownerId: ownerId,
          owner: owner,
          title: title,
          content: content,
          banner: banner,
          dateCreated: dateCreated,
          updatedAt: updatedAt,
          numberOfComments: numberOfComments,
          numberOfLikes: numberOfLikes,
          numberOfViews: numberOfViews,
        );

  /// Returns a shallow copy of this [Article]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  Article copyWith({
    Object? id = _Undefined,
    int? ownerId,
    Object? owner = _Undefined,
    Object? title = _Undefined,
    Object? content = _Undefined,
    Object? banner = _Undefined,
    Object? dateCreated = _Undefined,
    Object? updatedAt = _Undefined,
    Object? numberOfComments = _Undefined,
    Object? numberOfLikes = _Undefined,
    Object? numberOfViews = _Undefined,
  }) {
    return Article(
      id: id is int? ? id : this.id,
      ownerId: ownerId ?? this.ownerId,
      owner: owner is _i2.UserRecord? ? owner : this.owner?.copyWith(),
      title: title is String? ? title : this.title,
      content: content is String? ? content : this.content,
      banner: banner is String? ? banner : this.banner,
      dateCreated: dateCreated is DateTime? ? dateCreated : this.dateCreated,
      updatedAt: updatedAt is DateTime? ? updatedAt : this.updatedAt,
      numberOfComments:
          numberOfComments is int? ? numberOfComments : this.numberOfComments,
      numberOfLikes: numberOfLikes is int? ? numberOfLikes : this.numberOfLikes,
      numberOfViews: numberOfViews is int? ? numberOfViews : this.numberOfViews,
    );
  }
}
