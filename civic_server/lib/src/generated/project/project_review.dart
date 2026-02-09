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

abstract class ProjectReview
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  ProjectReview._({
    this.id,
    required this.ownerId,
    this.owner,
    required this.projectId,
    this.project,
    String? review,
    double? locationRating,
    double? descriptionRating,
    double? attachmentsRating,
    double? categoryRating,
    double? fundingRating,
    double? datesRating,
    double? overallRating,
    DateTime? dateCreated,
    this.updatedAt,
    int? likesCount,
    int? dislikesCount,
  }) : review = review ?? '',
       locationRating = locationRating ?? 0.0,
       descriptionRating = descriptionRating ?? 0.0,
       attachmentsRating = attachmentsRating ?? 0.0,
       categoryRating = categoryRating ?? 0.0,
       fundingRating = fundingRating ?? 0.0,
       datesRating = datesRating ?? 0.0,
       overallRating = overallRating ?? 0.0,
       dateCreated = dateCreated ?? DateTime.now(),
       likesCount = likesCount ?? 0,
       dislikesCount = dislikesCount ?? 0;

  factory ProjectReview({
    int? id,
    required int ownerId,
    _i2.UserRecord? owner,
    required int projectId,
    _i3.Project? project,
    String? review,
    double? locationRating,
    double? descriptionRating,
    double? attachmentsRating,
    double? categoryRating,
    double? fundingRating,
    double? datesRating,
    double? overallRating,
    DateTime? dateCreated,
    DateTime? updatedAt,
    int? likesCount,
    int? dislikesCount,
  }) = _ProjectReviewImpl;

  factory ProjectReview.fromJson(Map<String, dynamic> jsonSerialization) {
    return ProjectReview(
      id: jsonSerialization['id'] as int?,
      ownerId: jsonSerialization['ownerId'] as int,
      owner: jsonSerialization['owner'] == null
          ? null
          : _i4.Protocol().deserialize<_i2.UserRecord>(
              jsonSerialization['owner'],
            ),
      projectId: jsonSerialization['projectId'] as int,
      project: jsonSerialization['project'] == null
          ? null
          : _i4.Protocol().deserialize<_i3.Project>(
              jsonSerialization['project'],
            ),
      review: jsonSerialization['review'] as String?,
      locationRating: (jsonSerialization['locationRating'] as num?)?.toDouble(),
      descriptionRating: (jsonSerialization['descriptionRating'] as num?)
          ?.toDouble(),
      attachmentsRating: (jsonSerialization['attachmentsRating'] as num?)
          ?.toDouble(),
      categoryRating: (jsonSerialization['categoryRating'] as num?)?.toDouble(),
      fundingRating: (jsonSerialization['fundingRating'] as num?)?.toDouble(),
      datesRating: (jsonSerialization['datesRating'] as num?)?.toDouble(),
      overallRating: (jsonSerialization['overallRating'] as num?)?.toDouble(),
      dateCreated: jsonSerialization['dateCreated'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(
              jsonSerialization['dateCreated'],
            ),
      updatedAt: jsonSerialization['updatedAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['updatedAt']),
      likesCount: jsonSerialization['likesCount'] as int?,
      dislikesCount: jsonSerialization['dislikesCount'] as int?,
    );
  }

  static final t = ProjectReviewTable();

  static const db = ProjectReviewRepository._();

  @override
  int? id;

  int ownerId;

  _i2.UserRecord? owner;

  int projectId;

  _i3.Project? project;

  String? review;

  double? locationRating;

  double? descriptionRating;

  double? attachmentsRating;

  double? categoryRating;

  double? fundingRating;

  double? datesRating;

  double? overallRating;

  DateTime? dateCreated;

  DateTime? updatedAt;

  int? likesCount;

  int? dislikesCount;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [ProjectReview]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  ProjectReview copyWith({
    int? id,
    int? ownerId,
    _i2.UserRecord? owner,
    int? projectId,
    _i3.Project? project,
    String? review,
    double? locationRating,
    double? descriptionRating,
    double? attachmentsRating,
    double? categoryRating,
    double? fundingRating,
    double? datesRating,
    double? overallRating,
    DateTime? dateCreated,
    DateTime? updatedAt,
    int? likesCount,
    int? dislikesCount,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'ProjectReview',
      if (id != null) 'id': id,
      'ownerId': ownerId,
      if (owner != null) 'owner': owner?.toJson(),
      'projectId': projectId,
      if (project != null) 'project': project?.toJson(),
      if (review != null) 'review': review,
      if (locationRating != null) 'locationRating': locationRating,
      if (descriptionRating != null) 'descriptionRating': descriptionRating,
      if (attachmentsRating != null) 'attachmentsRating': attachmentsRating,
      if (categoryRating != null) 'categoryRating': categoryRating,
      if (fundingRating != null) 'fundingRating': fundingRating,
      if (datesRating != null) 'datesRating': datesRating,
      if (overallRating != null) 'overallRating': overallRating,
      if (dateCreated != null) 'dateCreated': dateCreated?.toJson(),
      if (updatedAt != null) 'updatedAt': updatedAt?.toJson(),
      if (likesCount != null) 'likesCount': likesCount,
      if (dislikesCount != null) 'dislikesCount': dislikesCount,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'ProjectReview',
      if (id != null) 'id': id,
      'ownerId': ownerId,
      if (owner != null) 'owner': owner?.toJsonForProtocol(),
      'projectId': projectId,
      if (project != null) 'project': project?.toJsonForProtocol(),
      if (review != null) 'review': review,
      if (locationRating != null) 'locationRating': locationRating,
      if (descriptionRating != null) 'descriptionRating': descriptionRating,
      if (attachmentsRating != null) 'attachmentsRating': attachmentsRating,
      if (categoryRating != null) 'categoryRating': categoryRating,
      if (fundingRating != null) 'fundingRating': fundingRating,
      if (datesRating != null) 'datesRating': datesRating,
      if (overallRating != null) 'overallRating': overallRating,
      if (dateCreated != null) 'dateCreated': dateCreated?.toJson(),
      if (updatedAt != null) 'updatedAt': updatedAt?.toJson(),
      if (likesCount != null) 'likesCount': likesCount,
      if (dislikesCount != null) 'dislikesCount': dislikesCount,
    };
  }

  static ProjectReviewInclude include({
    _i2.UserRecordInclude? owner,
    _i3.ProjectInclude? project,
  }) {
    return ProjectReviewInclude._(
      owner: owner,
      project: project,
    );
  }

  static ProjectReviewIncludeList includeList({
    _i1.WhereExpressionBuilder<ProjectReviewTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<ProjectReviewTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<ProjectReviewTable>? orderByList,
    ProjectReviewInclude? include,
  }) {
    return ProjectReviewIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(ProjectReview.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(ProjectReview.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _ProjectReviewImpl extends ProjectReview {
  _ProjectReviewImpl({
    int? id,
    required int ownerId,
    _i2.UserRecord? owner,
    required int projectId,
    _i3.Project? project,
    String? review,
    double? locationRating,
    double? descriptionRating,
    double? attachmentsRating,
    double? categoryRating,
    double? fundingRating,
    double? datesRating,
    double? overallRating,
    DateTime? dateCreated,
    DateTime? updatedAt,
    int? likesCount,
    int? dislikesCount,
  }) : super._(
         id: id,
         ownerId: ownerId,
         owner: owner,
         projectId: projectId,
         project: project,
         review: review,
         locationRating: locationRating,
         descriptionRating: descriptionRating,
         attachmentsRating: attachmentsRating,
         categoryRating: categoryRating,
         fundingRating: fundingRating,
         datesRating: datesRating,
         overallRating: overallRating,
         dateCreated: dateCreated,
         updatedAt: updatedAt,
         likesCount: likesCount,
         dislikesCount: dislikesCount,
       );

  /// Returns a shallow copy of this [ProjectReview]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  ProjectReview copyWith({
    Object? id = _Undefined,
    int? ownerId,
    Object? owner = _Undefined,
    int? projectId,
    Object? project = _Undefined,
    Object? review = _Undefined,
    Object? locationRating = _Undefined,
    Object? descriptionRating = _Undefined,
    Object? attachmentsRating = _Undefined,
    Object? categoryRating = _Undefined,
    Object? fundingRating = _Undefined,
    Object? datesRating = _Undefined,
    Object? overallRating = _Undefined,
    Object? dateCreated = _Undefined,
    Object? updatedAt = _Undefined,
    Object? likesCount = _Undefined,
    Object? dislikesCount = _Undefined,
  }) {
    return ProjectReview(
      id: id is int? ? id : this.id,
      ownerId: ownerId ?? this.ownerId,
      owner: owner is _i2.UserRecord? ? owner : this.owner?.copyWith(),
      projectId: projectId ?? this.projectId,
      project: project is _i3.Project? ? project : this.project?.copyWith(),
      review: review is String? ? review : this.review,
      locationRating: locationRating is double?
          ? locationRating
          : this.locationRating,
      descriptionRating: descriptionRating is double?
          ? descriptionRating
          : this.descriptionRating,
      attachmentsRating: attachmentsRating is double?
          ? attachmentsRating
          : this.attachmentsRating,
      categoryRating: categoryRating is double?
          ? categoryRating
          : this.categoryRating,
      fundingRating: fundingRating is double?
          ? fundingRating
          : this.fundingRating,
      datesRating: datesRating is double? ? datesRating : this.datesRating,
      overallRating: overallRating is double?
          ? overallRating
          : this.overallRating,
      dateCreated: dateCreated is DateTime? ? dateCreated : this.dateCreated,
      updatedAt: updatedAt is DateTime? ? updatedAt : this.updatedAt,
      likesCount: likesCount is int? ? likesCount : this.likesCount,
      dislikesCount: dislikesCount is int? ? dislikesCount : this.dislikesCount,
    );
  }
}

class ProjectReviewUpdateTable extends _i1.UpdateTable<ProjectReviewTable> {
  ProjectReviewUpdateTable(super.table);

  _i1.ColumnValue<int, int> ownerId(int value) => _i1.ColumnValue(
    table.ownerId,
    value,
  );

  _i1.ColumnValue<int, int> projectId(int value) => _i1.ColumnValue(
    table.projectId,
    value,
  );

  _i1.ColumnValue<String, String> review(String? value) => _i1.ColumnValue(
    table.review,
    value,
  );

  _i1.ColumnValue<double, double> locationRating(double? value) =>
      _i1.ColumnValue(
        table.locationRating,
        value,
      );

  _i1.ColumnValue<double, double> descriptionRating(double? value) =>
      _i1.ColumnValue(
        table.descriptionRating,
        value,
      );

  _i1.ColumnValue<double, double> attachmentsRating(double? value) =>
      _i1.ColumnValue(
        table.attachmentsRating,
        value,
      );

  _i1.ColumnValue<double, double> categoryRating(double? value) =>
      _i1.ColumnValue(
        table.categoryRating,
        value,
      );

  _i1.ColumnValue<double, double> fundingRating(double? value) =>
      _i1.ColumnValue(
        table.fundingRating,
        value,
      );

  _i1.ColumnValue<double, double> datesRating(double? value) => _i1.ColumnValue(
    table.datesRating,
    value,
  );

  _i1.ColumnValue<double, double> overallRating(double? value) =>
      _i1.ColumnValue(
        table.overallRating,
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

  _i1.ColumnValue<int, int> likesCount(int? value) => _i1.ColumnValue(
    table.likesCount,
    value,
  );

  _i1.ColumnValue<int, int> dislikesCount(int? value) => _i1.ColumnValue(
    table.dislikesCount,
    value,
  );
}

class ProjectReviewTable extends _i1.Table<int?> {
  ProjectReviewTable({super.tableRelation})
    : super(tableName: 'project_review') {
    updateTable = ProjectReviewUpdateTable(this);
    ownerId = _i1.ColumnInt(
      'ownerId',
      this,
    );
    projectId = _i1.ColumnInt(
      'projectId',
      this,
    );
    review = _i1.ColumnString(
      'review',
      this,
      hasDefault: true,
    );
    locationRating = _i1.ColumnDouble(
      'locationRating',
      this,
      hasDefault: true,
    );
    descriptionRating = _i1.ColumnDouble(
      'descriptionRating',
      this,
      hasDefault: true,
    );
    attachmentsRating = _i1.ColumnDouble(
      'attachmentsRating',
      this,
      hasDefault: true,
    );
    categoryRating = _i1.ColumnDouble(
      'categoryRating',
      this,
      hasDefault: true,
    );
    fundingRating = _i1.ColumnDouble(
      'fundingRating',
      this,
      hasDefault: true,
    );
    datesRating = _i1.ColumnDouble(
      'datesRating',
      this,
      hasDefault: true,
    );
    overallRating = _i1.ColumnDouble(
      'overallRating',
      this,
      hasDefault: true,
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
    likesCount = _i1.ColumnInt(
      'likesCount',
      this,
      hasDefault: true,
    );
    dislikesCount = _i1.ColumnInt(
      'dislikesCount',
      this,
      hasDefault: true,
    );
  }

  late final ProjectReviewUpdateTable updateTable;

  late final _i1.ColumnInt ownerId;

  _i2.UserRecordTable? _owner;

  late final _i1.ColumnInt projectId;

  _i3.ProjectTable? _project;

  late final _i1.ColumnString review;

  late final _i1.ColumnDouble locationRating;

  late final _i1.ColumnDouble descriptionRating;

  late final _i1.ColumnDouble attachmentsRating;

  late final _i1.ColumnDouble categoryRating;

  late final _i1.ColumnDouble fundingRating;

  late final _i1.ColumnDouble datesRating;

  late final _i1.ColumnDouble overallRating;

  late final _i1.ColumnDateTime dateCreated;

  late final _i1.ColumnDateTime updatedAt;

  late final _i1.ColumnInt likesCount;

  late final _i1.ColumnInt dislikesCount;

  _i2.UserRecordTable get owner {
    if (_owner != null) return _owner!;
    _owner = _i1.createRelationTable(
      relationFieldName: 'owner',
      field: ProjectReview.t.ownerId,
      foreignField: _i2.UserRecord.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.UserRecordTable(tableRelation: foreignTableRelation),
    );
    return _owner!;
  }

  _i3.ProjectTable get project {
    if (_project != null) return _project!;
    _project = _i1.createRelationTable(
      relationFieldName: 'project',
      field: ProjectReview.t.projectId,
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
    ownerId,
    projectId,
    review,
    locationRating,
    descriptionRating,
    attachmentsRating,
    categoryRating,
    fundingRating,
    datesRating,
    overallRating,
    dateCreated,
    updatedAt,
    likesCount,
    dislikesCount,
  ];

  @override
  _i1.Table? getRelationTable(String relationField) {
    if (relationField == 'owner') {
      return owner;
    }
    if (relationField == 'project') {
      return project;
    }
    return null;
  }
}

class ProjectReviewInclude extends _i1.IncludeObject {
  ProjectReviewInclude._({
    _i2.UserRecordInclude? owner,
    _i3.ProjectInclude? project,
  }) {
    _owner = owner;
    _project = project;
  }

  _i2.UserRecordInclude? _owner;

  _i3.ProjectInclude? _project;

  @override
  Map<String, _i1.Include?> get includes => {
    'owner': _owner,
    'project': _project,
  };

  @override
  _i1.Table<int?> get table => ProjectReview.t;
}

class ProjectReviewIncludeList extends _i1.IncludeList {
  ProjectReviewIncludeList._({
    _i1.WhereExpressionBuilder<ProjectReviewTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(ProjectReview.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => ProjectReview.t;
}

class ProjectReviewRepository {
  const ProjectReviewRepository._();

  final attachRow = const ProjectReviewAttachRowRepository._();

  /// Returns a list of [ProjectReview]s matching the given query parameters.
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
  Future<List<ProjectReview>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<ProjectReviewTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<ProjectReviewTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<ProjectReviewTable>? orderByList,
    _i1.Transaction? transaction,
    ProjectReviewInclude? include,
  }) async {
    return session.db.find<ProjectReview>(
      where: where?.call(ProjectReview.t),
      orderBy: orderBy?.call(ProjectReview.t),
      orderByList: orderByList?.call(ProjectReview.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Returns the first matching [ProjectReview] matching the given query parameters.
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
  Future<ProjectReview?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<ProjectReviewTable>? where,
    int? offset,
    _i1.OrderByBuilder<ProjectReviewTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<ProjectReviewTable>? orderByList,
    _i1.Transaction? transaction,
    ProjectReviewInclude? include,
  }) async {
    return session.db.findFirstRow<ProjectReview>(
      where: where?.call(ProjectReview.t),
      orderBy: orderBy?.call(ProjectReview.t),
      orderByList: orderByList?.call(ProjectReview.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Finds a single [ProjectReview] by its [id] or null if no such row exists.
  Future<ProjectReview?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
    ProjectReviewInclude? include,
  }) async {
    return session.db.findById<ProjectReview>(
      id,
      transaction: transaction,
      include: include,
    );
  }

  /// Inserts all [ProjectReview]s in the list and returns the inserted rows.
  ///
  /// The returned [ProjectReview]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<ProjectReview>> insert(
    _i1.Session session,
    List<ProjectReview> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<ProjectReview>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [ProjectReview] and returns the inserted row.
  ///
  /// The returned [ProjectReview] will have its `id` field set.
  Future<ProjectReview> insertRow(
    _i1.Session session,
    ProjectReview row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<ProjectReview>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [ProjectReview]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<ProjectReview>> update(
    _i1.Session session,
    List<ProjectReview> rows, {
    _i1.ColumnSelections<ProjectReviewTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<ProjectReview>(
      rows,
      columns: columns?.call(ProjectReview.t),
      transaction: transaction,
    );
  }

  /// Updates a single [ProjectReview]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<ProjectReview> updateRow(
    _i1.Session session,
    ProjectReview row, {
    _i1.ColumnSelections<ProjectReviewTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<ProjectReview>(
      row,
      columns: columns?.call(ProjectReview.t),
      transaction: transaction,
    );
  }

  /// Updates a single [ProjectReview] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<ProjectReview?> updateById(
    _i1.Session session,
    int id, {
    required _i1.ColumnValueListBuilder<ProjectReviewUpdateTable> columnValues,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateById<ProjectReview>(
      id,
      columnValues: columnValues(ProjectReview.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [ProjectReview]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  Future<List<ProjectReview>> updateWhere(
    _i1.Session session, {
    required _i1.ColumnValueListBuilder<ProjectReviewUpdateTable> columnValues,
    required _i1.WhereExpressionBuilder<ProjectReviewTable> where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<ProjectReviewTable>? orderBy,
    _i1.OrderByListBuilder<ProjectReviewTable>? orderByList,
    bool orderDescending = false,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateWhere<ProjectReview>(
      columnValues: columnValues(ProjectReview.t.updateTable),
      where: where(ProjectReview.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(ProjectReview.t),
      orderByList: orderByList?.call(ProjectReview.t),
      orderDescending: orderDescending,
      transaction: transaction,
    );
  }

  /// Deletes all [ProjectReview]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<ProjectReview>> delete(
    _i1.Session session,
    List<ProjectReview> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<ProjectReview>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [ProjectReview].
  Future<ProjectReview> deleteRow(
    _i1.Session session,
    ProjectReview row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<ProjectReview>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<ProjectReview>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<ProjectReviewTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<ProjectReview>(
      where: where(ProjectReview.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<ProjectReviewTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<ProjectReview>(
      where: where?.call(ProjectReview.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

class ProjectReviewAttachRowRepository {
  const ProjectReviewAttachRowRepository._();

  /// Creates a relation between the given [ProjectReview] and [UserRecord]
  /// by setting the [ProjectReview]'s foreign key `ownerId` to refer to the [UserRecord].
  Future<void> owner(
    _i1.Session session,
    ProjectReview projectReview,
    _i2.UserRecord owner, {
    _i1.Transaction? transaction,
  }) async {
    if (projectReview.id == null) {
      throw ArgumentError.notNull('projectReview.id');
    }
    if (owner.id == null) {
      throw ArgumentError.notNull('owner.id');
    }

    var $projectReview = projectReview.copyWith(ownerId: owner.id);
    await session.db.updateRow<ProjectReview>(
      $projectReview,
      columns: [ProjectReview.t.ownerId],
      transaction: transaction,
    );
  }

  /// Creates a relation between the given [ProjectReview] and [Project]
  /// by setting the [ProjectReview]'s foreign key `projectId` to refer to the [Project].
  Future<void> project(
    _i1.Session session,
    ProjectReview projectReview,
    _i3.Project project, {
    _i1.Transaction? transaction,
  }) async {
    if (projectReview.id == null) {
      throw ArgumentError.notNull('projectReview.id');
    }
    if (project.id == null) {
      throw ArgumentError.notNull('project.id');
    }

    var $projectReview = projectReview.copyWith(projectId: project.id);
    await session.db.updateRow<ProjectReview>(
      $projectReview,
      columns: [ProjectReview.t.projectId],
      transaction: transaction,
    );
  }
}
