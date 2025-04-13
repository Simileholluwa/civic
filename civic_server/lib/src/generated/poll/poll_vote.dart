/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;
import '../poll/poll.dart' as _i2;

abstract class PollVote
    implements _i1.TableRow<int>, _i1.ProtocolSerialization {
  PollVote._({
    this.id,
    required this.pollId,
    this.poll,
    required this.voterId,
  });

  factory PollVote({
    int? id,
    required int pollId,
    _i2.Poll? poll,
    required int voterId,
  }) = _PollVoteImpl;

  factory PollVote.fromJson(Map<String, dynamic> jsonSerialization) {
    return PollVote(
      id: jsonSerialization['id'] as int?,
      pollId: jsonSerialization['pollId'] as int,
      poll: jsonSerialization['poll'] == null
          ? null
          : _i2.Poll.fromJson(
              (jsonSerialization['poll'] as Map<String, dynamic>)),
      voterId: jsonSerialization['voterId'] as int,
    );
  }

  static final t = PollVoteTable();

  static const db = PollVoteRepository._();

  @override
  int? id;

  int pollId;

  _i2.Poll? poll;

  int voterId;

  @override
  _i1.Table<int> get table => t;

  /// Returns a shallow copy of this [PollVote]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  PollVote copyWith({
    int? id,
    int? pollId,
    _i2.Poll? poll,
    int? voterId,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'pollId': pollId,
      if (poll != null) 'poll': poll?.toJson(),
      'voterId': voterId,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'pollId': pollId,
      if (poll != null) 'poll': poll?.toJsonForProtocol(),
      'voterId': voterId,
    };
  }

  static PollVoteInclude include({_i2.PollInclude? poll}) {
    return PollVoteInclude._(poll: poll);
  }

  static PollVoteIncludeList includeList({
    _i1.WhereExpressionBuilder<PollVoteTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<PollVoteTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<PollVoteTable>? orderByList,
    PollVoteInclude? include,
  }) {
    return PollVoteIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(PollVote.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(PollVote.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _PollVoteImpl extends PollVote {
  _PollVoteImpl({
    int? id,
    required int pollId,
    _i2.Poll? poll,
    required int voterId,
  }) : super._(
          id: id,
          pollId: pollId,
          poll: poll,
          voterId: voterId,
        );

  /// Returns a shallow copy of this [PollVote]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  PollVote copyWith({
    Object? id = _Undefined,
    int? pollId,
    Object? poll = _Undefined,
    int? voterId,
  }) {
    return PollVote(
      id: id is int? ? id : this.id,
      pollId: pollId ?? this.pollId,
      poll: poll is _i2.Poll? ? poll : this.poll?.copyWith(),
      voterId: voterId ?? this.voterId,
    );
  }
}

class PollVoteTable extends _i1.Table<int> {
  PollVoteTable({super.tableRelation}) : super(tableName: 'poll_vote') {
    pollId = _i1.ColumnInt(
      'pollId',
      this,
    );
    voterId = _i1.ColumnInt(
      'voterId',
      this,
    );
  }

  late final _i1.ColumnInt pollId;

  _i2.PollTable? _poll;

  late final _i1.ColumnInt voterId;

  _i2.PollTable get poll {
    if (_poll != null) return _poll!;
    _poll = _i1.createRelationTable(
      relationFieldName: 'poll',
      field: PollVote.t.pollId,
      foreignField: _i2.Poll.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.PollTable(tableRelation: foreignTableRelation),
    );
    return _poll!;
  }

  @override
  List<_i1.Column> get columns => [
        id,
        pollId,
        voterId,
      ];

  @override
  _i1.Table? getRelationTable(String relationField) {
    if (relationField == 'poll') {
      return poll;
    }
    return null;
  }
}

class PollVoteInclude extends _i1.IncludeObject {
  PollVoteInclude._({_i2.PollInclude? poll}) {
    _poll = poll;
  }

  _i2.PollInclude? _poll;

  @override
  Map<String, _i1.Include?> get includes => {'poll': _poll};

  @override
  _i1.Table<int> get table => PollVote.t;
}

class PollVoteIncludeList extends _i1.IncludeList {
  PollVoteIncludeList._({
    _i1.WhereExpressionBuilder<PollVoteTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(PollVote.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int> get table => PollVote.t;
}

class PollVoteRepository {
  const PollVoteRepository._();

  final attachRow = const PollVoteAttachRowRepository._();

  /// Returns a list of [PollVote]s matching the given query parameters.
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
  Future<List<PollVote>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<PollVoteTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<PollVoteTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<PollVoteTable>? orderByList,
    _i1.Transaction? transaction,
    PollVoteInclude? include,
  }) async {
    return session.db.find<PollVote>(
      where: where?.call(PollVote.t),
      orderBy: orderBy?.call(PollVote.t),
      orderByList: orderByList?.call(PollVote.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Returns the first matching [PollVote] matching the given query parameters.
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
  Future<PollVote?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<PollVoteTable>? where,
    int? offset,
    _i1.OrderByBuilder<PollVoteTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<PollVoteTable>? orderByList,
    _i1.Transaction? transaction,
    PollVoteInclude? include,
  }) async {
    return session.db.findFirstRow<PollVote>(
      where: where?.call(PollVote.t),
      orderBy: orderBy?.call(PollVote.t),
      orderByList: orderByList?.call(PollVote.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Finds a single [PollVote] by its [id] or null if no such row exists.
  Future<PollVote?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
    PollVoteInclude? include,
  }) async {
    return session.db.findById<PollVote>(
      id,
      transaction: transaction,
      include: include,
    );
  }

  /// Inserts all [PollVote]s in the list and returns the inserted rows.
  ///
  /// The returned [PollVote]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<PollVote>> insert(
    _i1.Session session,
    List<PollVote> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<PollVote>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [PollVote] and returns the inserted row.
  ///
  /// The returned [PollVote] will have its `id` field set.
  Future<PollVote> insertRow(
    _i1.Session session,
    PollVote row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<PollVote>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [PollVote]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<PollVote>> update(
    _i1.Session session,
    List<PollVote> rows, {
    _i1.ColumnSelections<PollVoteTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<PollVote>(
      rows,
      columns: columns?.call(PollVote.t),
      transaction: transaction,
    );
  }

  /// Updates a single [PollVote]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<PollVote> updateRow(
    _i1.Session session,
    PollVote row, {
    _i1.ColumnSelections<PollVoteTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<PollVote>(
      row,
      columns: columns?.call(PollVote.t),
      transaction: transaction,
    );
  }

  /// Deletes all [PollVote]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<PollVote>> delete(
    _i1.Session session,
    List<PollVote> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<PollVote>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [PollVote].
  Future<PollVote> deleteRow(
    _i1.Session session,
    PollVote row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<PollVote>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<PollVote>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<PollVoteTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<PollVote>(
      where: where(PollVote.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<PollVoteTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<PollVote>(
      where: where?.call(PollVote.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

class PollVoteAttachRowRepository {
  const PollVoteAttachRowRepository._();

  /// Creates a relation between the given [PollVote] and [Poll]
  /// by setting the [PollVote]'s foreign key `pollId` to refer to the [Poll].
  Future<void> poll(
    _i1.Session session,
    PollVote pollVote,
    _i2.Poll poll, {
    _i1.Transaction? transaction,
  }) async {
    if (pollVote.id == null) {
      throw ArgumentError.notNull('pollVote.id');
    }
    if (poll.id == null) {
      throw ArgumentError.notNull('poll.id');
    }

    var $pollVote = pollVote.copyWith(pollId: poll.id);
    await session.db.updateRow<PollVote>(
      $pollVote,
      columns: [PollVote.t.pollId],
      transaction: transaction,
    );
  }
}
