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
import '../protocol.dart' as _i2;

abstract class Post extends _i1.TableRow implements _i1.ProtocolSerialization {
  Post._({
    int? id,
    required this.ownerId,
    this.owner,
    required this.postType,
    required this.text,
    required this.imageUrls,
    required this.videoUrl,
    required this.taggedUsers,
    required this.locations,
    required this.mentions,
    required this.tags,
    this.hashtags,
  }) : super(id);

  factory Post({
    int? id,
    required int ownerId,
    _i2.UserRecord? owner,
    required _i2.PostType postType,
    required String text,
    required List<String> imageUrls,
    required String videoUrl,
    required List<_i2.UserRecord> taggedUsers,
    required List<_i2.AWSPlaces> locations,
    required List<_i2.UserRecord> mentions,
    required List<String> tags,
    List<_i2.PostsHashtags>? hashtags,
  }) = _PostImpl;

  factory Post.fromJson(Map<String, dynamic> jsonSerialization) {
    return Post(
      id: jsonSerialization['id'] as int?,
      ownerId: jsonSerialization['ownerId'] as int,
      owner: jsonSerialization['owner'] == null
          ? null
          : _i2.UserRecord.fromJson(
              (jsonSerialization['owner'] as Map<String, dynamic>)),
      postType: _i2.PostType.fromJson((jsonSerialization['postType'] as int)),
      text: jsonSerialization['text'] as String,
      imageUrls: (jsonSerialization['imageUrls'] as List)
          .map((e) => e as String)
          .toList(),
      videoUrl: jsonSerialization['videoUrl'] as String,
      taggedUsers: (jsonSerialization['taggedUsers'] as List)
          .map((e) => _i2.UserRecord.fromJson((e as Map<String, dynamic>)))
          .toList(),
      locations: (jsonSerialization['locations'] as List)
          .map((e) => _i2.AWSPlaces.fromJson((e as Map<String, dynamic>)))
          .toList(),
      mentions: (jsonSerialization['mentions'] as List)
          .map((e) => _i2.UserRecord.fromJson((e as Map<String, dynamic>)))
          .toList(),
      tags:
          (jsonSerialization['tags'] as List).map((e) => e as String).toList(),
      hashtags: (jsonSerialization['hashtags'] as List?)
          ?.map((e) => _i2.PostsHashtags.fromJson((e as Map<String, dynamic>)))
          .toList(),
    );
  }

  static final t = PostTable();

  static const db = PostRepository._();

  int ownerId;

  _i2.UserRecord? owner;

  _i2.PostType postType;

  String text;

  List<String> imageUrls;

  String videoUrl;

  List<_i2.UserRecord> taggedUsers;

  List<_i2.AWSPlaces> locations;

  List<_i2.UserRecord> mentions;

  List<String> tags;

  List<_i2.PostsHashtags>? hashtags;

  @override
  _i1.Table get table => t;

  Post copyWith({
    int? id,
    int? ownerId,
    _i2.UserRecord? owner,
    _i2.PostType? postType,
    String? text,
    List<String>? imageUrls,
    String? videoUrl,
    List<_i2.UserRecord>? taggedUsers,
    List<_i2.AWSPlaces>? locations,
    List<_i2.UserRecord>? mentions,
    List<String>? tags,
    List<_i2.PostsHashtags>? hashtags,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'ownerId': ownerId,
      if (owner != null) 'owner': owner?.toJson(),
      'postType': postType.toJson(),
      'text': text,
      'imageUrls': imageUrls.toJson(),
      'videoUrl': videoUrl,
      'taggedUsers': taggedUsers.toJson(valueToJson: (v) => v.toJson()),
      'locations': locations.toJson(valueToJson: (v) => v.toJson()),
      'mentions': mentions.toJson(valueToJson: (v) => v.toJson()),
      'tags': tags.toJson(),
      if (hashtags != null)
        'hashtags': hashtags?.toJson(valueToJson: (v) => v.toJson()),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'ownerId': ownerId,
      if (owner != null) 'owner': owner?.toJsonForProtocol(),
      'postType': postType.toJson(),
      'text': text,
      'imageUrls': imageUrls.toJson(),
      'videoUrl': videoUrl,
      'taggedUsers':
          taggedUsers.toJson(valueToJson: (v) => v.toJsonForProtocol()),
      'locations': locations.toJson(valueToJson: (v) => v.toJsonForProtocol()),
      'mentions': mentions.toJson(valueToJson: (v) => v.toJsonForProtocol()),
      'tags': tags.toJson(),
      if (hashtags != null)
        'hashtags': hashtags?.toJson(valueToJson: (v) => v.toJsonForProtocol()),
    };
  }

  static PostInclude include({
    _i2.UserRecordInclude? owner,
    _i2.PostsHashtagsIncludeList? hashtags,
  }) {
    return PostInclude._(
      owner: owner,
      hashtags: hashtags,
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
    required _i2.PostType postType,
    required String text,
    required List<String> imageUrls,
    required String videoUrl,
    required List<_i2.UserRecord> taggedUsers,
    required List<_i2.AWSPlaces> locations,
    required List<_i2.UserRecord> mentions,
    required List<String> tags,
    List<_i2.PostsHashtags>? hashtags,
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
          hashtags: hashtags,
        );

  @override
  Post copyWith({
    Object? id = _Undefined,
    int? ownerId,
    Object? owner = _Undefined,
    _i2.PostType? postType,
    String? text,
    List<String>? imageUrls,
    String? videoUrl,
    List<_i2.UserRecord>? taggedUsers,
    List<_i2.AWSPlaces>? locations,
    List<_i2.UserRecord>? mentions,
    List<String>? tags,
    Object? hashtags = _Undefined,
  }) {
    return Post(
      id: id is int? ? id : this.id,
      ownerId: ownerId ?? this.ownerId,
      owner: owner is _i2.UserRecord? ? owner : this.owner?.copyWith(),
      postType: postType ?? this.postType,
      text: text ?? this.text,
      imageUrls: imageUrls ?? this.imageUrls.map((e0) => e0).toList(),
      videoUrl: videoUrl ?? this.videoUrl,
      taggedUsers:
          taggedUsers ?? this.taggedUsers.map((e0) => e0.copyWith()).toList(),
      locations:
          locations ?? this.locations.map((e0) => e0.copyWith()).toList(),
      mentions: mentions ?? this.mentions.map((e0) => e0.copyWith()).toList(),
      tags: tags ?? this.tags.map((e0) => e0).toList(),
      hashtags: hashtags is List<_i2.PostsHashtags>?
          ? hashtags
          : this.hashtags?.map((e0) => e0.copyWith()).toList(),
    );
  }
}

class PostTable extends _i1.Table {
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
  }

  late final _i1.ColumnInt ownerId;

  _i2.UserRecordTable? _owner;

  late final _i1.ColumnEnum<_i2.PostType> postType;

  late final _i1.ColumnString text;

  late final _i1.ColumnSerializable imageUrls;

  late final _i1.ColumnString videoUrl;

  late final _i1.ColumnSerializable taggedUsers;

  late final _i1.ColumnSerializable locations;

  late final _i1.ColumnSerializable mentions;

  late final _i1.ColumnSerializable tags;

  _i2.PostsHashtagsTable? ___hashtags;

  _i1.ManyRelation<_i2.PostsHashtagsTable>? _hashtags;

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

  _i2.PostsHashtagsTable get __hashtags {
    if (___hashtags != null) return ___hashtags!;
    ___hashtags = _i1.createRelationTable(
      relationFieldName: '__hashtags',
      field: Post.t.id,
      foreignField: _i2.PostsHashtags.t.postId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.PostsHashtagsTable(tableRelation: foreignTableRelation),
    );
    return ___hashtags!;
  }

  _i1.ManyRelation<_i2.PostsHashtagsTable> get hashtags {
    if (_hashtags != null) return _hashtags!;
    var relationTable = _i1.createRelationTable(
      relationFieldName: 'hashtags',
      field: Post.t.id,
      foreignField: _i2.PostsHashtags.t.postId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.PostsHashtagsTable(tableRelation: foreignTableRelation),
    );
    _hashtags = _i1.ManyRelation<_i2.PostsHashtagsTable>(
      tableWithRelations: relationTable,
      table: _i2.PostsHashtagsTable(
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
      ];

  @override
  _i1.Table? getRelationTable(String relationField) {
    if (relationField == 'owner') {
      return owner;
    }
    if (relationField == 'hashtags') {
      return __hashtags;
    }
    return null;
  }
}

class PostInclude extends _i1.IncludeObject {
  PostInclude._({
    _i2.UserRecordInclude? owner,
    _i2.PostsHashtagsIncludeList? hashtags,
  }) {
    _owner = owner;
    _hashtags = hashtags;
  }

  _i2.UserRecordInclude? _owner;

  _i2.PostsHashtagsIncludeList? _hashtags;

  @override
  Map<String, _i1.Include?> get includes => {
        'owner': _owner,
        'hashtags': _hashtags,
      };

  @override
  _i1.Table get table => Post.t;
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
  _i1.Table get table => Post.t;
}

class PostRepository {
  const PostRepository._();

  final attach = const PostAttachRepository._();

  final attachRow = const PostAttachRowRepository._();

  final detach = const PostDetachRepository._();

  final detachRow = const PostDetachRowRepository._();

  Future<List<Post>> find(
    _i1.DatabaseAccessor databaseAccessor, {
    _i1.WhereExpressionBuilder<PostTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<PostTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<PostTable>? orderByList,
    _i1.Transaction? transaction,
    PostInclude? include,
  }) async {
    return databaseAccessor.db.find<Post>(
      where: where?.call(Post.t),
      orderBy: orderBy?.call(Post.t),
      orderByList: orderByList?.call(Post.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction ?? databaseAccessor.transaction,
      include: include,
    );
  }

  Future<Post?> findFirstRow(
    _i1.DatabaseAccessor databaseAccessor, {
    _i1.WhereExpressionBuilder<PostTable>? where,
    int? offset,
    _i1.OrderByBuilder<PostTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<PostTable>? orderByList,
    _i1.Transaction? transaction,
    PostInclude? include,
  }) async {
    return databaseAccessor.db.findFirstRow<Post>(
      where: where?.call(Post.t),
      orderBy: orderBy?.call(Post.t),
      orderByList: orderByList?.call(Post.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction ?? databaseAccessor.transaction,
      include: include,
    );
  }

  Future<Post?> findById(
    _i1.DatabaseAccessor databaseAccessor,
    int id, {
    _i1.Transaction? transaction,
    PostInclude? include,
  }) async {
    return databaseAccessor.db.findById<Post>(
      id,
      transaction: transaction ?? databaseAccessor.transaction,
      include: include,
    );
  }

  Future<List<Post>> insert(
    _i1.DatabaseAccessor databaseAccessor,
    List<Post> rows, {
    _i1.Transaction? transaction,
  }) async {
    return databaseAccessor.db.insert<Post>(
      rows,
      transaction: transaction ?? databaseAccessor.transaction,
    );
  }

  Future<Post> insertRow(
    _i1.DatabaseAccessor databaseAccessor,
    Post row, {
    _i1.Transaction? transaction,
  }) async {
    return databaseAccessor.db.insertRow<Post>(
      row,
      transaction: transaction ?? databaseAccessor.transaction,
    );
  }

  Future<List<Post>> update(
    _i1.DatabaseAccessor databaseAccessor,
    List<Post> rows, {
    _i1.ColumnSelections<PostTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return databaseAccessor.db.update<Post>(
      rows,
      columns: columns?.call(Post.t),
      transaction: transaction ?? databaseAccessor.transaction,
    );
  }

  Future<Post> updateRow(
    _i1.DatabaseAccessor databaseAccessor,
    Post row, {
    _i1.ColumnSelections<PostTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return databaseAccessor.db.updateRow<Post>(
      row,
      columns: columns?.call(Post.t),
      transaction: transaction ?? databaseAccessor.transaction,
    );
  }

  Future<List<Post>> delete(
    _i1.DatabaseAccessor databaseAccessor,
    List<Post> rows, {
    _i1.Transaction? transaction,
  }) async {
    return databaseAccessor.db.delete<Post>(
      rows,
      transaction: transaction ?? databaseAccessor.transaction,
    );
  }

  Future<Post> deleteRow(
    _i1.DatabaseAccessor databaseAccessor,
    Post row, {
    _i1.Transaction? transaction,
  }) async {
    return databaseAccessor.db.deleteRow<Post>(
      row,
      transaction: transaction ?? databaseAccessor.transaction,
    );
  }

  Future<List<Post>> deleteWhere(
    _i1.DatabaseAccessor databaseAccessor, {
    required _i1.WhereExpressionBuilder<PostTable> where,
    _i1.Transaction? transaction,
  }) async {
    return databaseAccessor.db.deleteWhere<Post>(
      where: where(Post.t),
      transaction: transaction ?? databaseAccessor.transaction,
    );
  }

  Future<int> count(
    _i1.DatabaseAccessor databaseAccessor, {
    _i1.WhereExpressionBuilder<PostTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return databaseAccessor.db.count<Post>(
      where: where?.call(Post.t),
      limit: limit,
      transaction: transaction ?? databaseAccessor.transaction,
    );
  }
}

class PostAttachRepository {
  const PostAttachRepository._();

  Future<void> hashtags(
    _i1.DatabaseAccessor databaseAccessor,
    Post post,
    List<_i2.PostsHashtags> postsHashtags, {
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
    await databaseAccessor.db.update<_i2.PostsHashtags>(
      $postsHashtags,
      columns: [_i2.PostsHashtags.t.postId],
      transaction: transaction ?? databaseAccessor.transaction,
    );
  }
}

class PostAttachRowRepository {
  const PostAttachRowRepository._();

  Future<void> owner(
    _i1.DatabaseAccessor databaseAccessor,
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
    await databaseAccessor.db.updateRow<Post>(
      $post,
      columns: [Post.t.ownerId],
      transaction: transaction ?? databaseAccessor.transaction,
    );
  }

  Future<void> hashtags(
    _i1.DatabaseAccessor databaseAccessor,
    Post post,
    _i2.PostsHashtags postsHashtags, {
    _i1.Transaction? transaction,
  }) async {
    if (postsHashtags.id == null) {
      throw ArgumentError.notNull('postsHashtags.id');
    }
    if (post.id == null) {
      throw ArgumentError.notNull('post.id');
    }

    var $postsHashtags = postsHashtags.copyWith(postId: post.id);
    await databaseAccessor.db.updateRow<_i2.PostsHashtags>(
      $postsHashtags,
      columns: [_i2.PostsHashtags.t.postId],
      transaction: transaction ?? databaseAccessor.transaction,
    );
  }
}

class PostDetachRepository {
  const PostDetachRepository._();

  Future<void> hashtags(
    _i1.DatabaseAccessor databaseAccessor,
    List<_i2.PostsHashtags> postsHashtags, {
    _i1.Transaction? transaction,
  }) async {
    if (postsHashtags.any((e) => e.id == null)) {
      throw ArgumentError.notNull('postsHashtags.id');
    }

    var $postsHashtags =
        postsHashtags.map((e) => e.copyWith(postId: null)).toList();
    await databaseAccessor.db.update<_i2.PostsHashtags>(
      $postsHashtags,
      columns: [_i2.PostsHashtags.t.postId],
      transaction: transaction ?? databaseAccessor.transaction,
    );
  }
}

class PostDetachRowRepository {
  const PostDetachRowRepository._();

  Future<void> hashtags(
    _i1.DatabaseAccessor databaseAccessor,
    _i2.PostsHashtags postsHashtags, {
    _i1.Transaction? transaction,
  }) async {
    if (postsHashtags.id == null) {
      throw ArgumentError.notNull('postsHashtags.id');
    }

    var $postsHashtags = postsHashtags.copyWith(postId: null);
    await databaseAccessor.db.updateRow<_i2.PostsHashtags>(
      $postsHashtags,
      columns: [_i2.PostsHashtags.t.postId],
      transaction: transaction ?? databaseAccessor.transaction,
    );
  }
}
