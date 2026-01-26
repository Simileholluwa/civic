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
import '../poll/poll_option.dart' as _i3;
import 'package:civic_server/src/generated/protocol.dart' as _i4;

abstract class Poll implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  Poll._({
    this.id,
    required this.ownerId,
    this.owner,
    this.options,
    this.expiresAt,
    int? votesCount,
  }) : votesCount = votesCount ?? 0;

  factory Poll({
    int? id,
    required int ownerId,
    _i2.UserRecord? owner,
    List<_i3.PollOption>? options,
    DateTime? expiresAt,
    int? votesCount,
  }) = _PollImpl;

  factory Poll.fromJson(Map<String, dynamic> jsonSerialization) {
    return Poll(
      id: jsonSerialization['id'] as int?,
      ownerId: jsonSerialization['ownerId'] as int,
      owner: jsonSerialization['owner'] == null
          ? null
          : _i4.Protocol().deserialize<_i2.UserRecord>(
              jsonSerialization['owner'],
            ),
      options: jsonSerialization['options'] == null
          ? null
          : _i4.Protocol().deserialize<List<_i3.PollOption>>(
              jsonSerialization['options'],
            ),
      expiresAt: jsonSerialization['expiresAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['expiresAt']),
      votesCount: jsonSerialization['votesCount'] as int?,
    );
  }

  static final t = PollTable();

  static const db = PollRepository._();

  @override
  int? id;

  int ownerId;

  _i2.UserRecord? owner;

  List<_i3.PollOption>? options;

  DateTime? expiresAt;

  int? votesCount;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [Poll]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  Poll copyWith({
    int? id,
    int? ownerId,
    _i2.UserRecord? owner,
    List<_i3.PollOption>? options,
    DateTime? expiresAt,
    int? votesCount,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'Poll',
      if (id != null) 'id': id,
      'ownerId': ownerId,
      if (owner != null) 'owner': owner?.toJson(),
      if (options != null)
        'options': options?.toJson(valueToJson: (v) => v.toJson()),
      if (expiresAt != null) 'expiresAt': expiresAt?.toJson(),
      if (votesCount != null) 'votesCount': votesCount,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'Poll',
      if (id != null) 'id': id,
      'ownerId': ownerId,
      if (owner != null) 'owner': owner?.toJsonForProtocol(),
      if (options != null)
        'options': options?.toJson(valueToJson: (v) => v.toJsonForProtocol()),
      if (expiresAt != null) 'expiresAt': expiresAt?.toJson(),
      if (votesCount != null) 'votesCount': votesCount,
    };
  }

  static PollInclude include({
    _i2.UserRecordInclude? owner,
    _i3.PollOptionIncludeList? options,
  }) {
    return PollInclude._(
      owner: owner,
      options: options,
    );
  }

  static PollIncludeList includeList({
    _i1.WhereExpressionBuilder<PollTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<PollTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<PollTable>? orderByList,
    PollInclude? include,
  }) {
    return PollIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Poll.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(Poll.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _PollImpl extends Poll {
  _PollImpl({
    int? id,
    required int ownerId,
    _i2.UserRecord? owner,
    List<_i3.PollOption>? options,
    DateTime? expiresAt,
    int? votesCount,
  }) : super._(
         id: id,
         ownerId: ownerId,
         owner: owner,
         options: options,
         expiresAt: expiresAt,
         votesCount: votesCount,
       );

  /// Returns a shallow copy of this [Poll]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  Poll copyWith({
    Object? id = _Undefined,
    int? ownerId,
    Object? owner = _Undefined,
    Object? options = _Undefined,
    Object? expiresAt = _Undefined,
    Object? votesCount = _Undefined,
  }) {
    return Poll(
      id: id is int? ? id : this.id,
      ownerId: ownerId ?? this.ownerId,
      owner: owner is _i2.UserRecord? ? owner : this.owner?.copyWith(),
      options: options is List<_i3.PollOption>?
          ? options
          : this.options?.map((e0) => e0.copyWith()).toList(),
      expiresAt: expiresAt is DateTime? ? expiresAt : this.expiresAt,
      votesCount: votesCount is int? ? votesCount : this.votesCount,
    );
  }
}

class PollUpdateTable extends _i1.UpdateTable<PollTable> {
  PollUpdateTable(super.table);

  _i1.ColumnValue<int, int> ownerId(int value) => _i1.ColumnValue(
    table.ownerId,
    value,
  );

  _i1.ColumnValue<DateTime, DateTime> expiresAt(DateTime? value) =>
      _i1.ColumnValue(
        table.expiresAt,
        value,
      );

  _i1.ColumnValue<int, int> votesCount(int? value) => _i1.ColumnValue(
    table.votesCount,
    value,
  );
}

class PollTable extends _i1.Table<int?> {
  PollTable({super.tableRelation}) : super(tableName: 'poll') {
    updateTable = PollUpdateTable(this);
    ownerId = _i1.ColumnInt(
      'ownerId',
      this,
    );
    expiresAt = _i1.ColumnDateTime(
      'expiresAt',
      this,
    );
    votesCount = _i1.ColumnInt(
      'votesCount',
      this,
      hasDefault: true,
    );
  }

  late final PollUpdateTable updateTable;

  late final _i1.ColumnInt ownerId;

  _i2.UserRecordTable? _owner;

  _i3.PollOptionTable? ___options;

  _i1.ManyRelation<_i3.PollOptionTable>? _options;

  late final _i1.ColumnDateTime expiresAt;

  late final _i1.ColumnInt votesCount;

  _i2.UserRecordTable get owner {
    if (_owner != null) return _owner!;
    _owner = _i1.createRelationTable(
      relationFieldName: 'owner',
      field: Poll.t.ownerId,
      foreignField: _i2.UserRecord.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.UserRecordTable(tableRelation: foreignTableRelation),
    );
    return _owner!;
  }

  _i3.PollOptionTable get __options {
    if (___options != null) return ___options!;
    ___options = _i1.createRelationTable(
      relationFieldName: '__options',
      field: Poll.t.id,
      foreignField: _i3.PollOption.t.pollId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i3.PollOptionTable(tableRelation: foreignTableRelation),
    );
    return ___options!;
  }

  _i1.ManyRelation<_i3.PollOptionTable> get options {
    if (_options != null) return _options!;
    var relationTable = _i1.createRelationTable(
      relationFieldName: 'options',
      field: Poll.t.id,
      foreignField: _i3.PollOption.t.pollId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i3.PollOptionTable(tableRelation: foreignTableRelation),
    );
    _options = _i1.ManyRelation<_i3.PollOptionTable>(
      tableWithRelations: relationTable,
      table: _i3.PollOptionTable(
        tableRelation: relationTable.tableRelation!.lastRelation,
      ),
    );
    return _options!;
  }

  @override
  List<_i1.Column> get columns => [
    id,
    ownerId,
    expiresAt,
    votesCount,
  ];

  @override
  _i1.Table? getRelationTable(String relationField) {
    if (relationField == 'owner') {
      return owner;
    }
    if (relationField == 'options') {
      return __options;
    }
    return null;
  }
}

class PollInclude extends _i1.IncludeObject {
  PollInclude._({
    _i2.UserRecordInclude? owner,
    _i3.PollOptionIncludeList? options,
  }) {
    _owner = owner;
    _options = options;
  }

  _i2.UserRecordInclude? _owner;

  _i3.PollOptionIncludeList? _options;

  @override
  Map<String, _i1.Include?> get includes => {
    'owner': _owner,
    'options': _options,
  };

  @override
  _i1.Table<int?> get table => Poll.t;
}

class PollIncludeList extends _i1.IncludeList {
  PollIncludeList._({
    _i1.WhereExpressionBuilder<PollTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(Poll.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => Poll.t;
}

class PollRepository {
  const PollRepository._();

  final attach = const PollAttachRepository._();

  final attachRow = const PollAttachRowRepository._();

  final detach = const PollDetachRepository._();

  final detachRow = const PollDetachRowRepository._();

  /// Returns a list of [Poll]s matching the given query parameters.
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
  Future<List<Poll>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<PollTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<PollTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<PollTable>? orderByList,
    _i1.Transaction? transaction,
    PollInclude? include,
  }) async {
    return session.db.find<Poll>(
      where: where?.call(Poll.t),
      orderBy: orderBy?.call(Poll.t),
      orderByList: orderByList?.call(Poll.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Returns the first matching [Poll] matching the given query parameters.
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
  Future<Poll?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<PollTable>? where,
    int? offset,
    _i1.OrderByBuilder<PollTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<PollTable>? orderByList,
    _i1.Transaction? transaction,
    PollInclude? include,
  }) async {
    return session.db.findFirstRow<Poll>(
      where: where?.call(Poll.t),
      orderBy: orderBy?.call(Poll.t),
      orderByList: orderByList?.call(Poll.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Finds a single [Poll] by its [id] or null if no such row exists.
  Future<Poll?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
    PollInclude? include,
  }) async {
    return session.db.findById<Poll>(
      id,
      transaction: transaction,
      include: include,
    );
  }

  /// Inserts all [Poll]s in the list and returns the inserted rows.
  ///
  /// The returned [Poll]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<Poll>> insert(
    _i1.Session session,
    List<Poll> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<Poll>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [Poll] and returns the inserted row.
  ///
  /// The returned [Poll] will have its `id` field set.
  Future<Poll> insertRow(
    _i1.Session session,
    Poll row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<Poll>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [Poll]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<Poll>> update(
    _i1.Session session,
    List<Poll> rows, {
    _i1.ColumnSelections<PollTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<Poll>(
      rows,
      columns: columns?.call(Poll.t),
      transaction: transaction,
    );
  }

  /// Updates a single [Poll]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<Poll> updateRow(
    _i1.Session session,
    Poll row, {
    _i1.ColumnSelections<PollTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<Poll>(
      row,
      columns: columns?.call(Poll.t),
      transaction: transaction,
    );
  }

  /// Updates a single [Poll] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<Poll?> updateById(
    _i1.Session session,
    int id, {
    required _i1.ColumnValueListBuilder<PollUpdateTable> columnValues,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateById<Poll>(
      id,
      columnValues: columnValues(Poll.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [Poll]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  Future<List<Poll>> updateWhere(
    _i1.Session session, {
    required _i1.ColumnValueListBuilder<PollUpdateTable> columnValues,
    required _i1.WhereExpressionBuilder<PollTable> where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<PollTable>? orderBy,
    _i1.OrderByListBuilder<PollTable>? orderByList,
    bool orderDescending = false,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateWhere<Poll>(
      columnValues: columnValues(Poll.t.updateTable),
      where: where(Poll.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Poll.t),
      orderByList: orderByList?.call(Poll.t),
      orderDescending: orderDescending,
      transaction: transaction,
    );
  }

  /// Deletes all [Poll]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<Poll>> delete(
    _i1.Session session,
    List<Poll> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<Poll>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [Poll].
  Future<Poll> deleteRow(
    _i1.Session session,
    Poll row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<Poll>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<Poll>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<PollTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<Poll>(
      where: where(Poll.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<PollTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<Poll>(
      where: where?.call(Poll.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

class PollAttachRepository {
  const PollAttachRepository._();

  /// Creates a relation between this [Poll] and the given [PollOption]s
  /// by setting each [PollOption]'s foreign key `pollId` to refer to this [Poll].
  Future<void> options(
    _i1.Session session,
    Poll poll,
    List<_i3.PollOption> pollOption, {
    _i1.Transaction? transaction,
  }) async {
    if (pollOption.any((e) => e.id == null)) {
      throw ArgumentError.notNull('pollOption.id');
    }
    if (poll.id == null) {
      throw ArgumentError.notNull('poll.id');
    }

    var $pollOption = pollOption
        .map((e) => e.copyWith(pollId: poll.id))
        .toList();
    await session.db.update<_i3.PollOption>(
      $pollOption,
      columns: [_i3.PollOption.t.pollId],
      transaction: transaction,
    );
  }
}

class PollAttachRowRepository {
  const PollAttachRowRepository._();

  /// Creates a relation between the given [Poll] and [UserRecord]
  /// by setting the [Poll]'s foreign key `ownerId` to refer to the [UserRecord].
  Future<void> owner(
    _i1.Session session,
    Poll poll,
    _i2.UserRecord owner, {
    _i1.Transaction? transaction,
  }) async {
    if (poll.id == null) {
      throw ArgumentError.notNull('poll.id');
    }
    if (owner.id == null) {
      throw ArgumentError.notNull('owner.id');
    }

    var $poll = poll.copyWith(ownerId: owner.id);
    await session.db.updateRow<Poll>(
      $poll,
      columns: [Poll.t.ownerId],
      transaction: transaction,
    );
  }

  /// Creates a relation between this [Poll] and the given [PollOption]
  /// by setting the [PollOption]'s foreign key `pollId` to refer to this [Poll].
  Future<void> options(
    _i1.Session session,
    Poll poll,
    _i3.PollOption pollOption, {
    _i1.Transaction? transaction,
  }) async {
    if (pollOption.id == null) {
      throw ArgumentError.notNull('pollOption.id');
    }
    if (poll.id == null) {
      throw ArgumentError.notNull('poll.id');
    }

    var $pollOption = pollOption.copyWith(pollId: poll.id);
    await session.db.updateRow<_i3.PollOption>(
      $pollOption,
      columns: [_i3.PollOption.t.pollId],
      transaction: transaction,
    );
  }
}

class PollDetachRepository {
  const PollDetachRepository._();

  /// Detaches the relation between this [Poll] and the given [PollOption]
  /// by setting the [PollOption]'s foreign key `pollId` to `null`.
  ///
  /// This removes the association between the two models without deleting
  /// the related record.
  Future<void> options(
    _i1.Session session,
    List<_i3.PollOption> pollOption, {
    _i1.Transaction? transaction,
  }) async {
    if (pollOption.any((e) => e.id == null)) {
      throw ArgumentError.notNull('pollOption.id');
    }

    var $pollOption = pollOption.map((e) => e.copyWith(pollId: null)).toList();
    await session.db.update<_i3.PollOption>(
      $pollOption,
      columns: [_i3.PollOption.t.pollId],
      transaction: transaction,
    );
  }
}

class PollDetachRowRepository {
  const PollDetachRowRepository._();

  /// Detaches the relation between this [Poll] and the given [PollOption]
  /// by setting the [PollOption]'s foreign key `pollId` to `null`.
  ///
  /// This removes the association between the two models without deleting
  /// the related record.
  Future<void> options(
    _i1.Session session,
    _i3.PollOption pollOption, {
    _i1.Transaction? transaction,
  }) async {
    if (pollOption.id == null) {
      throw ArgumentError.notNull('pollOption.id');
    }

    var $pollOption = pollOption.copyWith(pollId: null);
    await session.db.updateRow<_i3.PollOption>(
      $pollOption,
      columns: [_i3.PollOption.t.pollId],
      transaction: transaction,
    );
  }
}
