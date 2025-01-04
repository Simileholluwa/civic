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

abstract class PollVote implements _i1.TableRow, _i1.ProtocolSerialization {
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
  _i1.Table get table => t;

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

class PollVoteTable extends _i1.Table {
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
  _i1.Table get table => PollVote.t;
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
  _i1.Table get table => PollVote.t;
}

class PollVoteRepository {
  const PollVoteRepository._();

  final attachRow = const PollVoteAttachRowRepository._();

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
