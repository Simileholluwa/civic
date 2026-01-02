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
import 'package:civic_server/src/generated/protocol.dart' as _i3;

abstract class ImpressionLog
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  ImpressionLog._({
    this.id,
    required this.userId,
    this.user,
    required this.postIds,
    required this.page,
    DateTime? createdAt,
  }) : createdAt = createdAt ?? DateTime.now();

  factory ImpressionLog({
    int? id,
    required int userId,
    _i2.UserRecord? user,
    required List<int> postIds,
    required int page,
    DateTime? createdAt,
  }) = _ImpressionLogImpl;

  factory ImpressionLog.fromJson(Map<String, dynamic> jsonSerialization) {
    return ImpressionLog(
      id: jsonSerialization['id'] as int?,
      userId: jsonSerialization['userId'] as int,
      user: jsonSerialization['user'] == null
          ? null
          : _i3.Protocol().deserialize<_i2.UserRecord>(
              jsonSerialization['user'],
            ),
      postIds: _i3.Protocol().deserialize<List<int>>(
        jsonSerialization['postIds'],
      ),
      page: jsonSerialization['page'] as int,
      createdAt: jsonSerialization['createdAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
    );
  }

  static final t = ImpressionLogTable();

  static const db = ImpressionLogRepository._();

  @override
  int? id;

  int userId;

  _i2.UserRecord? user;

  List<int> postIds;

  int page;

  DateTime? createdAt;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [ImpressionLog]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  ImpressionLog copyWith({
    int? id,
    int? userId,
    _i2.UserRecord? user,
    List<int>? postIds,
    int? page,
    DateTime? createdAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'ImpressionLog',
      if (id != null) 'id': id,
      'userId': userId,
      if (user != null) 'user': user?.toJson(),
      'postIds': postIds.toJson(),
      'page': page,
      if (createdAt != null) 'createdAt': createdAt?.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'ImpressionLog',
      if (id != null) 'id': id,
      'userId': userId,
      if (user != null) 'user': user?.toJsonForProtocol(),
      'postIds': postIds.toJson(),
      'page': page,
      if (createdAt != null) 'createdAt': createdAt?.toJson(),
    };
  }

  static ImpressionLogInclude include({_i2.UserRecordInclude? user}) {
    return ImpressionLogInclude._(user: user);
  }

  static ImpressionLogIncludeList includeList({
    _i1.WhereExpressionBuilder<ImpressionLogTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<ImpressionLogTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<ImpressionLogTable>? orderByList,
    ImpressionLogInclude? include,
  }) {
    return ImpressionLogIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(ImpressionLog.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(ImpressionLog.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _ImpressionLogImpl extends ImpressionLog {
  _ImpressionLogImpl({
    int? id,
    required int userId,
    _i2.UserRecord? user,
    required List<int> postIds,
    required int page,
    DateTime? createdAt,
  }) : super._(
         id: id,
         userId: userId,
         user: user,
         postIds: postIds,
         page: page,
         createdAt: createdAt,
       );

  /// Returns a shallow copy of this [ImpressionLog]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  ImpressionLog copyWith({
    Object? id = _Undefined,
    int? userId,
    Object? user = _Undefined,
    List<int>? postIds,
    int? page,
    Object? createdAt = _Undefined,
  }) {
    return ImpressionLog(
      id: id is int? ? id : this.id,
      userId: userId ?? this.userId,
      user: user is _i2.UserRecord? ? user : this.user?.copyWith(),
      postIds: postIds ?? this.postIds.map((e0) => e0).toList(),
      page: page ?? this.page,
      createdAt: createdAt is DateTime? ? createdAt : this.createdAt,
    );
  }
}

class ImpressionLogUpdateTable extends _i1.UpdateTable<ImpressionLogTable> {
  ImpressionLogUpdateTable(super.table);

  _i1.ColumnValue<int, int> userId(int value) => _i1.ColumnValue(
    table.userId,
    value,
  );

  _i1.ColumnValue<List<int>, List<int>> postIds(List<int> value) =>
      _i1.ColumnValue(
        table.postIds,
        value,
      );

  _i1.ColumnValue<int, int> page(int value) => _i1.ColumnValue(
    table.page,
    value,
  );

  _i1.ColumnValue<DateTime, DateTime> createdAt(DateTime? value) =>
      _i1.ColumnValue(
        table.createdAt,
        value,
      );
}

class ImpressionLogTable extends _i1.Table<int?> {
  ImpressionLogTable({super.tableRelation})
    : super(tableName: 'impression_log') {
    updateTable = ImpressionLogUpdateTable(this);
    userId = _i1.ColumnInt(
      'userId',
      this,
    );
    postIds = _i1.ColumnSerializable<List<int>>(
      'postIds',
      this,
    );
    page = _i1.ColumnInt(
      'page',
      this,
    );
    createdAt = _i1.ColumnDateTime(
      'createdAt',
      this,
      hasDefault: true,
    );
  }

  late final ImpressionLogUpdateTable updateTable;

  late final _i1.ColumnInt userId;

  _i2.UserRecordTable? _user;

  late final _i1.ColumnSerializable<List<int>> postIds;

  late final _i1.ColumnInt page;

  late final _i1.ColumnDateTime createdAt;

  _i2.UserRecordTable get user {
    if (_user != null) return _user!;
    _user = _i1.createRelationTable(
      relationFieldName: 'user',
      field: ImpressionLog.t.userId,
      foreignField: _i2.UserRecord.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.UserRecordTable(tableRelation: foreignTableRelation),
    );
    return _user!;
  }

  @override
  List<_i1.Column> get columns => [
    id,
    userId,
    postIds,
    page,
    createdAt,
  ];

  @override
  _i1.Table? getRelationTable(String relationField) {
    if (relationField == 'user') {
      return user;
    }
    return null;
  }
}

class ImpressionLogInclude extends _i1.IncludeObject {
  ImpressionLogInclude._({_i2.UserRecordInclude? user}) {
    _user = user;
  }

  _i2.UserRecordInclude? _user;

  @override
  Map<String, _i1.Include?> get includes => {'user': _user};

  @override
  _i1.Table<int?> get table => ImpressionLog.t;
}

class ImpressionLogIncludeList extends _i1.IncludeList {
  ImpressionLogIncludeList._({
    _i1.WhereExpressionBuilder<ImpressionLogTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(ImpressionLog.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => ImpressionLog.t;
}

class ImpressionLogRepository {
  const ImpressionLogRepository._();

  final attachRow = const ImpressionLogAttachRowRepository._();

  /// Returns a list of [ImpressionLog]s matching the given query parameters.
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
  Future<List<ImpressionLog>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<ImpressionLogTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<ImpressionLogTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<ImpressionLogTable>? orderByList,
    _i1.Transaction? transaction,
    ImpressionLogInclude? include,
  }) async {
    return session.db.find<ImpressionLog>(
      where: where?.call(ImpressionLog.t),
      orderBy: orderBy?.call(ImpressionLog.t),
      orderByList: orderByList?.call(ImpressionLog.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Returns the first matching [ImpressionLog] matching the given query parameters.
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
  Future<ImpressionLog?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<ImpressionLogTable>? where,
    int? offset,
    _i1.OrderByBuilder<ImpressionLogTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<ImpressionLogTable>? orderByList,
    _i1.Transaction? transaction,
    ImpressionLogInclude? include,
  }) async {
    return session.db.findFirstRow<ImpressionLog>(
      where: where?.call(ImpressionLog.t),
      orderBy: orderBy?.call(ImpressionLog.t),
      orderByList: orderByList?.call(ImpressionLog.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Finds a single [ImpressionLog] by its [id] or null if no such row exists.
  Future<ImpressionLog?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
    ImpressionLogInclude? include,
  }) async {
    return session.db.findById<ImpressionLog>(
      id,
      transaction: transaction,
      include: include,
    );
  }

  /// Inserts all [ImpressionLog]s in the list and returns the inserted rows.
  ///
  /// The returned [ImpressionLog]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<ImpressionLog>> insert(
    _i1.Session session,
    List<ImpressionLog> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<ImpressionLog>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [ImpressionLog] and returns the inserted row.
  ///
  /// The returned [ImpressionLog] will have its `id` field set.
  Future<ImpressionLog> insertRow(
    _i1.Session session,
    ImpressionLog row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<ImpressionLog>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [ImpressionLog]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<ImpressionLog>> update(
    _i1.Session session,
    List<ImpressionLog> rows, {
    _i1.ColumnSelections<ImpressionLogTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<ImpressionLog>(
      rows,
      columns: columns?.call(ImpressionLog.t),
      transaction: transaction,
    );
  }

  /// Updates a single [ImpressionLog]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<ImpressionLog> updateRow(
    _i1.Session session,
    ImpressionLog row, {
    _i1.ColumnSelections<ImpressionLogTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<ImpressionLog>(
      row,
      columns: columns?.call(ImpressionLog.t),
      transaction: transaction,
    );
  }

  /// Updates a single [ImpressionLog] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<ImpressionLog?> updateById(
    _i1.Session session,
    int id, {
    required _i1.ColumnValueListBuilder<ImpressionLogUpdateTable> columnValues,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateById<ImpressionLog>(
      id,
      columnValues: columnValues(ImpressionLog.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [ImpressionLog]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  Future<List<ImpressionLog>> updateWhere(
    _i1.Session session, {
    required _i1.ColumnValueListBuilder<ImpressionLogUpdateTable> columnValues,
    required _i1.WhereExpressionBuilder<ImpressionLogTable> where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<ImpressionLogTable>? orderBy,
    _i1.OrderByListBuilder<ImpressionLogTable>? orderByList,
    bool orderDescending = false,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateWhere<ImpressionLog>(
      columnValues: columnValues(ImpressionLog.t.updateTable),
      where: where(ImpressionLog.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(ImpressionLog.t),
      orderByList: orderByList?.call(ImpressionLog.t),
      orderDescending: orderDescending,
      transaction: transaction,
    );
  }

  /// Deletes all [ImpressionLog]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<ImpressionLog>> delete(
    _i1.Session session,
    List<ImpressionLog> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<ImpressionLog>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [ImpressionLog].
  Future<ImpressionLog> deleteRow(
    _i1.Session session,
    ImpressionLog row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<ImpressionLog>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<ImpressionLog>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<ImpressionLogTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<ImpressionLog>(
      where: where(ImpressionLog.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<ImpressionLogTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<ImpressionLog>(
      where: where?.call(ImpressionLog.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

class ImpressionLogAttachRowRepository {
  const ImpressionLogAttachRowRepository._();

  /// Creates a relation between the given [ImpressionLog] and [UserRecord]
  /// by setting the [ImpressionLog]'s foreign key `userId` to refer to the [UserRecord].
  Future<void> user(
    _i1.Session session,
    ImpressionLog impressionLog,
    _i2.UserRecord user, {
    _i1.Transaction? transaction,
  }) async {
    if (impressionLog.id == null) {
      throw ArgumentError.notNull('impressionLog.id');
    }
    if (user.id == null) {
      throw ArgumentError.notNull('user.id');
    }

    var $impressionLog = impressionLog.copyWith(userId: user.id);
    await session.db.updateRow<ImpressionLog>(
      $impressionLog,
      columns: [ImpressionLog.t.userId],
      transaction: transaction,
    );
  }
}
