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
import '../project/project_review.dart' as _i3;

abstract class ProjectReviewReaction
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  ProjectReviewReaction._({
    this.id,
    required this.ownerId,
    this.owner,
    required this.reviewId,
    this.review,
    DateTime? dateCreated,
    this.updatedAt,
    this.isLike,
    this.isDeleted,
  }) : dateCreated = dateCreated ?? DateTime.now();

  factory ProjectReviewReaction({
    int? id,
    required int ownerId,
    _i2.UserRecord? owner,
    required int reviewId,
    _i3.ProjectReview? review,
    DateTime? dateCreated,
    DateTime? updatedAt,
    bool? isLike,
    bool? isDeleted,
  }) = _ProjectReviewReactionImpl;

  factory ProjectReviewReaction.fromJson(
      Map<String, dynamic> jsonSerialization) {
    return ProjectReviewReaction(
      id: jsonSerialization['id'] as int?,
      ownerId: jsonSerialization['ownerId'] as int,
      owner: jsonSerialization['owner'] == null
          ? null
          : _i2.UserRecord.fromJson(
              (jsonSerialization['owner'] as Map<String, dynamic>)),
      reviewId: jsonSerialization['reviewId'] as int,
      review: jsonSerialization['review'] == null
          ? null
          : _i3.ProjectReview.fromJson(
              (jsonSerialization['review'] as Map<String, dynamic>)),
      dateCreated: jsonSerialization['dateCreated'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(
              jsonSerialization['dateCreated']),
      updatedAt: jsonSerialization['updatedAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['updatedAt']),
      isLike: jsonSerialization['isLike'] as bool?,
      isDeleted: jsonSerialization['isDeleted'] as bool?,
    );
  }

  static final t = ProjectReviewReactionTable();

  static const db = ProjectReviewReactionRepository._();

  @override
  int? id;

  int ownerId;

  _i2.UserRecord? owner;

  int reviewId;

  _i3.ProjectReview? review;

  DateTime? dateCreated;

  DateTime? updatedAt;

  bool? isLike;

  bool? isDeleted;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [ProjectReviewReaction]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  ProjectReviewReaction copyWith({
    int? id,
    int? ownerId,
    _i2.UserRecord? owner,
    int? reviewId,
    _i3.ProjectReview? review,
    DateTime? dateCreated,
    DateTime? updatedAt,
    bool? isLike,
    bool? isDeleted,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'ownerId': ownerId,
      if (owner != null) 'owner': owner?.toJson(),
      'reviewId': reviewId,
      if (review != null) 'review': review?.toJson(),
      if (dateCreated != null) 'dateCreated': dateCreated?.toJson(),
      if (updatedAt != null) 'updatedAt': updatedAt?.toJson(),
      if (isLike != null) 'isLike': isLike,
      if (isDeleted != null) 'isDeleted': isDeleted,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'ownerId': ownerId,
      if (owner != null) 'owner': owner?.toJsonForProtocol(),
      'reviewId': reviewId,
      if (review != null) 'review': review?.toJsonForProtocol(),
      if (dateCreated != null) 'dateCreated': dateCreated?.toJson(),
      if (updatedAt != null) 'updatedAt': updatedAt?.toJson(),
      if (isLike != null) 'isLike': isLike,
      if (isDeleted != null) 'isDeleted': isDeleted,
    };
  }

  static ProjectReviewReactionInclude include({
    _i2.UserRecordInclude? owner,
    _i3.ProjectReviewInclude? review,
  }) {
    return ProjectReviewReactionInclude._(
      owner: owner,
      review: review,
    );
  }

  static ProjectReviewReactionIncludeList includeList({
    _i1.WhereExpressionBuilder<ProjectReviewReactionTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<ProjectReviewReactionTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<ProjectReviewReactionTable>? orderByList,
    ProjectReviewReactionInclude? include,
  }) {
    return ProjectReviewReactionIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(ProjectReviewReaction.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(ProjectReviewReaction.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _ProjectReviewReactionImpl extends ProjectReviewReaction {
  _ProjectReviewReactionImpl({
    int? id,
    required int ownerId,
    _i2.UserRecord? owner,
    required int reviewId,
    _i3.ProjectReview? review,
    DateTime? dateCreated,
    DateTime? updatedAt,
    bool? isLike,
    bool? isDeleted,
  }) : super._(
          id: id,
          ownerId: ownerId,
          owner: owner,
          reviewId: reviewId,
          review: review,
          dateCreated: dateCreated,
          updatedAt: updatedAt,
          isLike: isLike,
          isDeleted: isDeleted,
        );

  /// Returns a shallow copy of this [ProjectReviewReaction]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  ProjectReviewReaction copyWith({
    Object? id = _Undefined,
    int? ownerId,
    Object? owner = _Undefined,
    int? reviewId,
    Object? review = _Undefined,
    Object? dateCreated = _Undefined,
    Object? updatedAt = _Undefined,
    Object? isLike = _Undefined,
    Object? isDeleted = _Undefined,
  }) {
    return ProjectReviewReaction(
      id: id is int? ? id : this.id,
      ownerId: ownerId ?? this.ownerId,
      owner: owner is _i2.UserRecord? ? owner : this.owner?.copyWith(),
      reviewId: reviewId ?? this.reviewId,
      review: review is _i3.ProjectReview? ? review : this.review?.copyWith(),
      dateCreated: dateCreated is DateTime? ? dateCreated : this.dateCreated,
      updatedAt: updatedAt is DateTime? ? updatedAt : this.updatedAt,
      isLike: isLike is bool? ? isLike : this.isLike,
      isDeleted: isDeleted is bool? ? isDeleted : this.isDeleted,
    );
  }
}

class ProjectReviewReactionTable extends _i1.Table<int?> {
  ProjectReviewReactionTable({super.tableRelation})
      : super(tableName: 'project_review_reaction') {
    ownerId = _i1.ColumnInt(
      'ownerId',
      this,
    );
    reviewId = _i1.ColumnInt(
      'reviewId',
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

  late final _i1.ColumnInt ownerId;

  _i2.UserRecordTable? _owner;

  late final _i1.ColumnInt reviewId;

  _i3.ProjectReviewTable? _review;

  late final _i1.ColumnDateTime dateCreated;

  late final _i1.ColumnDateTime updatedAt;

  late final _i1.ColumnBool isLike;

  late final _i1.ColumnBool isDeleted;

  _i2.UserRecordTable get owner {
    if (_owner != null) return _owner!;
    _owner = _i1.createRelationTable(
      relationFieldName: 'owner',
      field: ProjectReviewReaction.t.ownerId,
      foreignField: _i2.UserRecord.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.UserRecordTable(tableRelation: foreignTableRelation),
    );
    return _owner!;
  }

  _i3.ProjectReviewTable get review {
    if (_review != null) return _review!;
    _review = _i1.createRelationTable(
      relationFieldName: 'review',
      field: ProjectReviewReaction.t.reviewId,
      foreignField: _i3.ProjectReview.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i3.ProjectReviewTable(tableRelation: foreignTableRelation),
    );
    return _review!;
  }

  @override
  List<_i1.Column> get columns => [
        id,
        ownerId,
        reviewId,
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
    if (relationField == 'review') {
      return review;
    }
    return null;
  }
}

class ProjectReviewReactionInclude extends _i1.IncludeObject {
  ProjectReviewReactionInclude._({
    _i2.UserRecordInclude? owner,
    _i3.ProjectReviewInclude? review,
  }) {
    _owner = owner;
    _review = review;
  }

  _i2.UserRecordInclude? _owner;

  _i3.ProjectReviewInclude? _review;

  @override
  Map<String, _i1.Include?> get includes => {
        'owner': _owner,
        'review': _review,
      };

  @override
  _i1.Table<int?> get table => ProjectReviewReaction.t;
}

class ProjectReviewReactionIncludeList extends _i1.IncludeList {
  ProjectReviewReactionIncludeList._({
    _i1.WhereExpressionBuilder<ProjectReviewReactionTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(ProjectReviewReaction.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => ProjectReviewReaction.t;
}

class ProjectReviewReactionRepository {
  const ProjectReviewReactionRepository._();

  final attachRow = const ProjectReviewReactionAttachRowRepository._();

  /// Returns a list of [ProjectReviewReaction]s matching the given query parameters.
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
  Future<List<ProjectReviewReaction>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<ProjectReviewReactionTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<ProjectReviewReactionTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<ProjectReviewReactionTable>? orderByList,
    _i1.Transaction? transaction,
    ProjectReviewReactionInclude? include,
  }) async {
    return session.db.find<ProjectReviewReaction>(
      where: where?.call(ProjectReviewReaction.t),
      orderBy: orderBy?.call(ProjectReviewReaction.t),
      orderByList: orderByList?.call(ProjectReviewReaction.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Returns the first matching [ProjectReviewReaction] matching the given query parameters.
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
  Future<ProjectReviewReaction?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<ProjectReviewReactionTable>? where,
    int? offset,
    _i1.OrderByBuilder<ProjectReviewReactionTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<ProjectReviewReactionTable>? orderByList,
    _i1.Transaction? transaction,
    ProjectReviewReactionInclude? include,
  }) async {
    return session.db.findFirstRow<ProjectReviewReaction>(
      where: where?.call(ProjectReviewReaction.t),
      orderBy: orderBy?.call(ProjectReviewReaction.t),
      orderByList: orderByList?.call(ProjectReviewReaction.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Finds a single [ProjectReviewReaction] by its [id] or null if no such row exists.
  Future<ProjectReviewReaction?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
    ProjectReviewReactionInclude? include,
  }) async {
    return session.db.findById<ProjectReviewReaction>(
      id,
      transaction: transaction,
      include: include,
    );
  }

  /// Inserts all [ProjectReviewReaction]s in the list and returns the inserted rows.
  ///
  /// The returned [ProjectReviewReaction]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<ProjectReviewReaction>> insert(
    _i1.Session session,
    List<ProjectReviewReaction> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<ProjectReviewReaction>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [ProjectReviewReaction] and returns the inserted row.
  ///
  /// The returned [ProjectReviewReaction] will have its `id` field set.
  Future<ProjectReviewReaction> insertRow(
    _i1.Session session,
    ProjectReviewReaction row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<ProjectReviewReaction>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [ProjectReviewReaction]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<ProjectReviewReaction>> update(
    _i1.Session session,
    List<ProjectReviewReaction> rows, {
    _i1.ColumnSelections<ProjectReviewReactionTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<ProjectReviewReaction>(
      rows,
      columns: columns?.call(ProjectReviewReaction.t),
      transaction: transaction,
    );
  }

  /// Updates a single [ProjectReviewReaction]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<ProjectReviewReaction> updateRow(
    _i1.Session session,
    ProjectReviewReaction row, {
    _i1.ColumnSelections<ProjectReviewReactionTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<ProjectReviewReaction>(
      row,
      columns: columns?.call(ProjectReviewReaction.t),
      transaction: transaction,
    );
  }

  /// Deletes all [ProjectReviewReaction]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<ProjectReviewReaction>> delete(
    _i1.Session session,
    List<ProjectReviewReaction> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<ProjectReviewReaction>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [ProjectReviewReaction].
  Future<ProjectReviewReaction> deleteRow(
    _i1.Session session,
    ProjectReviewReaction row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<ProjectReviewReaction>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<ProjectReviewReaction>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<ProjectReviewReactionTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<ProjectReviewReaction>(
      where: where(ProjectReviewReaction.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<ProjectReviewReactionTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<ProjectReviewReaction>(
      where: where?.call(ProjectReviewReaction.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

class ProjectReviewReactionAttachRowRepository {
  const ProjectReviewReactionAttachRowRepository._();

  /// Creates a relation between the given [ProjectReviewReaction] and [UserRecord]
  /// by setting the [ProjectReviewReaction]'s foreign key `ownerId` to refer to the [UserRecord].
  Future<void> owner(
    _i1.Session session,
    ProjectReviewReaction projectReviewReaction,
    _i2.UserRecord owner, {
    _i1.Transaction? transaction,
  }) async {
    if (projectReviewReaction.id == null) {
      throw ArgumentError.notNull('projectReviewReaction.id');
    }
    if (owner.id == null) {
      throw ArgumentError.notNull('owner.id');
    }

    var $projectReviewReaction =
        projectReviewReaction.copyWith(ownerId: owner.id);
    await session.db.updateRow<ProjectReviewReaction>(
      $projectReviewReaction,
      columns: [ProjectReviewReaction.t.ownerId],
      transaction: transaction,
    );
  }

  /// Creates a relation between the given [ProjectReviewReaction] and [ProjectReview]
  /// by setting the [ProjectReviewReaction]'s foreign key `reviewId` to refer to the [ProjectReview].
  Future<void> review(
    _i1.Session session,
    ProjectReviewReaction projectReviewReaction,
    _i3.ProjectReview review, {
    _i1.Transaction? transaction,
  }) async {
    if (projectReviewReaction.id == null) {
      throw ArgumentError.notNull('projectReviewReaction.id');
    }
    if (review.id == null) {
      throw ArgumentError.notNull('review.id');
    }

    var $projectReviewReaction =
        projectReviewReaction.copyWith(reviewId: review.id);
    await session.db.updateRow<ProjectReviewReaction>(
      $projectReviewReaction,
      columns: [ProjectReviewReaction.t.reviewId],
      transaction: transaction,
    );
  }
}
