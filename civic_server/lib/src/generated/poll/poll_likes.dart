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

abstract class PollLikes
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  PollLikes._({
    this.id,
    required this.pollId,
    this.poll,
    required this.ownerId,
    this.owner,
    this.dateCreated,
  });

  factory PollLikes({
    int? id,
    required int pollId,
    _i2.Poll? poll,
    required int ownerId,
    _i3.UserRecord? owner,
    DateTime? dateCreated,
  }) = _PollLikesImpl;

  factory PollLikes.fromJson(Map<String, dynamic> jsonSerialization) {
    return PollLikes(
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
      dateCreated: jsonSerialization['dateCreated'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(
              jsonSerialization['dateCreated']),
    );
  }

  static final t = PollLikesTable();

  static const db = PollLikesRepository._();

  @override
  int? id;

  int pollId;

  _i2.Poll? poll;

  int ownerId;

  _i3.UserRecord? owner;

  DateTime? dateCreated;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [PollLikes]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  PollLikes copyWith({
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
      if (dateCreated != null) 'dateCreated': dateCreated?.toJson(),
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
      if (dateCreated != null) 'dateCreated': dateCreated?.toJson(),
    };
  }

  static PollLikesInclude include({
    _i2.PollInclude? poll,
    _i3.UserRecordInclude? owner,
  }) {
    return PollLikesInclude._(
      poll: poll,
      owner: owner,
    );
  }

  static PollLikesIncludeList includeList({
    _i1.WhereExpressionBuilder<PollLikesTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<PollLikesTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<PollLikesTable>? orderByList,
    PollLikesInclude? include,
  }) {
    return PollLikesIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(PollLikes.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(PollLikes.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _PollLikesImpl extends PollLikes {
  _PollLikesImpl({
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

  /// Returns a shallow copy of this [PollLikes]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  PollLikes copyWith({
    Object? id = _Undefined,
    int? pollId,
    Object? poll = _Undefined,
    int? ownerId,
    Object? owner = _Undefined,
    Object? dateCreated = _Undefined,
  }) {
    return PollLikes(
      id: id is int? ? id : this.id,
      pollId: pollId ?? this.pollId,
      poll: poll is _i2.Poll? ? poll : this.poll?.copyWith(),
      ownerId: ownerId ?? this.ownerId,
      owner: owner is _i3.UserRecord? ? owner : this.owner?.copyWith(),
      dateCreated: dateCreated is DateTime? ? dateCreated : this.dateCreated,
    );
  }
}

class PollLikesTable extends _i1.Table<int?> {
  PollLikesTable({super.tableRelation}) : super(tableName: 'poll_likes') {
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
      field: PollLikes.t.pollId,
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
      field: PollLikes.t.ownerId,
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

class PollLikesInclude extends _i1.IncludeObject {
  PollLikesInclude._({
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
  _i1.Table<int?> get table => PollLikes.t;
}

class PollLikesIncludeList extends _i1.IncludeList {
  PollLikesIncludeList._({
    _i1.WhereExpressionBuilder<PollLikesTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(PollLikes.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => PollLikes.t;
}

class PollLikesRepository {
  const PollLikesRepository._();

  final attachRow = const PollLikesAttachRowRepository._();

  /// Returns a list of [PollLikes]s matching the given query parameters.
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
  Future<List<PollLikes>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<PollLikesTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<PollLikesTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<PollLikesTable>? orderByList,
    _i1.Transaction? transaction,
    PollLikesInclude? include,
  }) async {
    return session.db.find<PollLikes>(
      where: where?.call(PollLikes.t),
      orderBy: orderBy?.call(PollLikes.t),
      orderByList: orderByList?.call(PollLikes.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Returns the first matching [PollLikes] matching the given query parameters.
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
  Future<PollLikes?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<PollLikesTable>? where,
    int? offset,
    _i1.OrderByBuilder<PollLikesTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<PollLikesTable>? orderByList,
    _i1.Transaction? transaction,
    PollLikesInclude? include,
  }) async {
    return session.db.findFirstRow<PollLikes>(
      where: where?.call(PollLikes.t),
      orderBy: orderBy?.call(PollLikes.t),
      orderByList: orderByList?.call(PollLikes.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Finds a single [PollLikes] by its [id] or null if no such row exists.
  Future<PollLikes?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
    PollLikesInclude? include,
  }) async {
    return session.db.findById<PollLikes>(
      id,
      transaction: transaction,
      include: include,
    );
  }

  /// Inserts all [PollLikes]s in the list and returns the inserted rows.
  ///
  /// The returned [PollLikes]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<PollLikes>> insert(
    _i1.Session session,
    List<PollLikes> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<PollLikes>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [PollLikes] and returns the inserted row.
  ///
  /// The returned [PollLikes] will have its `id` field set.
  Future<PollLikes> insertRow(
    _i1.Session session,
    PollLikes row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<PollLikes>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [PollLikes]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<PollLikes>> update(
    _i1.Session session,
    List<PollLikes> rows, {
    _i1.ColumnSelections<PollLikesTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<PollLikes>(
      rows,
      columns: columns?.call(PollLikes.t),
      transaction: transaction,
    );
  }

  /// Updates a single [PollLikes]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<PollLikes> updateRow(
    _i1.Session session,
    PollLikes row, {
    _i1.ColumnSelections<PollLikesTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<PollLikes>(
      row,
      columns: columns?.call(PollLikes.t),
      transaction: transaction,
    );
  }

  /// Deletes all [PollLikes]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<PollLikes>> delete(
    _i1.Session session,
    List<PollLikes> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<PollLikes>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [PollLikes].
  Future<PollLikes> deleteRow(
    _i1.Session session,
    PollLikes row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<PollLikes>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<PollLikes>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<PollLikesTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<PollLikes>(
      where: where(PollLikes.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<PollLikesTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<PollLikes>(
      where: where?.call(PollLikes.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

class PollLikesAttachRowRepository {
  const PollLikesAttachRowRepository._();

  /// Creates a relation between the given [PollLikes] and [Poll]
  /// by setting the [PollLikes]'s foreign key `pollId` to refer to the [Poll].
  Future<void> poll(
    _i1.Session session,
    PollLikes pollLikes,
    _i2.Poll poll, {
    _i1.Transaction? transaction,
  }) async {
    if (pollLikes.id == null) {
      throw ArgumentError.notNull('pollLikes.id');
    }
    if (poll.id == null) {
      throw ArgumentError.notNull('poll.id');
    }

    var $pollLikes = pollLikes.copyWith(pollId: poll.id);
    await session.db.updateRow<PollLikes>(
      $pollLikes,
      columns: [PollLikes.t.pollId],
      transaction: transaction,
    );
  }

  /// Creates a relation between the given [PollLikes] and [UserRecord]
  /// by setting the [PollLikes]'s foreign key `ownerId` to refer to the [UserRecord].
  Future<void> owner(
    _i1.Session session,
    PollLikes pollLikes,
    _i3.UserRecord owner, {
    _i1.Transaction? transaction,
  }) async {
    if (pollLikes.id == null) {
      throw ArgumentError.notNull('pollLikes.id');
    }
    if (owner.id == null) {
      throw ArgumentError.notNull('owner.id');
    }

    var $pollLikes = pollLikes.copyWith(ownerId: owner.id);
    await session.db.updateRow<PollLikes>(
      $pollLikes,
      columns: [PollLikes.t.ownerId],
      transaction: transaction,
    );
  }
}
