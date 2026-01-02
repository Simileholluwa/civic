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
import '../user/user_record.dart' as _i2;
import '../post/post.dart' as _i3;
import 'package:civic_server/src/generated/protocol.dart' as _i4;

abstract class PostSubscription
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  PostSubscription._({
    this.id,
    required this.userId,
    this.user,
    required this.postId,
    this.post,
    DateTime? createdAt,
  }) : createdAt = createdAt ?? DateTime.now();

  factory PostSubscription({
    int? id,
    required int userId,
    _i2.UserRecord? user,
    required int postId,
    _i3.Post? post,
    DateTime? createdAt,
  }) = _PostSubscriptionImpl;

  factory PostSubscription.fromJson(Map<String, dynamic> jsonSerialization) {
    return PostSubscription(
      id: jsonSerialization['id'] as int?,
      userId: jsonSerialization['userId'] as int,
      user: jsonSerialization['user'] == null
          ? null
          : _i4.Protocol().deserialize<_i2.UserRecord>(
              jsonSerialization['user'],
            ),
      postId: jsonSerialization['postId'] as int,
      post: jsonSerialization['post'] == null
          ? null
          : _i4.Protocol().deserialize<_i3.Post>(jsonSerialization['post']),
      createdAt: jsonSerialization['createdAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
    );
  }

  static final t = PostSubscriptionTable();

  static const db = PostSubscriptionRepository._();

  @override
  int? id;

  int userId;

  _i2.UserRecord? user;

  int postId;

  _i3.Post? post;

  DateTime? createdAt;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [PostSubscription]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  PostSubscription copyWith({
    int? id,
    int? userId,
    _i2.UserRecord? user,
    int? postId,
    _i3.Post? post,
    DateTime? createdAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'PostSubscription',
      if (id != null) 'id': id,
      'userId': userId,
      if (user != null) 'user': user?.toJson(),
      'postId': postId,
      if (post != null) 'post': post?.toJson(),
      if (createdAt != null) 'createdAt': createdAt?.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'PostSubscription',
      if (id != null) 'id': id,
      'userId': userId,
      if (user != null) 'user': user?.toJsonForProtocol(),
      'postId': postId,
      if (post != null) 'post': post?.toJsonForProtocol(),
      if (createdAt != null) 'createdAt': createdAt?.toJson(),
    };
  }

  static PostSubscriptionInclude include({
    _i2.UserRecordInclude? user,
    _i3.PostInclude? post,
  }) {
    return PostSubscriptionInclude._(
      user: user,
      post: post,
    );
  }

  static PostSubscriptionIncludeList includeList({
    _i1.WhereExpressionBuilder<PostSubscriptionTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<PostSubscriptionTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<PostSubscriptionTable>? orderByList,
    PostSubscriptionInclude? include,
  }) {
    return PostSubscriptionIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(PostSubscription.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(PostSubscription.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _PostSubscriptionImpl extends PostSubscription {
  _PostSubscriptionImpl({
    int? id,
    required int userId,
    _i2.UserRecord? user,
    required int postId,
    _i3.Post? post,
    DateTime? createdAt,
  }) : super._(
         id: id,
         userId: userId,
         user: user,
         postId: postId,
         post: post,
         createdAt: createdAt,
       );

  /// Returns a shallow copy of this [PostSubscription]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  PostSubscription copyWith({
    Object? id = _Undefined,
    int? userId,
    Object? user = _Undefined,
    int? postId,
    Object? post = _Undefined,
    Object? createdAt = _Undefined,
  }) {
    return PostSubscription(
      id: id is int? ? id : this.id,
      userId: userId ?? this.userId,
      user: user is _i2.UserRecord? ? user : this.user?.copyWith(),
      postId: postId ?? this.postId,
      post: post is _i3.Post? ? post : this.post?.copyWith(),
      createdAt: createdAt is DateTime? ? createdAt : this.createdAt,
    );
  }
}

class PostSubscriptionUpdateTable
    extends _i1.UpdateTable<PostSubscriptionTable> {
  PostSubscriptionUpdateTable(super.table);

  _i1.ColumnValue<int, int> userId(int value) => _i1.ColumnValue(
    table.userId,
    value,
  );

  _i1.ColumnValue<int, int> postId(int value) => _i1.ColumnValue(
    table.postId,
    value,
  );

  _i1.ColumnValue<DateTime, DateTime> createdAt(DateTime? value) =>
      _i1.ColumnValue(
        table.createdAt,
        value,
      );
}

class PostSubscriptionTable extends _i1.Table<int?> {
  PostSubscriptionTable({super.tableRelation})
    : super(tableName: 'post_subscription') {
    updateTable = PostSubscriptionUpdateTable(this);
    userId = _i1.ColumnInt(
      'userId',
      this,
    );
    postId = _i1.ColumnInt(
      'postId',
      this,
    );
    createdAt = _i1.ColumnDateTime(
      'createdAt',
      this,
      hasDefault: true,
    );
  }

  late final PostSubscriptionUpdateTable updateTable;

  late final _i1.ColumnInt userId;

  _i2.UserRecordTable? _user;

  late final _i1.ColumnInt postId;

  _i3.PostTable? _post;

  late final _i1.ColumnDateTime createdAt;

  _i2.UserRecordTable get user {
    if (_user != null) return _user!;
    _user = _i1.createRelationTable(
      relationFieldName: 'user',
      field: PostSubscription.t.userId,
      foreignField: _i2.UserRecord.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.UserRecordTable(tableRelation: foreignTableRelation),
    );
    return _user!;
  }

  _i3.PostTable get post {
    if (_post != null) return _post!;
    _post = _i1.createRelationTable(
      relationFieldName: 'post',
      field: PostSubscription.t.postId,
      foreignField: _i3.Post.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i3.PostTable(tableRelation: foreignTableRelation),
    );
    return _post!;
  }

  @override
  List<_i1.Column> get columns => [
    id,
    userId,
    postId,
    createdAt,
  ];

  @override
  _i1.Table? getRelationTable(String relationField) {
    if (relationField == 'user') {
      return user;
    }
    if (relationField == 'post') {
      return post;
    }
    return null;
  }
}

class PostSubscriptionInclude extends _i1.IncludeObject {
  PostSubscriptionInclude._({
    _i2.UserRecordInclude? user,
    _i3.PostInclude? post,
  }) {
    _user = user;
    _post = post;
  }

  _i2.UserRecordInclude? _user;

  _i3.PostInclude? _post;

  @override
  Map<String, _i1.Include?> get includes => {
    'user': _user,
    'post': _post,
  };

  @override
  _i1.Table<int?> get table => PostSubscription.t;
}

class PostSubscriptionIncludeList extends _i1.IncludeList {
  PostSubscriptionIncludeList._({
    _i1.WhereExpressionBuilder<PostSubscriptionTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(PostSubscription.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => PostSubscription.t;
}

class PostSubscriptionRepository {
  const PostSubscriptionRepository._();

  final attachRow = const PostSubscriptionAttachRowRepository._();

  /// Returns a list of [PostSubscription]s matching the given query parameters.
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
  Future<List<PostSubscription>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<PostSubscriptionTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<PostSubscriptionTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<PostSubscriptionTable>? orderByList,
    _i1.Transaction? transaction,
    PostSubscriptionInclude? include,
  }) async {
    return session.db.find<PostSubscription>(
      where: where?.call(PostSubscription.t),
      orderBy: orderBy?.call(PostSubscription.t),
      orderByList: orderByList?.call(PostSubscription.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Returns the first matching [PostSubscription] matching the given query parameters.
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
  Future<PostSubscription?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<PostSubscriptionTable>? where,
    int? offset,
    _i1.OrderByBuilder<PostSubscriptionTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<PostSubscriptionTable>? orderByList,
    _i1.Transaction? transaction,
    PostSubscriptionInclude? include,
  }) async {
    return session.db.findFirstRow<PostSubscription>(
      where: where?.call(PostSubscription.t),
      orderBy: orderBy?.call(PostSubscription.t),
      orderByList: orderByList?.call(PostSubscription.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Finds a single [PostSubscription] by its [id] or null if no such row exists.
  Future<PostSubscription?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
    PostSubscriptionInclude? include,
  }) async {
    return session.db.findById<PostSubscription>(
      id,
      transaction: transaction,
      include: include,
    );
  }

  /// Inserts all [PostSubscription]s in the list and returns the inserted rows.
  ///
  /// The returned [PostSubscription]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<PostSubscription>> insert(
    _i1.Session session,
    List<PostSubscription> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<PostSubscription>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [PostSubscription] and returns the inserted row.
  ///
  /// The returned [PostSubscription] will have its `id` field set.
  Future<PostSubscription> insertRow(
    _i1.Session session,
    PostSubscription row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<PostSubscription>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [PostSubscription]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<PostSubscription>> update(
    _i1.Session session,
    List<PostSubscription> rows, {
    _i1.ColumnSelections<PostSubscriptionTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<PostSubscription>(
      rows,
      columns: columns?.call(PostSubscription.t),
      transaction: transaction,
    );
  }

  /// Updates a single [PostSubscription]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<PostSubscription> updateRow(
    _i1.Session session,
    PostSubscription row, {
    _i1.ColumnSelections<PostSubscriptionTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<PostSubscription>(
      row,
      columns: columns?.call(PostSubscription.t),
      transaction: transaction,
    );
  }

  /// Updates a single [PostSubscription] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<PostSubscription?> updateById(
    _i1.Session session,
    int id, {
    required _i1.ColumnValueListBuilder<PostSubscriptionUpdateTable>
    columnValues,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateById<PostSubscription>(
      id,
      columnValues: columnValues(PostSubscription.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [PostSubscription]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  Future<List<PostSubscription>> updateWhere(
    _i1.Session session, {
    required _i1.ColumnValueListBuilder<PostSubscriptionUpdateTable>
    columnValues,
    required _i1.WhereExpressionBuilder<PostSubscriptionTable> where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<PostSubscriptionTable>? orderBy,
    _i1.OrderByListBuilder<PostSubscriptionTable>? orderByList,
    bool orderDescending = false,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateWhere<PostSubscription>(
      columnValues: columnValues(PostSubscription.t.updateTable),
      where: where(PostSubscription.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(PostSubscription.t),
      orderByList: orderByList?.call(PostSubscription.t),
      orderDescending: orderDescending,
      transaction: transaction,
    );
  }

  /// Deletes all [PostSubscription]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<PostSubscription>> delete(
    _i1.Session session,
    List<PostSubscription> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<PostSubscription>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [PostSubscription].
  Future<PostSubscription> deleteRow(
    _i1.Session session,
    PostSubscription row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<PostSubscription>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<PostSubscription>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<PostSubscriptionTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<PostSubscription>(
      where: where(PostSubscription.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<PostSubscriptionTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<PostSubscription>(
      where: where?.call(PostSubscription.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

class PostSubscriptionAttachRowRepository {
  const PostSubscriptionAttachRowRepository._();

  /// Creates a relation between the given [PostSubscription] and [UserRecord]
  /// by setting the [PostSubscription]'s foreign key `userId` to refer to the [UserRecord].
  Future<void> user(
    _i1.Session session,
    PostSubscription postSubscription,
    _i2.UserRecord user, {
    _i1.Transaction? transaction,
  }) async {
    if (postSubscription.id == null) {
      throw ArgumentError.notNull('postSubscription.id');
    }
    if (user.id == null) {
      throw ArgumentError.notNull('user.id');
    }

    var $postSubscription = postSubscription.copyWith(userId: user.id);
    await session.db.updateRow<PostSubscription>(
      $postSubscription,
      columns: [PostSubscription.t.userId],
      transaction: transaction,
    );
  }

  /// Creates a relation between the given [PostSubscription] and [Post]
  /// by setting the [PostSubscription]'s foreign key `postId` to refer to the [Post].
  Future<void> post(
    _i1.Session session,
    PostSubscription postSubscription,
    _i3.Post post, {
    _i1.Transaction? transaction,
  }) async {
    if (postSubscription.id == null) {
      throw ArgumentError.notNull('postSubscription.id');
    }
    if (post.id == null) {
      throw ArgumentError.notNull('post.id');
    }

    var $postSubscription = postSubscription.copyWith(postId: post.id);
    await session.db.updateRow<PostSubscription>(
      $postSubscription,
      columns: [PostSubscription.t.postId],
      transaction: transaction,
    );
  }
}
