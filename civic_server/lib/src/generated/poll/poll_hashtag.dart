/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters

// ignore_for_file: invalid_use_of_visible_for_testing_member

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;
import '../protocol.dart' as _i2;

abstract class PollHashtag implements _i1.TableRow, _i1.ProtocolSerialization {
  PollHashtag._({
    this.id,
    required this.tag,
    required this.usageCount,
    this.hashtags,
  });

  factory PollHashtag({
    int? id,
    required String tag,
    required int usageCount,
    List<_i2.PollsHashtags>? hashtags,
  }) = _PollHashtagImpl;

  factory PollHashtag.fromJson(Map<String, dynamic> jsonSerialization) {
    return PollHashtag(
      id: jsonSerialization['id'] as int?,
      tag: jsonSerialization['tag'] as String,
      usageCount: jsonSerialization['usageCount'] as int,
      hashtags: (jsonSerialization['hashtags'] as List?)
          ?.map((e) => _i2.PollsHashtags.fromJson((e as Map<String, dynamic>)))
          .toList(),
    );
  }

  static final t = PollHashtagTable();

  static const db = PollHashtagRepository._();

  @override
  int? id;

  String tag;

  int usageCount;

  List<_i2.PollsHashtags>? hashtags;

  @override
  _i1.Table get table => t;

  PollHashtag copyWith({
    int? id,
    String? tag,
    int? usageCount,
    List<_i2.PollsHashtags>? hashtags,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'tag': tag,
      'usageCount': usageCount,
      if (hashtags != null)
        'hashtags': hashtags?.toJson(valueToJson: (v) => v.toJson()),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'tag': tag,
      'usageCount': usageCount,
      if (hashtags != null)
        'hashtags': hashtags?.toJson(valueToJson: (v) => v.toJsonForProtocol()),
    };
  }

  static PollHashtagInclude include({_i2.PollsHashtagsIncludeList? hashtags}) {
    return PollHashtagInclude._(hashtags: hashtags);
  }

  static PollHashtagIncludeList includeList({
    _i1.WhereExpressionBuilder<PollHashtagTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<PollHashtagTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<PollHashtagTable>? orderByList,
    PollHashtagInclude? include,
  }) {
    return PollHashtagIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(PollHashtag.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(PollHashtag.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _PollHashtagImpl extends PollHashtag {
  _PollHashtagImpl({
    int? id,
    required String tag,
    required int usageCount,
    List<_i2.PollsHashtags>? hashtags,
  }) : super._(
          id: id,
          tag: tag,
          usageCount: usageCount,
          hashtags: hashtags,
        );

  @override
  PollHashtag copyWith({
    Object? id = _Undefined,
    String? tag,
    int? usageCount,
    Object? hashtags = _Undefined,
  }) {
    return PollHashtag(
      id: id is int? ? id : this.id,
      tag: tag ?? this.tag,
      usageCount: usageCount ?? this.usageCount,
      hashtags: hashtags is List<_i2.PollsHashtags>?
          ? hashtags
          : this.hashtags?.map((e0) => e0.copyWith()).toList(),
    );
  }
}

class PollHashtagTable extends _i1.Table {
  PollHashtagTable({super.tableRelation}) : super(tableName: 'pollhashtag') {
    tag = _i1.ColumnString(
      'tag',
      this,
    );
    usageCount = _i1.ColumnInt(
      'usageCount',
      this,
    );
  }

  late final _i1.ColumnString tag;

  late final _i1.ColumnInt usageCount;

  _i2.PollsHashtagsTable? ___hashtags;

  _i1.ManyRelation<_i2.PollsHashtagsTable>? _hashtags;

  _i2.PollsHashtagsTable get __hashtags {
    if (___hashtags != null) return ___hashtags!;
    ___hashtags = _i1.createRelationTable(
      relationFieldName: '__hashtags',
      field: PollHashtag.t.id,
      foreignField: _i2.PollsHashtags.t.hashtagId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.PollsHashtagsTable(tableRelation: foreignTableRelation),
    );
    return ___hashtags!;
  }

  _i1.ManyRelation<_i2.PollsHashtagsTable> get hashtags {
    if (_hashtags != null) return _hashtags!;
    var relationTable = _i1.createRelationTable(
      relationFieldName: 'hashtags',
      field: PollHashtag.t.id,
      foreignField: _i2.PollsHashtags.t.hashtagId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.PollsHashtagsTable(tableRelation: foreignTableRelation),
    );
    _hashtags = _i1.ManyRelation<_i2.PollsHashtagsTable>(
      tableWithRelations: relationTable,
      table: _i2.PollsHashtagsTable(
          tableRelation: relationTable.tableRelation!.lastRelation),
    );
    return _hashtags!;
  }

  @override
  List<_i1.Column> get columns => [
        id,
        tag,
        usageCount,
      ];

  @override
  _i1.Table? getRelationTable(String relationField) {
    if (relationField == 'hashtags') {
      return __hashtags;
    }
    return null;
  }
}

class PollHashtagInclude extends _i1.IncludeObject {
  PollHashtagInclude._({_i2.PollsHashtagsIncludeList? hashtags}) {
    _hashtags = hashtags;
  }

  _i2.PollsHashtagsIncludeList? _hashtags;

  @override
  Map<String, _i1.Include?> get includes => {'hashtags': _hashtags};

  @override
  _i1.Table get table => PollHashtag.t;
}

class PollHashtagIncludeList extends _i1.IncludeList {
  PollHashtagIncludeList._({
    _i1.WhereExpressionBuilder<PollHashtagTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(PollHashtag.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table get table => PollHashtag.t;
}

class PollHashtagRepository {
  const PollHashtagRepository._();

  final attach = const PollHashtagAttachRepository._();

  final attachRow = const PollHashtagAttachRowRepository._();

  final detach = const PollHashtagDetachRepository._();

  final detachRow = const PollHashtagDetachRowRepository._();

  Future<List<PollHashtag>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<PollHashtagTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<PollHashtagTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<PollHashtagTable>? orderByList,
    _i1.Transaction? transaction,
    PollHashtagInclude? include,
  }) async {
    return session.db.find<PollHashtag>(
      where: where?.call(PollHashtag.t),
      orderBy: orderBy?.call(PollHashtag.t),
      orderByList: orderByList?.call(PollHashtag.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction ?? session.transaction,
      include: include,
    );
  }

  Future<PollHashtag?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<PollHashtagTable>? where,
    int? offset,
    _i1.OrderByBuilder<PollHashtagTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<PollHashtagTable>? orderByList,
    _i1.Transaction? transaction,
    PollHashtagInclude? include,
  }) async {
    return session.db.findFirstRow<PollHashtag>(
      where: where?.call(PollHashtag.t),
      orderBy: orderBy?.call(PollHashtag.t),
      orderByList: orderByList?.call(PollHashtag.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction ?? session.transaction,
      include: include,
    );
  }

  Future<PollHashtag?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
    PollHashtagInclude? include,
  }) async {
    return session.db.findById<PollHashtag>(
      id,
      transaction: transaction ?? session.transaction,
      include: include,
    );
  }

  Future<List<PollHashtag>> insert(
    _i1.Session session,
    List<PollHashtag> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<PollHashtag>(
      rows,
      transaction: transaction ?? session.transaction,
    );
  }

  Future<PollHashtag> insertRow(
    _i1.Session session,
    PollHashtag row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<PollHashtag>(
      row,
      transaction: transaction ?? session.transaction,
    );
  }

  Future<List<PollHashtag>> update(
    _i1.Session session,
    List<PollHashtag> rows, {
    _i1.ColumnSelections<PollHashtagTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<PollHashtag>(
      rows,
      columns: columns?.call(PollHashtag.t),
      transaction: transaction ?? session.transaction,
    );
  }

  Future<PollHashtag> updateRow(
    _i1.Session session,
    PollHashtag row, {
    _i1.ColumnSelections<PollHashtagTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<PollHashtag>(
      row,
      columns: columns?.call(PollHashtag.t),
      transaction: transaction ?? session.transaction,
    );
  }

  Future<List<PollHashtag>> delete(
    _i1.Session session,
    List<PollHashtag> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<PollHashtag>(
      rows,
      transaction: transaction ?? session.transaction,
    );
  }

  Future<PollHashtag> deleteRow(
    _i1.Session session,
    PollHashtag row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<PollHashtag>(
      row,
      transaction: transaction ?? session.transaction,
    );
  }

  Future<List<PollHashtag>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<PollHashtagTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<PollHashtag>(
      where: where(PollHashtag.t),
      transaction: transaction ?? session.transaction,
    );
  }

  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<PollHashtagTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<PollHashtag>(
      where: where?.call(PollHashtag.t),
      limit: limit,
      transaction: transaction ?? session.transaction,
    );
  }
}

class PollHashtagAttachRepository {
  const PollHashtagAttachRepository._();

  Future<void> hashtags(
    _i1.Session session,
    PollHashtag pollHashtag,
    List<_i2.PollsHashtags> pollsHashtags, {
    _i1.Transaction? transaction,
  }) async {
    if (pollsHashtags.any((e) => e.id == null)) {
      throw ArgumentError.notNull('pollsHashtags.id');
    }
    if (pollHashtag.id == null) {
      throw ArgumentError.notNull('pollHashtag.id');
    }

    var $pollsHashtags = pollsHashtags
        .map((e) => e.copyWith(hashtagId: pollHashtag.id))
        .toList();
    await session.db.update<_i2.PollsHashtags>(
      $pollsHashtags,
      columns: [_i2.PollsHashtags.t.hashtagId],
      transaction: transaction ?? session.transaction,
    );
  }
}

class PollHashtagAttachRowRepository {
  const PollHashtagAttachRowRepository._();

  Future<void> hashtags(
    _i1.Session session,
    PollHashtag pollHashtag,
    _i2.PollsHashtags pollsHashtags, {
    _i1.Transaction? transaction,
  }) async {
    if (pollsHashtags.id == null) {
      throw ArgumentError.notNull('pollsHashtags.id');
    }
    if (pollHashtag.id == null) {
      throw ArgumentError.notNull('pollHashtag.id');
    }

    var $pollsHashtags = pollsHashtags.copyWith(hashtagId: pollHashtag.id);
    await session.db.updateRow<_i2.PollsHashtags>(
      $pollsHashtags,
      columns: [_i2.PollsHashtags.t.hashtagId],
      transaction: transaction ?? session.transaction,
    );
  }
}

class PollHashtagDetachRepository {
  const PollHashtagDetachRepository._();

  Future<void> hashtags(
    _i1.Session session,
    List<_i2.PollsHashtags> pollsHashtags, {
    _i1.Transaction? transaction,
  }) async {
    if (pollsHashtags.any((e) => e.id == null)) {
      throw ArgumentError.notNull('pollsHashtags.id');
    }

    var $pollsHashtags =
        pollsHashtags.map((e) => e.copyWith(hashtagId: null)).toList();
    await session.db.update<_i2.PollsHashtags>(
      $pollsHashtags,
      columns: [_i2.PollsHashtags.t.hashtagId],
      transaction: transaction ?? session.transaction,
    );
  }
}

class PollHashtagDetachRowRepository {
  const PollHashtagDetachRowRepository._();

  Future<void> hashtags(
    _i1.Session session,
    _i2.PollsHashtags pollsHashtags, {
    _i1.Transaction? transaction,
  }) async {
    if (pollsHashtags.id == null) {
      throw ArgumentError.notNull('pollsHashtags.id');
    }

    var $pollsHashtags = pollsHashtags.copyWith(hashtagId: null);
    await session.db.updateRow<_i2.PollsHashtags>(
      $pollsHashtags,
      columns: [_i2.PollsHashtags.t.hashtagId],
      transaction: transaction ?? session.transaction,
    );
  }
}
