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
import '../post/post_type_enums.dart' as _i3;
import '../media/media_asset.dart' as _i4;
import '../general/aws_places.dart' as _i5;
import '../post/posts_hashtags.dart' as _i6;
import '../poll/poll.dart' as _i7;
import '../article/article.dart' as _i8;
import '../project/project.dart' as _i9;
import '../post/post.dart' as _i10;
import 'package:civic_client/src/protocol/protocol.dart' as _i11;

abstract class Post implements _i1.SerializableModel {
  Post._({
    this.id,
    required this.ownerId,
    this.owner,
    this.postType,
    this.text,
    this.mediaAssets,
    this.taggedUsers,
    this.locations,
    this.mentions,
    this.tags,
    DateTime? dateCreated,
    this.updatedAt,
    this.hashtags,
    int? likesCount,
    int? repostCount,
    int? bookmarksCount,
    int? commentCount,
    this.pollId,
    this.poll,
    this.articleId,
    this.article,
    this.projectId,
    this.project,
    this.parentId,
    this.parent,
    bool? isDeleted,
    int? impressionsCount,
    this.lastImpressionAt,
  }) : dateCreated = dateCreated ?? DateTime.now(),
       likesCount = likesCount ?? 0,
       repostCount = repostCount ?? 0,
       bookmarksCount = bookmarksCount ?? 0,
       commentCount = commentCount ?? 0,
       isDeleted = isDeleted ?? false,
       impressionsCount = impressionsCount ?? 0;

  factory Post({
    int? id,
    required int ownerId,
    _i2.UserRecord? owner,
    _i3.PostType? postType,
    String? text,
    List<_i4.MediaAsset>? mediaAssets,
    List<_i2.UserRecord>? taggedUsers,
    List<_i5.AWSPlaces>? locations,
    List<_i2.UserRecord>? mentions,
    List<String>? tags,
    DateTime? dateCreated,
    DateTime? updatedAt,
    List<_i6.PostsHashtags>? hashtags,
    int? likesCount,
    int? repostCount,
    int? bookmarksCount,
    int? commentCount,
    int? pollId,
    _i7.Poll? poll,
    int? articleId,
    _i8.Article? article,
    int? projectId,
    _i9.Project? project,
    int? parentId,
    _i10.Post? parent,
    bool? isDeleted,
    int? impressionsCount,
    DateTime? lastImpressionAt,
  }) = _PostImpl;

  factory Post.fromJson(Map<String, dynamic> jsonSerialization) {
    return Post(
      id: jsonSerialization['id'] as int?,
      ownerId: jsonSerialization['ownerId'] as int,
      owner: jsonSerialization['owner'] == null
          ? null
          : _i11.Protocol().deserialize<_i2.UserRecord>(
              jsonSerialization['owner'],
            ),
      postType: jsonSerialization['postType'] == null
          ? null
          : _i3.PostType.fromJson((jsonSerialization['postType'] as String)),
      text: jsonSerialization['text'] as String?,
      mediaAssets: jsonSerialization['mediaAssets'] == null
          ? null
          : _i11.Protocol().deserialize<List<_i4.MediaAsset>>(
              jsonSerialization['mediaAssets'],
            ),
      taggedUsers: jsonSerialization['taggedUsers'] == null
          ? null
          : _i11.Protocol().deserialize<List<_i2.UserRecord>>(
              jsonSerialization['taggedUsers'],
            ),
      locations: jsonSerialization['locations'] == null
          ? null
          : _i11.Protocol().deserialize<List<_i5.AWSPlaces>>(
              jsonSerialization['locations'],
            ),
      mentions: jsonSerialization['mentions'] == null
          ? null
          : _i11.Protocol().deserialize<List<_i2.UserRecord>>(
              jsonSerialization['mentions'],
            ),
      tags: jsonSerialization['tags'] == null
          ? null
          : _i11.Protocol().deserialize<List<String>>(
              jsonSerialization['tags'],
            ),
      dateCreated: jsonSerialization['dateCreated'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(
              jsonSerialization['dateCreated'],
            ),
      updatedAt: jsonSerialization['updatedAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['updatedAt']),
      hashtags: jsonSerialization['hashtags'] == null
          ? null
          : _i11.Protocol().deserialize<List<_i6.PostsHashtags>>(
              jsonSerialization['hashtags'],
            ),
      likesCount: jsonSerialization['likesCount'] as int?,
      repostCount: jsonSerialization['repostCount'] as int?,
      bookmarksCount: jsonSerialization['bookmarksCount'] as int?,
      commentCount: jsonSerialization['commentCount'] as int?,
      pollId: jsonSerialization['pollId'] as int?,
      poll: jsonSerialization['poll'] == null
          ? null
          : _i11.Protocol().deserialize<_i7.Poll>(jsonSerialization['poll']),
      articleId: jsonSerialization['articleId'] as int?,
      article: jsonSerialization['article'] == null
          ? null
          : _i11.Protocol().deserialize<_i8.Article>(
              jsonSerialization['article'],
            ),
      projectId: jsonSerialization['projectId'] as int?,
      project: jsonSerialization['project'] == null
          ? null
          : _i11.Protocol().deserialize<_i9.Project>(
              jsonSerialization['project'],
            ),
      parentId: jsonSerialization['parentId'] as int?,
      parent: jsonSerialization['parent'] == null
          ? null
          : _i11.Protocol().deserialize<_i10.Post>(jsonSerialization['parent']),
      isDeleted: jsonSerialization['isDeleted'] as bool?,
      impressionsCount: jsonSerialization['impressionsCount'] as int?,
      lastImpressionAt: jsonSerialization['lastImpressionAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(
              jsonSerialization['lastImpressionAt'],
            ),
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

  List<_i4.MediaAsset>? mediaAssets;

  List<_i2.UserRecord>? taggedUsers;

  List<_i5.AWSPlaces>? locations;

  List<_i2.UserRecord>? mentions;

  List<String>? tags;

  DateTime? dateCreated;

  DateTime? updatedAt;

  List<_i6.PostsHashtags>? hashtags;

  int? likesCount;

  int? repostCount;

  int? bookmarksCount;

  int? commentCount;

  int? pollId;

  _i7.Poll? poll;

  int? articleId;

  _i8.Article? article;

  int? projectId;

  _i9.Project? project;

  int? parentId;

  _i10.Post? parent;

  bool? isDeleted;

  int? impressionsCount;

  DateTime? lastImpressionAt;

  /// Returns a shallow copy of this [Post]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  Post copyWith({
    int? id,
    int? ownerId,
    _i2.UserRecord? owner,
    _i3.PostType? postType,
    String? text,
    List<_i4.MediaAsset>? mediaAssets,
    List<_i2.UserRecord>? taggedUsers,
    List<_i5.AWSPlaces>? locations,
    List<_i2.UserRecord>? mentions,
    List<String>? tags,
    DateTime? dateCreated,
    DateTime? updatedAt,
    List<_i6.PostsHashtags>? hashtags,
    int? likesCount,
    int? repostCount,
    int? bookmarksCount,
    int? commentCount,
    int? pollId,
    _i7.Poll? poll,
    int? articleId,
    _i8.Article? article,
    int? projectId,
    _i9.Project? project,
    int? parentId,
    _i10.Post? parent,
    bool? isDeleted,
    int? impressionsCount,
    DateTime? lastImpressionAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'Post',
      if (id != null) 'id': id,
      'ownerId': ownerId,
      if (owner != null) 'owner': owner?.toJson(),
      if (postType != null) 'postType': postType?.toJson(),
      if (text != null) 'text': text,
      if (mediaAssets != null)
        'mediaAssets': mediaAssets?.toJson(valueToJson: (v) => v.toJson()),
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
      if (likesCount != null) 'likesCount': likesCount,
      if (repostCount != null) 'repostCount': repostCount,
      if (bookmarksCount != null) 'bookmarksCount': bookmarksCount,
      if (commentCount != null) 'commentCount': commentCount,
      if (pollId != null) 'pollId': pollId,
      if (poll != null) 'poll': poll?.toJson(),
      if (articleId != null) 'articleId': articleId,
      if (article != null) 'article': article?.toJson(),
      if (projectId != null) 'projectId': projectId,
      if (project != null) 'project': project?.toJson(),
      if (parentId != null) 'parentId': parentId,
      if (parent != null) 'parent': parent?.toJson(),
      if (isDeleted != null) 'isDeleted': isDeleted,
      if (impressionsCount != null) 'impressionsCount': impressionsCount,
      if (lastImpressionAt != null)
        'lastImpressionAt': lastImpressionAt?.toJson(),
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
    List<_i4.MediaAsset>? mediaAssets,
    List<_i2.UserRecord>? taggedUsers,
    List<_i5.AWSPlaces>? locations,
    List<_i2.UserRecord>? mentions,
    List<String>? tags,
    DateTime? dateCreated,
    DateTime? updatedAt,
    List<_i6.PostsHashtags>? hashtags,
    int? likesCount,
    int? repostCount,
    int? bookmarksCount,
    int? commentCount,
    int? pollId,
    _i7.Poll? poll,
    int? articleId,
    _i8.Article? article,
    int? projectId,
    _i9.Project? project,
    int? parentId,
    _i10.Post? parent,
    bool? isDeleted,
    int? impressionsCount,
    DateTime? lastImpressionAt,
  }) : super._(
         id: id,
         ownerId: ownerId,
         owner: owner,
         postType: postType,
         text: text,
         mediaAssets: mediaAssets,
         taggedUsers: taggedUsers,
         locations: locations,
         mentions: mentions,
         tags: tags,
         dateCreated: dateCreated,
         updatedAt: updatedAt,
         hashtags: hashtags,
         likesCount: likesCount,
         repostCount: repostCount,
         bookmarksCount: bookmarksCount,
         commentCount: commentCount,
         pollId: pollId,
         poll: poll,
         articleId: articleId,
         article: article,
         projectId: projectId,
         project: project,
         parentId: parentId,
         parent: parent,
         isDeleted: isDeleted,
         impressionsCount: impressionsCount,
         lastImpressionAt: lastImpressionAt,
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
    Object? mediaAssets = _Undefined,
    Object? taggedUsers = _Undefined,
    Object? locations = _Undefined,
    Object? mentions = _Undefined,
    Object? tags = _Undefined,
    Object? dateCreated = _Undefined,
    Object? updatedAt = _Undefined,
    Object? hashtags = _Undefined,
    Object? likesCount = _Undefined,
    Object? repostCount = _Undefined,
    Object? bookmarksCount = _Undefined,
    Object? commentCount = _Undefined,
    Object? pollId = _Undefined,
    Object? poll = _Undefined,
    Object? articleId = _Undefined,
    Object? article = _Undefined,
    Object? projectId = _Undefined,
    Object? project = _Undefined,
    Object? parentId = _Undefined,
    Object? parent = _Undefined,
    Object? isDeleted = _Undefined,
    Object? impressionsCount = _Undefined,
    Object? lastImpressionAt = _Undefined,
  }) {
    return Post(
      id: id is int? ? id : this.id,
      ownerId: ownerId ?? this.ownerId,
      owner: owner is _i2.UserRecord? ? owner : this.owner?.copyWith(),
      postType: postType is _i3.PostType? ? postType : this.postType,
      text: text is String? ? text : this.text,
      mediaAssets: mediaAssets is List<_i4.MediaAsset>?
          ? mediaAssets
          : this.mediaAssets?.map((e0) => e0.copyWith()).toList(),
      taggedUsers: taggedUsers is List<_i2.UserRecord>?
          ? taggedUsers
          : this.taggedUsers?.map((e0) => e0.copyWith()).toList(),
      locations: locations is List<_i5.AWSPlaces>?
          ? locations
          : this.locations?.map((e0) => e0.copyWith()).toList(),
      mentions: mentions is List<_i2.UserRecord>?
          ? mentions
          : this.mentions?.map((e0) => e0.copyWith()).toList(),
      tags: tags is List<String>? ? tags : this.tags?.map((e0) => e0).toList(),
      dateCreated: dateCreated is DateTime? ? dateCreated : this.dateCreated,
      updatedAt: updatedAt is DateTime? ? updatedAt : this.updatedAt,
      hashtags: hashtags is List<_i6.PostsHashtags>?
          ? hashtags
          : this.hashtags?.map((e0) => e0.copyWith()).toList(),
      likesCount: likesCount is int? ? likesCount : this.likesCount,
      repostCount: repostCount is int? ? repostCount : this.repostCount,
      bookmarksCount: bookmarksCount is int?
          ? bookmarksCount
          : this.bookmarksCount,
      commentCount: commentCount is int? ? commentCount : this.commentCount,
      pollId: pollId is int? ? pollId : this.pollId,
      poll: poll is _i7.Poll? ? poll : this.poll?.copyWith(),
      articleId: articleId is int? ? articleId : this.articleId,
      article: article is _i8.Article? ? article : this.article?.copyWith(),
      projectId: projectId is int? ? projectId : this.projectId,
      project: project is _i9.Project? ? project : this.project?.copyWith(),
      parentId: parentId is int? ? parentId : this.parentId,
      parent: parent is _i10.Post? ? parent : this.parent?.copyWith(),
      isDeleted: isDeleted is bool? ? isDeleted : this.isDeleted,
      impressionsCount: impressionsCount is int?
          ? impressionsCount
          : this.impressionsCount,
      lastImpressionAt: lastImpressionAt is DateTime?
          ? lastImpressionAt
          : this.lastImpressionAt,
    );
  }
}
