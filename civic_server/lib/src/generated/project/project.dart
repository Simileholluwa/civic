/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters

// ignore_for_file: invalid_use_of_visible_for_testing_member

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;
import '../protocol.dart' as _i2;

abstract class Project implements _i1.TableRow, _i1.ProtocolSerialization {
  Project._({
    this.id,
    required this.ownerId,
    this.owner,
    required this.title,
    required this.description,
    required this.category,
    required this.status,
    required this.images,
    required this.startDate,
    required this.endDate,
    this.completionRate,
    this.cost,
    this.currency,
    this.locations,
    this.fundingSources,
  });

  factory Project({
    int? id,
    required int ownerId,
    _i2.UserRecord? owner,
    required String title,
    required String description,
    required List<String> category,
    required _i2.ProjectStatus status,
    required List<String> images,
    required DateTime startDate,
    required DateTime endDate,
    double? completionRate,
    double? cost,
    String? currency,
    List<_i2.AWSPlaces>? locations,
    List<String>? fundingSources,
  }) = _ProjectImpl;

  factory Project.fromJson(Map<String, dynamic> jsonSerialization) {
    return Project(
      id: jsonSerialization['id'] as int?,
      ownerId: jsonSerialization['ownerId'] as int,
      owner: jsonSerialization['owner'] == null
          ? null
          : _i2.UserRecord.fromJson(
              (jsonSerialization['owner'] as Map<String, dynamic>)),
      title: jsonSerialization['title'] as String,
      description: jsonSerialization['description'] as String,
      category: (jsonSerialization['category'] as List)
          .map((e) => e as String)
          .toList(),
      status: _i2.ProjectStatus.fromJson((jsonSerialization['status'] as int)),
      images: (jsonSerialization['images'] as List)
          .map((e) => e as String)
          .toList(),
      startDate:
          _i1.DateTimeJsonExtension.fromJson(jsonSerialization['startDate']),
      endDate: _i1.DateTimeJsonExtension.fromJson(jsonSerialization['endDate']),
      completionRate: (jsonSerialization['completionRate'] as num?)?.toDouble(),
      cost: (jsonSerialization['cost'] as num?)?.toDouble(),
      currency: jsonSerialization['currency'] as String?,
      locations: (jsonSerialization['locations'] as List?)
          ?.map((e) => _i2.AWSPlaces.fromJson((e as Map<String, dynamic>)))
          .toList(),
      fundingSources: (jsonSerialization['fundingSources'] as List?)
          ?.map((e) => e as String)
          .toList(),
    );
  }

  static final t = ProjectTable();

  static const db = ProjectRepository._();

  @override
  int? id;

  int ownerId;

  _i2.UserRecord? owner;

  String title;

  String description;

  List<String> category;

  _i2.ProjectStatus status;

  List<String> images;

  DateTime startDate;

  DateTime endDate;

  double? completionRate;

  double? cost;

  String? currency;

  List<_i2.AWSPlaces>? locations;

  List<String>? fundingSources;

  @override
  _i1.Table get table => t;

  Project copyWith({
    int? id,
    int? ownerId,
    _i2.UserRecord? owner,
    String? title,
    String? description,
    List<String>? category,
    _i2.ProjectStatus? status,
    List<String>? images,
    DateTime? startDate,
    DateTime? endDate,
    double? completionRate,
    double? cost,
    String? currency,
    List<_i2.AWSPlaces>? locations,
    List<String>? fundingSources,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'ownerId': ownerId,
      if (owner != null) 'owner': owner?.toJson(),
      'title': title,
      'description': description,
      'category': category.toJson(),
      'status': status.toJson(),
      'images': images.toJson(),
      'startDate': startDate.toJson(),
      'endDate': endDate.toJson(),
      if (completionRate != null) 'completionRate': completionRate,
      if (cost != null) 'cost': cost,
      if (currency != null) 'currency': currency,
      if (locations != null)
        'locations': locations?.toJson(valueToJson: (v) => v.toJson()),
      if (fundingSources != null) 'fundingSources': fundingSources?.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'ownerId': ownerId,
      if (owner != null) 'owner': owner?.toJsonForProtocol(),
      'title': title,
      'description': description,
      'category': category.toJson(),
      'status': status.toJson(),
      'images': images.toJson(),
      'startDate': startDate.toJson(),
      'endDate': endDate.toJson(),
      if (completionRate != null) 'completionRate': completionRate,
      if (cost != null) 'cost': cost,
      if (currency != null) 'currency': currency,
      if (locations != null)
        'locations':
            locations?.toJson(valueToJson: (v) => v.toJsonForProtocol()),
      if (fundingSources != null) 'fundingSources': fundingSources?.toJson(),
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
    required String title,
    required String description,
    required List<String> category,
    required _i2.ProjectStatus status,
    required List<String> images,
    required DateTime startDate,
    required DateTime endDate,
    double? completionRate,
    double? cost,
    String? currency,
    List<_i2.AWSPlaces>? locations,
    List<String>? fundingSources,
  }) : super._(
          id: id,
          ownerId: ownerId,
          owner: owner,
          title: title,
          description: description,
          category: category,
          status: status,
          images: images,
          startDate: startDate,
          endDate: endDate,
          completionRate: completionRate,
          cost: cost,
          currency: currency,
          locations: locations,
          fundingSources: fundingSources,
        );

  @override
  Project copyWith({
    Object? id = _Undefined,
    int? ownerId,
    Object? owner = _Undefined,
    String? title,
    String? description,
    List<String>? category,
    _i2.ProjectStatus? status,
    List<String>? images,
    DateTime? startDate,
    DateTime? endDate,
    Object? completionRate = _Undefined,
    Object? cost = _Undefined,
    Object? currency = _Undefined,
    Object? locations = _Undefined,
    Object? fundingSources = _Undefined,
  }) {
    return Project(
      id: id is int? ? id : this.id,
      ownerId: ownerId ?? this.ownerId,
      owner: owner is _i2.UserRecord? ? owner : this.owner?.copyWith(),
      title: title ?? this.title,
      description: description ?? this.description,
      category: category ?? this.category.map((e0) => e0).toList(),
      status: status ?? this.status,
      images: images ?? this.images.map((e0) => e0).toList(),
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      completionRate:
          completionRate is double? ? completionRate : this.completionRate,
      cost: cost is double? ? cost : this.cost,
      currency: currency is String? ? currency : this.currency,
      locations: locations is List<_i2.AWSPlaces>?
          ? locations
          : this.locations?.map((e0) => e0.copyWith()).toList(),
      fundingSources: fundingSources is List<String>?
          ? fundingSources
          : this.fundingSources?.map((e0) => e0).toList(),
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
    category = _i1.ColumnSerializable(
      'category',
      this,
    );
    status = _i1.ColumnEnum(
      'status',
      this,
      _i1.EnumSerialization.byIndex,
    );
    images = _i1.ColumnSerializable(
      'images',
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
    completionRate = _i1.ColumnDouble(
      'completionRate',
      this,
    );
    cost = _i1.ColumnDouble(
      'cost',
      this,
    );
    currency = _i1.ColumnString(
      'currency',
      this,
    );
    locations = _i1.ColumnSerializable(
      'locations',
      this,
    );
    fundingSources = _i1.ColumnSerializable(
      'fundingSources',
      this,
    );
  }

  late final _i1.ColumnInt ownerId;

  _i2.UserRecordTable? _owner;

  late final _i1.ColumnString title;

  late final _i1.ColumnString description;

  late final _i1.ColumnSerializable category;

  late final _i1.ColumnEnum<_i2.ProjectStatus> status;

  late final _i1.ColumnSerializable images;

  late final _i1.ColumnDateTime startDate;

  late final _i1.ColumnDateTime endDate;

  late final _i1.ColumnDouble completionRate;

  late final _i1.ColumnDouble cost;

  late final _i1.ColumnString currency;

  late final _i1.ColumnSerializable locations;

  late final _i1.ColumnSerializable fundingSources;

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
        category,
        status,
        images,
        startDate,
        endDate,
        completionRate,
        cost,
        currency,
        locations,
        fundingSources,
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
      transaction: transaction ?? session.transaction,
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
      transaction: transaction ?? session.transaction,
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
      transaction: transaction ?? session.transaction,
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
      transaction: transaction ?? session.transaction,
    );
  }

  Future<Project> insertRow(
    _i1.Session session,
    Project row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<Project>(
      row,
      transaction: transaction ?? session.transaction,
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
      transaction: transaction ?? session.transaction,
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
      transaction: transaction ?? session.transaction,
    );
  }

  Future<List<Project>> delete(
    _i1.Session session,
    List<Project> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<Project>(
      rows,
      transaction: transaction ?? session.transaction,
    );
  }

  Future<Project> deleteRow(
    _i1.Session session,
    Project row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<Project>(
      row,
      transaction: transaction ?? session.transaction,
    );
  }

  Future<List<Project>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<ProjectTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<Project>(
      where: where(Project.t),
      transaction: transaction ?? session.transaction,
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
      transaction: transaction ?? session.transaction,
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
      transaction: transaction ?? session.transaction,
    );
  }
}
