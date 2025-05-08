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
import '../poll/poll.dart' as _i2;
import '../poll/poll_hashtag.dart' as _i3;

abstract class PollsHashtags
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  PollsHashtags._({
    this.id,
    required this.pollId,
    this.poll,
    required this.hashtagId,
    this.hashtag,
  });

  factory PollsHashtags({
    int? id,
    required int pollId,
    _i2.Poll? poll,
    required int hashtagId,
    _i3.PollHashtag? hashtag,
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
          : _i3.PollHashtag.fromJson(
              (jsonSerialization['hashtag'] as Map<String, dynamic>)),
    );
  }

  static final t = PollsHashtagsTable();

  static const db = PollsHashtagsRepository._();

  @override
  int? id;

  int pollId;

  _i2.Poll? poll;

  int hashtagId;

  _i3.PollHashtag? hashtag;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [PollsHashtags]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  PollsHashtags copyWith({
    int? id,
    int? pollId,
    _i2.Poll? poll,
    int? hashtagId,
    _i3.PollHashtag? hashtag,
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
    _i3.PollHashtagInclude? hashtag,
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
    _i3.PollHashtag? hashtag,
  }) : super._(
          id: id,
          pollId: pollId,
          poll: poll,
          hashtagId: hashtagId,
          hashtag: hashtag,
        );

  /// Returns a shallow copy of this [PollsHashtags]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
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
      hashtag: hashtag is _i3.PollHashtag? ? hashtag : this.hashtag?.copyWith(),
    );
  }
}

class PollsHashtagsTable extends _i1.Table<int?> {
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

  _i3.PollHashtagTable? _hashtag;

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

  _i3.PollHashtagTable get hashtag {
    if (_hashtag != null) return _hashtag!;
    _hashtag = _i1.createRelationTable(
      relationFieldName: 'hashtag',
      field: PollsHashtags.t.hashtagId,
      foreignField: _i3.PollHashtag.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i3.PollHashtagTable(tableRelation: foreignTableRelation),
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
    _i3.PollHashtagInclude? hashtag,
  }) {
    _poll = poll;
    _hashtag = hashtag;
  }

  _i2.PollInclude? _poll;

  _i3.PollHashtagInclude? _hashtag;

  @override
  Map<String, _i1.Include?> get includes => {
        'poll': _poll,
        'hashtag': _hashtag,
      };

  @override
  _i1.Table<int?> get table => PollsHashtags.t;
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
  _i1.Table<int?> get table => PollsHashtags.t;
}

class PollsHashtagsRepository {
  const PollsHashtagsRepository._();

  final attachRow = const PollsHashtagsAttachRowRepository._();

  /// Returns a list of [PollsHashtags]s matching the given query parameters.
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
  Future<List<PollsHashtags>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<PollsHashtagsTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<PollsHashtagsTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<PollsHashtagsTable>? orderByList,
    _i1.Transaction? transaction,
    PollsHashtagsInclude? include,
  }) async {
    return session.db.find<PollsHashtags>(
      where: where?.call(PollsHashtags.t),
      orderBy: orderBy?.call(PollsHashtags.t),
      orderByList: orderByList?.call(PollsHashtags.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Returns the first matching [PollsHashtags] matching the given query parameters.
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
  Future<PollsHashtags?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<PollsHashtagsTable>? where,
    int? offset,
    _i1.OrderByBuilder<PollsHashtagsTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<PollsHashtagsTable>? orderByList,
    _i1.Transaction? transaction,
    PollsHashtagsInclude? include,
  }) async {
    return session.db.findFirstRow<PollsHashtags>(
      where: where?.call(PollsHashtags.t),
      orderBy: orderBy?.call(PollsHashtags.t),
      orderByList: orderByList?.call(PollsHashtags.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Finds a single [PollsHashtags] by its [id] or null if no such row exists.
  Future<PollsHashtags?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
    PollsHashtagsInclude? include,
  }) async {
    return session.db.findById<PollsHashtags>(
      id,
      transaction: transaction,
      include: include,
    );
  }

  /// Inserts all [PollsHashtags]s in the list and returns the inserted rows.
  ///
  /// The returned [PollsHashtags]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<PollsHashtags>> insert(
    _i1.Session session,
    List<PollsHashtags> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<PollsHashtags>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [PollsHashtags] and returns the inserted row.
  ///
  /// The returned [PollsHashtags] will have its `id` field set.
  Future<PollsHashtags> insertRow(
    _i1.Session session,
    PollsHashtags row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<PollsHashtags>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [PollsHashtags]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<PollsHashtags>> update(
    _i1.Session session,
    List<PollsHashtags> rows, {
    _i1.ColumnSelections<PollsHashtagsTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<PollsHashtags>(
      rows,
      columns: columns?.call(PollsHashtags.t),
      transaction: transaction,
    );
  }

  /// Updates a single [PollsHashtags]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<PollsHashtags> updateRow(
    _i1.Session session,
    PollsHashtags row, {
    _i1.ColumnSelections<PollsHashtagsTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<PollsHashtags>(
      row,
      columns: columns?.call(PollsHashtags.t),
      transaction: transaction,
    );
  }

  /// Deletes all [PollsHashtags]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<PollsHashtags>> delete(
    _i1.Session session,
    List<PollsHashtags> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<PollsHashtags>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [PollsHashtags].
  Future<PollsHashtags> deleteRow(
    _i1.Session session,
    PollsHashtags row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<PollsHashtags>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<PollsHashtags>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<PollsHashtagsTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<PollsHashtags>(
      where: where(PollsHashtags.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<PollsHashtagsTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<PollsHashtags>(
      where: where?.call(PollsHashtags.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

class PollsHashtagsAttachRowRepository {
  const PollsHashtagsAttachRowRepository._();

  /// Creates a relation between the given [PollsHashtags] and [Poll]
  /// by setting the [PollsHashtags]'s foreign key `pollId` to refer to the [Poll].
  Future<void> poll(
    _i1.Session session,
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
    await session.db.updateRow<PollsHashtags>(
      $pollsHashtags,
      columns: [PollsHashtags.t.pollId],
      transaction: transaction,
    );
  }

  /// Creates a relation between the given [PollsHashtags] and [PollHashtag]
  /// by setting the [PollsHashtags]'s foreign key `hashtagId` to refer to the [PollHashtag].
  Future<void> hashtag(
    _i1.Session session,
    PollsHashtags pollsHashtags,
    _i3.PollHashtag hashtag, {
    _i1.Transaction? transaction,
  }) async {
    if (pollsHashtags.id == null) {
      throw ArgumentError.notNull('pollsHashtags.id');
    }
    if (hashtag.id == null) {
      throw ArgumentError.notNull('hashtag.id');
    }

    var $pollsHashtags = pollsHashtags.copyWith(hashtagId: hashtag.id);
    await session.db.updateRow<PollsHashtags>(
      $pollsHashtags,
      columns: [PollsHashtags.t.hashtagId],
      transaction: transaction,
    );
  }
}
