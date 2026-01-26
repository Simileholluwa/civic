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

abstract class ProjectVetting
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  ProjectVetting._({
    this.id,
    required this.projectId,
    this.project,
    required this.ownerId,
    this.owner,
    this.images,
    this.comment,
    this.status,
    DateTime? createdAt,
    this.updatedAt,
    this.likedBy,
    this.dislikedBy,
  }) : createdAt = createdAt ?? DateTime.now();

  factory ProjectVetting({
    int? id,
    required int projectId,
    _i2.Project? project,
    required int ownerId,
    _i3.UserRecord? owner,
    List<String>? images,
    String? comment,
    String? status,
    DateTime? createdAt,
    DateTime? updatedAt,
    List<int>? likedBy,
    List<int>? dislikedBy,
  }) = _ProjectVettingImpl;

  factory ProjectVetting.fromJson(Map<String, dynamic> jsonSerialization) {
    return ProjectVetting(
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
      images: jsonSerialization['images'] == null
          ? null
          : _i4.Protocol().deserialize<List<String>>(
              jsonSerialization['images'],
            ),
      comment: jsonSerialization['comment'] as String?,
      status: jsonSerialization['status'] as String?,
      createdAt: jsonSerialization['createdAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
      updatedAt: jsonSerialization['updatedAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['updatedAt']),
      likedBy: jsonSerialization['likedBy'] == null
          ? null
          : _i4.Protocol().deserialize<List<int>>(jsonSerialization['likedBy']),
      dislikedBy: jsonSerialization['dislikedBy'] == null
          ? null
          : _i4.Protocol().deserialize<List<int>>(
              jsonSerialization['dislikedBy'],
            ),
    );
  }

  static final t = ProjectVettingTable();

  static const db = ProjectVettingRepository._();

  @override
  int? id;

  int projectId;

  _i2.Project? project;

  int ownerId;

  _i3.UserRecord? owner;

  List<String>? images;

  String? comment;

  String? status;

  DateTime? createdAt;

  DateTime? updatedAt;

  List<int>? likedBy;

  List<int>? dislikedBy;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [ProjectVetting]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  ProjectVetting copyWith({
    int? id,
    int? projectId,
    _i2.Project? project,
    int? ownerId,
    _i3.UserRecord? owner,
    List<String>? images,
    String? comment,
    String? status,
    DateTime? createdAt,
    DateTime? updatedAt,
    List<int>? likedBy,
    List<int>? dislikedBy,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'ProjectVetting',
      if (id != null) 'id': id,
      'projectId': projectId,
      if (project != null) 'project': project?.toJson(),
      'ownerId': ownerId,
      if (owner != null) 'owner': owner?.toJson(),
      if (images != null) 'images': images?.toJson(),
      if (comment != null) 'comment': comment,
      if (status != null) 'status': status,
      if (createdAt != null) 'createdAt': createdAt?.toJson(),
      if (updatedAt != null) 'updatedAt': updatedAt?.toJson(),
      if (likedBy != null) 'likedBy': likedBy?.toJson(),
      if (dislikedBy != null) 'dislikedBy': dislikedBy?.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'ProjectVetting',
      if (id != null) 'id': id,
      'projectId': projectId,
      if (project != null) 'project': project?.toJsonForProtocol(),
      'ownerId': ownerId,
      if (owner != null) 'owner': owner?.toJsonForProtocol(),
      if (images != null) 'images': images?.toJson(),
      if (comment != null) 'comment': comment,
      if (status != null) 'status': status,
      if (createdAt != null) 'createdAt': createdAt?.toJson(),
      if (updatedAt != null) 'updatedAt': updatedAt?.toJson(),
      if (likedBy != null) 'likedBy': likedBy?.toJson(),
      if (dislikedBy != null) 'dislikedBy': dislikedBy?.toJson(),
    };
  }

  static ProjectVettingInclude include({
    _i2.ProjectInclude? project,
    _i3.UserRecordInclude? owner,
  }) {
    return ProjectVettingInclude._(
      project: project,
      owner: owner,
    );
  }

  static ProjectVettingIncludeList includeList({
    _i1.WhereExpressionBuilder<ProjectVettingTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<ProjectVettingTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<ProjectVettingTable>? orderByList,
    ProjectVettingInclude? include,
  }) {
    return ProjectVettingIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(ProjectVetting.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(ProjectVetting.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _ProjectVettingImpl extends ProjectVetting {
  _ProjectVettingImpl({
    int? id,
    required int projectId,
    _i2.Project? project,
    required int ownerId,
    _i3.UserRecord? owner,
    List<String>? images,
    String? comment,
    String? status,
    DateTime? createdAt,
    DateTime? updatedAt,
    List<int>? likedBy,
    List<int>? dislikedBy,
  }) : super._(
         id: id,
         projectId: projectId,
         project: project,
         ownerId: ownerId,
         owner: owner,
         images: images,
         comment: comment,
         status: status,
         createdAt: createdAt,
         updatedAt: updatedAt,
         likedBy: likedBy,
         dislikedBy: dislikedBy,
       );

  /// Returns a shallow copy of this [ProjectVetting]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  ProjectVetting copyWith({
    Object? id = _Undefined,
    int? projectId,
    Object? project = _Undefined,
    int? ownerId,
    Object? owner = _Undefined,
    Object? images = _Undefined,
    Object? comment = _Undefined,
    Object? status = _Undefined,
    Object? createdAt = _Undefined,
    Object? updatedAt = _Undefined,
    Object? likedBy = _Undefined,
    Object? dislikedBy = _Undefined,
  }) {
    return ProjectVetting(
      id: id is int? ? id : this.id,
      projectId: projectId ?? this.projectId,
      project: project is _i2.Project? ? project : this.project?.copyWith(),
      ownerId: ownerId ?? this.ownerId,
      owner: owner is _i3.UserRecord? ? owner : this.owner?.copyWith(),
      images: images is List<String>?
          ? images
          : this.images?.map((e0) => e0).toList(),
      comment: comment is String? ? comment : this.comment,
      status: status is String? ? status : this.status,
      createdAt: createdAt is DateTime? ? createdAt : this.createdAt,
      updatedAt: updatedAt is DateTime? ? updatedAt : this.updatedAt,
      likedBy: likedBy is List<int>?
          ? likedBy
          : this.likedBy?.map((e0) => e0).toList(),
      dislikedBy: dislikedBy is List<int>?
          ? dislikedBy
          : this.dislikedBy?.map((e0) => e0).toList(),
    );
  }
}

class ProjectVettingUpdateTable extends _i1.UpdateTable<ProjectVettingTable> {
  ProjectVettingUpdateTable(super.table);

  _i1.ColumnValue<int, int> projectId(int value) => _i1.ColumnValue(
    table.projectId,
    value,
  );

  _i1.ColumnValue<int, int> ownerId(int value) => _i1.ColumnValue(
    table.ownerId,
    value,
  );

  _i1.ColumnValue<List<String>, List<String>> images(List<String>? value) =>
      _i1.ColumnValue(
        table.images,
        value,
      );

  _i1.ColumnValue<String, String> comment(String? value) => _i1.ColumnValue(
    table.comment,
    value,
  );

  _i1.ColumnValue<String, String> status(String? value) => _i1.ColumnValue(
    table.status,
    value,
  );

  _i1.ColumnValue<DateTime, DateTime> createdAt(DateTime? value) =>
      _i1.ColumnValue(
        table.createdAt,
        value,
      );

  _i1.ColumnValue<DateTime, DateTime> updatedAt(DateTime? value) =>
      _i1.ColumnValue(
        table.updatedAt,
        value,
      );

  _i1.ColumnValue<List<int>, List<int>> likedBy(List<int>? value) =>
      _i1.ColumnValue(
        table.likedBy,
        value,
      );

  _i1.ColumnValue<List<int>, List<int>> dislikedBy(List<int>? value) =>
      _i1.ColumnValue(
        table.dislikedBy,
        value,
      );
}

class ProjectVettingTable extends _i1.Table<int?> {
  ProjectVettingTable({super.tableRelation})
    : super(tableName: 'project_vetting') {
    updateTable = ProjectVettingUpdateTable(this);
    projectId = _i1.ColumnInt(
      'projectId',
      this,
    );
    ownerId = _i1.ColumnInt(
      'ownerId',
      this,
    );
    images = _i1.ColumnSerializable<List<String>>(
      'images',
      this,
    );
    comment = _i1.ColumnString(
      'comment',
      this,
    );
    status = _i1.ColumnString(
      'status',
      this,
    );
    createdAt = _i1.ColumnDateTime(
      'createdAt',
      this,
      hasDefault: true,
    );
    updatedAt = _i1.ColumnDateTime(
      'updatedAt',
      this,
    );
    likedBy = _i1.ColumnSerializable<List<int>>(
      'likedBy',
      this,
    );
    dislikedBy = _i1.ColumnSerializable<List<int>>(
      'dislikedBy',
      this,
    );
  }

  late final ProjectVettingUpdateTable updateTable;

  late final _i1.ColumnInt projectId;

  _i2.ProjectTable? _project;

  late final _i1.ColumnInt ownerId;

  _i3.UserRecordTable? _owner;

  late final _i1.ColumnSerializable<List<String>> images;

  late final _i1.ColumnString comment;

  late final _i1.ColumnString status;

  late final _i1.ColumnDateTime createdAt;

  late final _i1.ColumnDateTime updatedAt;

  late final _i1.ColumnSerializable<List<int>> likedBy;

  late final _i1.ColumnSerializable<List<int>> dislikedBy;

  _i2.ProjectTable get project {
    if (_project != null) return _project!;
    _project = _i1.createRelationTable(
      relationFieldName: 'project',
      field: ProjectVetting.t.projectId,
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
      field: ProjectVetting.t.ownerId,
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
    images,
    comment,
    status,
    createdAt,
    updatedAt,
    likedBy,
    dislikedBy,
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

class ProjectVettingInclude extends _i1.IncludeObject {
  ProjectVettingInclude._({
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
  _i1.Table<int?> get table => ProjectVetting.t;
}

class ProjectVettingIncludeList extends _i1.IncludeList {
  ProjectVettingIncludeList._({
    _i1.WhereExpressionBuilder<ProjectVettingTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(ProjectVetting.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => ProjectVetting.t;
}

class ProjectVettingRepository {
  const ProjectVettingRepository._();

  final attachRow = const ProjectVettingAttachRowRepository._();

  /// Returns a list of [ProjectVetting]s matching the given query parameters.
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
  Future<List<ProjectVetting>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<ProjectVettingTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<ProjectVettingTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<ProjectVettingTable>? orderByList,
    _i1.Transaction? transaction,
    ProjectVettingInclude? include,
  }) async {
    return session.db.find<ProjectVetting>(
      where: where?.call(ProjectVetting.t),
      orderBy: orderBy?.call(ProjectVetting.t),
      orderByList: orderByList?.call(ProjectVetting.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Returns the first matching [ProjectVetting] matching the given query parameters.
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
  Future<ProjectVetting?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<ProjectVettingTable>? where,
    int? offset,
    _i1.OrderByBuilder<ProjectVettingTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<ProjectVettingTable>? orderByList,
    _i1.Transaction? transaction,
    ProjectVettingInclude? include,
  }) async {
    return session.db.findFirstRow<ProjectVetting>(
      where: where?.call(ProjectVetting.t),
      orderBy: orderBy?.call(ProjectVetting.t),
      orderByList: orderByList?.call(ProjectVetting.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Finds a single [ProjectVetting] by its [id] or null if no such row exists.
  Future<ProjectVetting?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
    ProjectVettingInclude? include,
  }) async {
    return session.db.findById<ProjectVetting>(
      id,
      transaction: transaction,
      include: include,
    );
  }

  /// Inserts all [ProjectVetting]s in the list and returns the inserted rows.
  ///
  /// The returned [ProjectVetting]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<ProjectVetting>> insert(
    _i1.Session session,
    List<ProjectVetting> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<ProjectVetting>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [ProjectVetting] and returns the inserted row.
  ///
  /// The returned [ProjectVetting] will have its `id` field set.
  Future<ProjectVetting> insertRow(
    _i1.Session session,
    ProjectVetting row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<ProjectVetting>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [ProjectVetting]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<ProjectVetting>> update(
    _i1.Session session,
    List<ProjectVetting> rows, {
    _i1.ColumnSelections<ProjectVettingTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<ProjectVetting>(
      rows,
      columns: columns?.call(ProjectVetting.t),
      transaction: transaction,
    );
  }

  /// Updates a single [ProjectVetting]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<ProjectVetting> updateRow(
    _i1.Session session,
    ProjectVetting row, {
    _i1.ColumnSelections<ProjectVettingTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<ProjectVetting>(
      row,
      columns: columns?.call(ProjectVetting.t),
      transaction: transaction,
    );
  }

  /// Updates a single [ProjectVetting] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<ProjectVetting?> updateById(
    _i1.Session session,
    int id, {
    required _i1.ColumnValueListBuilder<ProjectVettingUpdateTable> columnValues,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateById<ProjectVetting>(
      id,
      columnValues: columnValues(ProjectVetting.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [ProjectVetting]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  Future<List<ProjectVetting>> updateWhere(
    _i1.Session session, {
    required _i1.ColumnValueListBuilder<ProjectVettingUpdateTable> columnValues,
    required _i1.WhereExpressionBuilder<ProjectVettingTable> where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<ProjectVettingTable>? orderBy,
    _i1.OrderByListBuilder<ProjectVettingTable>? orderByList,
    bool orderDescending = false,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateWhere<ProjectVetting>(
      columnValues: columnValues(ProjectVetting.t.updateTable),
      where: where(ProjectVetting.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(ProjectVetting.t),
      orderByList: orderByList?.call(ProjectVetting.t),
      orderDescending: orderDescending,
      transaction: transaction,
    );
  }

  /// Deletes all [ProjectVetting]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<ProjectVetting>> delete(
    _i1.Session session,
    List<ProjectVetting> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<ProjectVetting>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [ProjectVetting].
  Future<ProjectVetting> deleteRow(
    _i1.Session session,
    ProjectVetting row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<ProjectVetting>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<ProjectVetting>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<ProjectVettingTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<ProjectVetting>(
      where: where(ProjectVetting.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<ProjectVettingTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<ProjectVetting>(
      where: where?.call(ProjectVetting.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

class ProjectVettingAttachRowRepository {
  const ProjectVettingAttachRowRepository._();

  /// Creates a relation between the given [ProjectVetting] and [Project]
  /// by setting the [ProjectVetting]'s foreign key `projectId` to refer to the [Project].
  Future<void> project(
    _i1.Session session,
    ProjectVetting projectVetting,
    _i2.Project project, {
    _i1.Transaction? transaction,
  }) async {
    if (projectVetting.id == null) {
      throw ArgumentError.notNull('projectVetting.id');
    }
    if (project.id == null) {
      throw ArgumentError.notNull('project.id');
    }

    var $projectVetting = projectVetting.copyWith(projectId: project.id);
    await session.db.updateRow<ProjectVetting>(
      $projectVetting,
      columns: [ProjectVetting.t.projectId],
      transaction: transaction,
    );
  }

  /// Creates a relation between the given [ProjectVetting] and [UserRecord]
  /// by setting the [ProjectVetting]'s foreign key `ownerId` to refer to the [UserRecord].
  Future<void> owner(
    _i1.Session session,
    ProjectVetting projectVetting,
    _i3.UserRecord owner, {
    _i1.Transaction? transaction,
  }) async {
    if (projectVetting.id == null) {
      throw ArgumentError.notNull('projectVetting.id');
    }
    if (owner.id == null) {
      throw ArgumentError.notNull('owner.id');
    }

    var $projectVetting = projectVetting.copyWith(ownerId: owner.id);
    await session.db.updateRow<ProjectVetting>(
      $projectVetting,
      columns: [ProjectVetting.t.ownerId],
      transaction: transaction,
    );
  }
}
