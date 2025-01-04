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
import '../post/post.dart' as _i2;
import '../post/hashtags.dart' as _i3;

abstract class PostsHashtags
    implements _i1.TableRow, _i1.ProtocolSerialization {
  PostsHashtags._({
    this.id,
    required this.postId,
    this.post,
    required this.hashtagId,
    this.hashtag,
  });

  factory PostsHashtags({
    int? id,
    required int postId,
    _i2.Post? post,
    required int hashtagId,
    _i3.Hashtag? hashtag,
  }) = _PostsHashtagsImpl;

  factory PostsHashtags.fromJson(Map<String, dynamic> jsonSerialization) {
    return PostsHashtags(
      id: jsonSerialization['id'] as int?,
      postId: jsonSerialization['postId'] as int,
      post: jsonSerialization['post'] == null
          ? null
          : _i2.Post.fromJson(
              (jsonSerialization['post'] as Map<String, dynamic>)),
      hashtagId: jsonSerialization['hashtagId'] as int,
      hashtag: jsonSerialization['hashtag'] == null
          ? null
          : _i3.Hashtag.fromJson(
              (jsonSerialization['hashtag'] as Map<String, dynamic>)),
    );
  }

  static final t = PostsHashtagsTable();

  static const db = PostsHashtagsRepository._();

  @override
  int? id;

  int postId;

  _i2.Post? post;

  int hashtagId;

  _i3.Hashtag? hashtag;

  @override
  _i1.Table get table => t;

  PostsHashtags copyWith({
    int? id,
    int? postId,
    _i2.Post? post,
    int? hashtagId,
    _i3.Hashtag? hashtag,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'postId': postId,
      if (post != null) 'post': post?.toJson(),
      'hashtagId': hashtagId,
      if (hashtag != null) 'hashtag': hashtag?.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'postId': postId,
      if (post != null) 'post': post?.toJsonForProtocol(),
      'hashtagId': hashtagId,
      if (hashtag != null) 'hashtag': hashtag?.toJsonForProtocol(),
    };
  }

  static PostsHashtagsInclude include({
    _i2.PostInclude? post,
    _i3.HashtagInclude? hashtag,
  }) {
    return PostsHashtagsInclude._(
      post: post,
      hashtag: hashtag,
    );
  }

  static PostsHashtagsIncludeList includeList({
    _i1.WhereExpressionBuilder<PostsHashtagsTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<PostsHashtagsTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<PostsHashtagsTable>? orderByList,
    PostsHashtagsInclude? include,
  }) {
    return PostsHashtagsIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(PostsHashtags.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(PostsHashtags.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _PostsHashtagsImpl extends PostsHashtags {
  _PostsHashtagsImpl({
    int? id,
    required int postId,
    _i2.Post? post,
    required int hashtagId,
    _i3.Hashtag? hashtag,
  }) : super._(
          id: id,
          postId: postId,
          post: post,
          hashtagId: hashtagId,
          hashtag: hashtag,
        );

  @override
  PostsHashtags copyWith({
    Object? id = _Undefined,
    int? postId,
    Object? post = _Undefined,
    int? hashtagId,
    Object? hashtag = _Undefined,
  }) {
    return PostsHashtags(
      id: id is int? ? id : this.id,
      postId: postId ?? this.postId,
      post: post is _i2.Post? ? post : this.post?.copyWith(),
      hashtagId: hashtagId ?? this.hashtagId,
      hashtag: hashtag is _i3.Hashtag? ? hashtag : this.hashtag?.copyWith(),
    );
  }
}

class PostsHashtagsTable extends _i1.Table {
  PostsHashtagsTable({super.tableRelation}) : super(tableName: 'posthashtags') {
    postId = _i1.ColumnInt(
      'postId',
      this,
    );
    hashtagId = _i1.ColumnInt(
      'hashtagId',
      this,
    );
  }

  late final _i1.ColumnInt postId;

  _i2.PostTable? _post;

  late final _i1.ColumnInt hashtagId;

  _i3.HashtagTable? _hashtag;

  _i2.PostTable get post {
    if (_post != null) return _post!;
    _post = _i1.createRelationTable(
      relationFieldName: 'post',
      field: PostsHashtags.t.postId,
      foreignField: _i2.Post.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.PostTable(tableRelation: foreignTableRelation),
    );
    return _post!;
  }

  _i3.HashtagTable get hashtag {
    if (_hashtag != null) return _hashtag!;
    _hashtag = _i1.createRelationTable(
      relationFieldName: 'hashtag',
      field: PostsHashtags.t.hashtagId,
      foreignField: _i3.Hashtag.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i3.HashtagTable(tableRelation: foreignTableRelation),
    );
    return _hashtag!;
  }

  @override
  List<_i1.Column> get columns => [
        id,
        postId,
        hashtagId,
      ];

  @override
  _i1.Table? getRelationTable(String relationField) {
    if (relationField == 'post') {
      return post;
    }
    if (relationField == 'hashtag') {
      return hashtag;
    }
    return null;
  }
}

class PostsHashtagsInclude extends _i1.IncludeObject {
  PostsHashtagsInclude._({
    _i2.PostInclude? post,
    _i3.HashtagInclude? hashtag,
  }) {
    _post = post;
    _hashtag = hashtag;
  }

  _i2.PostInclude? _post;

  _i3.HashtagInclude? _hashtag;

  @override
  Map<String, _i1.Include?> get includes => {
        'post': _post,
        'hashtag': _hashtag,
      };

  @override
  _i1.Table get table => PostsHashtags.t;
}

class PostsHashtagsIncludeList extends _i1.IncludeList {
  PostsHashtagsIncludeList._({
    _i1.WhereExpressionBuilder<PostsHashtagsTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(PostsHashtags.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table get table => PostsHashtags.t;
}

class PostsHashtagsRepository {
  const PostsHashtagsRepository._();

  final attachRow = const PostsHashtagsAttachRowRepository._();

  Future<List<PostsHashtags>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<PostsHashtagsTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<PostsHashtagsTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<PostsHashtagsTable>? orderByList,
    _i1.Transaction? transaction,
    PostsHashtagsInclude? include,
  }) async {
    return session.db.find<PostsHashtags>(
      where: where?.call(PostsHashtags.t),
      orderBy: orderBy?.call(PostsHashtags.t),
      orderByList: orderByList?.call(PostsHashtags.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  Future<PostsHashtags?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<PostsHashtagsTable>? where,
    int? offset,
    _i1.OrderByBuilder<PostsHashtagsTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<PostsHashtagsTable>? orderByList,
    _i1.Transaction? transaction,
    PostsHashtagsInclude? include,
  }) async {
    return session.db.findFirstRow<PostsHashtags>(
      where: where?.call(PostsHashtags.t),
      orderBy: orderBy?.call(PostsHashtags.t),
      orderByList: orderByList?.call(PostsHashtags.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  Future<PostsHashtags?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
    PostsHashtagsInclude? include,
  }) async {
    return session.db.findById<PostsHashtags>(
      id,
      transaction: transaction,
      include: include,
    );
  }

  Future<List<PostsHashtags>> insert(
    _i1.Session session,
    List<PostsHashtags> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<PostsHashtags>(
      rows,
      transaction: transaction,
    );
  }

  Future<PostsHashtags> insertRow(
    _i1.Session session,
    PostsHashtags row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<PostsHashtags>(
      row,
      transaction: transaction,
    );
  }

  Future<List<PostsHashtags>> update(
    _i1.Session session,
    List<PostsHashtags> rows, {
    _i1.ColumnSelections<PostsHashtagsTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<PostsHashtags>(
      rows,
      columns: columns?.call(PostsHashtags.t),
      transaction: transaction,
    );
  }

  Future<PostsHashtags> updateRow(
    _i1.Session session,
    PostsHashtags row, {
    _i1.ColumnSelections<PostsHashtagsTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<PostsHashtags>(
      row,
      columns: columns?.call(PostsHashtags.t),
      transaction: transaction,
    );
  }

  Future<List<PostsHashtags>> delete(
    _i1.Session session,
    List<PostsHashtags> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<PostsHashtags>(
      rows,
      transaction: transaction,
    );
  }

  Future<PostsHashtags> deleteRow(
    _i1.Session session,
    PostsHashtags row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<PostsHashtags>(
      row,
      transaction: transaction,
    );
  }

  Future<List<PostsHashtags>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<PostsHashtagsTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<PostsHashtags>(
      where: where(PostsHashtags.t),
      transaction: transaction,
    );
  }

  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<PostsHashtagsTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<PostsHashtags>(
      where: where?.call(PostsHashtags.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

class PostsHashtagsAttachRowRepository {
  const PostsHashtagsAttachRowRepository._();

  Future<void> post(
    _i1.Session session,
    PostsHashtags postsHashtags,
    _i2.Post post, {
    _i1.Transaction? transaction,
  }) async {
    if (postsHashtags.id == null) {
      throw ArgumentError.notNull('postsHashtags.id');
    }
    if (post.id == null) {
      throw ArgumentError.notNull('post.id');
    }

    var $postsHashtags = postsHashtags.copyWith(postId: post.id);
    await session.db.updateRow<PostsHashtags>(
      $postsHashtags,
      columns: [PostsHashtags.t.postId],
      transaction: transaction,
    );
  }

  Future<void> hashtag(
    _i1.Session session,
    PostsHashtags postsHashtags,
    _i3.Hashtag hashtag, {
    _i1.Transaction? transaction,
  }) async {
    if (postsHashtags.id == null) {
      throw ArgumentError.notNull('postsHashtags.id');
    }
    if (hashtag.id == null) {
      throw ArgumentError.notNull('hashtag.id');
    }

    var $postsHashtags = postsHashtags.copyWith(hashtagId: hashtag.id);
    await session.db.updateRow<PostsHashtags>(
      $postsHashtags,
      columns: [PostsHashtags.t.hashtagId],
      transaction: transaction,
    );
  }
}
