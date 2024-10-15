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
import '../protocol.dart' as _i2;

abstract class PollsHashtags extends _i1.TableRow
    implements _i1.ProtocolSerialization {
  PollsHashtags._({
    int? id,
    required this.pollId,
    this.poll,
    required this.hashtagId,
    this.hashtag,
  }) : super(id);

  factory PollsHashtags({
    int? id,
    required int pollId,
    _i2.Poll? poll,
    required int hashtagId,
    _i2.PollHashtag? hashtag,
  }) = _PollsHashtagsImpl;

  factory PollsHashtags.fromJson(Map<String, dynamic> jsonSerialization) {
    return PollsHashtags(
      id: jsonSerialization['id'] as int?,
      pollId: jsonSerialization['pollId'] as int,
      poll: jsonSerialization['poll'] == null
          ? null
          : _i2.Poll.fromJson(
              (jsonSerialization['poll'] as Map<String, dynamic>)),
      hashtagId: jsonSerialization['hashtagId'] as int,
      hashtag: jsonSerialization['hashtag'] == null
          ? null
          : _i2.PollHashtag.fromJson(
              (jsonSerialization['hashtag'] as Map<String, dynamic>)),
    );
  }

  static final t = PollsHashtagsTable();

  static const db = PollsHashtagsRepository._();

  int pollId;

  _i2.Poll? poll;

  int hashtagId;

  _i2.PollHashtag? hashtag;

  @override
  _i1.Table get table => t;

  PollsHashtags copyWith({
    int? id,
    int? pollId,
    _i2.Poll? poll,
    int? hashtagId,
    _i2.PollHashtag? hashtag,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'pollId': pollId,
      if (poll != null) 'poll': poll?.toJson(),
      'hashtagId': hashtagId,
      if (hashtag != null) 'hashtag': hashtag?.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'pollId': pollId,
      if (poll != null) 'poll': poll?.toJsonForProtocol(),
      'hashtagId': hashtagId,
      if (hashtag != null) 'hashtag': hashtag?.toJsonForProtocol(),
    };
  }

  static PollsHashtagsInclude include({
    _i2.PollInclude? poll,
    _i2.PollHashtagInclude? hashtag,
  }) {
    return PollsHashtagsInclude._(
      poll: poll,
      hashtag: hashtag,
    );
  }

  static PollsHashtagsIncludeList includeList({
    _i1.WhereExpressionBuilder<PollsHashtagsTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<PollsHashtagsTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<PollsHashtagsTable>? orderByList,
    PollsHashtagsInclude? include,
  }) {
    return PollsHashtagsIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(PollsHashtags.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(PollsHashtags.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _PollsHashtagsImpl extends PollsHashtags {
  _PollsHashtagsImpl({
    int? id,
    required int pollId,
    _i2.Poll? poll,
    required int hashtagId,
    _i2.PollHashtag? hashtag,
  }) : super._(
          id: id,
          pollId: pollId,
          poll: poll,
          hashtagId: hashtagId,
          hashtag: hashtag,
        );

  @override
  PollsHashtags copyWith({
    Object? id = _Undefined,
    int? pollId,
    Object? poll = _Undefined,
    int? hashtagId,
    Object? hashtag = _Undefined,
  }) {
    return PollsHashtags(
      id: id is int? ? id : this.id,
      pollId: pollId ?? this.pollId,
      poll: poll is _i2.Poll? ? poll : this.poll?.copyWith(),
      hashtagId: hashtagId ?? this.hashtagId,
      hashtag: hashtag is _i2.PollHashtag? ? hashtag : this.hashtag?.copyWith(),
    );
  }
}

class PollsHashtagsTable extends _i1.Table {
  PollsHashtagsTable({super.tableRelation})
      : super(tableName: 'pollshashtags') {
    pollId = _i1.ColumnInt(
      'pollId',
      this,
    );
    hashtagId = _i1.ColumnInt(
      'hashtagId',
      this,
    );
  }

  late final _i1.ColumnInt pollId;

  _i2.PollTable? _poll;

  late final _i1.ColumnInt hashtagId;

  _i2.PollHashtagTable? _hashtag;

  _i2.PollTable get poll {
    if (_poll != null) return _poll!;
    _poll = _i1.createRelationTable(
      relationFieldName: 'poll',
      field: PollsHashtags.t.pollId,
      foreignField: _i2.Poll.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.PollTable(tableRelation: foreignTableRelation),
    );
    return _poll!;
  }

  _i2.PollHashtagTable get hashtag {
    if (_hashtag != null) return _hashtag!;
    _hashtag = _i1.createRelationTable(
      relationFieldName: 'hashtag',
      field: PollsHashtags.t.hashtagId,
      foreignField: _i2.PollHashtag.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.PollHashtagTable(tableRelation: foreignTableRelation),
    );
    return _hashtag!;
  }

  @override
  List<_i1.Column> get columns => [
        id,
        pollId,
        hashtagId,
      ];

  @override
  _i1.Table? getRelationTable(String relationField) {
    if (relationField == 'poll') {
      return poll;
    }
    if (relationField == 'hashtag') {
      return hashtag;
    }
    return null;
  }
}

class PollsHashtagsInclude extends _i1.IncludeObject {
  PollsHashtagsInclude._({
    _i2.PollInclude? poll,
    _i2.PollHashtagInclude? hashtag,
  }) {
    _poll = poll;
    _hashtag = hashtag;
  }

  _i2.PollInclude? _poll;

  _i2.PollHashtagInclude? _hashtag;

  @override
  Map<String, _i1.Include?> get includes => {
        'poll': _poll,
        'hashtag': _hashtag,
      };

  @override
  _i1.Table get table => PollsHashtags.t;
}

class PollsHashtagsIncludeList extends _i1.IncludeList {
  PollsHashtagsIncludeList._({
    _i1.WhereExpressionBuilder<PollsHashtagsTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(PollsHashtags.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table get table => PollsHashtags.t;
}

class PollsHashtagsRepository {
  const PollsHashtagsRepository._();

  final attachRow = const PollsHashtagsAttachRowRepository._();

  Future<List<PollsHashtags>> find(
    _i1.DatabaseAccessor databaseAccessor, {
    _i1.WhereExpressionBuilder<PollsHashtagsTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<PollsHashtagsTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<PollsHashtagsTable>? orderByList,
    _i1.Transaction? transaction,
    PollsHashtagsInclude? include,
  }) async {
    return databaseAccessor.db.find<PollsHashtags>(
      where: where?.call(PollsHashtags.t),
      orderBy: orderBy?.call(PollsHashtags.t),
      orderByList: orderByList?.call(PollsHashtags.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction ?? databaseAccessor.transaction,
      include: include,
    );
  }

  Future<PollsHashtags?> findFirstRow(
    _i1.DatabaseAccessor databaseAccessor, {
    _i1.WhereExpressionBuilder<PollsHashtagsTable>? where,
    int? offset,
    _i1.OrderByBuilder<PollsHashtagsTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<PollsHashtagsTable>? orderByList,
    _i1.Transaction? transaction,
    PollsHashtagsInclude? include,
  }) async {
    return databaseAccessor.db.findFirstRow<PollsHashtags>(
      where: where?.call(PollsHashtags.t),
      orderBy: orderBy?.call(PollsHashtags.t),
      orderByList: orderByList?.call(PollsHashtags.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction ?? databaseAccessor.transaction,
      include: include,
    );
  }

  Future<PollsHashtags?> findById(
    _i1.DatabaseAccessor databaseAccessor,
    int id, {
    _i1.Transaction? transaction,
    PollsHashtagsInclude? include,
  }) async {
    return databaseAccessor.db.findById<PollsHashtags>(
      id,
      transaction: transaction ?? databaseAccessor.transaction,
      include: include,
    );
  }

  Future<List<PollsHashtags>> insert(
    _i1.DatabaseAccessor databaseAccessor,
    List<PollsHashtags> rows, {
    _i1.Transaction? transaction,
  }) async {
    return databaseAccessor.db.insert<PollsHashtags>(
      rows,
      transaction: transaction ?? databaseAccessor.transaction,
    );
  }

  Future<PollsHashtags> insertRow(
    _i1.DatabaseAccessor databaseAccessor,
    PollsHashtags row, {
    _i1.Transaction? transaction,
  }) async {
    return databaseAccessor.db.insertRow<PollsHashtags>(
      row,
      transaction: transaction ?? databaseAccessor.transaction,
    );
  }

  Future<List<PollsHashtags>> update(
    _i1.DatabaseAccessor databaseAccessor,
    List<PollsHashtags> rows, {
    _i1.ColumnSelections<PollsHashtagsTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return databaseAccessor.db.update<PollsHashtags>(
      rows,
      columns: columns?.call(PollsHashtags.t),
      transaction: transaction ?? databaseAccessor.transaction,
    );
  }

  Future<PollsHashtags> updateRow(
    _i1.DatabaseAccessor databaseAccessor,
    PollsHashtags row, {
    _i1.ColumnSelections<PollsHashtagsTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return databaseAccessor.db.updateRow<PollsHashtags>(
      row,
      columns: columns?.call(PollsHashtags.t),
      transaction: transaction ?? databaseAccessor.transaction,
    );
  }

  Future<List<PollsHashtags>> delete(
    _i1.DatabaseAccessor databaseAccessor,
    List<PollsHashtags> rows, {
    _i1.Transaction? transaction,
  }) async {
    return databaseAccessor.db.delete<PollsHashtags>(
      rows,
      transaction: transaction ?? databaseAccessor.transaction,
    );
  }

  Future<PollsHashtags> deleteRow(
    _i1.DatabaseAccessor databaseAccessor,
    PollsHashtags row, {
    _i1.Transaction? transaction,
  }) async {
    return databaseAccessor.db.deleteRow<PollsHashtags>(
      row,
      transaction: transaction ?? databaseAccessor.transaction,
    );
  }

  Future<List<PollsHashtags>> deleteWhere(
    _i1.DatabaseAccessor databaseAccessor, {
    required _i1.WhereExpressionBuilder<PollsHashtagsTable> where,
    _i1.Transaction? transaction,
  }) async {
    return databaseAccessor.db.deleteWhere<PollsHashtags>(
      where: where(PollsHashtags.t),
      transaction: transaction ?? databaseAccessor.transaction,
    );
  }

  Future<int> count(
    _i1.DatabaseAccessor databaseAccessor, {
    _i1.WhereExpressionBuilder<PollsHashtagsTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return databaseAccessor.db.count<PollsHashtags>(
      where: where?.call(PollsHashtags.t),
      limit: limit,
      transaction: transaction ?? databaseAccessor.transaction,
    );
  }
}

class PollsHashtagsAttachRowRepository {
  const PollsHashtagsAttachRowRepository._();

  Future<void> poll(
    _i1.DatabaseAccessor databaseAccessor,
    PollsHashtags pollsHashtags,
    _i2.Poll poll, {
    _i1.Transaction? transaction,
  }) async {
    if (pollsHashtags.id == null) {
      throw ArgumentError.notNull('pollsHashtags.id');
    }
    if (poll.id == null) {
      throw ArgumentError.notNull('poll.id');
    }

    var $pollsHashtags = pollsHashtags.copyWith(pollId: poll.id);
    await databaseAccessor.db.updateRow<PollsHashtags>(
      $pollsHashtags,
      columns: [PollsHashtags.t.pollId],
      transaction: transaction ?? databaseAccessor.transaction,
    );
  }

  Future<void> hashtag(
    _i1.DatabaseAccessor databaseAccessor,
    PollsHashtags pollsHashtags,
    _i2.PollHashtag hashtag, {
    _i1.Transaction? transaction,
  }) async {
    if (pollsHashtags.id == null) {
      throw ArgumentError.notNull('pollsHashtags.id');
    }
    if (hashtag.id == null) {
      throw ArgumentError.notNull('hashtag.id');
    }

    var $pollsHashtags = pollsHashtags.copyWith(hashtagId: hashtag.id);
    await databaseAccessor.db.updateRow<PollsHashtags>(
      $pollsHashtags,
      columns: [PollsHashtags.t.hashtagId],
      transaction: transaction ?? databaseAccessor.transaction,
    );
  }
}
