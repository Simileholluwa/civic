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
import '../poll/poll.dart' as _i3;

abstract class PollNotInterested
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  PollNotInterested._({
    this.id,
    required this.userId,
    this.user,
    required this.pollId,
    this.poll,
    DateTime? dateMarked,
    required this.reason,
  }) : dateMarked = dateMarked ?? DateTime.now();

  factory PollNotInterested({
    int? id,
    required int userId,
    _i2.UserRecord? user,
    required int pollId,
    _i3.Poll? poll,
    DateTime? dateMarked,
    required String reason,
  }) = _PollNotInterestedImpl;

  factory PollNotInterested.fromJson(Map<String, dynamic> jsonSerialization) {
    return PollNotInterested(
      id: jsonSerialization['id'] as int?,
      userId: jsonSerialization['userId'] as int,
      user: jsonSerialization['user'] == null
          ? null
          : _i2.UserRecord.fromJson(
              (jsonSerialization['user'] as Map<String, dynamic>)),
      pollId: jsonSerialization['pollId'] as int,
      poll: jsonSerialization['poll'] == null
          ? null
          : _i3.Poll.fromJson(
              (jsonSerialization['poll'] as Map<String, dynamic>)),
      dateMarked: jsonSerialization['dateMarked'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['dateMarked']),
      reason: jsonSerialization['reason'] as String,
    );
  }

  static final t = PollNotInterestedTable();

  static const db = PollNotInterestedRepository._();

  @override
  int? id;

  int userId;

  _i2.UserRecord? user;

  int pollId;

  _i3.Poll? poll;

  DateTime? dateMarked;

  String reason;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [PollNotInterested]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  PollNotInterested copyWith({
    int? id,
    int? userId,
    _i2.UserRecord? user,
    int? pollId,
    _i3.Poll? poll,
    DateTime? dateMarked,
    String? reason,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'userId': userId,
      if (user != null) 'user': user?.toJson(),
      'pollId': pollId,
      if (poll != null) 'poll': poll?.toJson(),
      if (dateMarked != null) 'dateMarked': dateMarked?.toJson(),
      'reason': reason,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'userId': userId,
      if (user != null) 'user': user?.toJsonForProtocol(),
      'pollId': pollId,
      if (poll != null) 'poll': poll?.toJsonForProtocol(),
      if (dateMarked != null) 'dateMarked': dateMarked?.toJson(),
      'reason': reason,
    };
  }

  static PollNotInterestedInclude include({
    _i2.UserRecordInclude? user,
    _i3.PollInclude? poll,
  }) {
    return PollNotInterestedInclude._(
      user: user,
      poll: poll,
    );
  }

  static PollNotInterestedIncludeList includeList({
    _i1.WhereExpressionBuilder<PollNotInterestedTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<PollNotInterestedTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<PollNotInterestedTable>? orderByList,
    PollNotInterestedInclude? include,
  }) {
    return PollNotInterestedIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(PollNotInterested.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(PollNotInterested.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _PollNotInterestedImpl extends PollNotInterested {
  _PollNotInterestedImpl({
    int? id,
    required int userId,
    _i2.UserRecord? user,
    required int pollId,
    _i3.Poll? poll,
    DateTime? dateMarked,
    required String reason,
  }) : super._(
          id: id,
          userId: userId,
          user: user,
          pollId: pollId,
          poll: poll,
          dateMarked: dateMarked,
          reason: reason,
        );

  /// Returns a shallow copy of this [PollNotInterested]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  PollNotInterested copyWith({
    Object? id = _Undefined,
    int? userId,
    Object? user = _Undefined,
    int? pollId,
    Object? poll = _Undefined,
    Object? dateMarked = _Undefined,
    String? reason,
  }) {
    return PollNotInterested(
      id: id is int? ? id : this.id,
      userId: userId ?? this.userId,
      user: user is _i2.UserRecord? ? user : this.user?.copyWith(),
      pollId: pollId ?? this.pollId,
      poll: poll is _i3.Poll? ? poll : this.poll?.copyWith(),
      dateMarked: dateMarked is DateTime? ? dateMarked : this.dateMarked,
      reason: reason ?? this.reason,
    );
  }
}

class PollNotInterestedTable extends _i1.Table<int?> {
  PollNotInterestedTable({super.tableRelation})
      : super(tableName: 'poll_not_interested') {
    userId = _i1.ColumnInt(
      'userId',
      this,
    );
    pollId = _i1.ColumnInt(
      'pollId',
      this,
    );
    dateMarked = _i1.ColumnDateTime(
      'dateMarked',
      this,
      hasDefault: true,
    );
    reason = _i1.ColumnString(
      'reason',
      this,
    );
  }

  late final _i1.ColumnInt userId;

  _i2.UserRecordTable? _user;

  late final _i1.ColumnInt pollId;

  _i3.PollTable? _poll;

  late final _i1.ColumnDateTime dateMarked;

  late final _i1.ColumnString reason;

  _i2.UserRecordTable get user {
    if (_user != null) return _user!;
    _user = _i1.createRelationTable(
      relationFieldName: 'user',
      field: PollNotInterested.t.userId,
      foreignField: _i2.UserRecord.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.UserRecordTable(tableRelation: foreignTableRelation),
    );
    return _user!;
  }

  _i3.PollTable get poll {
    if (_poll != null) return _poll!;
    _poll = _i1.createRelationTable(
      relationFieldName: 'poll',
      field: PollNotInterested.t.pollId,
      foreignField: _i3.Poll.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i3.PollTable(tableRelation: foreignTableRelation),
    );
    return _poll!;
  }

  @override
  List<_i1.Column> get columns => [
        id,
        userId,
        pollId,
        dateMarked,
        reason,
      ];

  @override
  _i1.Table? getRelationTable(String relationField) {
    if (relationField == 'user') {
      return user;
    }
    if (relationField == 'poll') {
      return poll;
    }
    return null;
  }
}

class PollNotInterestedInclude extends _i1.IncludeObject {
  PollNotInterestedInclude._({
    _i2.UserRecordInclude? user,
    _i3.PollInclude? poll,
  }) {
    _user = user;
    _poll = poll;
  }

  _i2.UserRecordInclude? _user;

  _i3.PollInclude? _poll;

  @override
  Map<String, _i1.Include?> get includes => {
        'user': _user,
        'poll': _poll,
      };

  @override
  _i1.Table<int?> get table => PollNotInterested.t;
}

class PollNotInterestedIncludeList extends _i1.IncludeList {
  PollNotInterestedIncludeList._({
    _i1.WhereExpressionBuilder<PollNotInterestedTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(PollNotInterested.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => PollNotInterested.t;
}

class PollNotInterestedRepository {
  const PollNotInterestedRepository._();

  final attachRow = const PollNotInterestedAttachRowRepository._();

  /// Returns a list of [PollNotInterested]s matching the given query parameters.
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
  Future<List<PollNotInterested>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<PollNotInterestedTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<PollNotInterestedTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<PollNotInterestedTable>? orderByList,
    _i1.Transaction? transaction,
    PollNotInterestedInclude? include,
  }) async {
    return session.db.find<PollNotInterested>(
      where: where?.call(PollNotInterested.t),
      orderBy: orderBy?.call(PollNotInterested.t),
      orderByList: orderByList?.call(PollNotInterested.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Returns the first matching [PollNotInterested] matching the given query parameters.
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
  Future<PollNotInterested?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<PollNotInterestedTable>? where,
    int? offset,
    _i1.OrderByBuilder<PollNotInterestedTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<PollNotInterestedTable>? orderByList,
    _i1.Transaction? transaction,
    PollNotInterestedInclude? include,
  }) async {
    return session.db.findFirstRow<PollNotInterested>(
      where: where?.call(PollNotInterested.t),
      orderBy: orderBy?.call(PollNotInterested.t),
      orderByList: orderByList?.call(PollNotInterested.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Finds a single [PollNotInterested] by its [id] or null if no such row exists.
  Future<PollNotInterested?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
    PollNotInterestedInclude? include,
  }) async {
    return session.db.findById<PollNotInterested>(
      id,
      transaction: transaction,
      include: include,
    );
  }

  /// Inserts all [PollNotInterested]s in the list and returns the inserted rows.
  ///
  /// The returned [PollNotInterested]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<PollNotInterested>> insert(
    _i1.Session session,
    List<PollNotInterested> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<PollNotInterested>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [PollNotInterested] and returns the inserted row.
  ///
  /// The returned [PollNotInterested] will have its `id` field set.
  Future<PollNotInterested> insertRow(
    _i1.Session session,
    PollNotInterested row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<PollNotInterested>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [PollNotInterested]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<PollNotInterested>> update(
    _i1.Session session,
    List<PollNotInterested> rows, {
    _i1.ColumnSelections<PollNotInterestedTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<PollNotInterested>(
      rows,
      columns: columns?.call(PollNotInterested.t),
      transaction: transaction,
    );
  }

  /// Updates a single [PollNotInterested]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<PollNotInterested> updateRow(
    _i1.Session session,
    PollNotInterested row, {
    _i1.ColumnSelections<PollNotInterestedTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<PollNotInterested>(
      row,
      columns: columns?.call(PollNotInterested.t),
      transaction: transaction,
    );
  }

  /// Deletes all [PollNotInterested]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<PollNotInterested>> delete(
    _i1.Session session,
    List<PollNotInterested> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<PollNotInterested>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [PollNotInterested].
  Future<PollNotInterested> deleteRow(
    _i1.Session session,
    PollNotInterested row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<PollNotInterested>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<PollNotInterested>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<PollNotInterestedTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<PollNotInterested>(
      where: where(PollNotInterested.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<PollNotInterestedTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<PollNotInterested>(
      where: where?.call(PollNotInterested.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

class PollNotInterestedAttachRowRepository {
  const PollNotInterestedAttachRowRepository._();

  /// Creates a relation between the given [PollNotInterested] and [UserRecord]
  /// by setting the [PollNotInterested]'s foreign key `userId` to refer to the [UserRecord].
  Future<void> user(
    _i1.Session session,
    PollNotInterested pollNotInterested,
    _i2.UserRecord user, {
    _i1.Transaction? transaction,
  }) async {
    if (pollNotInterested.id == null) {
      throw ArgumentError.notNull('pollNotInterested.id');
    }
    if (user.id == null) {
      throw ArgumentError.notNull('user.id');
    }

    var $pollNotInterested = pollNotInterested.copyWith(userId: user.id);
    await session.db.updateRow<PollNotInterested>(
      $pollNotInterested,
      columns: [PollNotInterested.t.userId],
      transaction: transaction,
    );
  }

  /// Creates a relation between the given [PollNotInterested] and [Poll]
  /// by setting the [PollNotInterested]'s foreign key `pollId` to refer to the [Poll].
  Future<void> poll(
    _i1.Session session,
    PollNotInterested pollNotInterested,
    _i3.Poll poll, {
    _i1.Transaction? transaction,
  }) async {
    if (pollNotInterested.id == null) {
      throw ArgumentError.notNull('pollNotInterested.id');
    }
    if (poll.id == null) {
      throw ArgumentError.notNull('poll.id');
    }

    var $pollNotInterested = pollNotInterested.copyWith(pollId: poll.id);
    await session.db.updateRow<PollNotInterested>(
      $pollNotInterested,
      columns: [PollNotInterested.t.pollId],
      transaction: transaction,
    );
  }
}
