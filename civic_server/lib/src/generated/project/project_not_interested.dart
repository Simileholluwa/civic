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
import '../project/project.dart' as _i3;
import 'package:civic_server/src/generated/protocol.dart' as _i4;

abstract class ProjectNotInterested
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  ProjectNotInterested._({
    this.id,
    required this.userId,
    this.user,
    required this.projectId,
    this.project,
    DateTime? dateMarked,
  }) : dateMarked = dateMarked ?? DateTime.now();

  factory ProjectNotInterested({
    int? id,
    required int userId,
    _i2.UserRecord? user,
    required int projectId,
    _i3.Project? project,
    DateTime? dateMarked,
  }) = _ProjectNotInterestedImpl;

  factory ProjectNotInterested.fromJson(
    Map<String, dynamic> jsonSerialization,
  ) {
    return ProjectNotInterested(
      id: jsonSerialization['id'] as int?,
      userId: jsonSerialization['userId'] as int,
      user: jsonSerialization['user'] == null
          ? null
          : _i4.Protocol().deserialize<_i2.UserRecord>(
              jsonSerialization['user'],
            ),
      projectId: jsonSerialization['projectId'] as int,
      project: jsonSerialization['project'] == null
          ? null
          : _i4.Protocol().deserialize<_i3.Project>(
              jsonSerialization['project'],
            ),
      dateMarked: jsonSerialization['dateMarked'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['dateMarked']),
    );
  }

  static final t = ProjectNotInterestedTable();

  static const db = ProjectNotInterestedRepository._();

  @override
  int? id;

  int userId;

  _i2.UserRecord? user;

  int projectId;

  _i3.Project? project;

  DateTime? dateMarked;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [ProjectNotInterested]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  ProjectNotInterested copyWith({
    int? id,
    int? userId,
    _i2.UserRecord? user,
    int? projectId,
    _i3.Project? project,
    DateTime? dateMarked,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'ProjectNotInterested',
      if (id != null) 'id': id,
      'userId': userId,
      if (user != null) 'user': user?.toJson(),
      'projectId': projectId,
      if (project != null) 'project': project?.toJson(),
      if (dateMarked != null) 'dateMarked': dateMarked?.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'ProjectNotInterested',
      if (id != null) 'id': id,
      'userId': userId,
      if (user != null) 'user': user?.toJsonForProtocol(),
      'projectId': projectId,
      if (project != null) 'project': project?.toJsonForProtocol(),
      if (dateMarked != null) 'dateMarked': dateMarked?.toJson(),
    };
  }

  static ProjectNotInterestedInclude include({
    _i2.UserRecordInclude? user,
    _i3.ProjectInclude? project,
  }) {
    return ProjectNotInterestedInclude._(
      user: user,
      project: project,
    );
  }

  static ProjectNotInterestedIncludeList includeList({
    _i1.WhereExpressionBuilder<ProjectNotInterestedTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<ProjectNotInterestedTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<ProjectNotInterestedTable>? orderByList,
    ProjectNotInterestedInclude? include,
  }) {
    return ProjectNotInterestedIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(ProjectNotInterested.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(ProjectNotInterested.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _ProjectNotInterestedImpl extends ProjectNotInterested {
  _ProjectNotInterestedImpl({
    int? id,
    required int userId,
    _i2.UserRecord? user,
    required int projectId,
    _i3.Project? project,
    DateTime? dateMarked,
  }) : super._(
         id: id,
         userId: userId,
         user: user,
         projectId: projectId,
         project: project,
         dateMarked: dateMarked,
       );

  /// Returns a shallow copy of this [ProjectNotInterested]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  ProjectNotInterested copyWith({
    Object? id = _Undefined,
    int? userId,
    Object? user = _Undefined,
    int? projectId,
    Object? project = _Undefined,
    Object? dateMarked = _Undefined,
  }) {
    return ProjectNotInterested(
      id: id is int? ? id : this.id,
      userId: userId ?? this.userId,
      user: user is _i2.UserRecord? ? user : this.user?.copyWith(),
      projectId: projectId ?? this.projectId,
      project: project is _i3.Project? ? project : this.project?.copyWith(),
      dateMarked: dateMarked is DateTime? ? dateMarked : this.dateMarked,
    );
  }
}

class ProjectNotInterestedUpdateTable
    extends _i1.UpdateTable<ProjectNotInterestedTable> {
  ProjectNotInterestedUpdateTable(super.table);

  _i1.ColumnValue<int, int> userId(int value) => _i1.ColumnValue(
    table.userId,
    value,
  );

  _i1.ColumnValue<int, int> projectId(int value) => _i1.ColumnValue(
    table.projectId,
    value,
  );

  _i1.ColumnValue<DateTime, DateTime> dateMarked(DateTime? value) =>
      _i1.ColumnValue(
        table.dateMarked,
        value,
      );
}

class ProjectNotInterestedTable extends _i1.Table<int?> {
  ProjectNotInterestedTable({super.tableRelation})
    : super(tableName: 'project_not_interested') {
    updateTable = ProjectNotInterestedUpdateTable(this);
    userId = _i1.ColumnInt(
      'userId',
      this,
    );
    projectId = _i1.ColumnInt(
      'projectId',
      this,
    );
    dateMarked = _i1.ColumnDateTime(
      'dateMarked',
      this,
      hasDefault: true,
    );
  }

  late final ProjectNotInterestedUpdateTable updateTable;

  late final _i1.ColumnInt userId;

  _i2.UserRecordTable? _user;

  late final _i1.ColumnInt projectId;

  _i3.ProjectTable? _project;

  late final _i1.ColumnDateTime dateMarked;

  _i2.UserRecordTable get user {
    if (_user != null) return _user!;
    _user = _i1.createRelationTable(
      relationFieldName: 'user',
      field: ProjectNotInterested.t.userId,
      foreignField: _i2.UserRecord.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.UserRecordTable(tableRelation: foreignTableRelation),
    );
    return _user!;
  }

  _i3.ProjectTable get project {
    if (_project != null) return _project!;
    _project = _i1.createRelationTable(
      relationFieldName: 'project',
      field: ProjectNotInterested.t.projectId,
      foreignField: _i3.Project.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i3.ProjectTable(tableRelation: foreignTableRelation),
    );
    return _project!;
  }

  @override
  List<_i1.Column> get columns => [
    id,
    userId,
    projectId,
    dateMarked,
  ];

  @override
  _i1.Table? getRelationTable(String relationField) {
    if (relationField == 'user') {
      return user;
    }
    if (relationField == 'project') {
      return project;
    }
    return null;
  }
}

class ProjectNotInterestedInclude extends _i1.IncludeObject {
  ProjectNotInterestedInclude._({
    _i2.UserRecordInclude? user,
    _i3.ProjectInclude? project,
  }) {
    _user = user;
    _project = project;
  }

  _i2.UserRecordInclude? _user;

  _i3.ProjectInclude? _project;

  @override
  Map<String, _i1.Include?> get includes => {
    'user': _user,
    'project': _project,
  };

  @override
  _i1.Table<int?> get table => ProjectNotInterested.t;
}

class ProjectNotInterestedIncludeList extends _i1.IncludeList {
  ProjectNotInterestedIncludeList._({
    _i1.WhereExpressionBuilder<ProjectNotInterestedTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(ProjectNotInterested.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => ProjectNotInterested.t;
}

class ProjectNotInterestedRepository {
  const ProjectNotInterestedRepository._();

  final attachRow = const ProjectNotInterestedAttachRowRepository._();

  /// Returns a list of [ProjectNotInterested]s matching the given query parameters.
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
  Future<List<ProjectNotInterested>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<ProjectNotInterestedTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<ProjectNotInterestedTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<ProjectNotInterestedTable>? orderByList,
    _i1.Transaction? transaction,
    ProjectNotInterestedInclude? include,
  }) async {
    return session.db.find<ProjectNotInterested>(
      where: where?.call(ProjectNotInterested.t),
      orderBy: orderBy?.call(ProjectNotInterested.t),
      orderByList: orderByList?.call(ProjectNotInterested.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Returns the first matching [ProjectNotInterested] matching the given query parameters.
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
  Future<ProjectNotInterested?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<ProjectNotInterestedTable>? where,
    int? offset,
    _i1.OrderByBuilder<ProjectNotInterestedTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<ProjectNotInterestedTable>? orderByList,
    _i1.Transaction? transaction,
    ProjectNotInterestedInclude? include,
  }) async {
    return session.db.findFirstRow<ProjectNotInterested>(
      where: where?.call(ProjectNotInterested.t),
      orderBy: orderBy?.call(ProjectNotInterested.t),
      orderByList: orderByList?.call(ProjectNotInterested.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Finds a single [ProjectNotInterested] by its [id] or null if no such row exists.
  Future<ProjectNotInterested?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
    ProjectNotInterestedInclude? include,
  }) async {
    return session.db.findById<ProjectNotInterested>(
      id,
      transaction: transaction,
      include: include,
    );
  }

  /// Inserts all [ProjectNotInterested]s in the list and returns the inserted rows.
  ///
  /// The returned [ProjectNotInterested]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<ProjectNotInterested>> insert(
    _i1.Session session,
    List<ProjectNotInterested> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<ProjectNotInterested>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [ProjectNotInterested] and returns the inserted row.
  ///
  /// The returned [ProjectNotInterested] will have its `id` field set.
  Future<ProjectNotInterested> insertRow(
    _i1.Session session,
    ProjectNotInterested row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<ProjectNotInterested>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [ProjectNotInterested]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<ProjectNotInterested>> update(
    _i1.Session session,
    List<ProjectNotInterested> rows, {
    _i1.ColumnSelections<ProjectNotInterestedTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<ProjectNotInterested>(
      rows,
      columns: columns?.call(ProjectNotInterested.t),
      transaction: transaction,
    );
  }

  /// Updates a single [ProjectNotInterested]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<ProjectNotInterested> updateRow(
    _i1.Session session,
    ProjectNotInterested row, {
    _i1.ColumnSelections<ProjectNotInterestedTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<ProjectNotInterested>(
      row,
      columns: columns?.call(ProjectNotInterested.t),
      transaction: transaction,
    );
  }

  /// Updates a single [ProjectNotInterested] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<ProjectNotInterested?> updateById(
    _i1.Session session,
    int id, {
    required _i1.ColumnValueListBuilder<ProjectNotInterestedUpdateTable>
    columnValues,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateById<ProjectNotInterested>(
      id,
      columnValues: columnValues(ProjectNotInterested.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [ProjectNotInterested]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  Future<List<ProjectNotInterested>> updateWhere(
    _i1.Session session, {
    required _i1.ColumnValueListBuilder<ProjectNotInterestedUpdateTable>
    columnValues,
    required _i1.WhereExpressionBuilder<ProjectNotInterestedTable> where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<ProjectNotInterestedTable>? orderBy,
    _i1.OrderByListBuilder<ProjectNotInterestedTable>? orderByList,
    bool orderDescending = false,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateWhere<ProjectNotInterested>(
      columnValues: columnValues(ProjectNotInterested.t.updateTable),
      where: where(ProjectNotInterested.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(ProjectNotInterested.t),
      orderByList: orderByList?.call(ProjectNotInterested.t),
      orderDescending: orderDescending,
      transaction: transaction,
    );
  }

  /// Deletes all [ProjectNotInterested]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<ProjectNotInterested>> delete(
    _i1.Session session,
    List<ProjectNotInterested> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<ProjectNotInterested>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [ProjectNotInterested].
  Future<ProjectNotInterested> deleteRow(
    _i1.Session session,
    ProjectNotInterested row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<ProjectNotInterested>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<ProjectNotInterested>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<ProjectNotInterestedTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<ProjectNotInterested>(
      where: where(ProjectNotInterested.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<ProjectNotInterestedTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<ProjectNotInterested>(
      where: where?.call(ProjectNotInterested.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

class ProjectNotInterestedAttachRowRepository {
  const ProjectNotInterestedAttachRowRepository._();

  /// Creates a relation between the given [ProjectNotInterested] and [UserRecord]
  /// by setting the [ProjectNotInterested]'s foreign key `userId` to refer to the [UserRecord].
  Future<void> user(
    _i1.Session session,
    ProjectNotInterested projectNotInterested,
    _i2.UserRecord user, {
    _i1.Transaction? transaction,
  }) async {
    if (projectNotInterested.id == null) {
      throw ArgumentError.notNull('projectNotInterested.id');
    }
    if (user.id == null) {
      throw ArgumentError.notNull('user.id');
    }

    var $projectNotInterested = projectNotInterested.copyWith(userId: user.id);
    await session.db.updateRow<ProjectNotInterested>(
      $projectNotInterested,
      columns: [ProjectNotInterested.t.userId],
      transaction: transaction,
    );
  }

  /// Creates a relation between the given [ProjectNotInterested] and [Project]
  /// by setting the [ProjectNotInterested]'s foreign key `projectId` to refer to the [Project].
  Future<void> project(
    _i1.Session session,
    ProjectNotInterested projectNotInterested,
    _i3.Project project, {
    _i1.Transaction? transaction,
  }) async {
    if (projectNotInterested.id == null) {
      throw ArgumentError.notNull('projectNotInterested.id');
    }
    if (project.id == null) {
      throw ArgumentError.notNull('project.id');
    }

    var $projectNotInterested = projectNotInterested.copyWith(
      projectId: project.id,
    );
    await session.db.updateRow<ProjectNotInterested>(
      $projectNotInterested,
      columns: [ProjectNotInterested.t.projectId],
      transaction: transaction,
    );
  }
}
