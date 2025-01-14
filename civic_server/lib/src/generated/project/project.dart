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
import '../general/aws_places.dart' as _i3;

abstract class Project implements _i1.TableRow, _i1.ProtocolSerialization {
  Project._({
    this.id,
    required this.ownerId,
    this.owner,
    this.title,
    this.description,
    this.projectCategory,
    this.projectSubCategory,
    this.status,
    this.startDate,
    this.endDate,
    this.currency,
    this.fundingCategory,
    this.fundingSubCategory,
    this.projectCost,
    this.zeroCost,
    this.fundingNote,
    this.projectImageAttachments,
    this.projectPDFAttachments,
    this.completionRate,
    this.physicalLocations,
    this.virtualLocations,
    this.manualLocations,
    this.projectVideoUrl,
    this.dateCreated,
    this.updatedAt,
    this.likedBy,
    this.commentBy,
    this.repostBy,
  });

  factory Project({
    int? id,
    required int ownerId,
    _i2.UserRecord? owner,
    String? title,
    String? description,
    String? projectCategory,
    String? projectSubCategory,
    String? status,
    DateTime? startDate,
    DateTime? endDate,
    String? currency,
    String? fundingCategory,
    String? fundingSubCategory,
    double? projectCost,
    bool? zeroCost,
    String? fundingNote,
    List<String>? projectImageAttachments,
    List<String>? projectPDFAttachments,
    double? completionRate,
    List<_i3.AWSPlaces>? physicalLocations,
    List<String>? virtualLocations,
    List<String>? manualLocations,
    String? projectVideoUrl,
    DateTime? dateCreated,
    DateTime? updatedAt,
    List<int>? likedBy,
    List<int>? commentBy,
    List<int>? repostBy,
  }) = _ProjectImpl;

  factory Project.fromJson(Map<String, dynamic> jsonSerialization) {
    return Project(
      id: jsonSerialization['id'] as int?,
      ownerId: jsonSerialization['ownerId'] as int,
      owner: jsonSerialization['owner'] == null
          ? null
          : _i2.UserRecord.fromJson(
              (jsonSerialization['owner'] as Map<String, dynamic>)),
      title: jsonSerialization['title'] as String?,
      description: jsonSerialization['description'] as String?,
      projectCategory: jsonSerialization['projectCategory'] as String?,
      projectSubCategory: jsonSerialization['projectSubCategory'] as String?,
      status: jsonSerialization['status'] as String?,
      startDate: jsonSerialization['startDate'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['startDate']),
      endDate: jsonSerialization['endDate'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['endDate']),
      currency: jsonSerialization['currency'] as String?,
      fundingCategory: jsonSerialization['fundingCategory'] as String?,
      fundingSubCategory: jsonSerialization['fundingSubCategory'] as String?,
      projectCost: (jsonSerialization['projectCost'] as num?)?.toDouble(),
      zeroCost: jsonSerialization['zeroCost'] as bool?,
      fundingNote: jsonSerialization['fundingNote'] as String?,
      projectImageAttachments:
          (jsonSerialization['projectImageAttachments'] as List?)
              ?.map((e) => e as String)
              .toList(),
      projectPDFAttachments:
          (jsonSerialization['projectPDFAttachments'] as List?)
              ?.map((e) => e as String)
              .toList(),
      completionRate: (jsonSerialization['completionRate'] as num?)?.toDouble(),
      physicalLocations: (jsonSerialization['physicalLocations'] as List?)
          ?.map((e) => _i3.AWSPlaces.fromJson((e as Map<String, dynamic>)))
          .toList(),
      virtualLocations: (jsonSerialization['virtualLocations'] as List?)
          ?.map((e) => e as String)
          .toList(),
      manualLocations: (jsonSerialization['manualLocations'] as List?)
          ?.map((e) => e as String)
          .toList(),
      projectVideoUrl: jsonSerialization['projectVideoUrl'] as String?,
      dateCreated: jsonSerialization['dateCreated'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(
              jsonSerialization['dateCreated']),
      updatedAt: jsonSerialization['updatedAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['updatedAt']),
      likedBy: (jsonSerialization['likedBy'] as List?)
          ?.map((e) => e as int)
          .toList(),
      commentBy: (jsonSerialization['commentBy'] as List?)
          ?.map((e) => e as int)
          .toList(),
      repostBy: (jsonSerialization['repostBy'] as List?)
          ?.map((e) => e as int)
          .toList(),
    );
  }

  static final t = ProjectTable();

  static const db = ProjectRepository._();

  @override
  int? id;

  int ownerId;

  _i2.UserRecord? owner;

  String? title;

  String? description;

  String? projectCategory;

  String? projectSubCategory;

  String? status;

  DateTime? startDate;

  DateTime? endDate;

  String? currency;

  String? fundingCategory;

  String? fundingSubCategory;

  double? projectCost;

  bool? zeroCost;

  String? fundingNote;

  List<String>? projectImageAttachments;

  List<String>? projectPDFAttachments;

  double? completionRate;

  List<_i3.AWSPlaces>? physicalLocations;

  List<String>? virtualLocations;

  List<String>? manualLocations;

  String? projectVideoUrl;

  DateTime? dateCreated;

  DateTime? updatedAt;

  List<int>? likedBy;

  List<int>? commentBy;

  List<int>? repostBy;

  @override
  _i1.Table get table => t;

  Project copyWith({
    int? id,
    int? ownerId,
    _i2.UserRecord? owner,
    String? title,
    String? description,
    String? projectCategory,
    String? projectSubCategory,
    String? status,
    DateTime? startDate,
    DateTime? endDate,
    String? currency,
    String? fundingCategory,
    String? fundingSubCategory,
    double? projectCost,
    bool? zeroCost,
    String? fundingNote,
    List<String>? projectImageAttachments,
    List<String>? projectPDFAttachments,
    double? completionRate,
    List<_i3.AWSPlaces>? physicalLocations,
    List<String>? virtualLocations,
    List<String>? manualLocations,
    String? projectVideoUrl,
    DateTime? dateCreated,
    DateTime? updatedAt,
    List<int>? likedBy,
    List<int>? commentBy,
    List<int>? repostBy,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'ownerId': ownerId,
      if (owner != null) 'owner': owner?.toJson(),
      if (title != null) 'title': title,
      if (description != null) 'description': description,
      if (projectCategory != null) 'projectCategory': projectCategory,
      if (projectSubCategory != null) 'projectSubCategory': projectSubCategory,
      if (status != null) 'status': status,
      if (startDate != null) 'startDate': startDate?.toJson(),
      if (endDate != null) 'endDate': endDate?.toJson(),
      if (currency != null) 'currency': currency,
      if (fundingCategory != null) 'fundingCategory': fundingCategory,
      if (fundingSubCategory != null) 'fundingSubCategory': fundingSubCategory,
      if (projectCost != null) 'projectCost': projectCost,
      if (zeroCost != null) 'zeroCost': zeroCost,
      if (fundingNote != null) 'fundingNote': fundingNote,
      if (projectImageAttachments != null)
        'projectImageAttachments': projectImageAttachments?.toJson(),
      if (projectPDFAttachments != null)
        'projectPDFAttachments': projectPDFAttachments?.toJson(),
      if (completionRate != null) 'completionRate': completionRate,
      if (physicalLocations != null)
        'physicalLocations':
            physicalLocations?.toJson(valueToJson: (v) => v.toJson()),
      if (virtualLocations != null)
        'virtualLocations': virtualLocations?.toJson(),
      if (manualLocations != null) 'manualLocations': manualLocations?.toJson(),
      if (projectVideoUrl != null) 'projectVideoUrl': projectVideoUrl,
      if (dateCreated != null) 'dateCreated': dateCreated?.toJson(),
      if (updatedAt != null) 'updatedAt': updatedAt?.toJson(),
      if (likedBy != null) 'likedBy': likedBy?.toJson(),
      if (commentBy != null) 'commentBy': commentBy?.toJson(),
      if (repostBy != null) 'repostBy': repostBy?.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'ownerId': ownerId,
      if (owner != null) 'owner': owner?.toJsonForProtocol(),
      if (title != null) 'title': title,
      if (description != null) 'description': description,
      if (projectCategory != null) 'projectCategory': projectCategory,
      if (projectSubCategory != null) 'projectSubCategory': projectSubCategory,
      if (status != null) 'status': status,
      if (startDate != null) 'startDate': startDate?.toJson(),
      if (endDate != null) 'endDate': endDate?.toJson(),
      if (currency != null) 'currency': currency,
      if (fundingCategory != null) 'fundingCategory': fundingCategory,
      if (fundingSubCategory != null) 'fundingSubCategory': fundingSubCategory,
      if (projectCost != null) 'projectCost': projectCost,
      if (zeroCost != null) 'zeroCost': zeroCost,
      if (fundingNote != null) 'fundingNote': fundingNote,
      if (projectImageAttachments != null)
        'projectImageAttachments': projectImageAttachments?.toJson(),
      if (projectPDFAttachments != null)
        'projectPDFAttachments': projectPDFAttachments?.toJson(),
      if (completionRate != null) 'completionRate': completionRate,
      if (physicalLocations != null)
        'physicalLocations': physicalLocations?.toJson(
            valueToJson: (v) => v.toJsonForProtocol()),
      if (virtualLocations != null)
        'virtualLocations': virtualLocations?.toJson(),
      if (manualLocations != null) 'manualLocations': manualLocations?.toJson(),
      if (projectVideoUrl != null) 'projectVideoUrl': projectVideoUrl,
      if (dateCreated != null) 'dateCreated': dateCreated?.toJson(),
      if (updatedAt != null) 'updatedAt': updatedAt?.toJson(),
      if (likedBy != null) 'likedBy': likedBy?.toJson(),
      if (commentBy != null) 'commentBy': commentBy?.toJson(),
      if (repostBy != null) 'repostBy': repostBy?.toJson(),
    };
  }

  static ProjectInclude include({_i2.UserRecordInclude? owner}) {
    return ProjectInclude._(owner: owner);
  }

  static ProjectIncludeList includeList({
    _i1.WhereExpressionBuilder<ProjectTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<ProjectTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<ProjectTable>? orderByList,
    ProjectInclude? include,
  }) {
    return ProjectIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Project.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(Project.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _ProjectImpl extends Project {
  _ProjectImpl({
    int? id,
    required int ownerId,
    _i2.UserRecord? owner,
    String? title,
    String? description,
    String? projectCategory,
    String? projectSubCategory,
    String? status,
    DateTime? startDate,
    DateTime? endDate,
    String? currency,
    String? fundingCategory,
    String? fundingSubCategory,
    double? projectCost,
    bool? zeroCost,
    String? fundingNote,
    List<String>? projectImageAttachments,
    List<String>? projectPDFAttachments,
    double? completionRate,
    List<_i3.AWSPlaces>? physicalLocations,
    List<String>? virtualLocations,
    List<String>? manualLocations,
    String? projectVideoUrl,
    DateTime? dateCreated,
    DateTime? updatedAt,
    List<int>? likedBy,
    List<int>? commentBy,
    List<int>? repostBy,
  }) : super._(
          id: id,
          ownerId: ownerId,
          owner: owner,
          title: title,
          description: description,
          projectCategory: projectCategory,
          projectSubCategory: projectSubCategory,
          status: status,
          startDate: startDate,
          endDate: endDate,
          currency: currency,
          fundingCategory: fundingCategory,
          fundingSubCategory: fundingSubCategory,
          projectCost: projectCost,
          zeroCost: zeroCost,
          fundingNote: fundingNote,
          projectImageAttachments: projectImageAttachments,
          projectPDFAttachments: projectPDFAttachments,
          completionRate: completionRate,
          physicalLocations: physicalLocations,
          virtualLocations: virtualLocations,
          manualLocations: manualLocations,
          projectVideoUrl: projectVideoUrl,
          dateCreated: dateCreated,
          updatedAt: updatedAt,
          likedBy: likedBy,
          commentBy: commentBy,
          repostBy: repostBy,
        );

  @override
  Project copyWith({
    Object? id = _Undefined,
    int? ownerId,
    Object? owner = _Undefined,
    Object? title = _Undefined,
    Object? description = _Undefined,
    Object? projectCategory = _Undefined,
    Object? projectSubCategory = _Undefined,
    Object? status = _Undefined,
    Object? startDate = _Undefined,
    Object? endDate = _Undefined,
    Object? currency = _Undefined,
    Object? fundingCategory = _Undefined,
    Object? fundingSubCategory = _Undefined,
    Object? projectCost = _Undefined,
    Object? zeroCost = _Undefined,
    Object? fundingNote = _Undefined,
    Object? projectImageAttachments = _Undefined,
    Object? projectPDFAttachments = _Undefined,
    Object? completionRate = _Undefined,
    Object? physicalLocations = _Undefined,
    Object? virtualLocations = _Undefined,
    Object? manualLocations = _Undefined,
    Object? projectVideoUrl = _Undefined,
    Object? dateCreated = _Undefined,
    Object? updatedAt = _Undefined,
    Object? likedBy = _Undefined,
    Object? commentBy = _Undefined,
    Object? repostBy = _Undefined,
  }) {
    return Project(
      id: id is int? ? id : this.id,
      ownerId: ownerId ?? this.ownerId,
      owner: owner is _i2.UserRecord? ? owner : this.owner?.copyWith(),
      title: title is String? ? title : this.title,
      description: description is String? ? description : this.description,
      projectCategory:
          projectCategory is String? ? projectCategory : this.projectCategory,
      projectSubCategory: projectSubCategory is String?
          ? projectSubCategory
          : this.projectSubCategory,
      status: status is String? ? status : this.status,
      startDate: startDate is DateTime? ? startDate : this.startDate,
      endDate: endDate is DateTime? ? endDate : this.endDate,
      currency: currency is String? ? currency : this.currency,
      fundingCategory:
          fundingCategory is String? ? fundingCategory : this.fundingCategory,
      fundingSubCategory: fundingSubCategory is String?
          ? fundingSubCategory
          : this.fundingSubCategory,
      projectCost: projectCost is double? ? projectCost : this.projectCost,
      zeroCost: zeroCost is bool? ? zeroCost : this.zeroCost,
      fundingNote: fundingNote is String? ? fundingNote : this.fundingNote,
      projectImageAttachments: projectImageAttachments is List<String>?
          ? projectImageAttachments
          : this.projectImageAttachments?.map((e0) => e0).toList(),
      projectPDFAttachments: projectPDFAttachments is List<String>?
          ? projectPDFAttachments
          : this.projectPDFAttachments?.map((e0) => e0).toList(),
      completionRate:
          completionRate is double? ? completionRate : this.completionRate,
      physicalLocations: physicalLocations is List<_i3.AWSPlaces>?
          ? physicalLocations
          : this.physicalLocations?.map((e0) => e0.copyWith()).toList(),
      virtualLocations: virtualLocations is List<String>?
          ? virtualLocations
          : this.virtualLocations?.map((e0) => e0).toList(),
      manualLocations: manualLocations is List<String>?
          ? manualLocations
          : this.manualLocations?.map((e0) => e0).toList(),
      projectVideoUrl:
          projectVideoUrl is String? ? projectVideoUrl : this.projectVideoUrl,
      dateCreated: dateCreated is DateTime? ? dateCreated : this.dateCreated,
      updatedAt: updatedAt is DateTime? ? updatedAt : this.updatedAt,
      likedBy: likedBy is List<int>?
          ? likedBy
          : this.likedBy?.map((e0) => e0).toList(),
      commentBy: commentBy is List<int>?
          ? commentBy
          : this.commentBy?.map((e0) => e0).toList(),
      repostBy: repostBy is List<int>?
          ? repostBy
          : this.repostBy?.map((e0) => e0).toList(),
    );
  }
}

class ProjectTable extends _i1.Table {
  ProjectTable({super.tableRelation}) : super(tableName: 'project') {
    ownerId = _i1.ColumnInt(
      'ownerId',
      this,
    );
    title = _i1.ColumnString(
      'title',
      this,
    );
    description = _i1.ColumnString(
      'description',
      this,
    );
    projectCategory = _i1.ColumnString(
      'projectCategory',
      this,
    );
    projectSubCategory = _i1.ColumnString(
      'projectSubCategory',
      this,
    );
    status = _i1.ColumnString(
      'status',
      this,
    );
    startDate = _i1.ColumnDateTime(
      'startDate',
      this,
    );
    endDate = _i1.ColumnDateTime(
      'endDate',
      this,
    );
    currency = _i1.ColumnString(
      'currency',
      this,
    );
    fundingCategory = _i1.ColumnString(
      'fundingCategory',
      this,
    );
    fundingSubCategory = _i1.ColumnString(
      'fundingSubCategory',
      this,
    );
    projectCost = _i1.ColumnDouble(
      'projectCost',
      this,
    );
    zeroCost = _i1.ColumnBool(
      'zeroCost',
      this,
    );
    fundingNote = _i1.ColumnString(
      'fundingNote',
      this,
    );
    projectImageAttachments = _i1.ColumnSerializable(
      'projectImageAttachments',
      this,
    );
    projectPDFAttachments = _i1.ColumnSerializable(
      'projectPDFAttachments',
      this,
    );
    completionRate = _i1.ColumnDouble(
      'completionRate',
      this,
    );
    physicalLocations = _i1.ColumnSerializable(
      'physicalLocations',
      this,
    );
    virtualLocations = _i1.ColumnSerializable(
      'virtualLocations',
      this,
    );
    manualLocations = _i1.ColumnSerializable(
      'manualLocations',
      this,
    );
    projectVideoUrl = _i1.ColumnString(
      'projectVideoUrl',
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
    likedBy = _i1.ColumnSerializable(
      'likedBy',
      this,
    );
    commentBy = _i1.ColumnSerializable(
      'commentBy',
      this,
    );
    repostBy = _i1.ColumnSerializable(
      'repostBy',
      this,
    );
  }

  late final _i1.ColumnInt ownerId;

  _i2.UserRecordTable? _owner;

  late final _i1.ColumnString title;

  late final _i1.ColumnString description;

  late final _i1.ColumnString projectCategory;

  late final _i1.ColumnString projectSubCategory;

  late final _i1.ColumnString status;

  late final _i1.ColumnDateTime startDate;

  late final _i1.ColumnDateTime endDate;

  late final _i1.ColumnString currency;

  late final _i1.ColumnString fundingCategory;

  late final _i1.ColumnString fundingSubCategory;

  late final _i1.ColumnDouble projectCost;

  late final _i1.ColumnBool zeroCost;

  late final _i1.ColumnString fundingNote;

  late final _i1.ColumnSerializable projectImageAttachments;

  late final _i1.ColumnSerializable projectPDFAttachments;

  late final _i1.ColumnDouble completionRate;

  late final _i1.ColumnSerializable physicalLocations;

  late final _i1.ColumnSerializable virtualLocations;

  late final _i1.ColumnSerializable manualLocations;

  late final _i1.ColumnString projectVideoUrl;

  late final _i1.ColumnDateTime dateCreated;

  late final _i1.ColumnDateTime updatedAt;

  late final _i1.ColumnSerializable likedBy;

  late final _i1.ColumnSerializable commentBy;

  late final _i1.ColumnSerializable repostBy;

  _i2.UserRecordTable get owner {
    if (_owner != null) return _owner!;
    _owner = _i1.createRelationTable(
      relationFieldName: 'owner',
      field: Project.t.ownerId,
      foreignField: _i2.UserRecord.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.UserRecordTable(tableRelation: foreignTableRelation),
    );
    return _owner!;
  }

  @override
  List<_i1.Column> get columns => [
        id,
        ownerId,
        title,
        description,
        projectCategory,
        projectSubCategory,
        status,
        startDate,
        endDate,
        currency,
        fundingCategory,
        fundingSubCategory,
        projectCost,
        zeroCost,
        fundingNote,
        projectImageAttachments,
        projectPDFAttachments,
        completionRate,
        physicalLocations,
        virtualLocations,
        manualLocations,
        projectVideoUrl,
        dateCreated,
        updatedAt,
        likedBy,
        commentBy,
        repostBy,
      ];

  @override
  _i1.Table? getRelationTable(String relationField) {
    if (relationField == 'owner') {
      return owner;
    }
    return null;
  }
}

class ProjectInclude extends _i1.IncludeObject {
  ProjectInclude._({_i2.UserRecordInclude? owner}) {
    _owner = owner;
  }

  _i2.UserRecordInclude? _owner;

  @override
  Map<String, _i1.Include?> get includes => {'owner': _owner};

  @override
  _i1.Table get table => Project.t;
}

class ProjectIncludeList extends _i1.IncludeList {
  ProjectIncludeList._({
    _i1.WhereExpressionBuilder<ProjectTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(Project.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table get table => Project.t;
}

class ProjectRepository {
  const ProjectRepository._();

  final attachRow = const ProjectAttachRowRepository._();

  Future<List<Project>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<ProjectTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<ProjectTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<ProjectTable>? orderByList,
    _i1.Transaction? transaction,
    ProjectInclude? include,
  }) async {
    return session.db.find<Project>(
      where: where?.call(Project.t),
      orderBy: orderBy?.call(Project.t),
      orderByList: orderByList?.call(Project.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  Future<Project?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<ProjectTable>? where,
    int? offset,
    _i1.OrderByBuilder<ProjectTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<ProjectTable>? orderByList,
    _i1.Transaction? transaction,
    ProjectInclude? include,
  }) async {
    return session.db.findFirstRow<Project>(
      where: where?.call(Project.t),
      orderBy: orderBy?.call(Project.t),
      orderByList: orderByList?.call(Project.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  Future<Project?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
    ProjectInclude? include,
  }) async {
    return session.db.findById<Project>(
      id,
      transaction: transaction,
      include: include,
    );
  }

  Future<List<Project>> insert(
    _i1.Session session,
    List<Project> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<Project>(
      rows,
      transaction: transaction,
    );
  }

  Future<Project> insertRow(
    _i1.Session session,
    Project row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<Project>(
      row,
      transaction: transaction,
    );
  }

  Future<List<Project>> update(
    _i1.Session session,
    List<Project> rows, {
    _i1.ColumnSelections<ProjectTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<Project>(
      rows,
      columns: columns?.call(Project.t),
      transaction: transaction,
    );
  }

  Future<Project> updateRow(
    _i1.Session session,
    Project row, {
    _i1.ColumnSelections<ProjectTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<Project>(
      row,
      columns: columns?.call(Project.t),
      transaction: transaction,
    );
  }

  Future<List<Project>> delete(
    _i1.Session session,
    List<Project> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<Project>(
      rows,
      transaction: transaction,
    );
  }

  Future<Project> deleteRow(
    _i1.Session session,
    Project row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<Project>(
      row,
      transaction: transaction,
    );
  }

  Future<List<Project>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<ProjectTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<Project>(
      where: where(Project.t),
      transaction: transaction,
    );
  }

  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<ProjectTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<Project>(
      where: where?.call(Project.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

class ProjectAttachRowRepository {
  const ProjectAttachRowRepository._();

  Future<void> owner(
    _i1.Session session,
    Project project,
    _i2.UserRecord owner, {
    _i1.Transaction? transaction,
  }) async {
    if (project.id == null) {
      throw ArgumentError.notNull('project.id');
    }
    if (owner.id == null) {
      throw ArgumentError.notNull('owner.id');
    }

    var $project = project.copyWith(ownerId: owner.id);
    await session.db.updateRow<Project>(
      $project,
      columns: [Project.t.ownerId],
      transaction: transaction,
    );
  }
}
