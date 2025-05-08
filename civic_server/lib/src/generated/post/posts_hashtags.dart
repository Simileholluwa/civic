/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters

// ignore_for_file: unnecessary_null_comparison

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;
import '../post/post.dart' as _i2;
import '../post/hashtags.dart' as _i3;

abstract class PostsHashtags
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
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
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [PostsHashtags]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
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

  /// Returns a shallow copy of this [PostsHashtags]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
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

class PostsHashtagsTable extends _i1.Table<int?> {
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
  _i1.Table<int?> get table => PostsHashtags.t;
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
  _i1.Table<int?> get table => PostsHashtags.t;
}

class PostsHashtagsRepository {
  const PostsHashtagsRepository._();

  final attachRow = const PostsHashtagsAttachRowRepository._();

  /// Returns a list of [PostsHashtags]s matching the given query parameters.
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

  /// Returns the first matching [PostsHashtags] matching the given query parameters.
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

  /// Finds a single [PostsHashtags] by its [id] or null if no such row exists.
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

  /// Inserts all [PostsHashtags]s in the list and returns the inserted rows.
  ///
  /// The returned [PostsHashtags]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
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

  /// Inserts a single [PostsHashtags] and returns the inserted row.
  ///
  /// The returned [PostsHashtags] will have its `id` field set.
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

  /// Updates all [PostsHashtags]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
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

  /// Updates a single [PostsHashtags]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
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

  /// Deletes all [PostsHashtags]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
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

  /// Deletes a single [PostsHashtags].
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

  /// Deletes all rows matching the [where] expression.
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

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
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

  /// Creates a relation between the given [PostsHashtags] and [Post]
  /// by setting the [PostsHashtags]'s foreign key `postId` to refer to the [Post].
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

  /// Creates a relation between the given [PostsHashtags] and [Hashtag]
  /// by setting the [PostsHashtags]'s foreign key `hashtagId` to refer to the [Hashtag].
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
