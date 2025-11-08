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
import '../project/project.dart' as _i2;
import '../user/user_record.dart' as _i3;
import '../project/project_review.dart' as _i4;
import '../project/rating_dimension.dart' as _i5;

abstract class ProjectRating
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  ProjectRating._({
    this.id,
    required this.projectId,
    this.project,
    required this.ownerId,
    this.owner,
    required this.reviewId,
    this.review,
    this.dimension,
    this.value,
    DateTime? dateCreated,
    this.updatedAt,
    bool? isDeleted,
  })  : dateCreated = dateCreated ?? DateTime.now(),
        isDeleted = isDeleted ?? false;

  factory ProjectRating({
    int? id,
    required int projectId,
    _i2.Project? project,
    required int ownerId,
    _i3.UserRecord? owner,
    required int reviewId,
    _i4.ProjectReview? review,
    _i5.RatingDimension? dimension,
    double? value,
    DateTime? dateCreated,
    DateTime? updatedAt,
    bool? isDeleted,
  }) = _ProjectRatingImpl;

  factory ProjectRating.fromJson(Map<String, dynamic> jsonSerialization) {
    return ProjectRating(
      id: jsonSerialization['id'] as int?,
      projectId: jsonSerialization['projectId'] as int,
      project: jsonSerialization['project'] == null
          ? null
          : _i2.Project.fromJson(
              (jsonSerialization['project'] as Map<String, dynamic>)),
      ownerId: jsonSerialization['ownerId'] as int,
      owner: jsonSerialization['owner'] == null
          ? null
          : _i3.UserRecord.fromJson(
              (jsonSerialization['owner'] as Map<String, dynamic>)),
      reviewId: jsonSerialization['reviewId'] as int,
      review: jsonSerialization['review'] == null
          ? null
          : _i4.ProjectReview.fromJson(
              (jsonSerialization['review'] as Map<String, dynamic>)),
      dimension: jsonSerialization['dimension'] == null
          ? null
          : _i5.RatingDimension.fromJson(
              (jsonSerialization['dimension'] as String)),
      value: (jsonSerialization['value'] as num?)?.toDouble(),
      dateCreated: jsonSerialization['dateCreated'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(
              jsonSerialization['dateCreated']),
      updatedAt: jsonSerialization['updatedAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['updatedAt']),
      isDeleted: jsonSerialization['isDeleted'] as bool?,
    );
  }

  static final t = ProjectRatingTable();

  static const db = ProjectRatingRepository._();

  @override
  int? id;

  int projectId;

  _i2.Project? project;

  int ownerId;

  _i3.UserRecord? owner;

  int reviewId;

  _i4.ProjectReview? review;

  _i5.RatingDimension? dimension;

  double? value;

  DateTime? dateCreated;

  DateTime? updatedAt;

  bool? isDeleted;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [ProjectRating]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  ProjectRating copyWith({
    int? id,
    int? projectId,
    _i2.Project? project,
    int? ownerId,
    _i3.UserRecord? owner,
    int? reviewId,
    _i4.ProjectReview? review,
    _i5.RatingDimension? dimension,
    double? value,
    DateTime? dateCreated,
    DateTime? updatedAt,
    bool? isDeleted,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'projectId': projectId,
      if (project != null) 'project': project?.toJson(),
      'ownerId': ownerId,
      if (owner != null) 'owner': owner?.toJson(),
      'reviewId': reviewId,
      if (review != null) 'review': review?.toJson(),
      if (dimension != null) 'dimension': dimension?.toJson(),
      if (value != null) 'value': value,
      if (dateCreated != null) 'dateCreated': dateCreated?.toJson(),
      if (updatedAt != null) 'updatedAt': updatedAt?.toJson(),
      if (isDeleted != null) 'isDeleted': isDeleted,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'projectId': projectId,
      if (project != null) 'project': project?.toJsonForProtocol(),
      'ownerId': ownerId,
      if (owner != null) 'owner': owner?.toJsonForProtocol(),
      'reviewId': reviewId,
      if (review != null) 'review': review?.toJsonForProtocol(),
      if (dimension != null) 'dimension': dimension?.toJson(),
      if (value != null) 'value': value,
      if (dateCreated != null) 'dateCreated': dateCreated?.toJson(),
      if (updatedAt != null) 'updatedAt': updatedAt?.toJson(),
      if (isDeleted != null) 'isDeleted': isDeleted,
    };
  }

  static ProjectRatingInclude include({
    _i2.ProjectInclude? project,
    _i3.UserRecordInclude? owner,
    _i4.ProjectReviewInclude? review,
  }) {
    return ProjectRatingInclude._(
      project: project,
      owner: owner,
      review: review,
    );
  }

  static ProjectRatingIncludeList includeList({
    _i1.WhereExpressionBuilder<ProjectRatingTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<ProjectRatingTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<ProjectRatingTable>? orderByList,
    ProjectRatingInclude? include,
  }) {
    return ProjectRatingIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(ProjectRating.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(ProjectRating.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _ProjectRatingImpl extends ProjectRating {
  _ProjectRatingImpl({
    int? id,
    required int projectId,
    _i2.Project? project,
    required int ownerId,
    _i3.UserRecord? owner,
    required int reviewId,
    _i4.ProjectReview? review,
    _i5.RatingDimension? dimension,
    double? value,
    DateTime? dateCreated,
    DateTime? updatedAt,
    bool? isDeleted,
  }) : super._(
          id: id,
          projectId: projectId,
          project: project,
          ownerId: ownerId,
          owner: owner,
          reviewId: reviewId,
          review: review,
          dimension: dimension,
          value: value,
          dateCreated: dateCreated,
          updatedAt: updatedAt,
          isDeleted: isDeleted,
        );

  /// Returns a shallow copy of this [ProjectRating]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  ProjectRating copyWith({
    Object? id = _Undefined,
    int? projectId,
    Object? project = _Undefined,
    int? ownerId,
    Object? owner = _Undefined,
    int? reviewId,
    Object? review = _Undefined,
    Object? dimension = _Undefined,
    Object? value = _Undefined,
    Object? dateCreated = _Undefined,
    Object? updatedAt = _Undefined,
    Object? isDeleted = _Undefined,
  }) {
    return ProjectRating(
      id: id is int? ? id : this.id,
      projectId: projectId ?? this.projectId,
      project: project is _i2.Project? ? project : this.project?.copyWith(),
      ownerId: ownerId ?? this.ownerId,
      owner: owner is _i3.UserRecord? ? owner : this.owner?.copyWith(),
      reviewId: reviewId ?? this.reviewId,
      review: review is _i4.ProjectReview? ? review : this.review?.copyWith(),
      dimension: dimension is _i5.RatingDimension? ? dimension : this.dimension,
      value: value is double? ? value : this.value,
      dateCreated: dateCreated is DateTime? ? dateCreated : this.dateCreated,
      updatedAt: updatedAt is DateTime? ? updatedAt : this.updatedAt,
      isDeleted: isDeleted is bool? ? isDeleted : this.isDeleted,
    );
  }
}

class ProjectRatingTable extends _i1.Table<int?> {
  ProjectRatingTable({super.tableRelation})
      : super(tableName: 'project_rating') {
    projectId = _i1.ColumnInt(
      'projectId',
      this,
    );
    ownerId = _i1.ColumnInt(
      'ownerId',
      this,
    );
    reviewId = _i1.ColumnInt(
      'reviewId',
      this,
    );
    dimension = _i1.ColumnEnum(
      'dimension',
      this,
      _i1.EnumSerialization.byName,
    );
    value = _i1.ColumnDouble(
      'value',
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
    isDeleted = _i1.ColumnBool(
      'isDeleted',
      this,
      hasDefault: true,
    );
  }

  late final _i1.ColumnInt projectId;

  _i2.ProjectTable? _project;

  late final _i1.ColumnInt ownerId;

  _i3.UserRecordTable? _owner;

  late final _i1.ColumnInt reviewId;

  _i4.ProjectReviewTable? _review;

  late final _i1.ColumnEnum<_i5.RatingDimension> dimension;

  late final _i1.ColumnDouble value;

  late final _i1.ColumnDateTime dateCreated;

  late final _i1.ColumnDateTime updatedAt;

  late final _i1.ColumnBool isDeleted;

  _i2.ProjectTable get project {
    if (_project != null) return _project!;
    _project = _i1.createRelationTable(
      relationFieldName: 'project',
      field: ProjectRating.t.projectId,
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
      field: ProjectRating.t.ownerId,
      foreignField: _i3.UserRecord.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i3.UserRecordTable(tableRelation: foreignTableRelation),
    );
    return _owner!;
  }

  _i4.ProjectReviewTable get review {
    if (_review != null) return _review!;
    _review = _i1.createRelationTable(
      relationFieldName: 'review',
      field: ProjectRating.t.reviewId,
      foreignField: _i4.ProjectReview.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i4.ProjectReviewTable(tableRelation: foreignTableRelation),
    );
    return _review!;
  }

  @override
  List<_i1.Column> get columns => [
        id,
        projectId,
        ownerId,
        reviewId,
        dimension,
        value,
        dateCreated,
        updatedAt,
        isDeleted,
      ];

  @override
  _i1.Table? getRelationTable(String relationField) {
    if (relationField == 'project') {
      return project;
    }
    if (relationField == 'owner') {
      return owner;
    }
    if (relationField == 'review') {
      return review;
    }
    return null;
  }
}

class ProjectRatingInclude extends _i1.IncludeObject {
  ProjectRatingInclude._({
    _i2.ProjectInclude? project,
    _i3.UserRecordInclude? owner,
    _i4.ProjectReviewInclude? review,
  }) {
    _project = project;
    _owner = owner;
    _review = review;
  }

  _i2.ProjectInclude? _project;

  _i3.UserRecordInclude? _owner;

  _i4.ProjectReviewInclude? _review;

  @override
  Map<String, _i1.Include?> get includes => {
        'project': _project,
        'owner': _owner,
        'review': _review,
      };

  @override
  _i1.Table<int?> get table => ProjectRating.t;
}

class ProjectRatingIncludeList extends _i1.IncludeList {
  ProjectRatingIncludeList._({
    _i1.WhereExpressionBuilder<ProjectRatingTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(ProjectRating.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => ProjectRating.t;
}

class ProjectRatingRepository {
  const ProjectRatingRepository._();

  final attachRow = const ProjectRatingAttachRowRepository._();

  /// Returns a list of [ProjectRating]s matching the given query parameters.
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
  Future<List<ProjectRating>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<ProjectRatingTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<ProjectRatingTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<ProjectRatingTable>? orderByList,
    _i1.Transaction? transaction,
    ProjectRatingInclude? include,
  }) async {
    return session.db.find<ProjectRating>(
      where: where?.call(ProjectRating.t),
      orderBy: orderBy?.call(ProjectRating.t),
      orderByList: orderByList?.call(ProjectRating.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Returns the first matching [ProjectRating] matching the given query parameters.
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
  Future<ProjectRating?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<ProjectRatingTable>? where,
    int? offset,
    _i1.OrderByBuilder<ProjectRatingTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<ProjectRatingTable>? orderByList,
    _i1.Transaction? transaction,
    ProjectRatingInclude? include,
  }) async {
    return session.db.findFirstRow<ProjectRating>(
      where: where?.call(ProjectRating.t),
      orderBy: orderBy?.call(ProjectRating.t),
      orderByList: orderByList?.call(ProjectRating.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Finds a single [ProjectRating] by its [id] or null if no such row exists.
  Future<ProjectRating?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
    ProjectRatingInclude? include,
  }) async {
    return session.db.findById<ProjectRating>(
      id,
      transaction: transaction,
      include: include,
    );
  }

  /// Inserts all [ProjectRating]s in the list and returns the inserted rows.
  ///
  /// The returned [ProjectRating]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<ProjectRating>> insert(
    _i1.Session session,
    List<ProjectRating> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<ProjectRating>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [ProjectRating] and returns the inserted row.
  ///
  /// The returned [ProjectRating] will have its `id` field set.
  Future<ProjectRating> insertRow(
    _i1.Session session,
    ProjectRating row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<ProjectRating>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [ProjectRating]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<ProjectRating>> update(
    _i1.Session session,
    List<ProjectRating> rows, {
    _i1.ColumnSelections<ProjectRatingTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<ProjectRating>(
      rows,
      columns: columns?.call(ProjectRating.t),
      transaction: transaction,
    );
  }

  /// Updates a single [ProjectRating]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<ProjectRating> updateRow(
    _i1.Session session,
    ProjectRating row, {
    _i1.ColumnSelections<ProjectRatingTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<ProjectRating>(
      row,
      columns: columns?.call(ProjectRating.t),
      transaction: transaction,
    );
  }

  /// Deletes all [ProjectRating]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<ProjectRating>> delete(
    _i1.Session session,
    List<ProjectRating> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<ProjectRating>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [ProjectRating].
  Future<ProjectRating> deleteRow(
    _i1.Session session,
    ProjectRating row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<ProjectRating>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<ProjectRating>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<ProjectRatingTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<ProjectRating>(
      where: where(ProjectRating.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<ProjectRatingTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<ProjectRating>(
      where: where?.call(ProjectRating.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

class ProjectRatingAttachRowRepository {
  const ProjectRatingAttachRowRepository._();

  /// Creates a relation between the given [ProjectRating] and [Project]
  /// by setting the [ProjectRating]'s foreign key `projectId` to refer to the [Project].
  Future<void> project(
    _i1.Session session,
    ProjectRating projectRating,
    _i2.Project project, {
    _i1.Transaction? transaction,
  }) async {
    if (projectRating.id == null) {
      throw ArgumentError.notNull('projectRating.id');
    }
    if (project.id == null) {
      throw ArgumentError.notNull('project.id');
    }

    var $projectRating = projectRating.copyWith(projectId: project.id);
    await session.db.updateRow<ProjectRating>(
      $projectRating,
      columns: [ProjectRating.t.projectId],
      transaction: transaction,
    );
  }

  /// Creates a relation between the given [ProjectRating] and [UserRecord]
  /// by setting the [ProjectRating]'s foreign key `ownerId` to refer to the [UserRecord].
  Future<void> owner(
    _i1.Session session,
    ProjectRating projectRating,
    _i3.UserRecord owner, {
    _i1.Transaction? transaction,
  }) async {
    if (projectRating.id == null) {
      throw ArgumentError.notNull('projectRating.id');
    }
    if (owner.id == null) {
      throw ArgumentError.notNull('owner.id');
    }

    var $projectRating = projectRating.copyWith(ownerId: owner.id);
    await session.db.updateRow<ProjectRating>(
      $projectRating,
      columns: [ProjectRating.t.ownerId],
      transaction: transaction,
    );
  }

  /// Creates a relation between the given [ProjectRating] and [ProjectReview]
  /// by setting the [ProjectRating]'s foreign key `reviewId` to refer to the [ProjectReview].
  Future<void> review(
    _i1.Session session,
    ProjectRating projectRating,
    _i4.ProjectReview review, {
    _i1.Transaction? transaction,
  }) async {
    if (projectRating.id == null) {
      throw ArgumentError.notNull('projectRating.id');
    }
    if (review.id == null) {
      throw ArgumentError.notNull('review.id');
    }

    var $projectRating = projectRating.copyWith(reviewId: review.id);
    await session.db.updateRow<ProjectRating>(
      $projectRating,
      columns: [ProjectRating.t.reviewId],
      transaction: transaction,
    );
  }
}
