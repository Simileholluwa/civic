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

abstract class PostReposts
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  PostReposts._({
    this.id,
    required this.postId,
    this.post,
    required this.ownerId,
    this.owner,
    DateTime? dateCreated,
  }) : dateCreated = dateCreated ?? DateTime.now();

  factory PostReposts({
    int? id,
    required int postId,
    _i2.Post? post,
    required int ownerId,
    _i3.UserRecord? owner,
    DateTime? dateCreated,
  }) = _PostRepostsImpl;

  factory PostReposts.fromJson(Map<String, dynamic> jsonSerialization) {
    return PostReposts(
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

  static final t = PostRepostsTable();

  static const db = PostRepostsRepository._();

  @override
  int? id;

  int postId;

  _i2.Post? post;

  int ownerId;

  _i3.UserRecord? owner;

  DateTime dateCreated;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [PostReposts]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  PostReposts copyWith({
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
      '__className__': 'PostReposts',
      if (id != null) 'id': id,
      'postId': postId,
      if (post != null) 'post': post?.toJson(),
      'ownerId': ownerId,
      if (owner != null) 'owner': owner?.toJson(),
      'dateCreated': dateCreated.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'PostReposts',
      if (id != null) 'id': id,
      'postId': postId,
      if (post != null) 'post': post?.toJsonForProtocol(),
      'ownerId': ownerId,
      if (owner != null) 'owner': owner?.toJsonForProtocol(),
      'dateCreated': dateCreated.toJson(),
    };
  }

  static PostRepostsInclude include({
    _i2.PostInclude? post,
    _i3.UserRecordInclude? owner,
  }) {
    return PostRepostsInclude._(
      post: post,
      owner: owner,
    );
  }

  static PostRepostsIncludeList includeList({
    _i1.WhereExpressionBuilder<PostRepostsTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<PostRepostsTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<PostRepostsTable>? orderByList,
    PostRepostsInclude? include,
  }) {
    return PostRepostsIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(PostReposts.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(PostReposts.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _PostRepostsImpl extends PostReposts {
  _PostRepostsImpl({
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

  /// Returns a shallow copy of this [PostReposts]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  PostReposts copyWith({
    Object? id = _Undefined,
    int? postId,
    Object? post = _Undefined,
    int? ownerId,
    Object? owner = _Undefined,
    DateTime? dateCreated,
  }) {
    return PostReposts(
      id: id is int? ? id : this.id,
      postId: postId ?? this.postId,
      post: post is _i2.Post? ? post : this.post?.copyWith(),
      ownerId: ownerId ?? this.ownerId,
      owner: owner is _i3.UserRecord? ? owner : this.owner?.copyWith(),
      dateCreated: dateCreated ?? this.dateCreated,
    );
  }
}

class PostRepostsUpdateTable extends _i1.UpdateTable<PostRepostsTable> {
  PostRepostsUpdateTable(super.table);

  _i1.ColumnValue<int, int> postId(int value) => _i1.ColumnValue(
    table.postId,
    value,
  );

  _i1.ColumnValue<int, int> ownerId(int value) => _i1.ColumnValue(
    table.ownerId,
    value,
  );

  _i1.ColumnValue<DateTime, DateTime> dateCreated(DateTime value) =>
      _i1.ColumnValue(
        table.dateCreated,
        value,
      );
}

class PostRepostsTable extends _i1.Table<int?> {
  PostRepostsTable({super.tableRelation}) : super(tableName: 'post_reposts') {
    updateTable = PostRepostsUpdateTable(this);
    postId = _i1.ColumnInt(
      'postId',
      this,
    );
    ownerId = _i1.ColumnInt(
      'ownerId',
      this,
    );
    dateCreated = _i1.ColumnDateTime(
      'dateCreated',
      this,
      hasDefault: true,
    );
  }

  late final PostRepostsUpdateTable updateTable;

  late final _i1.ColumnInt postId;

  _i2.PostTable? _post;

  late final _i1.ColumnInt ownerId;

  _i3.UserRecordTable? _owner;

  late final _i1.ColumnDateTime dateCreated;

  _i2.PostTable get post {
    if (_post != null) return _post!;
    _post = _i1.createRelationTable(
      relationFieldName: 'post',
      field: PostReposts.t.postId,
      foreignField: _i2.Post.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.PostTable(tableRelation: foreignTableRelation),
    );
    return _post!;
  }

  _i3.UserRecordTable get owner {
    if (_owner != null) return _owner!;
    _owner = _i1.createRelationTable(
      relationFieldName: 'owner',
      field: PostReposts.t.ownerId,
      foreignField: _i3.UserRecord.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i3.UserRecordTable(tableRelation: foreignTableRelation),
    );
    return _owner!;
  }

  @override
  List<_i1.Column> get columns => [
    id,
    postId,
    ownerId,
    dateCreated,
  ];

  @override
  _i1.Table? getRelationTable(String relationField) {
    if (relationField == 'post') {
      return post;
    }
    if (relationField == 'owner') {
      return owner;
    }
    return null;
  }
}

class PostRepostsInclude extends _i1.IncludeObject {
  PostRepostsInclude._({
    _i2.PostInclude? post,
    _i3.UserRecordInclude? owner,
  }) {
    _post = post;
    _owner = owner;
  }

  _i2.PostInclude? _post;

  _i3.UserRecordInclude? _owner;

  @override
  Map<String, _i1.Include?> get includes => {
    'post': _post,
    'owner': _owner,
  };

  @override
  _i1.Table<int?> get table => PostReposts.t;
}

class PostRepostsIncludeList extends _i1.IncludeList {
  PostRepostsIncludeList._({
    _i1.WhereExpressionBuilder<PostRepostsTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(PostReposts.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => PostReposts.t;
}

class PostRepostsRepository {
  const PostRepostsRepository._();

  final attachRow = const PostRepostsAttachRowRepository._();

  /// Returns a list of [PostReposts]s matching the given query parameters.
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
  Future<List<PostReposts>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<PostRepostsTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<PostRepostsTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<PostRepostsTable>? orderByList,
    _i1.Transaction? transaction,
    PostRepostsInclude? include,
  }) async {
    return session.db.find<PostReposts>(
      where: where?.call(PostReposts.t),
      orderBy: orderBy?.call(PostReposts.t),
      orderByList: orderByList?.call(PostReposts.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Returns the first matching [PostReposts] matching the given query parameters.
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
  Future<PostReposts?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<PostRepostsTable>? where,
    int? offset,
    _i1.OrderByBuilder<PostRepostsTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<PostRepostsTable>? orderByList,
    _i1.Transaction? transaction,
    PostRepostsInclude? include,
  }) async {
    return session.db.findFirstRow<PostReposts>(
      where: where?.call(PostReposts.t),
      orderBy: orderBy?.call(PostReposts.t),
      orderByList: orderByList?.call(PostReposts.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Finds a single [PostReposts] by its [id] or null if no such row exists.
  Future<PostReposts?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
    PostRepostsInclude? include,
  }) async {
    return session.db.findById<PostReposts>(
      id,
      transaction: transaction,
      include: include,
    );
  }

  /// Inserts all [PostReposts]s in the list and returns the inserted rows.
  ///
  /// The returned [PostReposts]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<PostReposts>> insert(
    _i1.Session session,
    List<PostReposts> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<PostReposts>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [PostReposts] and returns the inserted row.
  ///
  /// The returned [PostReposts] will have its `id` field set.
  Future<PostReposts> insertRow(
    _i1.Session session,
    PostReposts row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<PostReposts>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [PostReposts]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<PostReposts>> update(
    _i1.Session session,
    List<PostReposts> rows, {
    _i1.ColumnSelections<PostRepostsTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<PostReposts>(
      rows,
      columns: columns?.call(PostReposts.t),
      transaction: transaction,
    );
  }

  /// Updates a single [PostReposts]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<PostReposts> updateRow(
    _i1.Session session,
    PostReposts row, {
    _i1.ColumnSelections<PostRepostsTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<PostReposts>(
      row,
      columns: columns?.call(PostReposts.t),
      transaction: transaction,
    );
  }

  /// Updates a single [PostReposts] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<PostReposts?> updateById(
    _i1.Session session,
    int id, {
    required _i1.ColumnValueListBuilder<PostRepostsUpdateTable> columnValues,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateById<PostReposts>(
      id,
      columnValues: columnValues(PostReposts.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [PostReposts]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  Future<List<PostReposts>> updateWhere(
    _i1.Session session, {
    required _i1.ColumnValueListBuilder<PostRepostsUpdateTable> columnValues,
    required _i1.WhereExpressionBuilder<PostRepostsTable> where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<PostRepostsTable>? orderBy,
    _i1.OrderByListBuilder<PostRepostsTable>? orderByList,
    bool orderDescending = false,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateWhere<PostReposts>(
      columnValues: columnValues(PostReposts.t.updateTable),
      where: where(PostReposts.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(PostReposts.t),
      orderByList: orderByList?.call(PostReposts.t),
      orderDescending: orderDescending,
      transaction: transaction,
    );
  }

  /// Deletes all [PostReposts]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<PostReposts>> delete(
    _i1.Session session,
    List<PostReposts> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<PostReposts>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [PostReposts].
  Future<PostReposts> deleteRow(
    _i1.Session session,
    PostReposts row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<PostReposts>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<PostReposts>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<PostRepostsTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<PostReposts>(
      where: where(PostReposts.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<PostRepostsTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<PostReposts>(
      where: where?.call(PostReposts.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

class PostRepostsAttachRowRepository {
  const PostRepostsAttachRowRepository._();

  /// Creates a relation between the given [PostReposts] and [Post]
  /// by setting the [PostReposts]'s foreign key `postId` to refer to the [Post].
  Future<void> post(
    _i1.Session session,
    PostReposts postReposts,
    _i2.Post post, {
    _i1.Transaction? transaction,
  }) async {
    if (postReposts.id == null) {
      throw ArgumentError.notNull('postReposts.id');
    }
    if (post.id == null) {
      throw ArgumentError.notNull('post.id');
    }

    var $postReposts = postReposts.copyWith(postId: post.id);
    await session.db.updateRow<PostReposts>(
      $postReposts,
      columns: [PostReposts.t.postId],
      transaction: transaction,
    );
  }

  /// Creates a relation between the given [PostReposts] and [UserRecord]
  /// by setting the [PostReposts]'s foreign key `ownerId` to refer to the [UserRecord].
  Future<void> owner(
    _i1.Session session,
    PostReposts postReposts,
    _i3.UserRecord owner, {
    _i1.Transaction? transaction,
  }) async {
    if (postReposts.id == null) {
      throw ArgumentError.notNull('postReposts.id');
    }
    if (owner.id == null) {
      throw ArgumentError.notNull('owner.id');
    }

    var $postReposts = postReposts.copyWith(ownerId: owner.id);
    await session.db.updateRow<PostReposts>(
      $postReposts,
      columns: [PostReposts.t.ownerId],
      transaction: transaction,
    );
  }
}
