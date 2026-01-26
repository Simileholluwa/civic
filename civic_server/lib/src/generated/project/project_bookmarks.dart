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
import '../project/project.dart' as _i2;
import '../user/user_record.dart' as _i3;
import 'package:civic_server/src/generated/protocol.dart' as _i4;

abstract class ProjectBookmarks
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  ProjectBookmarks._({
    this.id,
    required this.projectId,
    this.project,
    required this.ownerId,
    this.owner,
    DateTime? dateCreated,
  }) : dateCreated = dateCreated ?? DateTime.now();

  factory ProjectBookmarks({
    int? id,
    required int projectId,
    _i2.Project? project,
    required int ownerId,
    _i3.UserRecord? owner,
    DateTime? dateCreated,
  }) = _ProjectBookmarksImpl;

  factory ProjectBookmarks.fromJson(Map<String, dynamic> jsonSerialization) {
    return ProjectBookmarks(
      id: jsonSerialization['id'] as int?,
      projectId: jsonSerialization['projectId'] as int,
      project: jsonSerialization['project'] == null
          ? null
          : _i4.Protocol().deserialize<_i2.Project>(
              jsonSerialization['project'],
            ),
      ownerId: jsonSerialization['ownerId'] as int,
      owner: jsonSerialization['owner'] == null
          ? null
          : _i4.Protocol().deserialize<_i3.UserRecord>(
              jsonSerialization['owner'],
            ),
      dateCreated: jsonSerialization['dateCreated'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(
              jsonSerialization['dateCreated'],
            ),
    );
  }

  static final t = ProjectBookmarksTable();

  static const db = ProjectBookmarksRepository._();

  @override
  int? id;

  int projectId;

  _i2.Project? project;

  int ownerId;

  _i3.UserRecord? owner;

  DateTime dateCreated;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [ProjectBookmarks]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  ProjectBookmarks copyWith({
    int? id,
    int? projectId,
    _i2.Project? project,
    int? ownerId,
    _i3.UserRecord? owner,
    DateTime? dateCreated,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'ProjectBookmarks',
      if (id != null) 'id': id,
      'projectId': projectId,
      if (project != null) 'project': project?.toJson(),
      'ownerId': ownerId,
      if (owner != null) 'owner': owner?.toJson(),
      'dateCreated': dateCreated.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'ProjectBookmarks',
      if (id != null) 'id': id,
      'projectId': projectId,
      if (project != null) 'project': project?.toJsonForProtocol(),
      'ownerId': ownerId,
      if (owner != null) 'owner': owner?.toJsonForProtocol(),
      'dateCreated': dateCreated.toJson(),
    };
  }

  static ProjectBookmarksInclude include({
    _i2.ProjectInclude? project,
    _i3.UserRecordInclude? owner,
  }) {
    return ProjectBookmarksInclude._(
      project: project,
      owner: owner,
    );
  }

  static ProjectBookmarksIncludeList includeList({
    _i1.WhereExpressionBuilder<ProjectBookmarksTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<ProjectBookmarksTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<ProjectBookmarksTable>? orderByList,
    ProjectBookmarksInclude? include,
  }) {
    return ProjectBookmarksIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(ProjectBookmarks.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(ProjectBookmarks.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _ProjectBookmarksImpl extends ProjectBookmarks {
  _ProjectBookmarksImpl({
    int? id,
    required int projectId,
    _i2.Project? project,
    required int ownerId,
    _i3.UserRecord? owner,
    DateTime? dateCreated,
  }) : super._(
         id: id,
         projectId: projectId,
         project: project,
         ownerId: ownerId,
         owner: owner,
         dateCreated: dateCreated,
       );

  /// Returns a shallow copy of this [ProjectBookmarks]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  ProjectBookmarks copyWith({
    Object? id = _Undefined,
    int? projectId,
    Object? project = _Undefined,
    int? ownerId,
    Object? owner = _Undefined,
    DateTime? dateCreated,
  }) {
    return ProjectBookmarks(
      id: id is int? ? id : this.id,
      projectId: projectId ?? this.projectId,
      project: project is _i2.Project? ? project : this.project?.copyWith(),
      ownerId: ownerId ?? this.ownerId,
      owner: owner is _i3.UserRecord? ? owner : this.owner?.copyWith(),
      dateCreated: dateCreated ?? this.dateCreated,
    );
  }
}

class ProjectBookmarksUpdateTable
    extends _i1.UpdateTable<ProjectBookmarksTable> {
  ProjectBookmarksUpdateTable(super.table);

  _i1.ColumnValue<int, int> projectId(int value) => _i1.ColumnValue(
    table.projectId,
    value,
  );

  _i1.ColumnValue<int, int> ownerId(int value) => _i1.ColumnValue(
    table.ownerId,
    value,
  );

  _i1.ColumnValue<DateTime, DateTime> dateCreated(DateTime value) =>
      _i1.ColumnValue(
        table.dateCreated,
        value,
      );
}

class ProjectBookmarksTable extends _i1.Table<int?> {
  ProjectBookmarksTable({super.tableRelation})
    : super(tableName: 'project_bookmarks') {
    updateTable = ProjectBookmarksUpdateTable(this);
    projectId = _i1.ColumnInt(
      'projectId',
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

  late final ProjectBookmarksUpdateTable updateTable;

  late final _i1.ColumnInt projectId;

  _i2.ProjectTable? _project;

  late final _i1.ColumnInt ownerId;

  _i3.UserRecordTable? _owner;

  late final _i1.ColumnDateTime dateCreated;

  _i2.ProjectTable get project {
    if (_project != null) return _project!;
    _project = _i1.createRelationTable(
      relationFieldName: 'project',
      field: ProjectBookmarks.t.projectId,
      foreignField: _i2.Project.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.ProjectTable(tableRelation: foreignTableRelation),
    );
    return _project!;
  }

  _i3.UserRecordTable get owner {
    if (_owner != null) return _owner!;
    _owner = _i1.createRelationTable(
      relationFieldName: 'owner',
      field: ProjectBookmarks.t.ownerId,
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
    projectId,
    ownerId,
    dateCreated,
  ];

  @override
  _i1.Table? getRelationTable(String relationField) {
    if (relationField == 'project') {
      return project;
    }
    if (relationField == 'owner') {
      return owner;
    }
    return null;
  }
}

class ProjectBookmarksInclude extends _i1.IncludeObject {
  ProjectBookmarksInclude._({
    _i2.ProjectInclude? project,
    _i3.UserRecordInclude? owner,
  }) {
    _project = project;
    _owner = owner;
  }

  _i2.ProjectInclude? _project;

  _i3.UserRecordInclude? _owner;

  @override
  Map<String, _i1.Include?> get includes => {
    'project': _project,
    'owner': _owner,
  };

  @override
  _i1.Table<int?> get table => ProjectBookmarks.t;
}

class ProjectBookmarksIncludeList extends _i1.IncludeList {
  ProjectBookmarksIncludeList._({
    _i1.WhereExpressionBuilder<ProjectBookmarksTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(ProjectBookmarks.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => ProjectBookmarks.t;
}

class ProjectBookmarksRepository {
  const ProjectBookmarksRepository._();

  final attachRow = const ProjectBookmarksAttachRowRepository._();

  /// Returns a list of [ProjectBookmarks]s matching the given query parameters.
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
  Future<List<ProjectBookmarks>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<ProjectBookmarksTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<ProjectBookmarksTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<ProjectBookmarksTable>? orderByList,
    _i1.Transaction? transaction,
    ProjectBookmarksInclude? include,
  }) async {
    return session.db.find<ProjectBookmarks>(
      where: where?.call(ProjectBookmarks.t),
      orderBy: orderBy?.call(ProjectBookmarks.t),
      orderByList: orderByList?.call(ProjectBookmarks.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Returns the first matching [ProjectBookmarks] matching the given query parameters.
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
  Future<ProjectBookmarks?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<ProjectBookmarksTable>? where,
    int? offset,
    _i1.OrderByBuilder<ProjectBookmarksTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<ProjectBookmarksTable>? orderByList,
    _i1.Transaction? transaction,
    ProjectBookmarksInclude? include,
  }) async {
    return session.db.findFirstRow<ProjectBookmarks>(
      where: where?.call(ProjectBookmarks.t),
      orderBy: orderBy?.call(ProjectBookmarks.t),
      orderByList: orderByList?.call(ProjectBookmarks.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Finds a single [ProjectBookmarks] by its [id] or null if no such row exists.
  Future<ProjectBookmarks?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
    ProjectBookmarksInclude? include,
  }) async {
    return session.db.findById<ProjectBookmarks>(
      id,
      transaction: transaction,
      include: include,
    );
  }

  /// Inserts all [ProjectBookmarks]s in the list and returns the inserted rows.
  ///
  /// The returned [ProjectBookmarks]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<ProjectBookmarks>> insert(
    _i1.Session session,
    List<ProjectBookmarks> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<ProjectBookmarks>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [ProjectBookmarks] and returns the inserted row.
  ///
  /// The returned [ProjectBookmarks] will have its `id` field set.
  Future<ProjectBookmarks> insertRow(
    _i1.Session session,
    ProjectBookmarks row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<ProjectBookmarks>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [ProjectBookmarks]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<ProjectBookmarks>> update(
    _i1.Session session,
    List<ProjectBookmarks> rows, {
    _i1.ColumnSelections<ProjectBookmarksTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<ProjectBookmarks>(
      rows,
      columns: columns?.call(ProjectBookmarks.t),
      transaction: transaction,
    );
  }

  /// Updates a single [ProjectBookmarks]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<ProjectBookmarks> updateRow(
    _i1.Session session,
    ProjectBookmarks row, {
    _i1.ColumnSelections<ProjectBookmarksTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<ProjectBookmarks>(
      row,
      columns: columns?.call(ProjectBookmarks.t),
      transaction: transaction,
    );
  }

  /// Updates a single [ProjectBookmarks] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<ProjectBookmarks?> updateById(
    _i1.Session session,
    int id, {
    required _i1.ColumnValueListBuilder<ProjectBookmarksUpdateTable>
    columnValues,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateById<ProjectBookmarks>(
      id,
      columnValues: columnValues(ProjectBookmarks.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [ProjectBookmarks]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  Future<List<ProjectBookmarks>> updateWhere(
    _i1.Session session, {
    required _i1.ColumnValueListBuilder<ProjectBookmarksUpdateTable>
    columnValues,
    required _i1.WhereExpressionBuilder<ProjectBookmarksTable> where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<ProjectBookmarksTable>? orderBy,
    _i1.OrderByListBuilder<ProjectBookmarksTable>? orderByList,
    bool orderDescending = false,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateWhere<ProjectBookmarks>(
      columnValues: columnValues(ProjectBookmarks.t.updateTable),
      where: where(ProjectBookmarks.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(ProjectBookmarks.t),
      orderByList: orderByList?.call(ProjectBookmarks.t),
      orderDescending: orderDescending,
      transaction: transaction,
    );
  }

  /// Deletes all [ProjectBookmarks]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<ProjectBookmarks>> delete(
    _i1.Session session,
    List<ProjectBookmarks> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<ProjectBookmarks>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [ProjectBookmarks].
  Future<ProjectBookmarks> deleteRow(
    _i1.Session session,
    ProjectBookmarks row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<ProjectBookmarks>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<ProjectBookmarks>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<ProjectBookmarksTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<ProjectBookmarks>(
      where: where(ProjectBookmarks.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<ProjectBookmarksTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<ProjectBookmarks>(
      where: where?.call(ProjectBookmarks.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

class ProjectBookmarksAttachRowRepository {
  const ProjectBookmarksAttachRowRepository._();

  /// Creates a relation between the given [ProjectBookmarks] and [Project]
  /// by setting the [ProjectBookmarks]'s foreign key `projectId` to refer to the [Project].
  Future<void> project(
    _i1.Session session,
    ProjectBookmarks projectBookmarks,
    _i2.Project project, {
    _i1.Transaction? transaction,
  }) async {
    if (projectBookmarks.id == null) {
      throw ArgumentError.notNull('projectBookmarks.id');
    }
    if (project.id == null) {
      throw ArgumentError.notNull('project.id');
    }

    var $projectBookmarks = projectBookmarks.copyWith(projectId: project.id);
    await session.db.updateRow<ProjectBookmarks>(
      $projectBookmarks,
      columns: [ProjectBookmarks.t.projectId],
      transaction: transaction,
    );
  }

  /// Creates a relation between the given [ProjectBookmarks] and [UserRecord]
  /// by setting the [ProjectBookmarks]'s foreign key `ownerId` to refer to the [UserRecord].
  Future<void> owner(
    _i1.Session session,
    ProjectBookmarks projectBookmarks,
    _i3.UserRecord owner, {
    _i1.Transaction? transaction,
  }) async {
    if (projectBookmarks.id == null) {
      throw ArgumentError.notNull('projectBookmarks.id');
    }
    if (owner.id == null) {
      throw ArgumentError.notNull('owner.id');
    }

    var $projectBookmarks = projectBookmarks.copyWith(ownerId: owner.id);
    await session.db.updateRow<ProjectBookmarks>(
      $projectBookmarks,
      columns: [ProjectBookmarks.t.ownerId],
      transaction: transaction,
    );
  }
}
