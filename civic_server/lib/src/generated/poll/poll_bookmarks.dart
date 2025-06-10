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
import '../user/user_record.dart' as _i3;

abstract class PollBookmarks
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  PollBookmarks._({
    this.id,
    required this.pollId,
    this.poll,
    required this.ownerId,
    this.owner,
    DateTime? dateCreated,
  }) : dateCreated = dateCreated ?? DateTime.now();

  factory PollBookmarks({
    int? id,
    required int pollId,
    _i2.Poll? poll,
    required int ownerId,
    _i3.UserRecord? owner,
    DateTime? dateCreated,
  }) = _PollBookmarksImpl;

  factory PollBookmarks.fromJson(Map<String, dynamic> jsonSerialization) {
    return PollBookmarks(
      id: jsonSerialization['id'] as int?,
      pollId: jsonSerialization['pollId'] as int,
      poll: jsonSerialization['poll'] == null
          ? null
          : _i2.Poll.fromJson(
              (jsonSerialization['poll'] as Map<String, dynamic>)),
      ownerId: jsonSerialization['ownerId'] as int,
      owner: jsonSerialization['owner'] == null
          ? null
          : _i3.UserRecord.fromJson(
              (jsonSerialization['owner'] as Map<String, dynamic>)),
      dateCreated:
          _i1.DateTimeJsonExtension.fromJson(jsonSerialization['dateCreated']),
    );
  }

  static final t = PollBookmarksTable();

  static const db = PollBookmarksRepository._();

  @override
  int? id;

  int pollId;

  _i2.Poll? poll;

  int ownerId;

  _i3.UserRecord? owner;

  DateTime dateCreated;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [PollBookmarks]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  PollBookmarks copyWith({
    int? id,
    int? pollId,
    _i2.Poll? poll,
    int? ownerId,
    _i3.UserRecord? owner,
    DateTime? dateCreated,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'pollId': pollId,
      if (poll != null) 'poll': poll?.toJson(),
      'ownerId': ownerId,
      if (owner != null) 'owner': owner?.toJson(),
      'dateCreated': dateCreated.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'pollId': pollId,
      if (poll != null) 'poll': poll?.toJsonForProtocol(),
      'ownerId': ownerId,
      if (owner != null) 'owner': owner?.toJsonForProtocol(),
      'dateCreated': dateCreated.toJson(),
    };
  }

  static PollBookmarksInclude include({
    _i2.PollInclude? poll,
    _i3.UserRecordInclude? owner,
  }) {
    return PollBookmarksInclude._(
      poll: poll,
      owner: owner,
    );
  }

  static PollBookmarksIncludeList includeList({
    _i1.WhereExpressionBuilder<PollBookmarksTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<PollBookmarksTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<PollBookmarksTable>? orderByList,
    PollBookmarksInclude? include,
  }) {
    return PollBookmarksIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(PollBookmarks.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(PollBookmarks.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _PollBookmarksImpl extends PollBookmarks {
  _PollBookmarksImpl({
    int? id,
    required int pollId,
    _i2.Poll? poll,
    required int ownerId,
    _i3.UserRecord? owner,
    DateTime? dateCreated,
  }) : super._(
          id: id,
          pollId: pollId,
          poll: poll,
          ownerId: ownerId,
          owner: owner,
          dateCreated: dateCreated,
        );

  /// Returns a shallow copy of this [PollBookmarks]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  PollBookmarks copyWith({
    Object? id = _Undefined,
    int? pollId,
    Object? poll = _Undefined,
    int? ownerId,
    Object? owner = _Undefined,
    DateTime? dateCreated,
  }) {
    return PollBookmarks(
      id: id is int? ? id : this.id,
      pollId: pollId ?? this.pollId,
      poll: poll is _i2.Poll? ? poll : this.poll?.copyWith(),
      ownerId: ownerId ?? this.ownerId,
      owner: owner is _i3.UserRecord? ? owner : this.owner?.copyWith(),
      dateCreated: dateCreated ?? this.dateCreated,
    );
  }
}

class PollBookmarksTable extends _i1.Table<int?> {
  PollBookmarksTable({super.tableRelation})
      : super(tableName: 'poll_bookmarks') {
    pollId = _i1.ColumnInt(
      'pollId',
      this,
    );
    ownerId = _i1.ColumnInt(
      'ownerId',
      this,
    );
    dateCreated = _i1.ColumnDateTime(
      'dateCreated',
      this,
      hasDefault: true,
    );
  }

  late final _i1.ColumnInt pollId;

  _i2.PollTable? _poll;

  late final _i1.ColumnInt ownerId;

  _i3.UserRecordTable? _owner;

  late final _i1.ColumnDateTime dateCreated;

  _i2.PollTable get poll {
    if (_poll != null) return _poll!;
    _poll = _i1.createRelationTable(
      relationFieldName: 'poll',
      field: PollBookmarks.t.pollId,
      foreignField: _i2.Poll.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.PollTable(tableRelation: foreignTableRelation),
    );
    return _poll!;
  }

  _i3.UserRecordTable get owner {
    if (_owner != null) return _owner!;
    _owner = _i1.createRelationTable(
      relationFieldName: 'owner',
      field: PollBookmarks.t.ownerId,
      foreignField: _i3.UserRecord.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i3.UserRecordTable(tableRelation: foreignTableRelation),
    );
    return _owner!;
  }

  @override
  List<_i1.Column> get columns => [
        id,
        pollId,
        ownerId,
        dateCreated,
      ];

  @override
  _i1.Table? getRelationTable(String relationField) {
    if (relationField == 'poll') {
      return poll;
    }
    if (relationField == 'owner') {
      return owner;
    }
    return null;
  }
}

class PollBookmarksInclude extends _i1.IncludeObject {
  PollBookmarksInclude._({
    _i2.PollInclude? poll,
    _i3.UserRecordInclude? owner,
  }) {
    _poll = poll;
    _owner = owner;
  }

  _i2.PollInclude? _poll;

  _i3.UserRecordInclude? _owner;

  @override
  Map<String, _i1.Include?> get includes => {
        'poll': _poll,
        'owner': _owner,
      };

  @override
  _i1.Table<int?> get table => PollBookmarks.t;
}

class PollBookmarksIncludeList extends _i1.IncludeList {
  PollBookmarksIncludeList._({
    _i1.WhereExpressionBuilder<PollBookmarksTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(PollBookmarks.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => PollBookmarks.t;
}

class PollBookmarksRepository {
  const PollBookmarksRepository._();

  final attachRow = const PollBookmarksAttachRowRepository._();

  /// Returns a list of [PollBookmarks]s matching the given query parameters.
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
  Future<List<PollBookmarks>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<PollBookmarksTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<PollBookmarksTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<PollBookmarksTable>? orderByList,
    _i1.Transaction? transaction,
    PollBookmarksInclude? include,
  }) async {
    return session.db.find<PollBookmarks>(
      where: where?.call(PollBookmarks.t),
      orderBy: orderBy?.call(PollBookmarks.t),
      orderByList: orderByList?.call(PollBookmarks.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Returns the first matching [PollBookmarks] matching the given query parameters.
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
  Future<PollBookmarks?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<PollBookmarksTable>? where,
    int? offset,
    _i1.OrderByBuilder<PollBookmarksTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<PollBookmarksTable>? orderByList,
    _i1.Transaction? transaction,
    PollBookmarksInclude? include,
  }) async {
    return session.db.findFirstRow<PollBookmarks>(
      where: where?.call(PollBookmarks.t),
      orderBy: orderBy?.call(PollBookmarks.t),
      orderByList: orderByList?.call(PollBookmarks.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Finds a single [PollBookmarks] by its [id] or null if no such row exists.
  Future<PollBookmarks?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
    PollBookmarksInclude? include,
  }) async {
    return session.db.findById<PollBookmarks>(
      id,
      transaction: transaction,
      include: include,
    );
  }

  /// Inserts all [PollBookmarks]s in the list and returns the inserted rows.
  ///
  /// The returned [PollBookmarks]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<PollBookmarks>> insert(
    _i1.Session session,
    List<PollBookmarks> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<PollBookmarks>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [PollBookmarks] and returns the inserted row.
  ///
  /// The returned [PollBookmarks] will have its `id` field set.
  Future<PollBookmarks> insertRow(
    _i1.Session session,
    PollBookmarks row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<PollBookmarks>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [PollBookmarks]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<PollBookmarks>> update(
    _i1.Session session,
    List<PollBookmarks> rows, {
    _i1.ColumnSelections<PollBookmarksTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<PollBookmarks>(
      rows,
      columns: columns?.call(PollBookmarks.t),
      transaction: transaction,
    );
  }

  /// Updates a single [PollBookmarks]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<PollBookmarks> updateRow(
    _i1.Session session,
    PollBookmarks row, {
    _i1.ColumnSelections<PollBookmarksTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<PollBookmarks>(
      row,
      columns: columns?.call(PollBookmarks.t),
      transaction: transaction,
    );
  }

  /// Deletes all [PollBookmarks]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<PollBookmarks>> delete(
    _i1.Session session,
    List<PollBookmarks> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<PollBookmarks>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [PollBookmarks].
  Future<PollBookmarks> deleteRow(
    _i1.Session session,
    PollBookmarks row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<PollBookmarks>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<PollBookmarks>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<PollBookmarksTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<PollBookmarks>(
      where: where(PollBookmarks.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<PollBookmarksTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<PollBookmarks>(
      where: where?.call(PollBookmarks.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

class PollBookmarksAttachRowRepository {
  const PollBookmarksAttachRowRepository._();

  /// Creates a relation between the given [PollBookmarks] and [Poll]
  /// by setting the [PollBookmarks]'s foreign key `pollId` to refer to the [Poll].
  Future<void> poll(
    _i1.Session session,
    PollBookmarks pollBookmarks,
    _i2.Poll poll, {
    _i1.Transaction? transaction,
  }) async {
    if (pollBookmarks.id == null) {
      throw ArgumentError.notNull('pollBookmarks.id');
    }
    if (poll.id == null) {
      throw ArgumentError.notNull('poll.id');
    }

    var $pollBookmarks = pollBookmarks.copyWith(pollId: poll.id);
    await session.db.updateRow<PollBookmarks>(
      $pollBookmarks,
      columns: [PollBookmarks.t.pollId],
      transaction: transaction,
    );
  }

  /// Creates a relation between the given [PollBookmarks] and [UserRecord]
  /// by setting the [PollBookmarks]'s foreign key `ownerId` to refer to the [UserRecord].
  Future<void> owner(
    _i1.Session session,
    PollBookmarks pollBookmarks,
    _i3.UserRecord owner, {
    _i1.Transaction? transaction,
  }) async {
    if (pollBookmarks.id == null) {
      throw ArgumentError.notNull('pollBookmarks.id');
    }
    if (owner.id == null) {
      throw ArgumentError.notNull('owner.id');
    }

    var $pollBookmarks = pollBookmarks.copyWith(ownerId: owner.id);
    await session.db.updateRow<PollBookmarks>(
      $pollBookmarks,
      columns: [PollBookmarks.t.ownerId],
      transaction: transaction,
    );
  }
}
