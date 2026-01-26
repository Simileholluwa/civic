/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters
// ignore_for_file: invalid_use_of_internal_member
// ignore_for_file: unnecessary_null_comparison

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;
import '../post/post.dart' as _i2;
import '../user/user_record.dart' as _i3;
import 'package:civic_server/src/generated/protocol.dart' as _i4;

abstract class PostImpression
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  PostImpression._({
    this.id,
    required this.postId,
    this.post,
    required this.viewerId,
    this.viewer,
    this.sessionId,
    this.source,
    this.hourBucket,
    DateTime? createdAt,
  }) : createdAt = createdAt ?? DateTime.now();

  factory PostImpression({
    int? id,
    required int postId,
    _i2.Post? post,
    required int viewerId,
    _i3.UserRecord? viewer,
    String? sessionId,
    String? source,
    DateTime? hourBucket,
    DateTime? createdAt,
  }) = _PostImpressionImpl;

  factory PostImpression.fromJson(Map<String, dynamic> jsonSerialization) {
    return PostImpression(
      id: jsonSerialization['id'] as int?,
      postId: jsonSerialization['postId'] as int,
      post: jsonSerialization['post'] == null
          ? null
          : _i4.Protocol().deserialize<_i2.Post>(jsonSerialization['post']),
      viewerId: jsonSerialization['viewerId'] as int,
      viewer: jsonSerialization['viewer'] == null
          ? null
          : _i4.Protocol().deserialize<_i3.UserRecord>(
              jsonSerialization['viewer'],
            ),
      sessionId: jsonSerialization['sessionId'] as String?,
      source: jsonSerialization['source'] as String?,
      hourBucket: jsonSerialization['hourBucket'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['hourBucket']),
      createdAt: jsonSerialization['createdAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
    );
  }

  static final t = PostImpressionTable();

  static const db = PostImpressionRepository._();

  @override
  int? id;

  int postId;

  _i2.Post? post;

  int viewerId;

  _i3.UserRecord? viewer;

  String? sessionId;

  String? source;

  DateTime? hourBucket;

  DateTime? createdAt;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [PostImpression]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  PostImpression copyWith({
    int? id,
    int? postId,
    _i2.Post? post,
    int? viewerId,
    _i3.UserRecord? viewer,
    String? sessionId,
    String? source,
    DateTime? hourBucket,
    DateTime? createdAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'PostImpression',
      if (id != null) 'id': id,
      'postId': postId,
      if (post != null) 'post': post?.toJson(),
      'viewerId': viewerId,
      if (viewer != null) 'viewer': viewer?.toJson(),
      if (sessionId != null) 'sessionId': sessionId,
      if (source != null) 'source': source,
      if (hourBucket != null) 'hourBucket': hourBucket?.toJson(),
      if (createdAt != null) 'createdAt': createdAt?.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'PostImpression',
      if (id != null) 'id': id,
      'postId': postId,
      if (post != null) 'post': post?.toJsonForProtocol(),
      'viewerId': viewerId,
      if (viewer != null) 'viewer': viewer?.toJsonForProtocol(),
      if (sessionId != null) 'sessionId': sessionId,
      if (source != null) 'source': source,
      if (hourBucket != null) 'hourBucket': hourBucket?.toJson(),
      if (createdAt != null) 'createdAt': createdAt?.toJson(),
    };
  }

  static PostImpressionInclude include({
    _i2.PostInclude? post,
    _i3.UserRecordInclude? viewer,
  }) {
    return PostImpressionInclude._(
      post: post,
      viewer: viewer,
    );
  }

  static PostImpressionIncludeList includeList({
    _i1.WhereExpressionBuilder<PostImpressionTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<PostImpressionTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<PostImpressionTable>? orderByList,
    PostImpressionInclude? include,
  }) {
    return PostImpressionIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(PostImpression.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(PostImpression.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _PostImpressionImpl extends PostImpression {
  _PostImpressionImpl({
    int? id,
    required int postId,
    _i2.Post? post,
    required int viewerId,
    _i3.UserRecord? viewer,
    String? sessionId,
    String? source,
    DateTime? hourBucket,
    DateTime? createdAt,
  }) : super._(
         id: id,
         postId: postId,
         post: post,
         viewerId: viewerId,
         viewer: viewer,
         sessionId: sessionId,
         source: source,
         hourBucket: hourBucket,
         createdAt: createdAt,
       );

  /// Returns a shallow copy of this [PostImpression]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  PostImpression copyWith({
    Object? id = _Undefined,
    int? postId,
    Object? post = _Undefined,
    int? viewerId,
    Object? viewer = _Undefined,
    Object? sessionId = _Undefined,
    Object? source = _Undefined,
    Object? hourBucket = _Undefined,
    Object? createdAt = _Undefined,
  }) {
    return PostImpression(
      id: id is int? ? id : this.id,
      postId: postId ?? this.postId,
      post: post is _i2.Post? ? post : this.post?.copyWith(),
      viewerId: viewerId ?? this.viewerId,
      viewer: viewer is _i3.UserRecord? ? viewer : this.viewer?.copyWith(),
      sessionId: sessionId is String? ? sessionId : this.sessionId,
      source: source is String? ? source : this.source,
      hourBucket: hourBucket is DateTime? ? hourBucket : this.hourBucket,
      createdAt: createdAt is DateTime? ? createdAt : this.createdAt,
    );
  }
}

class PostImpressionUpdateTable extends _i1.UpdateTable<PostImpressionTable> {
  PostImpressionUpdateTable(super.table);

  _i1.ColumnValue<int, int> postId(int value) => _i1.ColumnValue(
    table.postId,
    value,
  );

  _i1.ColumnValue<int, int> viewerId(int value) => _i1.ColumnValue(
    table.viewerId,
    value,
  );

  _i1.ColumnValue<String, String> sessionId(String? value) => _i1.ColumnValue(
    table.sessionId,
    value,
  );

  _i1.ColumnValue<String, String> source(String? value) => _i1.ColumnValue(
    table.source,
    value,
  );

  _i1.ColumnValue<DateTime, DateTime> hourBucket(DateTime? value) =>
      _i1.ColumnValue(
        table.hourBucket,
        value,
      );

  _i1.ColumnValue<DateTime, DateTime> createdAt(DateTime? value) =>
      _i1.ColumnValue(
        table.createdAt,
        value,
      );
}

class PostImpressionTable extends _i1.Table<int?> {
  PostImpressionTable({super.tableRelation})
    : super(tableName: 'post_impression') {
    updateTable = PostImpressionUpdateTable(this);
    postId = _i1.ColumnInt(
      'postId',
      this,
    );
    viewerId = _i1.ColumnInt(
      'viewerId',
      this,
    );
    sessionId = _i1.ColumnString(
      'sessionId',
      this,
    );
    source = _i1.ColumnString(
      'source',
      this,
    );
    hourBucket = _i1.ColumnDateTime(
      'hourBucket',
      this,
    );
    createdAt = _i1.ColumnDateTime(
      'createdAt',
      this,
      hasDefault: true,
    );
  }

  late final PostImpressionUpdateTable updateTable;

  late final _i1.ColumnInt postId;

  _i2.PostTable? _post;

  late final _i1.ColumnInt viewerId;

  _i3.UserRecordTable? _viewer;

  late final _i1.ColumnString sessionId;

  late final _i1.ColumnString source;

  late final _i1.ColumnDateTime hourBucket;

  late final _i1.ColumnDateTime createdAt;

  _i2.PostTable get post {
    if (_post != null) return _post!;
    _post = _i1.createRelationTable(
      relationFieldName: 'post',
      field: PostImpression.t.postId,
      foreignField: _i2.Post.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.PostTable(tableRelation: foreignTableRelation),
    );
    return _post!;
  }

  _i3.UserRecordTable get viewer {
    if (_viewer != null) return _viewer!;
    _viewer = _i1.createRelationTable(
      relationFieldName: 'viewer',
      field: PostImpression.t.viewerId,
      foreignField: _i3.UserRecord.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i3.UserRecordTable(tableRelation: foreignTableRelation),
    );
    return _viewer!;
  }

  @override
  List<_i1.Column> get columns => [
    id,
    postId,
    viewerId,
    sessionId,
    source,
    hourBucket,
    createdAt,
  ];

  @override
  _i1.Table? getRelationTable(String relationField) {
    if (relationField == 'post') {
      return post;
    }
    if (relationField == 'viewer') {
      return viewer;
    }
    return null;
  }
}

class PostImpressionInclude extends _i1.IncludeObject {
  PostImpressionInclude._({
    _i2.PostInclude? post,
    _i3.UserRecordInclude? viewer,
  }) {
    _post = post;
    _viewer = viewer;
  }

  _i2.PostInclude? _post;

  _i3.UserRecordInclude? _viewer;

  @override
  Map<String, _i1.Include?> get includes => {
    'post': _post,
    'viewer': _viewer,
  };

  @override
  _i1.Table<int?> get table => PostImpression.t;
}

class PostImpressionIncludeList extends _i1.IncludeList {
  PostImpressionIncludeList._({
    _i1.WhereExpressionBuilder<PostImpressionTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(PostImpression.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => PostImpression.t;
}

class PostImpressionRepository {
  const PostImpressionRepository._();

  final attachRow = const PostImpressionAttachRowRepository._();

  /// Returns a list of [PostImpression]s matching the given query parameters.
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
  Future<List<PostImpression>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<PostImpressionTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<PostImpressionTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<PostImpressionTable>? orderByList,
    _i1.Transaction? transaction,
    PostImpressionInclude? include,
  }) async {
    return session.db.find<PostImpression>(
      where: where?.call(PostImpression.t),
      orderBy: orderBy?.call(PostImpression.t),
      orderByList: orderByList?.call(PostImpression.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Returns the first matching [PostImpression] matching the given query parameters.
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
  Future<PostImpression?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<PostImpressionTable>? where,
    int? offset,
    _i1.OrderByBuilder<PostImpressionTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<PostImpressionTable>? orderByList,
    _i1.Transaction? transaction,
    PostImpressionInclude? include,
  }) async {
    return session.db.findFirstRow<PostImpression>(
      where: where?.call(PostImpression.t),
      orderBy: orderBy?.call(PostImpression.t),
      orderByList: orderByList?.call(PostImpression.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Finds a single [PostImpression] by its [id] or null if no such row exists.
  Future<PostImpression?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
    PostImpressionInclude? include,
  }) async {
    return session.db.findById<PostImpression>(
      id,
      transaction: transaction,
      include: include,
    );
  }

  /// Inserts all [PostImpression]s in the list and returns the inserted rows.
  ///
  /// The returned [PostImpression]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<PostImpression>> insert(
    _i1.Session session,
    List<PostImpression> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<PostImpression>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [PostImpression] and returns the inserted row.
  ///
  /// The returned [PostImpression] will have its `id` field set.
  Future<PostImpression> insertRow(
    _i1.Session session,
    PostImpression row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<PostImpression>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [PostImpression]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<PostImpression>> update(
    _i1.Session session,
    List<PostImpression> rows, {
    _i1.ColumnSelections<PostImpressionTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<PostImpression>(
      rows,
      columns: columns?.call(PostImpression.t),
      transaction: transaction,
    );
  }

  /// Updates a single [PostImpression]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<PostImpression> updateRow(
    _i1.Session session,
    PostImpression row, {
    _i1.ColumnSelections<PostImpressionTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<PostImpression>(
      row,
      columns: columns?.call(PostImpression.t),
      transaction: transaction,
    );
  }

  /// Updates a single [PostImpression] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<PostImpression?> updateById(
    _i1.Session session,
    int id, {
    required _i1.ColumnValueListBuilder<PostImpressionUpdateTable> columnValues,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateById<PostImpression>(
      id,
      columnValues: columnValues(PostImpression.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [PostImpression]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  Future<List<PostImpression>> updateWhere(
    _i1.Session session, {
    required _i1.ColumnValueListBuilder<PostImpressionUpdateTable> columnValues,
    required _i1.WhereExpressionBuilder<PostImpressionTable> where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<PostImpressionTable>? orderBy,
    _i1.OrderByListBuilder<PostImpressionTable>? orderByList,
    bool orderDescending = false,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateWhere<PostImpression>(
      columnValues: columnValues(PostImpression.t.updateTable),
      where: where(PostImpression.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(PostImpression.t),
      orderByList: orderByList?.call(PostImpression.t),
      orderDescending: orderDescending,
      transaction: transaction,
    );
  }

  /// Deletes all [PostImpression]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<PostImpression>> delete(
    _i1.Session session,
    List<PostImpression> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<PostImpression>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [PostImpression].
  Future<PostImpression> deleteRow(
    _i1.Session session,
    PostImpression row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<PostImpression>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<PostImpression>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<PostImpressionTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<PostImpression>(
      where: where(PostImpression.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<PostImpressionTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<PostImpression>(
      where: where?.call(PostImpression.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

class PostImpressionAttachRowRepository {
  const PostImpressionAttachRowRepository._();

  /// Creates a relation between the given [PostImpression] and [Post]
  /// by setting the [PostImpression]'s foreign key `postId` to refer to the [Post].
  Future<void> post(
    _i1.Session session,
    PostImpression postImpression,
    _i2.Post post, {
    _i1.Transaction? transaction,
  }) async {
    if (postImpression.id == null) {
      throw ArgumentError.notNull('postImpression.id');
    }
    if (post.id == null) {
      throw ArgumentError.notNull('post.id');
    }

    var $postImpression = postImpression.copyWith(postId: post.id);
    await session.db.updateRow<PostImpression>(
      $postImpression,
      columns: [PostImpression.t.postId],
      transaction: transaction,
    );
  }

  /// Creates a relation between the given [PostImpression] and [UserRecord]
  /// by setting the [PostImpression]'s foreign key `viewerId` to refer to the [UserRecord].
  Future<void> viewer(
    _i1.Session session,
    PostImpression postImpression,
    _i3.UserRecord viewer, {
    _i1.Transaction? transaction,
  }) async {
    if (postImpression.id == null) {
      throw ArgumentError.notNull('postImpression.id');
    }
    if (viewer.id == null) {
      throw ArgumentError.notNull('viewer.id');
    }

    var $postImpression = postImpression.copyWith(viewerId: viewer.id);
    await session.db.updateRow<PostImpression>(
      $postImpression,
      columns: [PostImpression.t.viewerId],
      transaction: transaction,
    );
  }
}
