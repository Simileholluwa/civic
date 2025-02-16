/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;
import '../user/user_record.dart' as _i2;
import '../project/project.dart' as _i3;

abstract class ProjectReview
    implements _i1.TableRow, _i1.ProtocolSerialization {
  ProjectReview._({
    this.id,
    required this.ownerId,
    this.owner,
    required this.projectId,
    this.project,
    this.review,
    this.locationRating,
    this.descriptionRating,
    this.attachmentsRating,
    this.categoryRating,
    this.fundingRating,
    this.datesRating,
    this.overallRating,
    this.dateCreated,
    this.updatedAt,
  });

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
  }) = _ProjectReviewImpl;

  factory ProjectReview.fromJson(Map<String, dynamic> jsonSerialization) {
    return ProjectReview(
      id: jsonSerialization['id'] as int?,
      ownerId: jsonSerialization['ownerId'] as int,
      owner: jsonSerialization['owner'] == null
          ? null
          : _i2.UserRecord.fromJson(
              (jsonSerialization['owner'] as Map<String, dynamic>)),
      projectId: jsonSerialization['projectId'] as int,
      project: jsonSerialization['project'] == null
          ? null
          : _i3.Project.fromJson(
              (jsonSerialization['project'] as Map<String, dynamic>)),
      review: jsonSerialization['review'] as String?,
      locationRating: (jsonSerialization['locationRating'] as num?)?.toDouble(),
      descriptionRating:
          (jsonSerialization['descriptionRating'] as num?)?.toDouble(),
      attachmentsRating:
          (jsonSerialization['attachmentsRating'] as num?)?.toDouble(),
      categoryRating: (jsonSerialization['categoryRating'] as num?)?.toDouble(),
      fundingRating: (jsonSerialization['fundingRating'] as num?)?.toDouble(),
      datesRating: (jsonSerialization['datesRating'] as num?)?.toDouble(),
      overallRating: (jsonSerialization['overallRating'] as num?)?.toDouble(),
      dateCreated: jsonSerialization['dateCreated'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(
              jsonSerialization['dateCreated']),
      updatedAt: jsonSerialization['updatedAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['updatedAt']),
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

  @override
  _i1.Table get table => t;

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
  });
  @override
  Map<String, dynamic> toJson() {
    return {
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
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
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
        );

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
  }) {
    return ProjectReview(
      id: id is int? ? id : this.id,
      ownerId: ownerId ?? this.ownerId,
      owner: owner is _i2.UserRecord? ? owner : this.owner?.copyWith(),
      projectId: projectId ?? this.projectId,
      project: project is _i3.Project? ? project : this.project?.copyWith(),
      review: review is String? ? review : this.review,
      locationRating:
          locationRating is double? ? locationRating : this.locationRating,
      descriptionRating: descriptionRating is double?
          ? descriptionRating
          : this.descriptionRating,
      attachmentsRating: attachmentsRating is double?
          ? attachmentsRating
          : this.attachmentsRating,
      categoryRating:
          categoryRating is double? ? categoryRating : this.categoryRating,
      fundingRating:
          fundingRating is double? ? fundingRating : this.fundingRating,
      datesRating: datesRating is double? ? datesRating : this.datesRating,
      overallRating:
          overallRating is double? ? overallRating : this.overallRating,
      dateCreated: dateCreated is DateTime? ? dateCreated : this.dateCreated,
      updatedAt: updatedAt is DateTime? ? updatedAt : this.updatedAt,
    );
  }
}

class ProjectReviewTable extends _i1.Table {
  ProjectReviewTable({super.tableRelation})
      : super(tableName: 'project_review') {
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
    );
    locationRating = _i1.ColumnDouble(
      'locationRating',
      this,
    );
    descriptionRating = _i1.ColumnDouble(
      'descriptionRating',
      this,
    );
    attachmentsRating = _i1.ColumnDouble(
      'attachmentsRating',
      this,
    );
    categoryRating = _i1.ColumnDouble(
      'categoryRating',
      this,
    );
    fundingRating = _i1.ColumnDouble(
      'fundingRating',
      this,
    );
    datesRating = _i1.ColumnDouble(
      'datesRating',
      this,
    );
    overallRating = _i1.ColumnDouble(
      'overallRating',
      this,
    );
    dateCreated = _i1.ColumnDateTime(
      'dateCreated',
      this,
    );
    updatedAt = _i1.ColumnDateTime(
      'updatedAt',
      this,
    );
  }

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
  _i1.Table get table => ProjectReview.t;
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
  _i1.Table get table => ProjectReview.t;
}

class ProjectReviewRepository {
  const ProjectReviewRepository._();

  final attachRow = const ProjectReviewAttachRowRepository._();

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
