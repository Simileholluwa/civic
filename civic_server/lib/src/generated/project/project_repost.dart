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
import '../post/post.dart' as _i4;

abstract class ProjectRepost
    implements _i1.TableRow<int>, _i1.ProtocolSerialization {
  ProjectRepost._({
    this.id,
    required this.ownerId,
    this.owner,
    required this.projectId,
    this.project,
    required this.postId,
    this.post,
    DateTime? repostedAt,
  }) : repostedAt = repostedAt ?? DateTime.now();

  factory ProjectRepost({
    int? id,
    required int ownerId,
    _i2.UserRecord? owner,
    required int projectId,
    _i3.Project? project,
    required int postId,
    _i4.Post? post,
    DateTime? repostedAt,
  }) = _ProjectRepostImpl;

  factory ProjectRepost.fromJson(Map<String, dynamic> jsonSerialization) {
    return ProjectRepost(
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
      postId: jsonSerialization['postId'] as int,
      post: jsonSerialization['post'] == null
          ? null
          : _i4.Post.fromJson(
              (jsonSerialization['post'] as Map<String, dynamic>)),
      repostedAt: jsonSerialization['repostedAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['repostedAt']),
    );
  }

  static final t = ProjectRepostTable();

  static const db = ProjectRepostRepository._();

  @override
  int? id;

  int ownerId;

  _i2.UserRecord? owner;

  int projectId;

  _i3.Project? project;

  int postId;

  _i4.Post? post;

  DateTime? repostedAt;

  @override
  _i1.Table<int> get table => t;

  /// Returns a shallow copy of this [ProjectRepost]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  ProjectRepost copyWith({
    int? id,
    int? ownerId,
    _i2.UserRecord? owner,
    int? projectId,
    _i3.Project? project,
    int? postId,
    _i4.Post? post,
    DateTime? repostedAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'ownerId': ownerId,
      if (owner != null) 'owner': owner?.toJson(),
      'projectId': projectId,
      if (project != null) 'project': project?.toJson(),
      'postId': postId,
      if (post != null) 'post': post?.toJson(),
      if (repostedAt != null) 'repostedAt': repostedAt?.toJson(),
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
      'postId': postId,
      if (post != null) 'post': post?.toJsonForProtocol(),
      if (repostedAt != null) 'repostedAt': repostedAt?.toJson(),
    };
  }

  static ProjectRepostInclude include({
    _i2.UserRecordInclude? owner,
    _i3.ProjectInclude? project,
    _i4.PostInclude? post,
  }) {
    return ProjectRepostInclude._(
      owner: owner,
      project: project,
      post: post,
    );
  }

  static ProjectRepostIncludeList includeList({
    _i1.WhereExpressionBuilder<ProjectRepostTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<ProjectRepostTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<ProjectRepostTable>? orderByList,
    ProjectRepostInclude? include,
  }) {
    return ProjectRepostIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(ProjectRepost.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(ProjectRepost.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _ProjectRepostImpl extends ProjectRepost {
  _ProjectRepostImpl({
    int? id,
    required int ownerId,
    _i2.UserRecord? owner,
    required int projectId,
    _i3.Project? project,
    required int postId,
    _i4.Post? post,
    DateTime? repostedAt,
  }) : super._(
          id: id,
          ownerId: ownerId,
          owner: owner,
          projectId: projectId,
          project: project,
          postId: postId,
          post: post,
          repostedAt: repostedAt,
        );

  /// Returns a shallow copy of this [ProjectRepost]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  ProjectRepost copyWith({
    Object? id = _Undefined,
    int? ownerId,
    Object? owner = _Undefined,
    int? projectId,
    Object? project = _Undefined,
    int? postId,
    Object? post = _Undefined,
    Object? repostedAt = _Undefined,
  }) {
    return ProjectRepost(
      id: id is int? ? id : this.id,
      ownerId: ownerId ?? this.ownerId,
      owner: owner is _i2.UserRecord? ? owner : this.owner?.copyWith(),
      projectId: projectId ?? this.projectId,
      project: project is _i3.Project? ? project : this.project?.copyWith(),
      postId: postId ?? this.postId,
      post: post is _i4.Post? ? post : this.post?.copyWith(),
      repostedAt: repostedAt is DateTime? ? repostedAt : this.repostedAt,
    );
  }
}

class ProjectRepostTable extends _i1.Table<int> {
  ProjectRepostTable({super.tableRelation})
      : super(tableName: 'project_reposts') {
    ownerId = _i1.ColumnInt(
      'ownerId',
      this,
    );
    projectId = _i1.ColumnInt(
      'projectId',
      this,
    );
    postId = _i1.ColumnInt(
      'postId',
      this,
    );
    repostedAt = _i1.ColumnDateTime(
      'repostedAt',
      this,
      hasDefault: true,
    );
  }

  late final _i1.ColumnInt ownerId;

  _i2.UserRecordTable? _owner;

  late final _i1.ColumnInt projectId;

  _i3.ProjectTable? _project;

  late final _i1.ColumnInt postId;

  _i4.PostTable? _post;

  late final _i1.ColumnDateTime repostedAt;

  _i2.UserRecordTable get owner {
    if (_owner != null) return _owner!;
    _owner = _i1.createRelationTable(
      relationFieldName: 'owner',
      field: ProjectRepost.t.ownerId,
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
      field: ProjectRepost.t.projectId,
      foreignField: _i3.Project.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i3.ProjectTable(tableRelation: foreignTableRelation),
    );
    return _project!;
  }

  _i4.PostTable get post {
    if (_post != null) return _post!;
    _post = _i1.createRelationTable(
      relationFieldName: 'post',
      field: ProjectRepost.t.postId,
      foreignField: _i4.Post.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i4.PostTable(tableRelation: foreignTableRelation),
    );
    return _post!;
  }

  @override
  List<_i1.Column> get columns => [
        id,
        ownerId,
        projectId,
        postId,
        repostedAt,
      ];

  @override
  _i1.Table? getRelationTable(String relationField) {
    if (relationField == 'owner') {
      return owner;
    }
    if (relationField == 'project') {
      return project;
    }
    if (relationField == 'post') {
      return post;
    }
    return null;
  }
}

class ProjectRepostInclude extends _i1.IncludeObject {
  ProjectRepostInclude._({
    _i2.UserRecordInclude? owner,
    _i3.ProjectInclude? project,
    _i4.PostInclude? post,
  }) {
    _owner = owner;
    _project = project;
    _post = post;
  }

  _i2.UserRecordInclude? _owner;

  _i3.ProjectInclude? _project;

  _i4.PostInclude? _post;

  @override
  Map<String, _i1.Include?> get includes => {
        'owner': _owner,
        'project': _project,
        'post': _post,
      };

  @override
  _i1.Table<int> get table => ProjectRepost.t;
}

class ProjectRepostIncludeList extends _i1.IncludeList {
  ProjectRepostIncludeList._({
    _i1.WhereExpressionBuilder<ProjectRepostTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(ProjectRepost.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int> get table => ProjectRepost.t;
}

class ProjectRepostRepository {
  const ProjectRepostRepository._();

  final attachRow = const ProjectRepostAttachRowRepository._();

  /// Returns a list of [ProjectRepost]s matching the given query parameters.
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
  Future<List<ProjectRepost>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<ProjectRepostTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<ProjectRepostTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<ProjectRepostTable>? orderByList,
    _i1.Transaction? transaction,
    ProjectRepostInclude? include,
  }) async {
    return session.db.find<ProjectRepost>(
      where: where?.call(ProjectRepost.t),
      orderBy: orderBy?.call(ProjectRepost.t),
      orderByList: orderByList?.call(ProjectRepost.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Returns the first matching [ProjectRepost] matching the given query parameters.
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
  Future<ProjectRepost?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<ProjectRepostTable>? where,
    int? offset,
    _i1.OrderByBuilder<ProjectRepostTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<ProjectRepostTable>? orderByList,
    _i1.Transaction? transaction,
    ProjectRepostInclude? include,
  }) async {
    return session.db.findFirstRow<ProjectRepost>(
      where: where?.call(ProjectRepost.t),
      orderBy: orderBy?.call(ProjectRepost.t),
      orderByList: orderByList?.call(ProjectRepost.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Finds a single [ProjectRepost] by its [id] or null if no such row exists.
  Future<ProjectRepost?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
    ProjectRepostInclude? include,
  }) async {
    return session.db.findById<ProjectRepost>(
      id,
      transaction: transaction,
      include: include,
    );
  }

  /// Inserts all [ProjectRepost]s in the list and returns the inserted rows.
  ///
  /// The returned [ProjectRepost]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<ProjectRepost>> insert(
    _i1.Session session,
    List<ProjectRepost> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<ProjectRepost>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [ProjectRepost] and returns the inserted row.
  ///
  /// The returned [ProjectRepost] will have its `id` field set.
  Future<ProjectRepost> insertRow(
    _i1.Session session,
    ProjectRepost row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<ProjectRepost>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [ProjectRepost]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<ProjectRepost>> update(
    _i1.Session session,
    List<ProjectRepost> rows, {
    _i1.ColumnSelections<ProjectRepostTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<ProjectRepost>(
      rows,
      columns: columns?.call(ProjectRepost.t),
      transaction: transaction,
    );
  }

  /// Updates a single [ProjectRepost]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<ProjectRepost> updateRow(
    _i1.Session session,
    ProjectRepost row, {
    _i1.ColumnSelections<ProjectRepostTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<ProjectRepost>(
      row,
      columns: columns?.call(ProjectRepost.t),
      transaction: transaction,
    );
  }

  /// Deletes all [ProjectRepost]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<ProjectRepost>> delete(
    _i1.Session session,
    List<ProjectRepost> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<ProjectRepost>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [ProjectRepost].
  Future<ProjectRepost> deleteRow(
    _i1.Session session,
    ProjectRepost row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<ProjectRepost>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<ProjectRepost>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<ProjectRepostTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<ProjectRepost>(
      where: where(ProjectRepost.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<ProjectRepostTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<ProjectRepost>(
      where: where?.call(ProjectRepost.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

class ProjectRepostAttachRowRepository {
  const ProjectRepostAttachRowRepository._();

  /// Creates a relation between the given [ProjectRepost] and [UserRecord]
  /// by setting the [ProjectRepost]'s foreign key `ownerId` to refer to the [UserRecord].
  Future<void> owner(
    _i1.Session session,
    ProjectRepost projectRepost,
    _i2.UserRecord owner, {
    _i1.Transaction? transaction,
  }) async {
    if (projectRepost.id == null) {
      throw ArgumentError.notNull('projectRepost.id');
    }
    if (owner.id == null) {
      throw ArgumentError.notNull('owner.id');
    }

    var $projectRepost = projectRepost.copyWith(ownerId: owner.id);
    await session.db.updateRow<ProjectRepost>(
      $projectRepost,
      columns: [ProjectRepost.t.ownerId],
      transaction: transaction,
    );
  }

  /// Creates a relation between the given [ProjectRepost] and [Project]
  /// by setting the [ProjectRepost]'s foreign key `projectId` to refer to the [Project].
  Future<void> project(
    _i1.Session session,
    ProjectRepost projectRepost,
    _i3.Project project, {
    _i1.Transaction? transaction,
  }) async {
    if (projectRepost.id == null) {
      throw ArgumentError.notNull('projectRepost.id');
    }
    if (project.id == null) {
      throw ArgumentError.notNull('project.id');
    }

    var $projectRepost = projectRepost.copyWith(projectId: project.id);
    await session.db.updateRow<ProjectRepost>(
      $projectRepost,
      columns: [ProjectRepost.t.projectId],
      transaction: transaction,
    );
  }

  /// Creates a relation between the given [ProjectRepost] and [Post]
  /// by setting the [ProjectRepost]'s foreign key `postId` to refer to the [Post].
  Future<void> post(
    _i1.Session session,
    ProjectRepost projectRepost,
    _i4.Post post, {
    _i1.Transaction? transaction,
  }) async {
    if (projectRepost.id == null) {
      throw ArgumentError.notNull('projectRepost.id');
    }
    if (post.id == null) {
      throw ArgumentError.notNull('post.id');
    }

    var $projectRepost = projectRepost.copyWith(postId: post.id);
    await session.db.updateRow<ProjectRepost>(
      $projectRepost,
      columns: [ProjectRepost.t.postId],
      transaction: transaction,
    );
  }
}
