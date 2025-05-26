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
import '../user/user_record.dart' as _i2;
import '../post/post.dart' as _i3;

abstract class PostNotInterested
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  PostNotInterested._({
    this.id,
    required this.userId,
    this.user,
    required this.postId,
    this.post,
    DateTime? dateMarked,
  }) : dateMarked = dateMarked ?? DateTime.now();

  factory PostNotInterested({
    int? id,
    required int userId,
    _i2.UserRecord? user,
    required int postId,
    _i3.Post? post,
    DateTime? dateMarked,
  }) = _PostNotInterestedImpl;

  factory PostNotInterested.fromJson(Map<String, dynamic> jsonSerialization) {
    return PostNotInterested(
      id: jsonSerialization['id'] as int?,
      userId: jsonSerialization['userId'] as int,
      user: jsonSerialization['user'] == null
          ? null
          : _i2.UserRecord.fromJson(
              (jsonSerialization['user'] as Map<String, dynamic>)),
      postId: jsonSerialization['postId'] as int,
      post: jsonSerialization['post'] == null
          ? null
          : _i3.Post.fromJson(
              (jsonSerialization['post'] as Map<String, dynamic>)),
      dateMarked: jsonSerialization['dateMarked'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['dateMarked']),
    );
  }

  static final t = PostNotInterestedTable();

  static const db = PostNotInterestedRepository._();

  @override
  int? id;

  int userId;

  _i2.UserRecord? user;

  int postId;

  _i3.Post? post;

  DateTime? dateMarked;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [PostNotInterested]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  PostNotInterested copyWith({
    int? id,
    int? userId,
    _i2.UserRecord? user,
    int? postId,
    _i3.Post? post,
    DateTime? dateMarked,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'userId': userId,
      if (user != null) 'user': user?.toJson(),
      'postId': postId,
      if (post != null) 'post': post?.toJson(),
      if (dateMarked != null) 'dateMarked': dateMarked?.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'userId': userId,
      if (user != null) 'user': user?.toJsonForProtocol(),
      'postId': postId,
      if (post != null) 'post': post?.toJsonForProtocol(),
      if (dateMarked != null) 'dateMarked': dateMarked?.toJson(),
    };
  }

  static PostNotInterestedInclude include({
    _i2.UserRecordInclude? user,
    _i3.PostInclude? post,
  }) {
    return PostNotInterestedInclude._(
      user: user,
      post: post,
    );
  }

  static PostNotInterestedIncludeList includeList({
    _i1.WhereExpressionBuilder<PostNotInterestedTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<PostNotInterestedTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<PostNotInterestedTable>? orderByList,
    PostNotInterestedInclude? include,
  }) {
    return PostNotInterestedIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(PostNotInterested.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(PostNotInterested.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _PostNotInterestedImpl extends PostNotInterested {
  _PostNotInterestedImpl({
    int? id,
    required int userId,
    _i2.UserRecord? user,
    required int postId,
    _i3.Post? post,
    DateTime? dateMarked,
  }) : super._(
          id: id,
          userId: userId,
          user: user,
          postId: postId,
          post: post,
          dateMarked: dateMarked,
        );

  /// Returns a shallow copy of this [PostNotInterested]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  PostNotInterested copyWith({
    Object? id = _Undefined,
    int? userId,
    Object? user = _Undefined,
    int? postId,
    Object? post = _Undefined,
    Object? dateMarked = _Undefined,
  }) {
    return PostNotInterested(
      id: id is int? ? id : this.id,
      userId: userId ?? this.userId,
      user: user is _i2.UserRecord? ? user : this.user?.copyWith(),
      postId: postId ?? this.postId,
      post: post is _i3.Post? ? post : this.post?.copyWith(),
      dateMarked: dateMarked is DateTime? ? dateMarked : this.dateMarked,
    );
  }
}

class PostNotInterestedTable extends _i1.Table<int?> {
  PostNotInterestedTable({super.tableRelation})
      : super(tableName: 'post_not_interested') {
    userId = _i1.ColumnInt(
      'userId',
      this,
    );
    postId = _i1.ColumnInt(
      'postId',
      this,
    );
    dateMarked = _i1.ColumnDateTime(
      'dateMarked',
      this,
      hasDefault: true,
    );
  }

  late final _i1.ColumnInt userId;

  _i2.UserRecordTable? _user;

  late final _i1.ColumnInt postId;

  _i3.PostTable? _post;

  late final _i1.ColumnDateTime dateMarked;

  _i2.UserRecordTable get user {
    if (_user != null) return _user!;
    _user = _i1.createRelationTable(
      relationFieldName: 'user',
      field: PostNotInterested.t.userId,
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
      field: PostNotInterested.t.postId,
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
        dateMarked,
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

class PostNotInterestedInclude extends _i1.IncludeObject {
  PostNotInterestedInclude._({
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
  _i1.Table<int?> get table => PostNotInterested.t;
}

class PostNotInterestedIncludeList extends _i1.IncludeList {
  PostNotInterestedIncludeList._({
    _i1.WhereExpressionBuilder<PostNotInterestedTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(PostNotInterested.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => PostNotInterested.t;
}

class PostNotInterestedRepository {
  const PostNotInterestedRepository._();

  final attachRow = const PostNotInterestedAttachRowRepository._();

  /// Returns a list of [PostNotInterested]s matching the given query parameters.
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
  Future<List<PostNotInterested>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<PostNotInterestedTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<PostNotInterestedTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<PostNotInterestedTable>? orderByList,
    _i1.Transaction? transaction,
    PostNotInterestedInclude? include,
  }) async {
    return session.db.find<PostNotInterested>(
      where: where?.call(PostNotInterested.t),
      orderBy: orderBy?.call(PostNotInterested.t),
      orderByList: orderByList?.call(PostNotInterested.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Returns the first matching [PostNotInterested] matching the given query parameters.
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
  Future<PostNotInterested?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<PostNotInterestedTable>? where,
    int? offset,
    _i1.OrderByBuilder<PostNotInterestedTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<PostNotInterestedTable>? orderByList,
    _i1.Transaction? transaction,
    PostNotInterestedInclude? include,
  }) async {
    return session.db.findFirstRow<PostNotInterested>(
      where: where?.call(PostNotInterested.t),
      orderBy: orderBy?.call(PostNotInterested.t),
      orderByList: orderByList?.call(PostNotInterested.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Finds a single [PostNotInterested] by its [id] or null if no such row exists.
  Future<PostNotInterested?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
    PostNotInterestedInclude? include,
  }) async {
    return session.db.findById<PostNotInterested>(
      id,
      transaction: transaction,
      include: include,
    );
  }

  /// Inserts all [PostNotInterested]s in the list and returns the inserted rows.
  ///
  /// The returned [PostNotInterested]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<PostNotInterested>> insert(
    _i1.Session session,
    List<PostNotInterested> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<PostNotInterested>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [PostNotInterested] and returns the inserted row.
  ///
  /// The returned [PostNotInterested] will have its `id` field set.
  Future<PostNotInterested> insertRow(
    _i1.Session session,
    PostNotInterested row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<PostNotInterested>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [PostNotInterested]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<PostNotInterested>> update(
    _i1.Session session,
    List<PostNotInterested> rows, {
    _i1.ColumnSelections<PostNotInterestedTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<PostNotInterested>(
      rows,
      columns: columns?.call(PostNotInterested.t),
      transaction: transaction,
    );
  }

  /// Updates a single [PostNotInterested]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<PostNotInterested> updateRow(
    _i1.Session session,
    PostNotInterested row, {
    _i1.ColumnSelections<PostNotInterestedTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<PostNotInterested>(
      row,
      columns: columns?.call(PostNotInterested.t),
      transaction: transaction,
    );
  }

  /// Deletes all [PostNotInterested]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<PostNotInterested>> delete(
    _i1.Session session,
    List<PostNotInterested> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<PostNotInterested>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [PostNotInterested].
  Future<PostNotInterested> deleteRow(
    _i1.Session session,
    PostNotInterested row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<PostNotInterested>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<PostNotInterested>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<PostNotInterestedTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<PostNotInterested>(
      where: where(PostNotInterested.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<PostNotInterestedTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<PostNotInterested>(
      where: where?.call(PostNotInterested.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

class PostNotInterestedAttachRowRepository {
  const PostNotInterestedAttachRowRepository._();

  /// Creates a relation between the given [PostNotInterested] and [UserRecord]
  /// by setting the [PostNotInterested]'s foreign key `userId` to refer to the [UserRecord].
  Future<void> user(
    _i1.Session session,
    PostNotInterested postNotInterested,
    _i2.UserRecord user, {
    _i1.Transaction? transaction,
  }) async {
    if (postNotInterested.id == null) {
      throw ArgumentError.notNull('postNotInterested.id');
    }
    if (user.id == null) {
      throw ArgumentError.notNull('user.id');
    }

    var $postNotInterested = postNotInterested.copyWith(userId: user.id);
    await session.db.updateRow<PostNotInterested>(
      $postNotInterested,
      columns: [PostNotInterested.t.userId],
      transaction: transaction,
    );
  }

  /// Creates a relation between the given [PostNotInterested] and [Post]
  /// by setting the [PostNotInterested]'s foreign key `postId` to refer to the [Post].
  Future<void> post(
    _i1.Session session,
    PostNotInterested postNotInterested,
    _i3.Post post, {
    _i1.Transaction? transaction,
  }) async {
    if (postNotInterested.id == null) {
      throw ArgumentError.notNull('postNotInterested.id');
    }
    if (post.id == null) {
      throw ArgumentError.notNull('post.id');
    }

    var $postNotInterested = postNotInterested.copyWith(postId: post.id);
    await session.db.updateRow<PostNotInterested>(
      $postNotInterested,
      columns: [PostNotInterested.t.postId],
      transaction: transaction,
    );
  }
}
