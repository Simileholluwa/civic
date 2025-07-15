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
import '../user/user_record.dart' as _i2;
import '../project/project.dart' as _i3;

abstract class ProjectSubscription
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  ProjectSubscription._({
    this.id,
    required this.userId,
    this.user,
    required this.projectId,
    this.project,
    DateTime? createdAt,
  }) : createdAt = createdAt ?? DateTime.now();

  factory ProjectSubscription({
    int? id,
    required int userId,
    _i2.UserRecord? user,
    required int projectId,
    _i3.Project? project,
    DateTime? createdAt,
  }) = _ProjectSubscriptionImpl;

  factory ProjectSubscription.fromJson(Map<String, dynamic> jsonSerialization) {
    return ProjectSubscription(
      id: jsonSerialization['id'] as int?,
      userId: jsonSerialization['userId'] as int,
      user: jsonSerialization['user'] == null
          ? null
          : _i2.UserRecord.fromJson(
              (jsonSerialization['user'] as Map<String, dynamic>)),
      projectId: jsonSerialization['projectId'] as int,
      project: jsonSerialization['project'] == null
          ? null
          : _i3.Project.fromJson(
              (jsonSerialization['project'] as Map<String, dynamic>)),
      createdAt: jsonSerialization['createdAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
    );
  }

  static final t = ProjectSubscriptionTable();

  static const db = ProjectSubscriptionRepository._();

  @override
  int? id;

  int userId;

  _i2.UserRecord? user;

  int projectId;

  _i3.Project? project;

  DateTime? createdAt;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [ProjectSubscription]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  ProjectSubscription copyWith({
    int? id,
    int? userId,
    _i2.UserRecord? user,
    int? projectId,
    _i3.Project? project,
    DateTime? createdAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'userId': userId,
      if (user != null) 'user': user?.toJson(),
      'projectId': projectId,
      if (project != null) 'project': project?.toJson(),
      if (createdAt != null) 'createdAt': createdAt?.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'userId': userId,
      if (user != null) 'user': user?.toJsonForProtocol(),
      'projectId': projectId,
      if (project != null) 'project': project?.toJsonForProtocol(),
      if (createdAt != null) 'createdAt': createdAt?.toJson(),
    };
  }

  static ProjectSubscriptionInclude include({
    _i2.UserRecordInclude? user,
    _i3.ProjectInclude? project,
  }) {
    return ProjectSubscriptionInclude._(
      user: user,
      project: project,
    );
  }

  static ProjectSubscriptionIncludeList includeList({
    _i1.WhereExpressionBuilder<ProjectSubscriptionTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<ProjectSubscriptionTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<ProjectSubscriptionTable>? orderByList,
    ProjectSubscriptionInclude? include,
  }) {
    return ProjectSubscriptionIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(ProjectSubscription.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(ProjectSubscription.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _ProjectSubscriptionImpl extends ProjectSubscription {
  _ProjectSubscriptionImpl({
    int? id,
    required int userId,
    _i2.UserRecord? user,
    required int projectId,
    _i3.Project? project,
    DateTime? createdAt,
  }) : super._(
          id: id,
          userId: userId,
          user: user,
          projectId: projectId,
          project: project,
          createdAt: createdAt,
        );

  /// Returns a shallow copy of this [ProjectSubscription]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  ProjectSubscription copyWith({
    Object? id = _Undefined,
    int? userId,
    Object? user = _Undefined,
    int? projectId,
    Object? project = _Undefined,
    Object? createdAt = _Undefined,
  }) {
    return ProjectSubscription(
      id: id is int? ? id : this.id,
      userId: userId ?? this.userId,
      user: user is _i2.UserRecord? ? user : this.user?.copyWith(),
      projectId: projectId ?? this.projectId,
      project: project is _i3.Project? ? project : this.project?.copyWith(),
      createdAt: createdAt is DateTime? ? createdAt : this.createdAt,
    );
  }
}

class ProjectSubscriptionTable extends _i1.Table<int?> {
  ProjectSubscriptionTable({super.tableRelation})
      : super(tableName: 'project_subscription') {
    userId = _i1.ColumnInt(
      'userId',
      this,
    );
    projectId = _i1.ColumnInt(
      'projectId',
      this,
    );
    createdAt = _i1.ColumnDateTime(
      'createdAt',
      this,
      hasDefault: true,
    );
  }

  late final _i1.ColumnInt userId;

  _i2.UserRecordTable? _user;

  late final _i1.ColumnInt projectId;

  _i3.ProjectTable? _project;

  late final _i1.ColumnDateTime createdAt;

  _i2.UserRecordTable get user {
    if (_user != null) return _user!;
    _user = _i1.createRelationTable(
      relationFieldName: 'user',
      field: ProjectSubscription.t.userId,
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
      field: ProjectSubscription.t.projectId,
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
        createdAt,
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

class ProjectSubscriptionInclude extends _i1.IncludeObject {
  ProjectSubscriptionInclude._({
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
  _i1.Table<int?> get table => ProjectSubscription.t;
}

class ProjectSubscriptionIncludeList extends _i1.IncludeList {
  ProjectSubscriptionIncludeList._({
    _i1.WhereExpressionBuilder<ProjectSubscriptionTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(ProjectSubscription.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => ProjectSubscription.t;
}

class ProjectSubscriptionRepository {
  const ProjectSubscriptionRepository._();

  final attachRow = const ProjectSubscriptionAttachRowRepository._();

  /// Returns a list of [ProjectSubscription]s matching the given query parameters.
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
  Future<List<ProjectSubscription>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<ProjectSubscriptionTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<ProjectSubscriptionTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<ProjectSubscriptionTable>? orderByList,
    _i1.Transaction? transaction,
    ProjectSubscriptionInclude? include,
  }) async {
    return session.db.find<ProjectSubscription>(
      where: where?.call(ProjectSubscription.t),
      orderBy: orderBy?.call(ProjectSubscription.t),
      orderByList: orderByList?.call(ProjectSubscription.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Returns the first matching [ProjectSubscription] matching the given query parameters.
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
  Future<ProjectSubscription?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<ProjectSubscriptionTable>? where,
    int? offset,
    _i1.OrderByBuilder<ProjectSubscriptionTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<ProjectSubscriptionTable>? orderByList,
    _i1.Transaction? transaction,
    ProjectSubscriptionInclude? include,
  }) async {
    return session.db.findFirstRow<ProjectSubscription>(
      where: where?.call(ProjectSubscription.t),
      orderBy: orderBy?.call(ProjectSubscription.t),
      orderByList: orderByList?.call(ProjectSubscription.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Finds a single [ProjectSubscription] by its [id] or null if no such row exists.
  Future<ProjectSubscription?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
    ProjectSubscriptionInclude? include,
  }) async {
    return session.db.findById<ProjectSubscription>(
      id,
      transaction: transaction,
      include: include,
    );
  }

  /// Inserts all [ProjectSubscription]s in the list and returns the inserted rows.
  ///
  /// The returned [ProjectSubscription]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<ProjectSubscription>> insert(
    _i1.Session session,
    List<ProjectSubscription> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<ProjectSubscription>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [ProjectSubscription] and returns the inserted row.
  ///
  /// The returned [ProjectSubscription] will have its `id` field set.
  Future<ProjectSubscription> insertRow(
    _i1.Session session,
    ProjectSubscription row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<ProjectSubscription>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [ProjectSubscription]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<ProjectSubscription>> update(
    _i1.Session session,
    List<ProjectSubscription> rows, {
    _i1.ColumnSelections<ProjectSubscriptionTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<ProjectSubscription>(
      rows,
      columns: columns?.call(ProjectSubscription.t),
      transaction: transaction,
    );
  }

  /// Updates a single [ProjectSubscription]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<ProjectSubscription> updateRow(
    _i1.Session session,
    ProjectSubscription row, {
    _i1.ColumnSelections<ProjectSubscriptionTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<ProjectSubscription>(
      row,
      columns: columns?.call(ProjectSubscription.t),
      transaction: transaction,
    );
  }

  /// Deletes all [ProjectSubscription]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<ProjectSubscription>> delete(
    _i1.Session session,
    List<ProjectSubscription> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<ProjectSubscription>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [ProjectSubscription].
  Future<ProjectSubscription> deleteRow(
    _i1.Session session,
    ProjectSubscription row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<ProjectSubscription>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<ProjectSubscription>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<ProjectSubscriptionTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<ProjectSubscription>(
      where: where(ProjectSubscription.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<ProjectSubscriptionTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<ProjectSubscription>(
      where: where?.call(ProjectSubscription.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

class ProjectSubscriptionAttachRowRepository {
  const ProjectSubscriptionAttachRowRepository._();

  /// Creates a relation between the given [ProjectSubscription] and [UserRecord]
  /// by setting the [ProjectSubscription]'s foreign key `userId` to refer to the [UserRecord].
  Future<void> user(
    _i1.Session session,
    ProjectSubscription projectSubscription,
    _i2.UserRecord user, {
    _i1.Transaction? transaction,
  }) async {
    if (projectSubscription.id == null) {
      throw ArgumentError.notNull('projectSubscription.id');
    }
    if (user.id == null) {
      throw ArgumentError.notNull('user.id');
    }

    var $projectSubscription = projectSubscription.copyWith(userId: user.id);
    await session.db.updateRow<ProjectSubscription>(
      $projectSubscription,
      columns: [ProjectSubscription.t.userId],
      transaction: transaction,
    );
  }

  /// Creates a relation between the given [ProjectSubscription] and [Project]
  /// by setting the [ProjectSubscription]'s foreign key `projectId` to refer to the [Project].
  Future<void> project(
    _i1.Session session,
    ProjectSubscription projectSubscription,
    _i3.Project project, {
    _i1.Transaction? transaction,
  }) async {
    if (projectSubscription.id == null) {
      throw ArgumentError.notNull('projectSubscription.id');
    }
    if (project.id == null) {
      throw ArgumentError.notNull('project.id');
    }

    var $projectSubscription =
        projectSubscription.copyWith(projectId: project.id);
    await session.db.updateRow<ProjectSubscription>(
      $projectSubscription,
      columns: [ProjectSubscription.t.projectId],
      transaction: transaction,
    );
  }
}
