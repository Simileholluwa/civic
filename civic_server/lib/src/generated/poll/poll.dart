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

abstract class Poll implements _i1.TableRow, _i1.ProtocolSerialization {
  Poll._({
    this.id,
    required this.ownerId,
    this.owner,
    required this.question,
    required this.taggedUsers,
    required this.locations,
    required this.mentions,
    this.options,
    required this.tags,
    this.createdAt,
    this.pollDuration,
    this.hashtags,
  });

  factory Poll({
    int? id,
    required int ownerId,
    _i2.UserRecord? owner,
    required String question,
    required List<_i2.UserRecord> taggedUsers,
    required List<_i2.AWSPlaces> locations,
    required List<_i2.UserRecord> mentions,
    _i2.PollOption? options,
    required List<String> tags,
    DateTime? createdAt,
    int? pollDuration,
    List<_i2.PollsHashtags>? hashtags,
  }) = _PollImpl;

  factory Poll.fromJson(Map<String, dynamic> jsonSerialization) {
    return Poll(
      id: jsonSerialization['id'] as int?,
      ownerId: jsonSerialization['ownerId'] as int,
      owner: jsonSerialization['owner'] == null
          ? null
          : _i2.UserRecord.fromJson(
              (jsonSerialization['owner'] as Map<String, dynamic>)),
      question: jsonSerialization['question'] as String,
      taggedUsers: (jsonSerialization['taggedUsers'] as List)
          .map((e) => _i2.UserRecord.fromJson((e as Map<String, dynamic>)))
          .toList(),
      locations: (jsonSerialization['locations'] as List)
          .map((e) => _i2.AWSPlaces.fromJson((e as Map<String, dynamic>)))
          .toList(),
      mentions: (jsonSerialization['mentions'] as List)
          .map((e) => _i2.UserRecord.fromJson((e as Map<String, dynamic>)))
          .toList(),
      options: jsonSerialization['options'] == null
          ? null
          : _i2.PollOption.fromJson(
              (jsonSerialization['options'] as Map<String, dynamic>)),
      tags:
          (jsonSerialization['tags'] as List).map((e) => e as String).toList(),
      createdAt: jsonSerialization['createdAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
      pollDuration: jsonSerialization['pollDuration'] as int?,
      hashtags: (jsonSerialization['hashtags'] as List?)
          ?.map((e) => _i2.PollsHashtags.fromJson((e as Map<String, dynamic>)))
          .toList(),
    );
  }

  static final t = PollTable();

  static const db = PollRepository._();

  @override
  int? id;

  int ownerId;

  _i2.UserRecord? owner;

  String question;

  List<_i2.UserRecord> taggedUsers;

  List<_i2.AWSPlaces> locations;

  List<_i2.UserRecord> mentions;

  _i2.PollOption? options;

  List<String> tags;

  DateTime? createdAt;

  int? pollDuration;

  List<_i2.PollsHashtags>? hashtags;

  @override
  _i1.Table get table => t;

  Poll copyWith({
    int? id,
    int? ownerId,
    _i2.UserRecord? owner,
    String? question,
    List<_i2.UserRecord>? taggedUsers,
    List<_i2.AWSPlaces>? locations,
    List<_i2.UserRecord>? mentions,
    _i2.PollOption? options,
    List<String>? tags,
    DateTime? createdAt,
    int? pollDuration,
    List<_i2.PollsHashtags>? hashtags,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'ownerId': ownerId,
      if (owner != null) 'owner': owner?.toJson(),
      'question': question,
      'taggedUsers': taggedUsers.toJson(valueToJson: (v) => v.toJson()),
      'locations': locations.toJson(valueToJson: (v) => v.toJson()),
      'mentions': mentions.toJson(valueToJson: (v) => v.toJson()),
      if (options != null) 'options': options?.toJson(),
      'tags': tags.toJson(),
      if (createdAt != null) 'createdAt': createdAt?.toJson(),
      if (pollDuration != null) 'pollDuration': pollDuration,
      if (hashtags != null)
        'hashtags': hashtags?.toJson(valueToJson: (v) => v.toJson()),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'ownerId': ownerId,
      if (owner != null) 'owner': owner?.toJsonForProtocol(),
      'question': question,
      'taggedUsers':
          taggedUsers.toJson(valueToJson: (v) => v.toJsonForProtocol()),
      'locations': locations.toJson(valueToJson: (v) => v.toJsonForProtocol()),
      'mentions': mentions.toJson(valueToJson: (v) => v.toJsonForProtocol()),
      if (options != null) 'options': options?.toJsonForProtocol(),
      'tags': tags.toJson(),
      if (createdAt != null) 'createdAt': createdAt?.toJson(),
      if (pollDuration != null) 'pollDuration': pollDuration,
      if (hashtags != null)
        'hashtags': hashtags?.toJson(valueToJson: (v) => v.toJsonForProtocol()),
    };
  }

  static PollInclude include({
    _i2.UserRecordInclude? owner,
    _i2.PollsHashtagsIncludeList? hashtags,
  }) {
    return PollInclude._(
      owner: owner,
      hashtags: hashtags,
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
    required String question,
    required List<_i2.UserRecord> taggedUsers,
    required List<_i2.AWSPlaces> locations,
    required List<_i2.UserRecord> mentions,
    _i2.PollOption? options,
    required List<String> tags,
    DateTime? createdAt,
    int? pollDuration,
    List<_i2.PollsHashtags>? hashtags,
  }) : super._(
          id: id,
          ownerId: ownerId,
          owner: owner,
          question: question,
          taggedUsers: taggedUsers,
          locations: locations,
          mentions: mentions,
          options: options,
          tags: tags,
          createdAt: createdAt,
          pollDuration: pollDuration,
          hashtags: hashtags,
        );

  @override
  Poll copyWith({
    Object? id = _Undefined,
    int? ownerId,
    Object? owner = _Undefined,
    String? question,
    List<_i2.UserRecord>? taggedUsers,
    List<_i2.AWSPlaces>? locations,
    List<_i2.UserRecord>? mentions,
    Object? options = _Undefined,
    List<String>? tags,
    Object? createdAt = _Undefined,
    Object? pollDuration = _Undefined,
    Object? hashtags = _Undefined,
  }) {
    return Poll(
      id: id is int? ? id : this.id,
      ownerId: ownerId ?? this.ownerId,
      owner: owner is _i2.UserRecord? ? owner : this.owner?.copyWith(),
      question: question ?? this.question,
      taggedUsers:
          taggedUsers ?? this.taggedUsers.map((e0) => e0.copyWith()).toList(),
      locations:
          locations ?? this.locations.map((e0) => e0.copyWith()).toList(),
      mentions: mentions ?? this.mentions.map((e0) => e0.copyWith()).toList(),
      options: options is _i2.PollOption? ? options : this.options?.copyWith(),
      tags: tags ?? this.tags.map((e0) => e0).toList(),
      createdAt: createdAt is DateTime? ? createdAt : this.createdAt,
      pollDuration: pollDuration is int? ? pollDuration : this.pollDuration,
      hashtags: hashtags is List<_i2.PollsHashtags>?
          ? hashtags
          : this.hashtags?.map((e0) => e0.copyWith()).toList(),
    );
  }
}

class PollTable extends _i1.Table {
  PollTable({super.tableRelation}) : super(tableName: 'poll') {
    ownerId = _i1.ColumnInt(
      'ownerId',
      this,
    );
    question = _i1.ColumnString(
      'question',
      this,
    );
    taggedUsers = _i1.ColumnSerializable(
      'taggedUsers',
      this,
    );
    locations = _i1.ColumnSerializable(
      'locations',
      this,
    );
    mentions = _i1.ColumnSerializable(
      'mentions',
      this,
    );
    options = _i1.ColumnSerializable(
      'options',
      this,
    );
    tags = _i1.ColumnSerializable(
      'tags',
      this,
    );
    createdAt = _i1.ColumnDateTime(
      'createdAt',
      this,
    );
    pollDuration = _i1.ColumnInt(
      'pollDuration',
      this,
    );
  }

  late final _i1.ColumnInt ownerId;

  _i2.UserRecordTable? _owner;

  late final _i1.ColumnString question;

  late final _i1.ColumnSerializable taggedUsers;

  late final _i1.ColumnSerializable locations;

  late final _i1.ColumnSerializable mentions;

  late final _i1.ColumnSerializable options;

  late final _i1.ColumnSerializable tags;

  late final _i1.ColumnDateTime createdAt;

  late final _i1.ColumnInt pollDuration;

  _i2.PollsHashtagsTable? ___hashtags;

  _i1.ManyRelation<_i2.PollsHashtagsTable>? _hashtags;

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

  _i2.PollsHashtagsTable get __hashtags {
    if (___hashtags != null) return ___hashtags!;
    ___hashtags = _i1.createRelationTable(
      relationFieldName: '__hashtags',
      field: Poll.t.id,
      foreignField: _i2.PollsHashtags.t.pollId,
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
      field: Poll.t.id,
      foreignField: _i2.PollsHashtags.t.pollId,
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
        ownerId,
        question,
        taggedUsers,
        locations,
        mentions,
        options,
        tags,
        createdAt,
        pollDuration,
      ];

  @override
  _i1.Table? getRelationTable(String relationField) {
    if (relationField == 'owner') {
      return owner;
    }
    if (relationField == 'hashtags') {
      return __hashtags;
    }
    return null;
  }
}

class PollInclude extends _i1.IncludeObject {
  PollInclude._({
    _i2.UserRecordInclude? owner,
    _i2.PollsHashtagsIncludeList? hashtags,
  }) {
    _owner = owner;
    _hashtags = hashtags;
  }

  _i2.UserRecordInclude? _owner;

  _i2.PollsHashtagsIncludeList? _hashtags;

  @override
  Map<String, _i1.Include?> get includes => {
        'owner': _owner,
        'hashtags': _hashtags,
      };

  @override
  _i1.Table get table => Poll.t;
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
  _i1.Table get table => Poll.t;
}

class PollRepository {
  const PollRepository._();

  final attach = const PollAttachRepository._();

  final attachRow = const PollAttachRowRepository._();

  final detach = const PollDetachRepository._();

  final detachRow = const PollDetachRowRepository._();

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
      transaction: transaction ?? session.transaction,
      include: include,
    );
  }

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
      transaction: transaction ?? session.transaction,
      include: include,
    );
  }

  Future<Poll?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
    PollInclude? include,
  }) async {
    return session.db.findById<Poll>(
      id,
      transaction: transaction ?? session.transaction,
      include: include,
    );
  }

  Future<List<Poll>> insert(
    _i1.Session session,
    List<Poll> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<Poll>(
      rows,
      transaction: transaction ?? session.transaction,
    );
  }

  Future<Poll> insertRow(
    _i1.Session session,
    Poll row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<Poll>(
      row,
      transaction: transaction ?? session.transaction,
    );
  }

  Future<List<Poll>> update(
    _i1.Session session,
    List<Poll> rows, {
    _i1.ColumnSelections<PollTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<Poll>(
      rows,
      columns: columns?.call(Poll.t),
      transaction: transaction ?? session.transaction,
    );
  }

  Future<Poll> updateRow(
    _i1.Session session,
    Poll row, {
    _i1.ColumnSelections<PollTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<Poll>(
      row,
      columns: columns?.call(Poll.t),
      transaction: transaction ?? session.transaction,
    );
  }

  Future<List<Poll>> delete(
    _i1.Session session,
    List<Poll> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<Poll>(
      rows,
      transaction: transaction ?? session.transaction,
    );
  }

  Future<Poll> deleteRow(
    _i1.Session session,
    Poll row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<Poll>(
      row,
      transaction: transaction ?? session.transaction,
    );
  }

  Future<List<Poll>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<PollTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<Poll>(
      where: where(Poll.t),
      transaction: transaction ?? session.transaction,
    );
  }

  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<PollTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<Poll>(
      where: where?.call(Poll.t),
      limit: limit,
      transaction: transaction ?? session.transaction,
    );
  }
}

class PollAttachRepository {
  const PollAttachRepository._();

  Future<void> hashtags(
    _i1.Session session,
    Poll poll,
    List<_i2.PollsHashtags> pollsHashtags, {
    _i1.Transaction? transaction,
  }) async {
    if (pollsHashtags.any((e) => e.id == null)) {
      throw ArgumentError.notNull('pollsHashtags.id');
    }
    if (poll.id == null) {
      throw ArgumentError.notNull('poll.id');
    }

    var $pollsHashtags =
        pollsHashtags.map((e) => e.copyWith(pollId: poll.id)).toList();
    await session.db.update<_i2.PollsHashtags>(
      $pollsHashtags,
      columns: [_i2.PollsHashtags.t.pollId],
      transaction: transaction ?? session.transaction,
    );
  }
}

class PollAttachRowRepository {
  const PollAttachRowRepository._();

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
      transaction: transaction ?? session.transaction,
    );
  }

  Future<void> hashtags(
    _i1.Session session,
    Poll poll,
    _i2.PollsHashtags pollsHashtags, {
    _i1.Transaction? transaction,
  }) async {
    if (pollsHashtags.id == null) {
      throw ArgumentError.notNull('pollsHashtags.id');
    }
    if (poll.id == null) {
      throw ArgumentError.notNull('poll.id');
    }

    var $pollsHashtags = pollsHashtags.copyWith(pollId: poll.id);
    await session.db.updateRow<_i2.PollsHashtags>(
      $pollsHashtags,
      columns: [_i2.PollsHashtags.t.pollId],
      transaction: transaction ?? session.transaction,
    );
  }
}

class PollDetachRepository {
  const PollDetachRepository._();

  Future<void> hashtags(
    _i1.Session session,
    List<_i2.PollsHashtags> pollsHashtags, {
    _i1.Transaction? transaction,
  }) async {
    if (pollsHashtags.any((e) => e.id == null)) {
      throw ArgumentError.notNull('pollsHashtags.id');
    }

    var $pollsHashtags =
        pollsHashtags.map((e) => e.copyWith(pollId: null)).toList();
    await session.db.update<_i2.PollsHashtags>(
      $pollsHashtags,
      columns: [_i2.PollsHashtags.t.pollId],
      transaction: transaction ?? session.transaction,
    );
  }
}

class PollDetachRowRepository {
  const PollDetachRowRepository._();

  Future<void> hashtags(
    _i1.Session session,
    _i2.PollsHashtags pollsHashtags, {
    _i1.Transaction? transaction,
  }) async {
    if (pollsHashtags.id == null) {
      throw ArgumentError.notNull('pollsHashtags.id');
    }

    var $pollsHashtags = pollsHashtags.copyWith(pollId: null);
    await session.db.updateRow<_i2.PollsHashtags>(
      $pollsHashtags,
      columns: [_i2.PollsHashtags.t.pollId],
      transaction: transaction ?? session.transaction,
    );
  }
}
