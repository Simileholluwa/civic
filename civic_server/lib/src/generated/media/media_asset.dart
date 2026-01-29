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
import '../post/post.dart' as _i3;
import '../project/project.dart' as _i4;
import '../media/media_kind.dart' as _i5;
import 'package:civic_server/src/generated/protocol.dart' as _i6;

abstract class MediaAsset
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  MediaAsset._({
    this.id,
    required this.ownerId,
    this.owner,
    this.postId,
    this.post,
    this.projectId,
    this.project,
    required this.objectKey,
    this.publicUrl,
    this.contentType,
    this.size,
    this.width,
    this.height,
    this.aspectRatio,
    this.durationMs,
    required this.kind,
    DateTime? createdAt,
    this.deletedAt,
  }) : createdAt = createdAt ?? DateTime.now();

  factory MediaAsset({
    int? id,
    required int ownerId,
    _i2.UserRecord? owner,
    int? postId,
    _i3.Post? post,
    int? projectId,
    _i4.Project? project,
    required String objectKey,
    String? publicUrl,
    String? contentType,
    int? size,
    int? width,
    int? height,
    double? aspectRatio,
    int? durationMs,
    required _i5.MediaKind kind,
    DateTime? createdAt,
    DateTime? deletedAt,
  }) = _MediaAssetImpl;

  factory MediaAsset.fromJson(Map<String, dynamic> jsonSerialization) {
    return MediaAsset(
      id: jsonSerialization['id'] as int?,
      ownerId: jsonSerialization['ownerId'] as int,
      owner: jsonSerialization['owner'] == null
          ? null
          : _i6.Protocol().deserialize<_i2.UserRecord>(
              jsonSerialization['owner'],
            ),
      postId: jsonSerialization['postId'] as int?,
      post: jsonSerialization['post'] == null
          ? null
          : _i6.Protocol().deserialize<_i3.Post>(jsonSerialization['post']),
      projectId: jsonSerialization['projectId'] as int?,
      project: jsonSerialization['project'] == null
          ? null
          : _i6.Protocol().deserialize<_i4.Project>(
              jsonSerialization['project'],
            ),
      objectKey: jsonSerialization['objectKey'] as String,
      publicUrl: jsonSerialization['publicUrl'] as String?,
      contentType: jsonSerialization['contentType'] as String?,
      size: jsonSerialization['size'] as int?,
      width: jsonSerialization['width'] as int?,
      height: jsonSerialization['height'] as int?,
      aspectRatio: (jsonSerialization['aspectRatio'] as num?)?.toDouble(),
      durationMs: jsonSerialization['durationMs'] as int?,
      kind: _i5.MediaKind.fromJson((jsonSerialization['kind'] as String)),
      createdAt: jsonSerialization['createdAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
      deletedAt: jsonSerialization['deletedAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['deletedAt']),
    );
  }

  static final t = MediaAssetTable();

  static const db = MediaAssetRepository._();

  @override
  int? id;

  int ownerId;

  _i2.UserRecord? owner;

  int? postId;

  _i3.Post? post;

  int? projectId;

  _i4.Project? project;

  String objectKey;

  String? publicUrl;

  String? contentType;

  int? size;

  int? width;

  int? height;

  double? aspectRatio;

  int? durationMs;

  _i5.MediaKind kind;

  DateTime? createdAt;

  DateTime? deletedAt;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [MediaAsset]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  MediaAsset copyWith({
    int? id,
    int? ownerId,
    _i2.UserRecord? owner,
    int? postId,
    _i3.Post? post,
    int? projectId,
    _i4.Project? project,
    String? objectKey,
    String? publicUrl,
    String? contentType,
    int? size,
    int? width,
    int? height,
    double? aspectRatio,
    int? durationMs,
    _i5.MediaKind? kind,
    DateTime? createdAt,
    DateTime? deletedAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'MediaAsset',
      if (id != null) 'id': id,
      'ownerId': ownerId,
      if (owner != null) 'owner': owner?.toJson(),
      if (postId != null) 'postId': postId,
      if (post != null) 'post': post?.toJson(),
      if (projectId != null) 'projectId': projectId,
      if (project != null) 'project': project?.toJson(),
      'objectKey': objectKey,
      if (publicUrl != null) 'publicUrl': publicUrl,
      if (contentType != null) 'contentType': contentType,
      if (size != null) 'size': size,
      if (width != null) 'width': width,
      if (height != null) 'height': height,
      if (aspectRatio != null) 'aspectRatio': aspectRatio,
      if (durationMs != null) 'durationMs': durationMs,
      'kind': kind.toJson(),
      if (createdAt != null) 'createdAt': createdAt?.toJson(),
      if (deletedAt != null) 'deletedAt': deletedAt?.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'MediaAsset',
      if (id != null) 'id': id,
      'ownerId': ownerId,
      if (owner != null) 'owner': owner?.toJsonForProtocol(),
      if (postId != null) 'postId': postId,
      if (post != null) 'post': post?.toJsonForProtocol(),
      if (projectId != null) 'projectId': projectId,
      if (project != null) 'project': project?.toJsonForProtocol(),
      'objectKey': objectKey,
      if (publicUrl != null) 'publicUrl': publicUrl,
      if (contentType != null) 'contentType': contentType,
      if (size != null) 'size': size,
      if (width != null) 'width': width,
      if (height != null) 'height': height,
      if (aspectRatio != null) 'aspectRatio': aspectRatio,
      if (durationMs != null) 'durationMs': durationMs,
      'kind': kind.toJson(),
      if (createdAt != null) 'createdAt': createdAt?.toJson(),
      if (deletedAt != null) 'deletedAt': deletedAt?.toJson(),
    };
  }

  static MediaAssetInclude include({
    _i2.UserRecordInclude? owner,
    _i3.PostInclude? post,
    _i4.ProjectInclude? project,
  }) {
    return MediaAssetInclude._(
      owner: owner,
      post: post,
      project: project,
    );
  }

  static MediaAssetIncludeList includeList({
    _i1.WhereExpressionBuilder<MediaAssetTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<MediaAssetTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<MediaAssetTable>? orderByList,
    MediaAssetInclude? include,
  }) {
    return MediaAssetIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(MediaAsset.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(MediaAsset.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _MediaAssetImpl extends MediaAsset {
  _MediaAssetImpl({
    int? id,
    required int ownerId,
    _i2.UserRecord? owner,
    int? postId,
    _i3.Post? post,
    int? projectId,
    _i4.Project? project,
    required String objectKey,
    String? publicUrl,
    String? contentType,
    int? size,
    int? width,
    int? height,
    double? aspectRatio,
    int? durationMs,
    required _i5.MediaKind kind,
    DateTime? createdAt,
    DateTime? deletedAt,
  }) : super._(
         id: id,
         ownerId: ownerId,
         owner: owner,
         postId: postId,
         post: post,
         projectId: projectId,
         project: project,
         objectKey: objectKey,
         publicUrl: publicUrl,
         contentType: contentType,
         size: size,
         width: width,
         height: height,
         aspectRatio: aspectRatio,
         durationMs: durationMs,
         kind: kind,
         createdAt: createdAt,
         deletedAt: deletedAt,
       );

  /// Returns a shallow copy of this [MediaAsset]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  MediaAsset copyWith({
    Object? id = _Undefined,
    int? ownerId,
    Object? owner = _Undefined,
    Object? postId = _Undefined,
    Object? post = _Undefined,
    Object? projectId = _Undefined,
    Object? project = _Undefined,
    String? objectKey,
    Object? publicUrl = _Undefined,
    Object? contentType = _Undefined,
    Object? size = _Undefined,
    Object? width = _Undefined,
    Object? height = _Undefined,
    Object? aspectRatio = _Undefined,
    Object? durationMs = _Undefined,
    _i5.MediaKind? kind,
    Object? createdAt = _Undefined,
    Object? deletedAt = _Undefined,
  }) {
    return MediaAsset(
      id: id is int? ? id : this.id,
      ownerId: ownerId ?? this.ownerId,
      owner: owner is _i2.UserRecord? ? owner : this.owner?.copyWith(),
      postId: postId is int? ? postId : this.postId,
      post: post is _i3.Post? ? post : this.post?.copyWith(),
      projectId: projectId is int? ? projectId : this.projectId,
      project: project is _i4.Project? ? project : this.project?.copyWith(),
      objectKey: objectKey ?? this.objectKey,
      publicUrl: publicUrl is String? ? publicUrl : this.publicUrl,
      contentType: contentType is String? ? contentType : this.contentType,
      size: size is int? ? size : this.size,
      width: width is int? ? width : this.width,
      height: height is int? ? height : this.height,
      aspectRatio: aspectRatio is double? ? aspectRatio : this.aspectRatio,
      durationMs: durationMs is int? ? durationMs : this.durationMs,
      kind: kind ?? this.kind,
      createdAt: createdAt is DateTime? ? createdAt : this.createdAt,
      deletedAt: deletedAt is DateTime? ? deletedAt : this.deletedAt,
    );
  }
}

class MediaAssetUpdateTable extends _i1.UpdateTable<MediaAssetTable> {
  MediaAssetUpdateTable(super.table);

  _i1.ColumnValue<int, int> ownerId(int value) => _i1.ColumnValue(
    table.ownerId,
    value,
  );

  _i1.ColumnValue<int, int> postId(int? value) => _i1.ColumnValue(
    table.postId,
    value,
  );

  _i1.ColumnValue<int, int> projectId(int? value) => _i1.ColumnValue(
    table.projectId,
    value,
  );

  _i1.ColumnValue<String, String> objectKey(String value) => _i1.ColumnValue(
    table.objectKey,
    value,
  );

  _i1.ColumnValue<String, String> publicUrl(String? value) => _i1.ColumnValue(
    table.publicUrl,
    value,
  );

  _i1.ColumnValue<String, String> contentType(String? value) => _i1.ColumnValue(
    table.contentType,
    value,
  );

  _i1.ColumnValue<int, int> size(int? value) => _i1.ColumnValue(
    table.size,
    value,
  );

  _i1.ColumnValue<int, int> width(int? value) => _i1.ColumnValue(
    table.width,
    value,
  );

  _i1.ColumnValue<int, int> height(int? value) => _i1.ColumnValue(
    table.height,
    value,
  );

  _i1.ColumnValue<double, double> aspectRatio(double? value) => _i1.ColumnValue(
    table.aspectRatio,
    value,
  );

  _i1.ColumnValue<int, int> durationMs(int? value) => _i1.ColumnValue(
    table.durationMs,
    value,
  );

  _i1.ColumnValue<_i5.MediaKind, _i5.MediaKind> kind(_i5.MediaKind value) =>
      _i1.ColumnValue(
        table.kind,
        value,
      );

  _i1.ColumnValue<DateTime, DateTime> createdAt(DateTime? value) =>
      _i1.ColumnValue(
        table.createdAt,
        value,
      );

  _i1.ColumnValue<DateTime, DateTime> deletedAt(DateTime? value) =>
      _i1.ColumnValue(
        table.deletedAt,
        value,
      );
}

class MediaAssetTable extends _i1.Table<int?> {
  MediaAssetTable({super.tableRelation}) : super(tableName: 'media_asset') {
    updateTable = MediaAssetUpdateTable(this);
    ownerId = _i1.ColumnInt(
      'ownerId',
      this,
    );
    postId = _i1.ColumnInt(
      'postId',
      this,
    );
    projectId = _i1.ColumnInt(
      'projectId',
      this,
    );
    objectKey = _i1.ColumnString(
      'objectKey',
      this,
    );
    publicUrl = _i1.ColumnString(
      'publicUrl',
      this,
    );
    contentType = _i1.ColumnString(
      'contentType',
      this,
    );
    size = _i1.ColumnInt(
      'size',
      this,
    );
    width = _i1.ColumnInt(
      'width',
      this,
    );
    height = _i1.ColumnInt(
      'height',
      this,
    );
    aspectRatio = _i1.ColumnDouble(
      'aspectRatio',
      this,
    );
    durationMs = _i1.ColumnInt(
      'durationMs',
      this,
    );
    kind = _i1.ColumnEnum(
      'kind',
      this,
      _i1.EnumSerialization.byName,
    );
    createdAt = _i1.ColumnDateTime(
      'createdAt',
      this,
      hasDefault: true,
    );
    deletedAt = _i1.ColumnDateTime(
      'deletedAt',
      this,
    );
  }

  late final MediaAssetUpdateTable updateTable;

  late final _i1.ColumnInt ownerId;

  _i2.UserRecordTable? _owner;

  late final _i1.ColumnInt postId;

  _i3.PostTable? _post;

  late final _i1.ColumnInt projectId;

  _i4.ProjectTable? _project;

  late final _i1.ColumnString objectKey;

  late final _i1.ColumnString publicUrl;

  late final _i1.ColumnString contentType;

  late final _i1.ColumnInt size;

  late final _i1.ColumnInt width;

  late final _i1.ColumnInt height;

  late final _i1.ColumnDouble aspectRatio;

  late final _i1.ColumnInt durationMs;

  late final _i1.ColumnEnum<_i5.MediaKind> kind;

  late final _i1.ColumnDateTime createdAt;

  late final _i1.ColumnDateTime deletedAt;

  _i2.UserRecordTable get owner {
    if (_owner != null) return _owner!;
    _owner = _i1.createRelationTable(
      relationFieldName: 'owner',
      field: MediaAsset.t.ownerId,
      foreignField: _i2.UserRecord.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.UserRecordTable(tableRelation: foreignTableRelation),
    );
    return _owner!;
  }

  _i3.PostTable get post {
    if (_post != null) return _post!;
    _post = _i1.createRelationTable(
      relationFieldName: 'post',
      field: MediaAsset.t.postId,
      foreignField: _i3.Post.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i3.PostTable(tableRelation: foreignTableRelation),
    );
    return _post!;
  }

  _i4.ProjectTable get project {
    if (_project != null) return _project!;
    _project = _i1.createRelationTable(
      relationFieldName: 'project',
      field: MediaAsset.t.projectId,
      foreignField: _i4.Project.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i4.ProjectTable(tableRelation: foreignTableRelation),
    );
    return _project!;
  }

  @override
  List<_i1.Column> get columns => [
    id,
    ownerId,
    postId,
    projectId,
    objectKey,
    publicUrl,
    contentType,
    size,
    width,
    height,
    aspectRatio,
    durationMs,
    kind,
    createdAt,
    deletedAt,
  ];

  @override
  _i1.Table? getRelationTable(String relationField) {
    if (relationField == 'owner') {
      return owner;
    }
    if (relationField == 'post') {
      return post;
    }
    if (relationField == 'project') {
      return project;
    }
    return null;
  }
}

class MediaAssetInclude extends _i1.IncludeObject {
  MediaAssetInclude._({
    _i2.UserRecordInclude? owner,
    _i3.PostInclude? post,
    _i4.ProjectInclude? project,
  }) {
    _owner = owner;
    _post = post;
    _project = project;
  }

  _i2.UserRecordInclude? _owner;

  _i3.PostInclude? _post;

  _i4.ProjectInclude? _project;

  @override
  Map<String, _i1.Include?> get includes => {
    'owner': _owner,
    'post': _post,
    'project': _project,
  };

  @override
  _i1.Table<int?> get table => MediaAsset.t;
}

class MediaAssetIncludeList extends _i1.IncludeList {
  MediaAssetIncludeList._({
    _i1.WhereExpressionBuilder<MediaAssetTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(MediaAsset.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => MediaAsset.t;
}

class MediaAssetRepository {
  const MediaAssetRepository._();

  final attachRow = const MediaAssetAttachRowRepository._();

  final detachRow = const MediaAssetDetachRowRepository._();

  /// Returns a list of [MediaAsset]s matching the given query parameters.
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
  Future<List<MediaAsset>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<MediaAssetTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<MediaAssetTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<MediaAssetTable>? orderByList,
    _i1.Transaction? transaction,
    MediaAssetInclude? include,
  }) async {
    return session.db.find<MediaAsset>(
      where: where?.call(MediaAsset.t),
      orderBy: orderBy?.call(MediaAsset.t),
      orderByList: orderByList?.call(MediaAsset.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Returns the first matching [MediaAsset] matching the given query parameters.
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
  Future<MediaAsset?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<MediaAssetTable>? where,
    int? offset,
    _i1.OrderByBuilder<MediaAssetTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<MediaAssetTable>? orderByList,
    _i1.Transaction? transaction,
    MediaAssetInclude? include,
  }) async {
    return session.db.findFirstRow<MediaAsset>(
      where: where?.call(MediaAsset.t),
      orderBy: orderBy?.call(MediaAsset.t),
      orderByList: orderByList?.call(MediaAsset.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Finds a single [MediaAsset] by its [id] or null if no such row exists.
  Future<MediaAsset?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
    MediaAssetInclude? include,
  }) async {
    return session.db.findById<MediaAsset>(
      id,
      transaction: transaction,
      include: include,
    );
  }

  /// Inserts all [MediaAsset]s in the list and returns the inserted rows.
  ///
  /// The returned [MediaAsset]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<MediaAsset>> insert(
    _i1.Session session,
    List<MediaAsset> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<MediaAsset>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [MediaAsset] and returns the inserted row.
  ///
  /// The returned [MediaAsset] will have its `id` field set.
  Future<MediaAsset> insertRow(
    _i1.Session session,
    MediaAsset row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<MediaAsset>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [MediaAsset]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<MediaAsset>> update(
    _i1.Session session,
    List<MediaAsset> rows, {
    _i1.ColumnSelections<MediaAssetTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<MediaAsset>(
      rows,
      columns: columns?.call(MediaAsset.t),
      transaction: transaction,
    );
  }

  /// Updates a single [MediaAsset]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<MediaAsset> updateRow(
    _i1.Session session,
    MediaAsset row, {
    _i1.ColumnSelections<MediaAssetTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<MediaAsset>(
      row,
      columns: columns?.call(MediaAsset.t),
      transaction: transaction,
    );
  }

  /// Updates a single [MediaAsset] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<MediaAsset?> updateById(
    _i1.Session session,
    int id, {
    required _i1.ColumnValueListBuilder<MediaAssetUpdateTable> columnValues,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateById<MediaAsset>(
      id,
      columnValues: columnValues(MediaAsset.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [MediaAsset]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  Future<List<MediaAsset>> updateWhere(
    _i1.Session session, {
    required _i1.ColumnValueListBuilder<MediaAssetUpdateTable> columnValues,
    required _i1.WhereExpressionBuilder<MediaAssetTable> where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<MediaAssetTable>? orderBy,
    _i1.OrderByListBuilder<MediaAssetTable>? orderByList,
    bool orderDescending = false,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateWhere<MediaAsset>(
      columnValues: columnValues(MediaAsset.t.updateTable),
      where: where(MediaAsset.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(MediaAsset.t),
      orderByList: orderByList?.call(MediaAsset.t),
      orderDescending: orderDescending,
      transaction: transaction,
    );
  }

  /// Deletes all [MediaAsset]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<MediaAsset>> delete(
    _i1.Session session,
    List<MediaAsset> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<MediaAsset>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [MediaAsset].
  Future<MediaAsset> deleteRow(
    _i1.Session session,
    MediaAsset row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<MediaAsset>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<MediaAsset>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<MediaAssetTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<MediaAsset>(
      where: where(MediaAsset.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<MediaAssetTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<MediaAsset>(
      where: where?.call(MediaAsset.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

class MediaAssetAttachRowRepository {
  const MediaAssetAttachRowRepository._();

  /// Creates a relation between the given [MediaAsset] and [UserRecord]
  /// by setting the [MediaAsset]'s foreign key `ownerId` to refer to the [UserRecord].
  Future<void> owner(
    _i1.Session session,
    MediaAsset mediaAsset,
    _i2.UserRecord owner, {
    _i1.Transaction? transaction,
  }) async {
    if (mediaAsset.id == null) {
      throw ArgumentError.notNull('mediaAsset.id');
    }
    if (owner.id == null) {
      throw ArgumentError.notNull('owner.id');
    }

    var $mediaAsset = mediaAsset.copyWith(ownerId: owner.id);
    await session.db.updateRow<MediaAsset>(
      $mediaAsset,
      columns: [MediaAsset.t.ownerId],
      transaction: transaction,
    );
  }

  /// Creates a relation between the given [MediaAsset] and [Post]
  /// by setting the [MediaAsset]'s foreign key `postId` to refer to the [Post].
  Future<void> post(
    _i1.Session session,
    MediaAsset mediaAsset,
    _i3.Post post, {
    _i1.Transaction? transaction,
  }) async {
    if (mediaAsset.id == null) {
      throw ArgumentError.notNull('mediaAsset.id');
    }
    if (post.id == null) {
      throw ArgumentError.notNull('post.id');
    }

    var $mediaAsset = mediaAsset.copyWith(postId: post.id);
    await session.db.updateRow<MediaAsset>(
      $mediaAsset,
      columns: [MediaAsset.t.postId],
      transaction: transaction,
    );
  }

  /// Creates a relation between the given [MediaAsset] and [Project]
  /// by setting the [MediaAsset]'s foreign key `projectId` to refer to the [Project].
  Future<void> project(
    _i1.Session session,
    MediaAsset mediaAsset,
    _i4.Project project, {
    _i1.Transaction? transaction,
  }) async {
    if (mediaAsset.id == null) {
      throw ArgumentError.notNull('mediaAsset.id');
    }
    if (project.id == null) {
      throw ArgumentError.notNull('project.id');
    }

    var $mediaAsset = mediaAsset.copyWith(projectId: project.id);
    await session.db.updateRow<MediaAsset>(
      $mediaAsset,
      columns: [MediaAsset.t.projectId],
      transaction: transaction,
    );
  }
}

class MediaAssetDetachRowRepository {
  const MediaAssetDetachRowRepository._();

  /// Detaches the relation between this [MediaAsset] and the [Post] set in `post`
  /// by setting the [MediaAsset]'s foreign key `postId` to `null`.
  ///
  /// This removes the association between the two models without deleting
  /// the related record.
  Future<void> post(
    _i1.Session session,
    MediaAsset mediaAsset, {
    _i1.Transaction? transaction,
  }) async {
    if (mediaAsset.id == null) {
      throw ArgumentError.notNull('mediaAsset.id');
    }

    var $mediaAsset = mediaAsset.copyWith(postId: null);
    await session.db.updateRow<MediaAsset>(
      $mediaAsset,
      columns: [MediaAsset.t.postId],
      transaction: transaction,
    );
  }

  /// Detaches the relation between this [MediaAsset] and the [Project] set in `project`
  /// by setting the [MediaAsset]'s foreign key `projectId` to `null`.
  ///
  /// This removes the association between the two models without deleting
  /// the related record.
  Future<void> project(
    _i1.Session session,
    MediaAsset mediaAsset, {
    _i1.Transaction? transaction,
  }) async {
    if (mediaAsset.id == null) {
      throw ArgumentError.notNull('mediaAsset.id');
    }

    var $mediaAsset = mediaAsset.copyWith(projectId: null);
    await session.db.updateRow<MediaAsset>(
      $mediaAsset,
      columns: [MediaAsset.t.projectId],
      transaction: transaction,
    );
  }
}
