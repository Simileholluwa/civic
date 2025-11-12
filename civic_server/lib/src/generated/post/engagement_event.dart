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

abstract class EngagementEvent
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  EngagementEvent._({
    this.id,
    required this.userId,
    this.user,
    required this.postId,
    this.post,
    required this.type,
    DateTime? createdAt,
  }) : createdAt = createdAt ?? DateTime.now();

  factory EngagementEvent({
    int? id,
    required int userId,
    _i2.UserRecord? user,
    required int postId,
    _i3.Post? post,
    required String type,
    DateTime? createdAt,
  }) = _EngagementEventImpl;

  factory EngagementEvent.fromJson(Map<String, dynamic> jsonSerialization) {
    return EngagementEvent(
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
      type: jsonSerialization['type'] as String,
      createdAt: jsonSerialization['createdAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
    );
  }

  static final t = EngagementEventTable();

  static const db = EngagementEventRepository._();

  @override
  int? id;

  int userId;

  _i2.UserRecord? user;

  int postId;

  _i3.Post? post;

  String type;

  DateTime? createdAt;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [EngagementEvent]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  EngagementEvent copyWith({
    int? id,
    int? userId,
    _i2.UserRecord? user,
    int? postId,
    _i3.Post? post,
    String? type,
    DateTime? createdAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'userId': userId,
      if (user != null) 'user': user?.toJson(),
      'postId': postId,
      if (post != null) 'post': post?.toJson(),
      'type': type,
      if (createdAt != null) 'createdAt': createdAt?.toJson(),
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
      'type': type,
      if (createdAt != null) 'createdAt': createdAt?.toJson(),
    };
  }

  static EngagementEventInclude include({
    _i2.UserRecordInclude? user,
    _i3.PostInclude? post,
  }) {
    return EngagementEventInclude._(
      user: user,
      post: post,
    );
  }

  static EngagementEventIncludeList includeList({
    _i1.WhereExpressionBuilder<EngagementEventTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<EngagementEventTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<EngagementEventTable>? orderByList,
    EngagementEventInclude? include,
  }) {
    return EngagementEventIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(EngagementEvent.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(EngagementEvent.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _EngagementEventImpl extends EngagementEvent {
  _EngagementEventImpl({
    int? id,
    required int userId,
    _i2.UserRecord? user,
    required int postId,
    _i3.Post? post,
    required String type,
    DateTime? createdAt,
  }) : super._(
          id: id,
          userId: userId,
          user: user,
          postId: postId,
          post: post,
          type: type,
          createdAt: createdAt,
        );

  /// Returns a shallow copy of this [EngagementEvent]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  EngagementEvent copyWith({
    Object? id = _Undefined,
    int? userId,
    Object? user = _Undefined,
    int? postId,
    Object? post = _Undefined,
    String? type,
    Object? createdAt = _Undefined,
  }) {
    return EngagementEvent(
      id: id is int? ? id : this.id,
      userId: userId ?? this.userId,
      user: user is _i2.UserRecord? ? user : this.user?.copyWith(),
      postId: postId ?? this.postId,
      post: post is _i3.Post? ? post : this.post?.copyWith(),
      type: type ?? this.type,
      createdAt: createdAt is DateTime? ? createdAt : this.createdAt,
    );
  }
}

class EngagementEventTable extends _i1.Table<int?> {
  EngagementEventTable({super.tableRelation})
      : super(tableName: 'engagement_event') {
    userId = _i1.ColumnInt(
      'userId',
      this,
    );
    postId = _i1.ColumnInt(
      'postId',
      this,
    );
    type = _i1.ColumnString(
      'type',
      this,
    );
    createdAt = _i1.ColumnDateTime(
      'createdAt',
      this,
      hasDefault: true,
    );
  }

  late final _i1.ColumnInt userId;

  _i2.UserRecordTable? _user;

  late final _i1.ColumnInt postId;

  _i3.PostTable? _post;

  late final _i1.ColumnString type;

  late final _i1.ColumnDateTime createdAt;

  _i2.UserRecordTable get user {
    if (_user != null) return _user!;
    _user = _i1.createRelationTable(
      relationFieldName: 'user',
      field: EngagementEvent.t.userId,
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
      field: EngagementEvent.t.postId,
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
        type,
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

class EngagementEventInclude extends _i1.IncludeObject {
  EngagementEventInclude._({
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
  _i1.Table<int?> get table => EngagementEvent.t;
}

class EngagementEventIncludeList extends _i1.IncludeList {
  EngagementEventIncludeList._({
    _i1.WhereExpressionBuilder<EngagementEventTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(EngagementEvent.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => EngagementEvent.t;
}

class EngagementEventRepository {
  const EngagementEventRepository._();

  final attachRow = const EngagementEventAttachRowRepository._();

  /// Returns a list of [EngagementEvent]s matching the given query parameters.
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
  Future<List<EngagementEvent>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<EngagementEventTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<EngagementEventTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<EngagementEventTable>? orderByList,
    _i1.Transaction? transaction,
    EngagementEventInclude? include,
  }) async {
    return session.db.find<EngagementEvent>(
      where: where?.call(EngagementEvent.t),
      orderBy: orderBy?.call(EngagementEvent.t),
      orderByList: orderByList?.call(EngagementEvent.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Returns the first matching [EngagementEvent] matching the given query parameters.
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
  Future<EngagementEvent?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<EngagementEventTable>? where,
    int? offset,
    _i1.OrderByBuilder<EngagementEventTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<EngagementEventTable>? orderByList,
    _i1.Transaction? transaction,
    EngagementEventInclude? include,
  }) async {
    return session.db.findFirstRow<EngagementEvent>(
      where: where?.call(EngagementEvent.t),
      orderBy: orderBy?.call(EngagementEvent.t),
      orderByList: orderByList?.call(EngagementEvent.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Finds a single [EngagementEvent] by its [id] or null if no such row exists.
  Future<EngagementEvent?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
    EngagementEventInclude? include,
  }) async {
    return session.db.findById<EngagementEvent>(
      id,
      transaction: transaction,
      include: include,
    );
  }

  /// Inserts all [EngagementEvent]s in the list and returns the inserted rows.
  ///
  /// The returned [EngagementEvent]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<EngagementEvent>> insert(
    _i1.Session session,
    List<EngagementEvent> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<EngagementEvent>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [EngagementEvent] and returns the inserted row.
  ///
  /// The returned [EngagementEvent] will have its `id` field set.
  Future<EngagementEvent> insertRow(
    _i1.Session session,
    EngagementEvent row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<EngagementEvent>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [EngagementEvent]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<EngagementEvent>> update(
    _i1.Session session,
    List<EngagementEvent> rows, {
    _i1.ColumnSelections<EngagementEventTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<EngagementEvent>(
      rows,
      columns: columns?.call(EngagementEvent.t),
      transaction: transaction,
    );
  }

  /// Updates a single [EngagementEvent]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<EngagementEvent> updateRow(
    _i1.Session session,
    EngagementEvent row, {
    _i1.ColumnSelections<EngagementEventTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<EngagementEvent>(
      row,
      columns: columns?.call(EngagementEvent.t),
      transaction: transaction,
    );
  }

  /// Deletes all [EngagementEvent]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<EngagementEvent>> delete(
    _i1.Session session,
    List<EngagementEvent> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<EngagementEvent>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [EngagementEvent].
  Future<EngagementEvent> deleteRow(
    _i1.Session session,
    EngagementEvent row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<EngagementEvent>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<EngagementEvent>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<EngagementEventTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<EngagementEvent>(
      where: where(EngagementEvent.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<EngagementEventTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<EngagementEvent>(
      where: where?.call(EngagementEvent.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

class EngagementEventAttachRowRepository {
  const EngagementEventAttachRowRepository._();

  /// Creates a relation between the given [EngagementEvent] and [UserRecord]
  /// by setting the [EngagementEvent]'s foreign key `userId` to refer to the [UserRecord].
  Future<void> user(
    _i1.Session session,
    EngagementEvent engagementEvent,
    _i2.UserRecord user, {
    _i1.Transaction? transaction,
  }) async {
    if (engagementEvent.id == null) {
      throw ArgumentError.notNull('engagementEvent.id');
    }
    if (user.id == null) {
      throw ArgumentError.notNull('user.id');
    }

    var $engagementEvent = engagementEvent.copyWith(userId: user.id);
    await session.db.updateRow<EngagementEvent>(
      $engagementEvent,
      columns: [EngagementEvent.t.userId],
      transaction: transaction,
    );
  }

  /// Creates a relation between the given [EngagementEvent] and [Post]
  /// by setting the [EngagementEvent]'s foreign key `postId` to refer to the [Post].
  Future<void> post(
    _i1.Session session,
    EngagementEvent engagementEvent,
    _i3.Post post, {
    _i1.Transaction? transaction,
  }) async {
    if (engagementEvent.id == null) {
      throw ArgumentError.notNull('engagementEvent.id');
    }
    if (post.id == null) {
      throw ArgumentError.notNull('post.id');
    }

    var $engagementEvent = engagementEvent.copyWith(postId: post.id);
    await session.db.updateRow<EngagementEvent>(
      $engagementEvent,
      columns: [EngagementEvent.t.postId],
      transaction: transaction,
    );
  }
}
