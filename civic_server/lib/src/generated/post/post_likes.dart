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

abstract class PostLikes
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  PostLikes._({
    this.id,
    required this.postId,
    this.post,
    required this.ownerId,
    this.owner,
    this.dateCreated,
  });

  factory PostLikes({
    int? id,
    required int postId,
    _i2.Post? post,
    required int ownerId,
    _i3.UserRecord? owner,
    DateTime? dateCreated,
  }) = _PostLikesImpl;

  factory PostLikes.fromJson(Map<String, dynamic> jsonSerialization) {
    return PostLikes(
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
      dateCreated: jsonSerialization['dateCreated'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(
              jsonSerialization['dateCreated'],
            ),
    );
  }

  static final t = PostLikesTable();

  static const db = PostLikesRepository._();

  @override
  int? id;

  int postId;

  _i2.Post? post;

  int ownerId;

  _i3.UserRecord? owner;

  DateTime? dateCreated;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [PostLikes]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  PostLikes copyWith({
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
      '__className__': 'PostLikes',
      if (id != null) 'id': id,
      'postId': postId,
      if (post != null) 'post': post?.toJson(),
      'ownerId': ownerId,
      if (owner != null) 'owner': owner?.toJson(),
      if (dateCreated != null) 'dateCreated': dateCreated?.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'PostLikes',
      if (id != null) 'id': id,
      'postId': postId,
      if (post != null) 'post': post?.toJsonForProtocol(),
      'ownerId': ownerId,
      if (owner != null) 'owner': owner?.toJsonForProtocol(),
      if (dateCreated != null) 'dateCreated': dateCreated?.toJson(),
    };
  }

  static PostLikesInclude include({
    _i2.PostInclude? post,
    _i3.UserRecordInclude? owner,
  }) {
    return PostLikesInclude._(
      post: post,
      owner: owner,
    );
  }

  static PostLikesIncludeList includeList({
    _i1.WhereExpressionBuilder<PostLikesTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<PostLikesTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<PostLikesTable>? orderByList,
    PostLikesInclude? include,
  }) {
    return PostLikesIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(PostLikes.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(PostLikes.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _PostLikesImpl extends PostLikes {
  _PostLikesImpl({
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

  /// Returns a shallow copy of this [PostLikes]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  PostLikes copyWith({
    Object? id = _Undefined,
    int? postId,
    Object? post = _Undefined,
    int? ownerId,
    Object? owner = _Undefined,
    Object? dateCreated = _Undefined,
  }) {
    return PostLikes(
      id: id is int? ? id : this.id,
      postId: postId ?? this.postId,
      post: post is _i2.Post? ? post : this.post?.copyWith(),
      ownerId: ownerId ?? this.ownerId,
      owner: owner is _i3.UserRecord? ? owner : this.owner?.copyWith(),
      dateCreated: dateCreated is DateTime? ? dateCreated : this.dateCreated,
    );
  }
}

class PostLikesUpdateTable extends _i1.UpdateTable<PostLikesTable> {
  PostLikesUpdateTable(super.table);

  _i1.ColumnValue<int, int> postId(int value) => _i1.ColumnValue(
    table.postId,
    value,
  );

  _i1.ColumnValue<int, int> ownerId(int value) => _i1.ColumnValue(
    table.ownerId,
    value,
  );

  _i1.ColumnValue<DateTime, DateTime> dateCreated(DateTime? value) =>
      _i1.ColumnValue(
        table.dateCreated,
        value,
      );
}

class PostLikesTable extends _i1.Table<int?> {
  PostLikesTable({super.tableRelation}) : super(tableName: 'post_likes') {
    updateTable = PostLikesUpdateTable(this);
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
    );
  }

  late final PostLikesUpdateTable updateTable;

  late final _i1.ColumnInt postId;

  _i2.PostTable? _post;

  late final _i1.ColumnInt ownerId;

  _i3.UserRecordTable? _owner;

  late final _i1.ColumnDateTime dateCreated;

  _i2.PostTable get post {
    if (_post != null) return _post!;
    _post = _i1.createRelationTable(
      relationFieldName: 'post',
      field: PostLikes.t.postId,
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
      field: PostLikes.t.ownerId,
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

class PostLikesInclude extends _i1.IncludeObject {
  PostLikesInclude._({
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
  _i1.Table<int?> get table => PostLikes.t;
}

class PostLikesIncludeList extends _i1.IncludeList {
  PostLikesIncludeList._({
    _i1.WhereExpressionBuilder<PostLikesTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(PostLikes.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => PostLikes.t;
}

class PostLikesRepository {
  const PostLikesRepository._();

  final attachRow = const PostLikesAttachRowRepository._();

  /// Returns a list of [PostLikes]s matching the given query parameters.
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
  Future<List<PostLikes>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<PostLikesTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<PostLikesTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<PostLikesTable>? orderByList,
    _i1.Transaction? transaction,
    PostLikesInclude? include,
  }) async {
    return session.db.find<PostLikes>(
      where: where?.call(PostLikes.t),
      orderBy: orderBy?.call(PostLikes.t),
      orderByList: orderByList?.call(PostLikes.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Returns the first matching [PostLikes] matching the given query parameters.
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
  Future<PostLikes?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<PostLikesTable>? where,
    int? offset,
    _i1.OrderByBuilder<PostLikesTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<PostLikesTable>? orderByList,
    _i1.Transaction? transaction,
    PostLikesInclude? include,
  }) async {
    return session.db.findFirstRow<PostLikes>(
      where: where?.call(PostLikes.t),
      orderBy: orderBy?.call(PostLikes.t),
      orderByList: orderByList?.call(PostLikes.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Finds a single [PostLikes] by its [id] or null if no such row exists.
  Future<PostLikes?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
    PostLikesInclude? include,
  }) async {
    return session.db.findById<PostLikes>(
      id,
      transaction: transaction,
      include: include,
    );
  }

  /// Inserts all [PostLikes]s in the list and returns the inserted rows.
  ///
  /// The returned [PostLikes]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<PostLikes>> insert(
    _i1.Session session,
    List<PostLikes> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<PostLikes>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [PostLikes] and returns the inserted row.
  ///
  /// The returned [PostLikes] will have its `id` field set.
  Future<PostLikes> insertRow(
    _i1.Session session,
    PostLikes row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<PostLikes>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [PostLikes]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<PostLikes>> update(
    _i1.Session session,
    List<PostLikes> rows, {
    _i1.ColumnSelections<PostLikesTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<PostLikes>(
      rows,
      columns: columns?.call(PostLikes.t),
      transaction: transaction,
    );
  }

  /// Updates a single [PostLikes]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<PostLikes> updateRow(
    _i1.Session session,
    PostLikes row, {
    _i1.ColumnSelections<PostLikesTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<PostLikes>(
      row,
      columns: columns?.call(PostLikes.t),
      transaction: transaction,
    );
  }

  /// Updates a single [PostLikes] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<PostLikes?> updateById(
    _i1.Session session,
    int id, {
    required _i1.ColumnValueListBuilder<PostLikesUpdateTable> columnValues,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateById<PostLikes>(
      id,
      columnValues: columnValues(PostLikes.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [PostLikes]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  Future<List<PostLikes>> updateWhere(
    _i1.Session session, {
    required _i1.ColumnValueListBuilder<PostLikesUpdateTable> columnValues,
    required _i1.WhereExpressionBuilder<PostLikesTable> where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<PostLikesTable>? orderBy,
    _i1.OrderByListBuilder<PostLikesTable>? orderByList,
    bool orderDescending = false,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateWhere<PostLikes>(
      columnValues: columnValues(PostLikes.t.updateTable),
      where: where(PostLikes.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(PostLikes.t),
      orderByList: orderByList?.call(PostLikes.t),
      orderDescending: orderDescending,
      transaction: transaction,
    );
  }

  /// Deletes all [PostLikes]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<PostLikes>> delete(
    _i1.Session session,
    List<PostLikes> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<PostLikes>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [PostLikes].
  Future<PostLikes> deleteRow(
    _i1.Session session,
    PostLikes row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<PostLikes>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<PostLikes>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<PostLikesTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<PostLikes>(
      where: where(PostLikes.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<PostLikesTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<PostLikes>(
      where: where?.call(PostLikes.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

class PostLikesAttachRowRepository {
  const PostLikesAttachRowRepository._();

  /// Creates a relation between the given [PostLikes] and [Post]
  /// by setting the [PostLikes]'s foreign key `postId` to refer to the [Post].
  Future<void> post(
    _i1.Session session,
    PostLikes postLikes,
    _i2.Post post, {
    _i1.Transaction? transaction,
  }) async {
    if (postLikes.id == null) {
      throw ArgumentError.notNull('postLikes.id');
    }
    if (post.id == null) {
      throw ArgumentError.notNull('post.id');
    }

    var $postLikes = postLikes.copyWith(postId: post.id);
    await session.db.updateRow<PostLikes>(
      $postLikes,
      columns: [PostLikes.t.postId],
      transaction: transaction,
    );
  }

  /// Creates a relation between the given [PostLikes] and [UserRecord]
  /// by setting the [PostLikes]'s foreign key `ownerId` to refer to the [UserRecord].
  Future<void> owner(
    _i1.Session session,
    PostLikes postLikes,
    _i3.UserRecord owner, {
    _i1.Transaction? transaction,
  }) async {
    if (postLikes.id == null) {
      throw ArgumentError.notNull('postLikes.id');
    }
    if (owner.id == null) {
      throw ArgumentError.notNull('owner.id');
    }

    var $postLikes = postLikes.copyWith(ownerId: owner.id);
    await session.db.updateRow<PostLikes>(
      $postLikes,
      columns: [PostLikes.t.ownerId],
      transaction: transaction,
    );
  }
}
