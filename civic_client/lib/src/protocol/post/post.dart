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
import '../post/post_type_enums.dart' as _i3;
import '../general/aws_places.dart' as _i4;
import '../post/posts_hashtags.dart' as _i5;
import '../project/project.dart' as _i6;
import '../post/post.dart' as _i7;

abstract class Post implements _i1.SerializableModel {
  Post._({
    this.id,
    required this.ownerId,
    this.owner,
    this.postType,
    this.text,
    this.imageUrls,
    this.videoUrl,
    this.taggedUsers,
    this.locations,
    this.mentions,
    this.tags,
    DateTime? dateCreated,
    this.updatedAt,
    this.hashtags,
    this.likedBy,
    this.commentedBy,
    this.bookmarkedBy,
    this.quotedBy,
    int? commentCount,
    int? quoteCount,
    this.projectId,
    this.project,
    this.parentId,
    this.parent,
    this.quotedOrRepostedFromUserId,
    this.quotedOrRepostedFromUser,
    bool? isDeleted,
  })  : dateCreated = dateCreated ?? DateTime.now(),
        commentCount = commentCount ?? 0,
        quoteCount = quoteCount ?? 0,
        isDeleted = isDeleted ?? false;

  factory Post({
    int? id,
    required int ownerId,
    _i2.UserRecord? owner,
    _i3.PostType? postType,
    String? text,
    List<String>? imageUrls,
    String? videoUrl,
    List<_i2.UserRecord>? taggedUsers,
    List<_i4.AWSPlaces>? locations,
    List<_i2.UserRecord>? mentions,
    List<String>? tags,
    DateTime? dateCreated,
    DateTime? updatedAt,
    List<_i5.PostsHashtags>? hashtags,
    List<int>? likedBy,
    List<int>? commentedBy,
    List<int>? bookmarkedBy,
    List<int>? quotedBy,
    int? commentCount,
    int? quoteCount,
    int? projectId,
    _i6.Project? project,
    int? parentId,
    _i7.Post? parent,
    int? quotedOrRepostedFromUserId,
    _i2.UserRecord? quotedOrRepostedFromUser,
    bool? isDeleted,
  }) = _PostImpl;

  factory Post.fromJson(Map<String, dynamic> jsonSerialization) {
    return Post(
      id: jsonSerialization['id'] as int?,
      ownerId: jsonSerialization['ownerId'] as int,
      owner: jsonSerialization['owner'] == null
          ? null
          : _i2.UserRecord.fromJson(
              (jsonSerialization['owner'] as Map<String, dynamic>)),
      postType: jsonSerialization['postType'] == null
          ? null
          : _i3.PostType.fromJson((jsonSerialization['postType'] as int)),
      text: jsonSerialization['text'] as String?,
      imageUrls: (jsonSerialization['imageUrls'] as List?)
          ?.map((e) => e as String)
          .toList(),
      videoUrl: jsonSerialization['videoUrl'] as String?,
      taggedUsers: (jsonSerialization['taggedUsers'] as List?)
          ?.map((e) => _i2.UserRecord.fromJson((e as Map<String, dynamic>)))
          .toList(),
      locations: (jsonSerialization['locations'] as List?)
          ?.map((e) => _i4.AWSPlaces.fromJson((e as Map<String, dynamic>)))
          .toList(),
      mentions: (jsonSerialization['mentions'] as List?)
          ?.map((e) => _i2.UserRecord.fromJson((e as Map<String, dynamic>)))
          .toList(),
      tags: (jsonSerialization['tags'] as List?)
          ?.map((e) => e as String)
          .toList(),
      dateCreated: jsonSerialization['dateCreated'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(
              jsonSerialization['dateCreated']),
      updatedAt: jsonSerialization['updatedAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['updatedAt']),
      hashtags: (jsonSerialization['hashtags'] as List?)
          ?.map((e) => _i5.PostsHashtags.fromJson((e as Map<String, dynamic>)))
          .toList(),
      likedBy: (jsonSerialization['likedBy'] as List?)
          ?.map((e) => e as int)
          .toList(),
      commentedBy: (jsonSerialization['commentedBy'] as List?)
          ?.map((e) => e as int)
          .toList(),
      bookmarkedBy: (jsonSerialization['bookmarkedBy'] as List?)
          ?.map((e) => e as int)
          .toList(),
      quotedBy: (jsonSerialization['quotedBy'] as List?)
          ?.map((e) => e as int)
          .toList(),
      commentCount: jsonSerialization['commentCount'] as int?,
      quoteCount: jsonSerialization['quoteCount'] as int?,
      projectId: jsonSerialization['projectId'] as int?,
      project: jsonSerialization['project'] == null
          ? null
          : _i6.Project.fromJson(
              (jsonSerialization['project'] as Map<String, dynamic>)),
      parentId: jsonSerialization['parentId'] as int?,
      parent: jsonSerialization['parent'] == null
          ? null
          : _i7.Post.fromJson(
              (jsonSerialization['parent'] as Map<String, dynamic>)),
      quotedOrRepostedFromUserId:
          jsonSerialization['quotedOrRepostedFromUserId'] as int?,
      quotedOrRepostedFromUser:
          jsonSerialization['quotedOrRepostedFromUser'] == null
              ? null
              : _i2.UserRecord.fromJson(
                  (jsonSerialization['quotedOrRepostedFromUser']
                      as Map<String, dynamic>)),
      isDeleted: jsonSerialization['isDeleted'] as bool?,
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int ownerId;

  _i2.UserRecord? owner;

  _i3.PostType? postType;

  String? text;

  List<String>? imageUrls;

  String? videoUrl;

  List<_i2.UserRecord>? taggedUsers;

  List<_i4.AWSPlaces>? locations;

  List<_i2.UserRecord>? mentions;

  List<String>? tags;

  DateTime? dateCreated;

  DateTime? updatedAt;

  List<_i5.PostsHashtags>? hashtags;

  List<int>? likedBy;

  List<int>? commentedBy;

  List<int>? bookmarkedBy;

  List<int>? quotedBy;

  int? commentCount;

  int? quoteCount;

  int? projectId;

  _i6.Project? project;

  int? parentId;

  _i7.Post? parent;

  int? quotedOrRepostedFromUserId;

  _i2.UserRecord? quotedOrRepostedFromUser;

  bool? isDeleted;

  /// Returns a shallow copy of this [Post]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  Post copyWith({
    int? id,
    int? ownerId,
    _i2.UserRecord? owner,
    _i3.PostType? postType,
    String? text,
    List<String>? imageUrls,
    String? videoUrl,
    List<_i2.UserRecord>? taggedUsers,
    List<_i4.AWSPlaces>? locations,
    List<_i2.UserRecord>? mentions,
    List<String>? tags,
    DateTime? dateCreated,
    DateTime? updatedAt,
    List<_i5.PostsHashtags>? hashtags,
    List<int>? likedBy,
    List<int>? commentedBy,
    List<int>? bookmarkedBy,
    List<int>? quotedBy,
    int? commentCount,
    int? quoteCount,
    int? projectId,
    _i6.Project? project,
    int? parentId,
    _i7.Post? parent,
    int? quotedOrRepostedFromUserId,
    _i2.UserRecord? quotedOrRepostedFromUser,
    bool? isDeleted,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'ownerId': ownerId,
      if (owner != null) 'owner': owner?.toJson(),
      if (postType != null) 'postType': postType?.toJson(),
      if (text != null) 'text': text,
      if (imageUrls != null) 'imageUrls': imageUrls?.toJson(),
      if (videoUrl != null) 'videoUrl': videoUrl,
      if (taggedUsers != null)
        'taggedUsers': taggedUsers?.toJson(valueToJson: (v) => v.toJson()),
      if (locations != null)
        'locations': locations?.toJson(valueToJson: (v) => v.toJson()),
      if (mentions != null)
        'mentions': mentions?.toJson(valueToJson: (v) => v.toJson()),
      if (tags != null) 'tags': tags?.toJson(),
      if (dateCreated != null) 'dateCreated': dateCreated?.toJson(),
      if (updatedAt != null) 'updatedAt': updatedAt?.toJson(),
      if (hashtags != null)
        'hashtags': hashtags?.toJson(valueToJson: (v) => v.toJson()),
      if (likedBy != null) 'likedBy': likedBy?.toJson(),
      if (commentedBy != null) 'commentedBy': commentedBy?.toJson(),
      if (bookmarkedBy != null) 'bookmarkedBy': bookmarkedBy?.toJson(),
      if (quotedBy != null) 'quotedBy': quotedBy?.toJson(),
      if (commentCount != null) 'commentCount': commentCount,
      if (quoteCount != null) 'quoteCount': quoteCount,
      if (projectId != null) 'projectId': projectId,
      if (project != null) 'project': project?.toJson(),
      if (parentId != null) 'parentId': parentId,
      if (parent != null) 'parent': parent?.toJson(),
      if (quotedOrRepostedFromUserId != null)
        'quotedOrRepostedFromUserId': quotedOrRepostedFromUserId,
      if (quotedOrRepostedFromUser != null)
        'quotedOrRepostedFromUser': quotedOrRepostedFromUser?.toJson(),
      if (isDeleted != null) 'isDeleted': isDeleted,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _PostImpl extends Post {
  _PostImpl({
    int? id,
    required int ownerId,
    _i2.UserRecord? owner,
    _i3.PostType? postType,
    String? text,
    List<String>? imageUrls,
    String? videoUrl,
    List<_i2.UserRecord>? taggedUsers,
    List<_i4.AWSPlaces>? locations,
    List<_i2.UserRecord>? mentions,
    List<String>? tags,
    DateTime? dateCreated,
    DateTime? updatedAt,
    List<_i5.PostsHashtags>? hashtags,
    List<int>? likedBy,
    List<int>? commentedBy,
    List<int>? bookmarkedBy,
    List<int>? quotedBy,
    int? commentCount,
    int? quoteCount,
    int? projectId,
    _i6.Project? project,
    int? parentId,
    _i7.Post? parent,
    int? quotedOrRepostedFromUserId,
    _i2.UserRecord? quotedOrRepostedFromUser,
    bool? isDeleted,
  }) : super._(
          id: id,
          ownerId: ownerId,
          owner: owner,
          postType: postType,
          text: text,
          imageUrls: imageUrls,
          videoUrl: videoUrl,
          taggedUsers: taggedUsers,
          locations: locations,
          mentions: mentions,
          tags: tags,
          dateCreated: dateCreated,
          updatedAt: updatedAt,
          hashtags: hashtags,
          likedBy: likedBy,
          commentedBy: commentedBy,
          bookmarkedBy: bookmarkedBy,
          quotedBy: quotedBy,
          commentCount: commentCount,
          quoteCount: quoteCount,
          projectId: projectId,
          project: project,
          parentId: parentId,
          parent: parent,
          quotedOrRepostedFromUserId: quotedOrRepostedFromUserId,
          quotedOrRepostedFromUser: quotedOrRepostedFromUser,
          isDeleted: isDeleted,
        );

  /// Returns a shallow copy of this [Post]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  Post copyWith({
    Object? id = _Undefined,
    int? ownerId,
    Object? owner = _Undefined,
    Object? postType = _Undefined,
    Object? text = _Undefined,
    Object? imageUrls = _Undefined,
    Object? videoUrl = _Undefined,
    Object? taggedUsers = _Undefined,
    Object? locations = _Undefined,
    Object? mentions = _Undefined,
    Object? tags = _Undefined,
    Object? dateCreated = _Undefined,
    Object? updatedAt = _Undefined,
    Object? hashtags = _Undefined,
    Object? likedBy = _Undefined,
    Object? commentedBy = _Undefined,
    Object? bookmarkedBy = _Undefined,
    Object? quotedBy = _Undefined,
    Object? commentCount = _Undefined,
    Object? quoteCount = _Undefined,
    Object? projectId = _Undefined,
    Object? project = _Undefined,
    Object? parentId = _Undefined,
    Object? parent = _Undefined,
    Object? quotedOrRepostedFromUserId = _Undefined,
    Object? quotedOrRepostedFromUser = _Undefined,
    Object? isDeleted = _Undefined,
  }) {
    return Post(
      id: id is int? ? id : this.id,
      ownerId: ownerId ?? this.ownerId,
      owner: owner is _i2.UserRecord? ? owner : this.owner?.copyWith(),
      postType: postType is _i3.PostType? ? postType : this.postType,
      text: text is String? ? text : this.text,
      imageUrls: imageUrls is List<String>?
          ? imageUrls
          : this.imageUrls?.map((e0) => e0).toList(),
      videoUrl: videoUrl is String? ? videoUrl : this.videoUrl,
      taggedUsers: taggedUsers is List<_i2.UserRecord>?
          ? taggedUsers
          : this.taggedUsers?.map((e0) => e0.copyWith()).toList(),
      locations: locations is List<_i4.AWSPlaces>?
          ? locations
          : this.locations?.map((e0) => e0.copyWith()).toList(),
      mentions: mentions is List<_i2.UserRecord>?
          ? mentions
          : this.mentions?.map((e0) => e0.copyWith()).toList(),
      tags: tags is List<String>? ? tags : this.tags?.map((e0) => e0).toList(),
      dateCreated: dateCreated is DateTime? ? dateCreated : this.dateCreated,
      updatedAt: updatedAt is DateTime? ? updatedAt : this.updatedAt,
      hashtags: hashtags is List<_i5.PostsHashtags>?
          ? hashtags
          : this.hashtags?.map((e0) => e0.copyWith()).toList(),
      likedBy: likedBy is List<int>?
          ? likedBy
          : this.likedBy?.map((e0) => e0).toList(),
      commentedBy: commentedBy is List<int>?
          ? commentedBy
          : this.commentedBy?.map((e0) => e0).toList(),
      bookmarkedBy: bookmarkedBy is List<int>?
          ? bookmarkedBy
          : this.bookmarkedBy?.map((e0) => e0).toList(),
      quotedBy: quotedBy is List<int>?
          ? quotedBy
          : this.quotedBy?.map((e0) => e0).toList(),
      commentCount: commentCount is int? ? commentCount : this.commentCount,
      quoteCount: quoteCount is int? ? quoteCount : this.quoteCount,
      projectId: projectId is int? ? projectId : this.projectId,
      project: project is _i6.Project? ? project : this.project?.copyWith(),
      parentId: parentId is int? ? parentId : this.parentId,
      parent: parent is _i7.Post? ? parent : this.parent?.copyWith(),
      quotedOrRepostedFromUserId: quotedOrRepostedFromUserId is int?
          ? quotedOrRepostedFromUserId
          : this.quotedOrRepostedFromUserId,
      quotedOrRepostedFromUser: quotedOrRepostedFromUser is _i2.UserRecord?
          ? quotedOrRepostedFromUser
          : this.quotedOrRepostedFromUser?.copyWith(),
      isDeleted: isDeleted is bool? ? isDeleted : this.isDeleted,
    );
  }
}
