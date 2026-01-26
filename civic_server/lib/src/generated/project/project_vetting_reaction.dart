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
import '../project/project_vetting.dart' as _i3;
import 'package:civic_server/src/generated/protocol.dart' as _i4;

abstract class ProjectVettingReaction
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  ProjectVettingReaction._({
    this.id,
    required this.ownerId,
    this.owner,
    required this.vettingId,
    this.vetting,
    DateTime? dateCreated,
    this.updatedAt,
    this.isLike,
    this.isDeleted,
  }) : dateCreated = dateCreated ?? DateTime.now();

  factory ProjectVettingReaction({
    int? id,
    required int ownerId,
    _i2.UserRecord? owner,
    required int vettingId,
    _i3.ProjectVetting? vetting,
    DateTime? dateCreated,
    DateTime? updatedAt,
    bool? isLike,
    bool? isDeleted,
  }) = _ProjectVettingReactionImpl;

  factory ProjectVettingReaction.fromJson(
    Map<String, dynamic> jsonSerialization,
  ) {
    return ProjectVettingReaction(
      id: jsonSerialization['id'] as int?,
      ownerId: jsonSerialization['ownerId'] as int,
      owner: jsonSerialization['owner'] == null
          ? null
          : _i4.Protocol().deserialize<_i2.UserRecord>(
              jsonSerialization['owner'],
            ),
      vettingId: jsonSerialization['vettingId'] as int,
      vetting: jsonSerialization['vetting'] == null
          ? null
          : _i4.Protocol().deserialize<_i3.ProjectVetting>(
              jsonSerialization['vetting'],
            ),
      dateCreated: jsonSerialization['dateCreated'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(
              jsonSerialization['dateCreated'],
            ),
      updatedAt: jsonSerialization['updatedAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['updatedAt']),
      isLike: jsonSerialization['isLike'] as bool?,
      isDeleted: jsonSerialization['isDeleted'] as bool?,
    );
  }

  static final t = ProjectVettingReactionTable();

  static const db = ProjectVettingReactionRepository._();

  @override
  int? id;

  int ownerId;

  _i2.UserRecord? owner;

  int vettingId;

  _i3.ProjectVetting? vetting;

  DateTime? dateCreated;

  DateTime? updatedAt;

  bool? isLike;

  bool? isDeleted;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [ProjectVettingReaction]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  ProjectVettingReaction copyWith({
    int? id,
    int? ownerId,
    _i2.UserRecord? owner,
    int? vettingId,
    _i3.ProjectVetting? vetting,
    DateTime? dateCreated,
    DateTime? updatedAt,
    bool? isLike,
    bool? isDeleted,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'ProjectVettingReaction',
      if (id != null) 'id': id,
      'ownerId': ownerId,
      if (owner != null) 'owner': owner?.toJson(),
      'vettingId': vettingId,
      if (vetting != null) 'vetting': vetting?.toJson(),
      if (dateCreated != null) 'dateCreated': dateCreated?.toJson(),
      if (updatedAt != null) 'updatedAt': updatedAt?.toJson(),
      if (isLike != null) 'isLike': isLike,
      if (isDeleted != null) 'isDeleted': isDeleted,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'ProjectVettingReaction',
      if (id != null) 'id': id,
      'ownerId': ownerId,
      if (owner != null) 'owner': owner?.toJsonForProtocol(),
      'vettingId': vettingId,
      if (vetting != null) 'vetting': vetting?.toJsonForProtocol(),
      if (dateCreated != null) 'dateCreated': dateCreated?.toJson(),
      if (updatedAt != null) 'updatedAt': updatedAt?.toJson(),
      if (isLike != null) 'isLike': isLike,
      if (isDeleted != null) 'isDeleted': isDeleted,
    };
  }

  static ProjectVettingReactionInclude include({
    _i2.UserRecordInclude? owner,
    _i3.ProjectVettingInclude? vetting,
  }) {
    return ProjectVettingReactionInclude._(
      owner: owner,
      vetting: vetting,
    );
  }

  static ProjectVettingReactionIncludeList includeList({
    _i1.WhereExpressionBuilder<ProjectVettingReactionTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<ProjectVettingReactionTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<ProjectVettingReactionTable>? orderByList,
    ProjectVettingReactionInclude? include,
  }) {
    return ProjectVettingReactionIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(ProjectVettingReaction.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(ProjectVettingReaction.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _ProjectVettingReactionImpl extends ProjectVettingReaction {
  _ProjectVettingReactionImpl({
    int? id,
    required int ownerId,
    _i2.UserRecord? owner,
    required int vettingId,
    _i3.ProjectVetting? vetting,
    DateTime? dateCreated,
    DateTime? updatedAt,
    bool? isLike,
    bool? isDeleted,
  }) : super._(
         id: id,
         ownerId: ownerId,
         owner: owner,
         vettingId: vettingId,
         vetting: vetting,
         dateCreated: dateCreated,
         updatedAt: updatedAt,
         isLike: isLike,
         isDeleted: isDeleted,
       );

  /// Returns a shallow copy of this [ProjectVettingReaction]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  ProjectVettingReaction copyWith({
    Object? id = _Undefined,
    int? ownerId,
    Object? owner = _Undefined,
    int? vettingId,
    Object? vetting = _Undefined,
    Object? dateCreated = _Undefined,
    Object? updatedAt = _Undefined,
    Object? isLike = _Undefined,
    Object? isDeleted = _Undefined,
  }) {
    return ProjectVettingReaction(
      id: id is int? ? id : this.id,
      ownerId: ownerId ?? this.ownerId,
      owner: owner is _i2.UserRecord? ? owner : this.owner?.copyWith(),
      vettingId: vettingId ?? this.vettingId,
      vetting: vetting is _i3.ProjectVetting?
          ? vetting
          : this.vetting?.copyWith(),
      dateCreated: dateCreated is DateTime? ? dateCreated : this.dateCreated,
      updatedAt: updatedAt is DateTime? ? updatedAt : this.updatedAt,
      isLike: isLike is bool? ? isLike : this.isLike,
      isDeleted: isDeleted is bool? ? isDeleted : this.isDeleted,
    );
  }
}

class ProjectVettingReactionUpdateTable
    extends _i1.UpdateTable<ProjectVettingReactionTable> {
  ProjectVettingReactionUpdateTable(super.table);

  _i1.ColumnValue<int, int> ownerId(int value) => _i1.ColumnValue(
    table.ownerId,
    value,
  );

  _i1.ColumnValue<int, int> vettingId(int value) => _i1.ColumnValue(
    table.vettingId,
    value,
  );

  _i1.ColumnValue<DateTime, DateTime> dateCreated(DateTime? value) =>
      _i1.ColumnValue(
        table.dateCreated,
        value,
      );

  _i1.ColumnValue<DateTime, DateTime> updatedAt(DateTime? value) =>
      _i1.ColumnValue(
        table.updatedAt,
        value,
      );

  _i1.ColumnValue<bool, bool> isLike(bool? value) => _i1.ColumnValue(
    table.isLike,
    value,
  );

  _i1.ColumnValue<bool, bool> isDeleted(bool? value) => _i1.ColumnValue(
    table.isDeleted,
    value,
  );
}

class ProjectVettingReactionTable extends _i1.Table<int?> {
  ProjectVettingReactionTable({super.tableRelation})
    : super(tableName: 'project_vetting_reaction') {
    updateTable = ProjectVettingReactionUpdateTable(this);
    ownerId = _i1.ColumnInt(
      'ownerId',
      this,
    );
    vettingId = _i1.ColumnInt(
      'vettingId',
      this,
    );
    dateCreated = _i1.ColumnDateTime(
      'dateCreated',
      this,
      hasDefault: true,
    );
    updatedAt = _i1.ColumnDateTime(
      'updatedAt',
      this,
    );
    isLike = _i1.ColumnBool(
      'isLike',
      this,
    );
    isDeleted = _i1.ColumnBool(
      'isDeleted',
      this,
    );
  }

  late final ProjectVettingReactionUpdateTable updateTable;

  late final _i1.ColumnInt ownerId;

  _i2.UserRecordTable? _owner;

  late final _i1.ColumnInt vettingId;

  _i3.ProjectVettingTable? _vetting;

  late final _i1.ColumnDateTime dateCreated;

  late final _i1.ColumnDateTime updatedAt;

  late final _i1.ColumnBool isLike;

  late final _i1.ColumnBool isDeleted;

  _i2.UserRecordTable get owner {
    if (_owner != null) return _owner!;
    _owner = _i1.createRelationTable(
      relationFieldName: 'owner',
      field: ProjectVettingReaction.t.ownerId,
      foreignField: _i2.UserRecord.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.UserRecordTable(tableRelation: foreignTableRelation),
    );
    return _owner!;
  }

  _i3.ProjectVettingTable get vetting {
    if (_vetting != null) return _vetting!;
    _vetting = _i1.createRelationTable(
      relationFieldName: 'vetting',
      field: ProjectVettingReaction.t.vettingId,
      foreignField: _i3.ProjectVetting.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i3.ProjectVettingTable(tableRelation: foreignTableRelation),
    );
    return _vetting!;
  }

  @override
  List<_i1.Column> get columns => [
    id,
    ownerId,
    vettingId,
    dateCreated,
    updatedAt,
    isLike,
    isDeleted,
  ];

  @override
  _i1.Table? getRelationTable(String relationField) {
    if (relationField == 'owner') {
      return owner;
    }
    if (relationField == 'vetting') {
      return vetting;
    }
    return null;
  }
}

class ProjectVettingReactionInclude extends _i1.IncludeObject {
  ProjectVettingReactionInclude._({
    _i2.UserRecordInclude? owner,
    _i3.ProjectVettingInclude? vetting,
  }) {
    _owner = owner;
    _vetting = vetting;
  }

  _i2.UserRecordInclude? _owner;

  _i3.ProjectVettingInclude? _vetting;

  @override
  Map<String, _i1.Include?> get includes => {
    'owner': _owner,
    'vetting': _vetting,
  };

  @override
  _i1.Table<int?> get table => ProjectVettingReaction.t;
}

class ProjectVettingReactionIncludeList extends _i1.IncludeList {
  ProjectVettingReactionIncludeList._({
    _i1.WhereExpressionBuilder<ProjectVettingReactionTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(ProjectVettingReaction.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => ProjectVettingReaction.t;
}

class ProjectVettingReactionRepository {
  const ProjectVettingReactionRepository._();

  final attachRow = const ProjectVettingReactionAttachRowRepository._();

  /// Returns a list of [ProjectVettingReaction]s matching the given query parameters.
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
  Future<List<ProjectVettingReaction>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<ProjectVettingReactionTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<ProjectVettingReactionTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<ProjectVettingReactionTable>? orderByList,
    _i1.Transaction? transaction,
    ProjectVettingReactionInclude? include,
  }) async {
    return session.db.find<ProjectVettingReaction>(
      where: where?.call(ProjectVettingReaction.t),
      orderBy: orderBy?.call(ProjectVettingReaction.t),
      orderByList: orderByList?.call(ProjectVettingReaction.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Returns the first matching [ProjectVettingReaction] matching the given query parameters.
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
  Future<ProjectVettingReaction?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<ProjectVettingReactionTable>? where,
    int? offset,
    _i1.OrderByBuilder<ProjectVettingReactionTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<ProjectVettingReactionTable>? orderByList,
    _i1.Transaction? transaction,
    ProjectVettingReactionInclude? include,
  }) async {
    return session.db.findFirstRow<ProjectVettingReaction>(
      where: where?.call(ProjectVettingReaction.t),
      orderBy: orderBy?.call(ProjectVettingReaction.t),
      orderByList: orderByList?.call(ProjectVettingReaction.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Finds a single [ProjectVettingReaction] by its [id] or null if no such row exists.
  Future<ProjectVettingReaction?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
    ProjectVettingReactionInclude? include,
  }) async {
    return session.db.findById<ProjectVettingReaction>(
      id,
      transaction: transaction,
      include: include,
    );
  }

  /// Inserts all [ProjectVettingReaction]s in the list and returns the inserted rows.
  ///
  /// The returned [ProjectVettingReaction]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<ProjectVettingReaction>> insert(
    _i1.Session session,
    List<ProjectVettingReaction> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<ProjectVettingReaction>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [ProjectVettingReaction] and returns the inserted row.
  ///
  /// The returned [ProjectVettingReaction] will have its `id` field set.
  Future<ProjectVettingReaction> insertRow(
    _i1.Session session,
    ProjectVettingReaction row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<ProjectVettingReaction>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [ProjectVettingReaction]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<ProjectVettingReaction>> update(
    _i1.Session session,
    List<ProjectVettingReaction> rows, {
    _i1.ColumnSelections<ProjectVettingReactionTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<ProjectVettingReaction>(
      rows,
      columns: columns?.call(ProjectVettingReaction.t),
      transaction: transaction,
    );
  }

  /// Updates a single [ProjectVettingReaction]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<ProjectVettingReaction> updateRow(
    _i1.Session session,
    ProjectVettingReaction row, {
    _i1.ColumnSelections<ProjectVettingReactionTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<ProjectVettingReaction>(
      row,
      columns: columns?.call(ProjectVettingReaction.t),
      transaction: transaction,
    );
  }

  /// Updates a single [ProjectVettingReaction] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<ProjectVettingReaction?> updateById(
    _i1.Session session,
    int id, {
    required _i1.ColumnValueListBuilder<ProjectVettingReactionUpdateTable>
    columnValues,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateById<ProjectVettingReaction>(
      id,
      columnValues: columnValues(ProjectVettingReaction.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [ProjectVettingReaction]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  Future<List<ProjectVettingReaction>> updateWhere(
    _i1.Session session, {
    required _i1.ColumnValueListBuilder<ProjectVettingReactionUpdateTable>
    columnValues,
    required _i1.WhereExpressionBuilder<ProjectVettingReactionTable> where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<ProjectVettingReactionTable>? orderBy,
    _i1.OrderByListBuilder<ProjectVettingReactionTable>? orderByList,
    bool orderDescending = false,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateWhere<ProjectVettingReaction>(
      columnValues: columnValues(ProjectVettingReaction.t.updateTable),
      where: where(ProjectVettingReaction.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(ProjectVettingReaction.t),
      orderByList: orderByList?.call(ProjectVettingReaction.t),
      orderDescending: orderDescending,
      transaction: transaction,
    );
  }

  /// Deletes all [ProjectVettingReaction]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<ProjectVettingReaction>> delete(
    _i1.Session session,
    List<ProjectVettingReaction> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<ProjectVettingReaction>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [ProjectVettingReaction].
  Future<ProjectVettingReaction> deleteRow(
    _i1.Session session,
    ProjectVettingReaction row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<ProjectVettingReaction>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<ProjectVettingReaction>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<ProjectVettingReactionTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<ProjectVettingReaction>(
      where: where(ProjectVettingReaction.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<ProjectVettingReactionTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<ProjectVettingReaction>(
      where: where?.call(ProjectVettingReaction.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

class ProjectVettingReactionAttachRowRepository {
  const ProjectVettingReactionAttachRowRepository._();

  /// Creates a relation between the given [ProjectVettingReaction] and [UserRecord]
  /// by setting the [ProjectVettingReaction]'s foreign key `ownerId` to refer to the [UserRecord].
  Future<void> owner(
    _i1.Session session,
    ProjectVettingReaction projectVettingReaction,
    _i2.UserRecord owner, {
    _i1.Transaction? transaction,
  }) async {
    if (projectVettingReaction.id == null) {
      throw ArgumentError.notNull('projectVettingReaction.id');
    }
    if (owner.id == null) {
      throw ArgumentError.notNull('owner.id');
    }

    var $projectVettingReaction = projectVettingReaction.copyWith(
      ownerId: owner.id,
    );
    await session.db.updateRow<ProjectVettingReaction>(
      $projectVettingReaction,
      columns: [ProjectVettingReaction.t.ownerId],
      transaction: transaction,
    );
  }

  /// Creates a relation between the given [ProjectVettingReaction] and [ProjectVetting]
  /// by setting the [ProjectVettingReaction]'s foreign key `vettingId` to refer to the [ProjectVetting].
  Future<void> vetting(
    _i1.Session session,
    ProjectVettingReaction projectVettingReaction,
    _i3.ProjectVetting vetting, {
    _i1.Transaction? transaction,
  }) async {
    if (projectVettingReaction.id == null) {
      throw ArgumentError.notNull('projectVettingReaction.id');
    }
    if (vetting.id == null) {
      throw ArgumentError.notNull('vetting.id');
    }

    var $projectVettingReaction = projectVettingReaction.copyWith(
      vettingId: vetting.id,
    );
    await session.db.updateRow<ProjectVettingReaction>(
      $projectVettingReaction,
      columns: [ProjectVettingReaction.t.vettingId],
      transaction: transaction,
    );
  }
}
