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
import '../post/post.dart' as _i2;
import '../user/user_record.dart' as _i3;
import '../poll/poll_option.dart' as _i4;

abstract class Poll implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  Poll._({
    this.id,
    this.postId,
    this.post,
    required this.ownerId,
    this.owner,
    this.options,
    this.expiresAt,
    this.votedBy,
  });

  factory Poll({
    int? id,
    int? postId,
    _i2.Post? post,
    required int ownerId,
    _i3.UserRecord? owner,
    List<_i4.PollOption>? options,
    DateTime? expiresAt,
    List<int>? votedBy,
  }) = _PollImpl;

  factory Poll.fromJson(Map<String, dynamic> jsonSerialization) {
    return Poll(
      id: jsonSerialization['id'] as int?,
      postId: jsonSerialization['postId'] as int?,
      post: jsonSerialization['post'] == null
          ? null
          : _i2.Post.fromJson(
              (jsonSerialization['post'] as Map<String, dynamic>)),
      ownerId: jsonSerialization['ownerId'] as int,
      owner: jsonSerialization['owner'] == null
          ? null
          : _i3.UserRecord.fromJson(
              (jsonSerialization['owner'] as Map<String, dynamic>)),
      options: (jsonSerialization['options'] as List?)
          ?.map((e) => _i4.PollOption.fromJson((e as Map<String, dynamic>)))
          .toList(),
      expiresAt: jsonSerialization['expiresAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['expiresAt']),
      votedBy: (jsonSerialization['votedBy'] as List?)
          ?.map((e) => e as int)
          .toList(),
    );
  }

  static final t = PollTable();

  static const db = PollRepository._();

  @override
  int? id;

  int? postId;

  _i2.Post? post;

  int ownerId;

  _i3.UserRecord? owner;

  List<_i4.PollOption>? options;

  DateTime? expiresAt;

  List<int>? votedBy;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [Poll]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  Poll copyWith({
    int? id,
    int? postId,
    _i2.Post? post,
    int? ownerId,
    _i3.UserRecord? owner,
    List<_i4.PollOption>? options,
    DateTime? expiresAt,
    List<int>? votedBy,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      if (postId != null) 'postId': postId,
      if (post != null) 'post': post?.toJson(),
      'ownerId': ownerId,
      if (owner != null) 'owner': owner?.toJson(),
      if (options != null)
        'options': options?.toJson(valueToJson: (v) => v.toJson()),
      if (expiresAt != null) 'expiresAt': expiresAt?.toJson(),
      if (votedBy != null) 'votedBy': votedBy?.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      if (postId != null) 'postId': postId,
      if (post != null) 'post': post?.toJsonForProtocol(),
      'ownerId': ownerId,
      if (owner != null) 'owner': owner?.toJsonForProtocol(),
      if (options != null)
        'options': options?.toJson(valueToJson: (v) => v.toJsonForProtocol()),
      if (expiresAt != null) 'expiresAt': expiresAt?.toJson(),
      if (votedBy != null) 'votedBy': votedBy?.toJson(),
    };
  }

  static PollInclude include({
    _i2.PostInclude? post,
    _i3.UserRecordInclude? owner,
    _i4.PollOptionIncludeList? options,
  }) {
    return PollInclude._(
      post: post,
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
    int? postId,
    _i2.Post? post,
    required int ownerId,
    _i3.UserRecord? owner,
    List<_i4.PollOption>? options,
    DateTime? expiresAt,
    List<int>? votedBy,
  }) : super._(
          id: id,
          postId: postId,
          post: post,
          ownerId: ownerId,
          owner: owner,
          options: options,
          expiresAt: expiresAt,
          votedBy: votedBy,
        );

  /// Returns a shallow copy of this [Poll]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  Poll copyWith({
    Object? id = _Undefined,
    Object? postId = _Undefined,
    Object? post = _Undefined,
    int? ownerId,
    Object? owner = _Undefined,
    Object? options = _Undefined,
    Object? expiresAt = _Undefined,
    Object? votedBy = _Undefined,
  }) {
    return Poll(
      id: id is int? ? id : this.id,
      postId: postId is int? ? postId : this.postId,
      post: post is _i2.Post? ? post : this.post?.copyWith(),
      ownerId: ownerId ?? this.ownerId,
      owner: owner is _i3.UserRecord? ? owner : this.owner?.copyWith(),
      options: options is List<_i4.PollOption>?
          ? options
          : this.options?.map((e0) => e0.copyWith()).toList(),
      expiresAt: expiresAt is DateTime? ? expiresAt : this.expiresAt,
      votedBy: votedBy is List<int>?
          ? votedBy
          : this.votedBy?.map((e0) => e0).toList(),
    );
  }
}

class PollTable extends _i1.Table<int?> {
  PollTable({super.tableRelation}) : super(tableName: 'poll') {
    postId = _i1.ColumnInt(
      'postId',
      this,
    );
    ownerId = _i1.ColumnInt(
      'ownerId',
      this,
    );
    expiresAt = _i1.ColumnDateTime(
      'expiresAt',
      this,
    );
    votedBy = _i1.ColumnSerializable(
      'votedBy',
      this,
    );
  }

  late final _i1.ColumnInt postId;

  _i2.PostTable? _post;

  late final _i1.ColumnInt ownerId;

  _i3.UserRecordTable? _owner;

  _i4.PollOptionTable? ___options;

  _i1.ManyRelation<_i4.PollOptionTable>? _options;

  late final _i1.ColumnDateTime expiresAt;

  late final _i1.ColumnSerializable votedBy;

  _i2.PostTable get post {
    if (_post != null) return _post!;
    _post = _i1.createRelationTable(
      relationFieldName: 'post',
      field: Poll.t.postId,
      foreignField: _i2.Post.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.PostTable(tableRelation: foreignTableRelation),
    );
    return _post!;
  }

  _i3.UserRecordTable get owner {
    if (_owner != null) return _owner!;
    _owner = _i1.createRelationTable(
      relationFieldName: 'owner',
      field: Poll.t.ownerId,
      foreignField: _i3.UserRecord.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i3.UserRecordTable(tableRelation: foreignTableRelation),
    );
    return _owner!;
  }

  _i4.PollOptionTable get __options {
    if (___options != null) return ___options!;
    ___options = _i1.createRelationTable(
      relationFieldName: '__options',
      field: Poll.t.id,
      foreignField: _i4.PollOption.t.$_pollOptionsPollId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i4.PollOptionTable(tableRelation: foreignTableRelation),
    );
    return ___options!;
  }

  _i1.ManyRelation<_i4.PollOptionTable> get options {
    if (_options != null) return _options!;
    var relationTable = _i1.createRelationTable(
      relationFieldName: 'options',
      field: Poll.t.id,
      foreignField: _i4.PollOption.t.$_pollOptionsPollId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i4.PollOptionTable(tableRelation: foreignTableRelation),
    );
    _options = _i1.ManyRelation<_i4.PollOptionTable>(
      tableWithRelations: relationTable,
      table: _i4.PollOptionTable(
          tableRelation: relationTable.tableRelation!.lastRelation),
    );
    return _options!;
  }

  @override
  List<_i1.Column> get columns => [
        id,
        postId,
        ownerId,
        expiresAt,
        votedBy,
      ];

  @override
  _i1.Table? getRelationTable(String relationField) {
    if (relationField == 'post') {
      return post;
    }
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
    _i2.PostInclude? post,
    _i3.UserRecordInclude? owner,
    _i4.PollOptionIncludeList? options,
  }) {
    _post = post;
    _owner = owner;
    _options = options;
  }

  _i2.PostInclude? _post;

  _i3.UserRecordInclude? _owner;

  _i4.PollOptionIncludeList? _options;

  @override
  Map<String, _i1.Include?> get includes => {
        'post': _post,
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
  /// by setting each [PollOption]'s foreign key `_pollOptionsPollId` to refer to this [Poll].
  Future<void> options(
    _i1.Session session,
    Poll poll,
    List<_i4.PollOption> pollOption, {
    _i1.Transaction? transaction,
  }) async {
    if (pollOption.any((e) => e.id == null)) {
      throw ArgumentError.notNull('pollOption.id');
    }
    if (poll.id == null) {
      throw ArgumentError.notNull('poll.id');
    }

    var $pollOption = pollOption
        .map((e) => _i4.PollOptionImplicit(
              e,
              $_pollOptionsPollId: poll.id,
            ))
        .toList();
    await session.db.update<_i4.PollOption>(
      $pollOption,
      columns: [_i4.PollOption.t.$_pollOptionsPollId],
      transaction: transaction,
    );
  }
}

class PollAttachRowRepository {
  const PollAttachRowRepository._();

  /// Creates a relation between the given [Poll] and [Post]
  /// by setting the [Poll]'s foreign key `postId` to refer to the [Post].
  Future<void> post(
    _i1.Session session,
    Poll poll,
    _i2.Post post, {
    _i1.Transaction? transaction,
  }) async {
    if (poll.id == null) {
      throw ArgumentError.notNull('poll.id');
    }
    if (post.id == null) {
      throw ArgumentError.notNull('post.id');
    }

    var $poll = poll.copyWith(postId: post.id);
    await session.db.updateRow<Poll>(
      $poll,
      columns: [Poll.t.postId],
      transaction: transaction,
    );
  }

  /// Creates a relation between the given [Poll] and [UserRecord]
  /// by setting the [Poll]'s foreign key `ownerId` to refer to the [UserRecord].
  Future<void> owner(
    _i1.Session session,
    Poll poll,
    _i3.UserRecord owner, {
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
  /// by setting the [PollOption]'s foreign key `_pollOptionsPollId` to refer to this [Poll].
  Future<void> options(
    _i1.Session session,
    Poll poll,
    _i4.PollOption pollOption, {
    _i1.Transaction? transaction,
  }) async {
    if (pollOption.id == null) {
      throw ArgumentError.notNull('pollOption.id');
    }
    if (poll.id == null) {
      throw ArgumentError.notNull('poll.id');
    }

    var $pollOption = _i4.PollOptionImplicit(
      pollOption,
      $_pollOptionsPollId: poll.id,
    );
    await session.db.updateRow<_i4.PollOption>(
      $pollOption,
      columns: [_i4.PollOption.t.$_pollOptionsPollId],
      transaction: transaction,
    );
  }
}

class PollDetachRepository {
  const PollDetachRepository._();

  /// Detaches the relation between this [Poll] and the given [PollOption]
  /// by setting the [PollOption]'s foreign key `_pollOptionsPollId` to `null`.
  ///
  /// This removes the association between the two models without deleting
  /// the related record.
  Future<void> options(
    _i1.Session session,
    List<_i4.PollOption> pollOption, {
    _i1.Transaction? transaction,
  }) async {
    if (pollOption.any((e) => e.id == null)) {
      throw ArgumentError.notNull('pollOption.id');
    }

    var $pollOption = pollOption
        .map((e) => _i4.PollOptionImplicit(
              e,
              $_pollOptionsPollId: null,
            ))
        .toList();
    await session.db.update<_i4.PollOption>(
      $pollOption,
      columns: [_i4.PollOption.t.$_pollOptionsPollId],
      transaction: transaction,
    );
  }
}

class PollDetachRowRepository {
  const PollDetachRowRepository._();

  /// Detaches the relation between this [Poll] and the [Post] set in `post`
  /// by setting the [Poll]'s foreign key `postId` to `null`.
  ///
  /// This removes the association between the two models without deleting
  /// the related record.
  Future<void> post(
    _i1.Session session,
    Poll poll, {
    _i1.Transaction? transaction,
  }) async {
    if (poll.id == null) {
      throw ArgumentError.notNull('poll.id');
    }

    var $poll = poll.copyWith(postId: null);
    await session.db.updateRow<Poll>(
      $poll,
      columns: [Poll.t.postId],
      transaction: transaction,
    );
  }

  /// Detaches the relation between this [Poll] and the given [PollOption]
  /// by setting the [PollOption]'s foreign key `_pollOptionsPollId` to `null`.
  ///
  /// This removes the association between the two models without deleting
  /// the related record.
  Future<void> options(
    _i1.Session session,
    _i4.PollOption pollOption, {
    _i1.Transaction? transaction,
  }) async {
    if (pollOption.id == null) {
      throw ArgumentError.notNull('pollOption.id');
    }

    var $pollOption = _i4.PollOptionImplicit(
      pollOption,
      $_pollOptionsPollId: null,
    );
    await session.db.updateRow<_i4.PollOption>(
      $pollOption,
      columns: [_i4.PollOption.t.$_pollOptionsPollId],
      transaction: transaction,
    );
  }
}
