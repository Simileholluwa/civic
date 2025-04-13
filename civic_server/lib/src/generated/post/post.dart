/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;
import '../user/user_record.dart' as _i2;
import '../post/post_type_enums.dart' as _i3;
import '../general/aws_places.dart' as _i4;
import '../post/posts_hashtags.dart' as _i5;
import '../project/project.dart' as _i6;

abstract class Post implements _i1.TableRow<int>, _i1.ProtocolSerialization {
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
    this.dateCreated,
    this.updatedAt,
    this.hashtags,
    this.likedBy,
    this.commentBy,
    this.repostBy,
    this.projectId,
    this.project,
    this.isProjectRepost,
  });

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
    List<int>? commentBy,
    List<int>? repostBy,
    int? projectId,
    _i6.Project? project,
    bool? isProjectRepost,
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
      commentBy: (jsonSerialization['commentBy'] as List?)
          ?.map((e) => e as int)
          .toList(),
      repostBy: (jsonSerialization['repostBy'] as List?)
          ?.map((e) => e as int)
          .toList(),
      projectId: jsonSerialization['projectId'] as int?,
      project: jsonSerialization['project'] == null
          ? null
          : _i6.Project.fromJson(
              (jsonSerialization['project'] as Map<String, dynamic>)),
      isProjectRepost: jsonSerialization['isProjectRepost'] as bool?,
    );
  }

  static final t = PostTable();

  static const db = PostRepository._();

  @override
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

  List<int>? commentBy;

  List<int>? repostBy;

  int? projectId;

  _i6.Project? project;

  bool? isProjectRepost;

  @override
  _i1.Table<int> get table => t;

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
    List<int>? commentBy,
    List<int>? repostBy,
    int? projectId,
    _i6.Project? project,
    bool? isProjectRepost,
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
      if (commentBy != null) 'commentBy': commentBy?.toJson(),
      if (repostBy != null) 'repostBy': repostBy?.toJson(),
      if (projectId != null) 'projectId': projectId,
      if (project != null) 'project': project?.toJson(),
      if (isProjectRepost != null) 'isProjectRepost': isProjectRepost,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'ownerId': ownerId,
      if (owner != null) 'owner': owner?.toJsonForProtocol(),
      if (postType != null) 'postType': postType?.toJson(),
      if (text != null) 'text': text,
      if (imageUrls != null) 'imageUrls': imageUrls?.toJson(),
      if (videoUrl != null) 'videoUrl': videoUrl,
      if (taggedUsers != null)
        'taggedUsers':
            taggedUsers?.toJson(valueToJson: (v) => v.toJsonForProtocol()),
      if (locations != null)
        'locations':
            locations?.toJson(valueToJson: (v) => v.toJsonForProtocol()),
      if (mentions != null)
        'mentions': mentions?.toJson(valueToJson: (v) => v.toJsonForProtocol()),
      if (tags != null) 'tags': tags?.toJson(),
      if (dateCreated != null) 'dateCreated': dateCreated?.toJson(),
      if (updatedAt != null) 'updatedAt': updatedAt?.toJson(),
      if (hashtags != null)
        'hashtags': hashtags?.toJson(valueToJson: (v) => v.toJsonForProtocol()),
      if (likedBy != null) 'likedBy': likedBy?.toJson(),
      if (commentBy != null) 'commentBy': commentBy?.toJson(),
      if (repostBy != null) 'repostBy': repostBy?.toJson(),
      if (projectId != null) 'projectId': projectId,
      if (project != null) 'project': project?.toJsonForProtocol(),
      if (isProjectRepost != null) 'isProjectRepost': isProjectRepost,
    };
  }

  static PostInclude include({
    _i2.UserRecordInclude? owner,
    _i5.PostsHashtagsIncludeList? hashtags,
    _i6.ProjectInclude? project,
  }) {
    return PostInclude._(
      owner: owner,
      hashtags: hashtags,
      project: project,
    );
  }

  static PostIncludeList includeList({
    _i1.WhereExpressionBuilder<PostTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<PostTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<PostTable>? orderByList,
    PostInclude? include,
  }) {
    return PostIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Post.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(Post.t),
      include: include,
    );
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
    List<int>? commentBy,
    List<int>? repostBy,
    int? projectId,
    _i6.Project? project,
    bool? isProjectRepost,
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
          commentBy: commentBy,
          repostBy: repostBy,
          projectId: projectId,
          project: project,
          isProjectRepost: isProjectRepost,
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
    Object? commentBy = _Undefined,
    Object? repostBy = _Undefined,
    Object? projectId = _Undefined,
    Object? project = _Undefined,
    Object? isProjectRepost = _Undefined,
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
      commentBy: commentBy is List<int>?
          ? commentBy
          : this.commentBy?.map((e0) => e0).toList(),
      repostBy: repostBy is List<int>?
          ? repostBy
          : this.repostBy?.map((e0) => e0).toList(),
      projectId: projectId is int? ? projectId : this.projectId,
      project: project is _i6.Project? ? project : this.project?.copyWith(),
      isProjectRepost:
          isProjectRepost is bool? ? isProjectRepost : this.isProjectRepost,
    );
  }
}

class PostTable extends _i1.Table<int> {
  PostTable({super.tableRelation}) : super(tableName: 'post') {
    ownerId = _i1.ColumnInt(
      'ownerId',
      this,
    );
    postType = _i1.ColumnEnum(
      'postType',
      this,
      _i1.EnumSerialization.byIndex,
    );
    text = _i1.ColumnString(
      'text',
      this,
    );
    imageUrls = _i1.ColumnSerializable(
      'imageUrls',
      this,
    );
    videoUrl = _i1.ColumnString(
      'videoUrl',
      this,
    );
    taggedUsers = _i1.ColumnSerializable(
      'taggedUsers',
      this,
    );
    locations = _i1.ColumnSerializable(
      'locations',
      this,
    );
    mentions = _i1.ColumnSerializable(
      'mentions',
      this,
    );
    tags = _i1.ColumnSerializable(
      'tags',
      this,
    );
    dateCreated = _i1.ColumnDateTime(
      'dateCreated',
      this,
    );
    updatedAt = _i1.ColumnDateTime(
      'updatedAt',
      this,
    );
    likedBy = _i1.ColumnSerializable(
      'likedBy',
      this,
    );
    commentBy = _i1.ColumnSerializable(
      'commentBy',
      this,
    );
    repostBy = _i1.ColumnSerializable(
      'repostBy',
      this,
    );
    projectId = _i1.ColumnInt(
      'projectId',
      this,
    );
    isProjectRepost = _i1.ColumnBool(
      'isProjectRepost',
      this,
    );
  }

  late final _i1.ColumnInt ownerId;

  _i2.UserRecordTable? _owner;

  late final _i1.ColumnEnum<_i3.PostType> postType;

  late final _i1.ColumnString text;

  late final _i1.ColumnSerializable imageUrls;

  late final _i1.ColumnString videoUrl;

  late final _i1.ColumnSerializable taggedUsers;

  late final _i1.ColumnSerializable locations;

  late final _i1.ColumnSerializable mentions;

  late final _i1.ColumnSerializable tags;

  late final _i1.ColumnDateTime dateCreated;

  late final _i1.ColumnDateTime updatedAt;

  _i5.PostsHashtagsTable? ___hashtags;

  _i1.ManyRelation<_i5.PostsHashtagsTable>? _hashtags;

  late final _i1.ColumnSerializable likedBy;

  late final _i1.ColumnSerializable commentBy;

  late final _i1.ColumnSerializable repostBy;

  late final _i1.ColumnInt projectId;

  _i6.ProjectTable? _project;

  late final _i1.ColumnBool isProjectRepost;

  _i2.UserRecordTable get owner {
    if (_owner != null) return _owner!;
    _owner = _i1.createRelationTable(
      relationFieldName: 'owner',
      field: Post.t.ownerId,
      foreignField: _i2.UserRecord.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.UserRecordTable(tableRelation: foreignTableRelation),
    );
    return _owner!;
  }

  _i5.PostsHashtagsTable get __hashtags {
    if (___hashtags != null) return ___hashtags!;
    ___hashtags = _i1.createRelationTable(
      relationFieldName: '__hashtags',
      field: Post.t.id,
      foreignField: _i5.PostsHashtags.t.postId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i5.PostsHashtagsTable(tableRelation: foreignTableRelation),
    );
    return ___hashtags!;
  }

  _i6.ProjectTable get project {
    if (_project != null) return _project!;
    _project = _i1.createRelationTable(
      relationFieldName: 'project',
      field: Post.t.projectId,
      foreignField: _i6.Project.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i6.ProjectTable(tableRelation: foreignTableRelation),
    );
    return _project!;
  }

  _i1.ManyRelation<_i5.PostsHashtagsTable> get hashtags {
    if (_hashtags != null) return _hashtags!;
    var relationTable = _i1.createRelationTable(
      relationFieldName: 'hashtags',
      field: Post.t.id,
      foreignField: _i5.PostsHashtags.t.postId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i5.PostsHashtagsTable(tableRelation: foreignTableRelation),
    );
    _hashtags = _i1.ManyRelation<_i5.PostsHashtagsTable>(
      tableWithRelations: relationTable,
      table: _i5.PostsHashtagsTable(
          tableRelation: relationTable.tableRelation!.lastRelation),
    );
    return _hashtags!;
  }

  @override
  List<_i1.Column> get columns => [
        id,
        ownerId,
        postType,
        text,
        imageUrls,
        videoUrl,
        taggedUsers,
        locations,
        mentions,
        tags,
        dateCreated,
        updatedAt,
        likedBy,
        commentBy,
        repostBy,
        projectId,
        isProjectRepost,
      ];

  @override
  _i1.Table? getRelationTable(String relationField) {
    if (relationField == 'owner') {
      return owner;
    }
    if (relationField == 'hashtags') {
      return __hashtags;
    }
    if (relationField == 'project') {
      return project;
    }
    return null;
  }
}

class PostInclude extends _i1.IncludeObject {
  PostInclude._({
    _i2.UserRecordInclude? owner,
    _i5.PostsHashtagsIncludeList? hashtags,
    _i6.ProjectInclude? project,
  }) {
    _owner = owner;
    _hashtags = hashtags;
    _project = project;
  }

  _i2.UserRecordInclude? _owner;

  _i5.PostsHashtagsIncludeList? _hashtags;

  _i6.ProjectInclude? _project;

  @override
  Map<String, _i1.Include?> get includes => {
        'owner': _owner,
        'hashtags': _hashtags,
        'project': _project,
      };

  @override
  _i1.Table<int> get table => Post.t;
}

class PostIncludeList extends _i1.IncludeList {
  PostIncludeList._({
    _i1.WhereExpressionBuilder<PostTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(Post.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int> get table => Post.t;
}

class PostRepository {
  const PostRepository._();

  final attach = const PostAttachRepository._();

  final attachRow = const PostAttachRowRepository._();

  final detach = const PostDetachRepository._();

  final detachRow = const PostDetachRowRepository._();

  /// Returns a list of [Post]s matching the given query parameters.
  ///
  /// Use [where] to specify which items to include in the return value.
  /// If none is specified, all items will be returned.
  ///
  /// To specify the order of the items use [orderBy] or [orderByList]
  /// when sorting by multiple columns.
  ///
  /// The maximum number of items can be set by [limit]. If no limit is set,
  /// all items matching the query will be returned.
  ///
  /// [offset] defines how many items to skip, after which [limit] (or all)
  /// items are read from the database.
  ///
  /// ```dart
  /// var persons = await Persons.db.find(
  ///   session,
  ///   where: (t) => t.lastName.equals('Jones'),
  ///   orderBy: (t) => t.firstName,
  ///   limit: 100,
  /// );
  /// ```
  Future<List<Post>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<PostTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<PostTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<PostTable>? orderByList,
    _i1.Transaction? transaction,
    PostInclude? include,
  }) async {
    return session.db.find<Post>(
      where: where?.call(Post.t),
      orderBy: orderBy?.call(Post.t),
      orderByList: orderByList?.call(Post.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Returns the first matching [Post] matching the given query parameters.
  ///
  /// Use [where] to specify which items to include in the return value.
  /// If none is specified, all items will be returned.
  ///
  /// To specify the order use [orderBy] or [orderByList]
  /// when sorting by multiple columns.
  ///
  /// [offset] defines how many items to skip, after which the next one will be picked.
  ///
  /// ```dart
  /// var youngestPerson = await Persons.db.findFirstRow(
  ///   session,
  ///   where: (t) => t.lastName.equals('Jones'),
  ///   orderBy: (t) => t.age,
  /// );
  /// ```
  Future<Post?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<PostTable>? where,
    int? offset,
    _i1.OrderByBuilder<PostTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<PostTable>? orderByList,
    _i1.Transaction? transaction,
    PostInclude? include,
  }) async {
    return session.db.findFirstRow<Post>(
      where: where?.call(Post.t),
      orderBy: orderBy?.call(Post.t),
      orderByList: orderByList?.call(Post.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Finds a single [Post] by its [id] or null if no such row exists.
  Future<Post?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
    PostInclude? include,
  }) async {
    return session.db.findById<Post>(
      id,
      transaction: transaction,
      include: include,
    );
  }

  /// Inserts all [Post]s in the list and returns the inserted rows.
  ///
  /// The returned [Post]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<Post>> insert(
    _i1.Session session,
    List<Post> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<Post>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [Post] and returns the inserted row.
  ///
  /// The returned [Post] will have its `id` field set.
  Future<Post> insertRow(
    _i1.Session session,
    Post row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<Post>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [Post]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<Post>> update(
    _i1.Session session,
    List<Post> rows, {
    _i1.ColumnSelections<PostTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<Post>(
      rows,
      columns: columns?.call(Post.t),
      transaction: transaction,
    );
  }

  /// Updates a single [Post]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<Post> updateRow(
    _i1.Session session,
    Post row, {
    _i1.ColumnSelections<PostTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<Post>(
      row,
      columns: columns?.call(Post.t),
      transaction: transaction,
    );
  }

  /// Deletes all [Post]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<Post>> delete(
    _i1.Session session,
    List<Post> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<Post>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [Post].
  Future<Post> deleteRow(
    _i1.Session session,
    Post row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<Post>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<Post>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<PostTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<Post>(
      where: where(Post.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<PostTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<Post>(
      where: where?.call(Post.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

class PostAttachRepository {
  const PostAttachRepository._();

  /// Creates a relation between this [Post] and the given [PostsHashtags]s
  /// by setting each [PostsHashtags]'s foreign key `postId` to refer to this [Post].
  Future<void> hashtags(
    _i1.Session session,
    Post post,
    List<_i5.PostsHashtags> postsHashtags, {
    _i1.Transaction? transaction,
  }) async {
    if (postsHashtags.any((e) => e.id == null)) {
      throw ArgumentError.notNull('postsHashtags.id');
    }
    if (post.id == null) {
      throw ArgumentError.notNull('post.id');
    }

    var $postsHashtags =
        postsHashtags.map((e) => e.copyWith(postId: post.id)).toList();
    await session.db.update<_i5.PostsHashtags>(
      $postsHashtags,
      columns: [_i5.PostsHashtags.t.postId],
      transaction: transaction,
    );
  }
}

class PostAttachRowRepository {
  const PostAttachRowRepository._();

  /// Creates a relation between the given [Post] and [UserRecord]
  /// by setting the [Post]'s foreign key `ownerId` to refer to the [UserRecord].
  Future<void> owner(
    _i1.Session session,
    Post post,
    _i2.UserRecord owner, {
    _i1.Transaction? transaction,
  }) async {
    if (post.id == null) {
      throw ArgumentError.notNull('post.id');
    }
    if (owner.id == null) {
      throw ArgumentError.notNull('owner.id');
    }

    var $post = post.copyWith(ownerId: owner.id);
    await session.db.updateRow<Post>(
      $post,
      columns: [Post.t.ownerId],
      transaction: transaction,
    );
  }

  /// Creates a relation between the given [Post] and [Project]
  /// by setting the [Post]'s foreign key `projectId` to refer to the [Project].
  Future<void> project(
    _i1.Session session,
    Post post,
    _i6.Project project, {
    _i1.Transaction? transaction,
  }) async {
    if (post.id == null) {
      throw ArgumentError.notNull('post.id');
    }
    if (project.id == null) {
      throw ArgumentError.notNull('project.id');
    }

    var $post = post.copyWith(projectId: project.id);
    await session.db.updateRow<Post>(
      $post,
      columns: [Post.t.projectId],
      transaction: transaction,
    );
  }

  /// Creates a relation between this [Post] and the given [PostsHashtags]
  /// by setting the [PostsHashtags]'s foreign key `postId` to refer to this [Post].
  Future<void> hashtags(
    _i1.Session session,
    Post post,
    _i5.PostsHashtags postsHashtags, {
    _i1.Transaction? transaction,
  }) async {
    if (postsHashtags.id == null) {
      throw ArgumentError.notNull('postsHashtags.id');
    }
    if (post.id == null) {
      throw ArgumentError.notNull('post.id');
    }

    var $postsHashtags = postsHashtags.copyWith(postId: post.id);
    await session.db.updateRow<_i5.PostsHashtags>(
      $postsHashtags,
      columns: [_i5.PostsHashtags.t.postId],
      transaction: transaction,
    );
  }
}

class PostDetachRepository {
  const PostDetachRepository._();

  /// Detaches the relation between this [Post] and the given [PostsHashtags]
  /// by setting the [PostsHashtags]'s foreign key `postId` to `null`.
  ///
  /// This removes the association between the two models without deleting
  /// the related record.
  Future<void> hashtags(
    _i1.Session session,
    List<_i5.PostsHashtags> postsHashtags, {
    _i1.Transaction? transaction,
  }) async {
    if (postsHashtags.any((e) => e.id == null)) {
      throw ArgumentError.notNull('postsHashtags.id');
    }

    var $postsHashtags =
        postsHashtags.map((e) => e.copyWith(postId: null)).toList();
    await session.db.update<_i5.PostsHashtags>(
      $postsHashtags,
      columns: [_i5.PostsHashtags.t.postId],
      transaction: transaction,
    );
  }
}

class PostDetachRowRepository {
  const PostDetachRowRepository._();

  /// Detaches the relation between this [Post] and the [Project] set in `project`
  /// by setting the [Post]'s foreign key `projectId` to `null`.
  ///
  /// This removes the association between the two models without deleting
  /// the related record.
  Future<void> project(
    _i1.Session session,
    Post post, {
    _i1.Transaction? transaction,
  }) async {
    if (post.id == null) {
      throw ArgumentError.notNull('post.id');
    }

    var $post = post.copyWith(projectId: null);
    await session.db.updateRow<Post>(
      $post,
      columns: [Post.t.projectId],
      transaction: transaction,
    );
  }

  /// Detaches the relation between this [Post] and the given [PostsHashtags]
  /// by setting the [PostsHashtags]'s foreign key `postId` to `null`.
  ///
  /// This removes the association between the two models without deleting
  /// the related record.
  Future<void> hashtags(
    _i1.Session session,
    _i5.PostsHashtags postsHashtags, {
    _i1.Transaction? transaction,
  }) async {
    if (postsHashtags.id == null) {
      throw ArgumentError.notNull('postsHashtags.id');
    }

    var $postsHashtags = postsHashtags.copyWith(postId: null);
    await session.db.updateRow<_i5.PostsHashtags>(
      $postsHashtags,
      columns: [_i5.PostsHashtags.t.postId],
      transaction: transaction,
    );
  }
}
