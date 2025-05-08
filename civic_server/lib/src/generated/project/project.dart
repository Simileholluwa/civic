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
import '../general/aws_places.dart' as _i3;
import '../project/project_repost.dart' as _i4;

abstract class Project
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  Project._({
    this.id,
    required this.ownerId,
    this.owner,
    this.title,
    this.description,
    this.projectCategory,
    this.projectSubCategory,
    this.startDate,
    this.endDate,
    this.currency,
    this.fundingCategory,
    this.fundingSubCategory,
    this.projectCost,
    this.fundingNote,
    this.projectImageAttachments,
    this.projectPDFAttachments,
    this.physicalLocations,
    this.virtualLocations,
    this.projectVideoUrl,
    DateTime? dateCreated,
    this.updatedAt,
    this.repost,
    this.likedBy,
    this.repostedBy,
    this.reviewedBy,
    this.verifiedBy,
    this.bookmarkedBy,
    this.vettedBy,
    this.overallRating,
    this.overallLocationRating,
    this.overallDescriptionRating,
    this.overallDatesRating,
    this.overallAttachmentsRating,
    this.overAllCategoryRating,
    this.overallFundingRating,
    bool? isDeleted,
  })  : dateCreated = dateCreated ?? DateTime.now(),
        isDeleted = isDeleted ?? false;

  factory Project({
    int? id,
    required int ownerId,
    _i2.UserRecord? owner,
    String? title,
    String? description,
    String? projectCategory,
    String? projectSubCategory,
    DateTime? startDate,
    DateTime? endDate,
    String? currency,
    String? fundingCategory,
    String? fundingSubCategory,
    double? projectCost,
    String? fundingNote,
    List<String>? projectImageAttachments,
    List<String>? projectPDFAttachments,
    List<_i3.AWSPlaces>? physicalLocations,
    List<String>? virtualLocations,
    String? projectVideoUrl,
    DateTime? dateCreated,
    DateTime? updatedAt,
    List<_i4.ProjectRepost>? repost,
    List<int>? likedBy,
    List<int>? repostedBy,
    List<int>? reviewedBy,
    List<int>? verifiedBy,
    List<int>? bookmarkedBy,
    List<int>? vettedBy,
    double? overallRating,
    double? overallLocationRating,
    double? overallDescriptionRating,
    double? overallDatesRating,
    double? overallAttachmentsRating,
    double? overAllCategoryRating,
    double? overallFundingRating,
    bool? isDeleted,
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
      fundingNote: jsonSerialization['fundingNote'] as String?,
      projectImageAttachments:
          (jsonSerialization['projectImageAttachments'] as List?)
              ?.map((e) => e as String)
              .toList(),
      projectPDFAttachments:
          (jsonSerialization['projectPDFAttachments'] as List?)
              ?.map((e) => e as String)
              .toList(),
      physicalLocations: (jsonSerialization['physicalLocations'] as List?)
          ?.map((e) => _i3.AWSPlaces.fromJson((e as Map<String, dynamic>)))
          .toList(),
      virtualLocations: (jsonSerialization['virtualLocations'] as List?)
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
      repost: (jsonSerialization['repost'] as List?)
          ?.map((e) => _i4.ProjectRepost.fromJson((e as Map<String, dynamic>)))
          .toList(),
      likedBy: (jsonSerialization['likedBy'] as List?)
          ?.map((e) => e as int)
          .toList(),
      repostedBy: (jsonSerialization['repostedBy'] as List?)
          ?.map((e) => e as int)
          .toList(),
      reviewedBy: (jsonSerialization['reviewedBy'] as List?)
          ?.map((e) => e as int)
          .toList(),
      verifiedBy: (jsonSerialization['verifiedBy'] as List?)
          ?.map((e) => e as int)
          .toList(),
      bookmarkedBy: (jsonSerialization['bookmarkedBy'] as List?)
          ?.map((e) => e as int)
          .toList(),
      vettedBy: (jsonSerialization['vettedBy'] as List?)
          ?.map((e) => e as int)
          .toList(),
      overallRating: (jsonSerialization['overallRating'] as num?)?.toDouble(),
      overallLocationRating:
          (jsonSerialization['overallLocationRating'] as num?)?.toDouble(),
      overallDescriptionRating:
          (jsonSerialization['overallDescriptionRating'] as num?)?.toDouble(),
      overallDatesRating:
          (jsonSerialization['overallDatesRating'] as num?)?.toDouble(),
      overallAttachmentsRating:
          (jsonSerialization['overallAttachmentsRating'] as num?)?.toDouble(),
      overAllCategoryRating:
          (jsonSerialization['overAllCategoryRating'] as num?)?.toDouble(),
      overallFundingRating:
          (jsonSerialization['overallFundingRating'] as num?)?.toDouble(),
      isDeleted: jsonSerialization['isDeleted'] as bool?,
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

  DateTime? startDate;

  DateTime? endDate;

  String? currency;

  String? fundingCategory;

  String? fundingSubCategory;

  double? projectCost;

  String? fundingNote;

  List<String>? projectImageAttachments;

  List<String>? projectPDFAttachments;

  List<_i3.AWSPlaces>? physicalLocations;

  List<String>? virtualLocations;

  String? projectVideoUrl;

  DateTime? dateCreated;

  DateTime? updatedAt;

  List<_i4.ProjectRepost>? repost;

  List<int>? likedBy;

  List<int>? repostedBy;

  List<int>? reviewedBy;

  List<int>? verifiedBy;

  List<int>? bookmarkedBy;

  List<int>? vettedBy;

  double? overallRating;

  double? overallLocationRating;

  double? overallDescriptionRating;

  double? overallDatesRating;

  double? overallAttachmentsRating;

  double? overAllCategoryRating;

  double? overallFundingRating;

  bool? isDeleted;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [Project]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  Project copyWith({
    int? id,
    int? ownerId,
    _i2.UserRecord? owner,
    String? title,
    String? description,
    String? projectCategory,
    String? projectSubCategory,
    DateTime? startDate,
    DateTime? endDate,
    String? currency,
    String? fundingCategory,
    String? fundingSubCategory,
    double? projectCost,
    String? fundingNote,
    List<String>? projectImageAttachments,
    List<String>? projectPDFAttachments,
    List<_i3.AWSPlaces>? physicalLocations,
    List<String>? virtualLocations,
    String? projectVideoUrl,
    DateTime? dateCreated,
    DateTime? updatedAt,
    List<_i4.ProjectRepost>? repost,
    List<int>? likedBy,
    List<int>? repostedBy,
    List<int>? reviewedBy,
    List<int>? verifiedBy,
    List<int>? bookmarkedBy,
    List<int>? vettedBy,
    double? overallRating,
    double? overallLocationRating,
    double? overallDescriptionRating,
    double? overallDatesRating,
    double? overallAttachmentsRating,
    double? overAllCategoryRating,
    double? overallFundingRating,
    bool? isDeleted,
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
      if (startDate != null) 'startDate': startDate?.toJson(),
      if (endDate != null) 'endDate': endDate?.toJson(),
      if (currency != null) 'currency': currency,
      if (fundingCategory != null) 'fundingCategory': fundingCategory,
      if (fundingSubCategory != null) 'fundingSubCategory': fundingSubCategory,
      if (projectCost != null) 'projectCost': projectCost,
      if (fundingNote != null) 'fundingNote': fundingNote,
      if (projectImageAttachments != null)
        'projectImageAttachments': projectImageAttachments?.toJson(),
      if (projectPDFAttachments != null)
        'projectPDFAttachments': projectPDFAttachments?.toJson(),
      if (physicalLocations != null)
        'physicalLocations':
            physicalLocations?.toJson(valueToJson: (v) => v.toJson()),
      if (virtualLocations != null)
        'virtualLocations': virtualLocations?.toJson(),
      if (projectVideoUrl != null) 'projectVideoUrl': projectVideoUrl,
      if (dateCreated != null) 'dateCreated': dateCreated?.toJson(),
      if (updatedAt != null) 'updatedAt': updatedAt?.toJson(),
      if (repost != null)
        'repost': repost?.toJson(valueToJson: (v) => v.toJson()),
      if (likedBy != null) 'likedBy': likedBy?.toJson(),
      if (repostedBy != null) 'repostedBy': repostedBy?.toJson(),
      if (reviewedBy != null) 'reviewedBy': reviewedBy?.toJson(),
      if (verifiedBy != null) 'verifiedBy': verifiedBy?.toJson(),
      if (bookmarkedBy != null) 'bookmarkedBy': bookmarkedBy?.toJson(),
      if (vettedBy != null) 'vettedBy': vettedBy?.toJson(),
      if (overallRating != null) 'overallRating': overallRating,
      if (overallLocationRating != null)
        'overallLocationRating': overallLocationRating,
      if (overallDescriptionRating != null)
        'overallDescriptionRating': overallDescriptionRating,
      if (overallDatesRating != null) 'overallDatesRating': overallDatesRating,
      if (overallAttachmentsRating != null)
        'overallAttachmentsRating': overallAttachmentsRating,
      if (overAllCategoryRating != null)
        'overAllCategoryRating': overAllCategoryRating,
      if (overallFundingRating != null)
        'overallFundingRating': overallFundingRating,
      if (isDeleted != null) 'isDeleted': isDeleted,
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
      if (startDate != null) 'startDate': startDate?.toJson(),
      if (endDate != null) 'endDate': endDate?.toJson(),
      if (currency != null) 'currency': currency,
      if (fundingCategory != null) 'fundingCategory': fundingCategory,
      if (fundingSubCategory != null) 'fundingSubCategory': fundingSubCategory,
      if (projectCost != null) 'projectCost': projectCost,
      if (fundingNote != null) 'fundingNote': fundingNote,
      if (projectImageAttachments != null)
        'projectImageAttachments': projectImageAttachments?.toJson(),
      if (projectPDFAttachments != null)
        'projectPDFAttachments': projectPDFAttachments?.toJson(),
      if (physicalLocations != null)
        'physicalLocations': physicalLocations?.toJson(
            valueToJson: (v) => v.toJsonForProtocol()),
      if (virtualLocations != null)
        'virtualLocations': virtualLocations?.toJson(),
      if (projectVideoUrl != null) 'projectVideoUrl': projectVideoUrl,
      if (dateCreated != null) 'dateCreated': dateCreated?.toJson(),
      if (updatedAt != null) 'updatedAt': updatedAt?.toJson(),
      if (repost != null)
        'repost': repost?.toJson(valueToJson: (v) => v.toJsonForProtocol()),
      if (likedBy != null) 'likedBy': likedBy?.toJson(),
      if (repostedBy != null) 'repostedBy': repostedBy?.toJson(),
      if (reviewedBy != null) 'reviewedBy': reviewedBy?.toJson(),
      if (verifiedBy != null) 'verifiedBy': verifiedBy?.toJson(),
      if (bookmarkedBy != null) 'bookmarkedBy': bookmarkedBy?.toJson(),
      if (vettedBy != null) 'vettedBy': vettedBy?.toJson(),
      if (overallRating != null) 'overallRating': overallRating,
      if (overallLocationRating != null)
        'overallLocationRating': overallLocationRating,
      if (overallDescriptionRating != null)
        'overallDescriptionRating': overallDescriptionRating,
      if (overallDatesRating != null) 'overallDatesRating': overallDatesRating,
      if (overallAttachmentsRating != null)
        'overallAttachmentsRating': overallAttachmentsRating,
      if (overAllCategoryRating != null)
        'overAllCategoryRating': overAllCategoryRating,
      if (overallFundingRating != null)
        'overallFundingRating': overallFundingRating,
      if (isDeleted != null) 'isDeleted': isDeleted,
    };
  }

  static ProjectInclude include({
    _i2.UserRecordInclude? owner,
    _i4.ProjectRepostIncludeList? repost,
  }) {
    return ProjectInclude._(
      owner: owner,
      repost: repost,
    );
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
    DateTime? startDate,
    DateTime? endDate,
    String? currency,
    String? fundingCategory,
    String? fundingSubCategory,
    double? projectCost,
    String? fundingNote,
    List<String>? projectImageAttachments,
    List<String>? projectPDFAttachments,
    List<_i3.AWSPlaces>? physicalLocations,
    List<String>? virtualLocations,
    String? projectVideoUrl,
    DateTime? dateCreated,
    DateTime? updatedAt,
    List<_i4.ProjectRepost>? repost,
    List<int>? likedBy,
    List<int>? repostedBy,
    List<int>? reviewedBy,
    List<int>? verifiedBy,
    List<int>? bookmarkedBy,
    List<int>? vettedBy,
    double? overallRating,
    double? overallLocationRating,
    double? overallDescriptionRating,
    double? overallDatesRating,
    double? overallAttachmentsRating,
    double? overAllCategoryRating,
    double? overallFundingRating,
    bool? isDeleted,
  }) : super._(
          id: id,
          ownerId: ownerId,
          owner: owner,
          title: title,
          description: description,
          projectCategory: projectCategory,
          projectSubCategory: projectSubCategory,
          startDate: startDate,
          endDate: endDate,
          currency: currency,
          fundingCategory: fundingCategory,
          fundingSubCategory: fundingSubCategory,
          projectCost: projectCost,
          fundingNote: fundingNote,
          projectImageAttachments: projectImageAttachments,
          projectPDFAttachments: projectPDFAttachments,
          physicalLocations: physicalLocations,
          virtualLocations: virtualLocations,
          projectVideoUrl: projectVideoUrl,
          dateCreated: dateCreated,
          updatedAt: updatedAt,
          repost: repost,
          likedBy: likedBy,
          repostedBy: repostedBy,
          reviewedBy: reviewedBy,
          verifiedBy: verifiedBy,
          bookmarkedBy: bookmarkedBy,
          vettedBy: vettedBy,
          overallRating: overallRating,
          overallLocationRating: overallLocationRating,
          overallDescriptionRating: overallDescriptionRating,
          overallDatesRating: overallDatesRating,
          overallAttachmentsRating: overallAttachmentsRating,
          overAllCategoryRating: overAllCategoryRating,
          overallFundingRating: overallFundingRating,
          isDeleted: isDeleted,
        );

  /// Returns a shallow copy of this [Project]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  Project copyWith({
    Object? id = _Undefined,
    int? ownerId,
    Object? owner = _Undefined,
    Object? title = _Undefined,
    Object? description = _Undefined,
    Object? projectCategory = _Undefined,
    Object? projectSubCategory = _Undefined,
    Object? startDate = _Undefined,
    Object? endDate = _Undefined,
    Object? currency = _Undefined,
    Object? fundingCategory = _Undefined,
    Object? fundingSubCategory = _Undefined,
    Object? projectCost = _Undefined,
    Object? fundingNote = _Undefined,
    Object? projectImageAttachments = _Undefined,
    Object? projectPDFAttachments = _Undefined,
    Object? physicalLocations = _Undefined,
    Object? virtualLocations = _Undefined,
    Object? projectVideoUrl = _Undefined,
    Object? dateCreated = _Undefined,
    Object? updatedAt = _Undefined,
    Object? repost = _Undefined,
    Object? likedBy = _Undefined,
    Object? repostedBy = _Undefined,
    Object? reviewedBy = _Undefined,
    Object? verifiedBy = _Undefined,
    Object? bookmarkedBy = _Undefined,
    Object? vettedBy = _Undefined,
    Object? overallRating = _Undefined,
    Object? overallLocationRating = _Undefined,
    Object? overallDescriptionRating = _Undefined,
    Object? overallDatesRating = _Undefined,
    Object? overallAttachmentsRating = _Undefined,
    Object? overAllCategoryRating = _Undefined,
    Object? overallFundingRating = _Undefined,
    Object? isDeleted = _Undefined,
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
      startDate: startDate is DateTime? ? startDate : this.startDate,
      endDate: endDate is DateTime? ? endDate : this.endDate,
      currency: currency is String? ? currency : this.currency,
      fundingCategory:
          fundingCategory is String? ? fundingCategory : this.fundingCategory,
      fundingSubCategory: fundingSubCategory is String?
          ? fundingSubCategory
          : this.fundingSubCategory,
      projectCost: projectCost is double? ? projectCost : this.projectCost,
      fundingNote: fundingNote is String? ? fundingNote : this.fundingNote,
      projectImageAttachments: projectImageAttachments is List<String>?
          ? projectImageAttachments
          : this.projectImageAttachments?.map((e0) => e0).toList(),
      projectPDFAttachments: projectPDFAttachments is List<String>?
          ? projectPDFAttachments
          : this.projectPDFAttachments?.map((e0) => e0).toList(),
      physicalLocations: physicalLocations is List<_i3.AWSPlaces>?
          ? physicalLocations
          : this.physicalLocations?.map((e0) => e0.copyWith()).toList(),
      virtualLocations: virtualLocations is List<String>?
          ? virtualLocations
          : this.virtualLocations?.map((e0) => e0).toList(),
      projectVideoUrl:
          projectVideoUrl is String? ? projectVideoUrl : this.projectVideoUrl,
      dateCreated: dateCreated is DateTime? ? dateCreated : this.dateCreated,
      updatedAt: updatedAt is DateTime? ? updatedAt : this.updatedAt,
      repost: repost is List<_i4.ProjectRepost>?
          ? repost
          : this.repost?.map((e0) => e0.copyWith()).toList(),
      likedBy: likedBy is List<int>?
          ? likedBy
          : this.likedBy?.map((e0) => e0).toList(),
      repostedBy: repostedBy is List<int>?
          ? repostedBy
          : this.repostedBy?.map((e0) => e0).toList(),
      reviewedBy: reviewedBy is List<int>?
          ? reviewedBy
          : this.reviewedBy?.map((e0) => e0).toList(),
      verifiedBy: verifiedBy is List<int>?
          ? verifiedBy
          : this.verifiedBy?.map((e0) => e0).toList(),
      bookmarkedBy: bookmarkedBy is List<int>?
          ? bookmarkedBy
          : this.bookmarkedBy?.map((e0) => e0).toList(),
      vettedBy: vettedBy is List<int>?
          ? vettedBy
          : this.vettedBy?.map((e0) => e0).toList(),
      overallRating:
          overallRating is double? ? overallRating : this.overallRating,
      overallLocationRating: overallLocationRating is double?
          ? overallLocationRating
          : this.overallLocationRating,
      overallDescriptionRating: overallDescriptionRating is double?
          ? overallDescriptionRating
          : this.overallDescriptionRating,
      overallDatesRating: overallDatesRating is double?
          ? overallDatesRating
          : this.overallDatesRating,
      overallAttachmentsRating: overallAttachmentsRating is double?
          ? overallAttachmentsRating
          : this.overallAttachmentsRating,
      overAllCategoryRating: overAllCategoryRating is double?
          ? overAllCategoryRating
          : this.overAllCategoryRating,
      overallFundingRating: overallFundingRating is double?
          ? overallFundingRating
          : this.overallFundingRating,
      isDeleted: isDeleted is bool? ? isDeleted : this.isDeleted,
    );
  }
}

class ProjectTable extends _i1.Table<int?> {
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
    physicalLocations = _i1.ColumnSerializable(
      'physicalLocations',
      this,
    );
    virtualLocations = _i1.ColumnSerializable(
      'virtualLocations',
      this,
    );
    projectVideoUrl = _i1.ColumnString(
      'projectVideoUrl',
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
    likedBy = _i1.ColumnSerializable(
      'likedBy',
      this,
    );
    repostedBy = _i1.ColumnSerializable(
      'repostedBy',
      this,
    );
    reviewedBy = _i1.ColumnSerializable(
      'reviewedBy',
      this,
    );
    verifiedBy = _i1.ColumnSerializable(
      'verifiedBy',
      this,
    );
    bookmarkedBy = _i1.ColumnSerializable(
      'bookmarkedBy',
      this,
    );
    vettedBy = _i1.ColumnSerializable(
      'vettedBy',
      this,
    );
    overallRating = _i1.ColumnDouble(
      'overallRating',
      this,
    );
    overallLocationRating = _i1.ColumnDouble(
      'overallLocationRating',
      this,
    );
    overallDescriptionRating = _i1.ColumnDouble(
      'overallDescriptionRating',
      this,
    );
    overallDatesRating = _i1.ColumnDouble(
      'overallDatesRating',
      this,
    );
    overallAttachmentsRating = _i1.ColumnDouble(
      'overallAttachmentsRating',
      this,
    );
    overAllCategoryRating = _i1.ColumnDouble(
      'overAllCategoryRating',
      this,
    );
    overallFundingRating = _i1.ColumnDouble(
      'overallFundingRating',
      this,
    );
    isDeleted = _i1.ColumnBool(
      'isDeleted',
      this,
      hasDefault: true,
    );
  }

  late final _i1.ColumnInt ownerId;

  _i2.UserRecordTable? _owner;

  late final _i1.ColumnString title;

  late final _i1.ColumnString description;

  late final _i1.ColumnString projectCategory;

  late final _i1.ColumnString projectSubCategory;

  late final _i1.ColumnDateTime startDate;

  late final _i1.ColumnDateTime endDate;

  late final _i1.ColumnString currency;

  late final _i1.ColumnString fundingCategory;

  late final _i1.ColumnString fundingSubCategory;

  late final _i1.ColumnDouble projectCost;

  late final _i1.ColumnString fundingNote;

  late final _i1.ColumnSerializable projectImageAttachments;

  late final _i1.ColumnSerializable projectPDFAttachments;

  late final _i1.ColumnSerializable physicalLocations;

  late final _i1.ColumnSerializable virtualLocations;

  late final _i1.ColumnString projectVideoUrl;

  late final _i1.ColumnDateTime dateCreated;

  late final _i1.ColumnDateTime updatedAt;

  _i4.ProjectRepostTable? ___repost;

  _i1.ManyRelation<_i4.ProjectRepostTable>? _repost;

  late final _i1.ColumnSerializable likedBy;

  late final _i1.ColumnSerializable repostedBy;

  late final _i1.ColumnSerializable reviewedBy;

  late final _i1.ColumnSerializable verifiedBy;

  late final _i1.ColumnSerializable bookmarkedBy;

  late final _i1.ColumnSerializable vettedBy;

  late final _i1.ColumnDouble overallRating;

  late final _i1.ColumnDouble overallLocationRating;

  late final _i1.ColumnDouble overallDescriptionRating;

  late final _i1.ColumnDouble overallDatesRating;

  late final _i1.ColumnDouble overallAttachmentsRating;

  late final _i1.ColumnDouble overAllCategoryRating;

  late final _i1.ColumnDouble overallFundingRating;

  late final _i1.ColumnBool isDeleted;

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

  _i4.ProjectRepostTable get __repost {
    if (___repost != null) return ___repost!;
    ___repost = _i1.createRelationTable(
      relationFieldName: '__repost',
      field: Project.t.id,
      foreignField: _i4.ProjectRepost.t.projectId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i4.ProjectRepostTable(tableRelation: foreignTableRelation),
    );
    return ___repost!;
  }

  _i1.ManyRelation<_i4.ProjectRepostTable> get repost {
    if (_repost != null) return _repost!;
    var relationTable = _i1.createRelationTable(
      relationFieldName: 'repost',
      field: Project.t.id,
      foreignField: _i4.ProjectRepost.t.projectId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i4.ProjectRepostTable(tableRelation: foreignTableRelation),
    );
    _repost = _i1.ManyRelation<_i4.ProjectRepostTable>(
      tableWithRelations: relationTable,
      table: _i4.ProjectRepostTable(
          tableRelation: relationTable.tableRelation!.lastRelation),
    );
    return _repost!;
  }

  @override
  List<_i1.Column> get columns => [
        id,
        ownerId,
        title,
        description,
        projectCategory,
        projectSubCategory,
        startDate,
        endDate,
        currency,
        fundingCategory,
        fundingSubCategory,
        projectCost,
        fundingNote,
        projectImageAttachments,
        projectPDFAttachments,
        physicalLocations,
        virtualLocations,
        projectVideoUrl,
        dateCreated,
        updatedAt,
        likedBy,
        repostedBy,
        reviewedBy,
        verifiedBy,
        bookmarkedBy,
        vettedBy,
        overallRating,
        overallLocationRating,
        overallDescriptionRating,
        overallDatesRating,
        overallAttachmentsRating,
        overAllCategoryRating,
        overallFundingRating,
        isDeleted,
      ];

  @override
  _i1.Table? getRelationTable(String relationField) {
    if (relationField == 'owner') {
      return owner;
    }
    if (relationField == 'repost') {
      return __repost;
    }
    return null;
  }
}

class ProjectInclude extends _i1.IncludeObject {
  ProjectInclude._({
    _i2.UserRecordInclude? owner,
    _i4.ProjectRepostIncludeList? repost,
  }) {
    _owner = owner;
    _repost = repost;
  }

  _i2.UserRecordInclude? _owner;

  _i4.ProjectRepostIncludeList? _repost;

  @override
  Map<String, _i1.Include?> get includes => {
        'owner': _owner,
        'repost': _repost,
      };

  @override
  _i1.Table<int?> get table => Project.t;
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
  _i1.Table<int?> get table => Project.t;
}

class ProjectRepository {
  const ProjectRepository._();

  final attach = const ProjectAttachRepository._();

  final attachRow = const ProjectAttachRowRepository._();

  final detach = const ProjectDetachRepository._();

  final detachRow = const ProjectDetachRowRepository._();

  /// Returns a list of [Project]s matching the given query parameters.
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

  /// Returns the first matching [Project] matching the given query parameters.
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

  /// Finds a single [Project] by its [id] or null if no such row exists.
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

  /// Inserts all [Project]s in the list and returns the inserted rows.
  ///
  /// The returned [Project]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
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

  /// Inserts a single [Project] and returns the inserted row.
  ///
  /// The returned [Project] will have its `id` field set.
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

  /// Updates all [Project]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
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

  /// Updates a single [Project]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
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

  /// Deletes all [Project]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
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

  /// Deletes a single [Project].
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

  /// Deletes all rows matching the [where] expression.
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

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
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

class ProjectAttachRepository {
  const ProjectAttachRepository._();

  /// Creates a relation between this [Project] and the given [ProjectRepost]s
  /// by setting each [ProjectRepost]'s foreign key `projectId` to refer to this [Project].
  Future<void> repost(
    _i1.Session session,
    Project project,
    List<_i4.ProjectRepost> projectRepost, {
    _i1.Transaction? transaction,
  }) async {
    if (projectRepost.any((e) => e.id == null)) {
      throw ArgumentError.notNull('projectRepost.id');
    }
    if (project.id == null) {
      throw ArgumentError.notNull('project.id');
    }

    var $projectRepost =
        projectRepost.map((e) => e.copyWith(projectId: project.id)).toList();
    await session.db.update<_i4.ProjectRepost>(
      $projectRepost,
      columns: [_i4.ProjectRepost.t.projectId],
      transaction: transaction,
    );
  }
}

class ProjectAttachRowRepository {
  const ProjectAttachRowRepository._();

  /// Creates a relation between the given [Project] and [UserRecord]
  /// by setting the [Project]'s foreign key `ownerId` to refer to the [UserRecord].
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

  /// Creates a relation between this [Project] and the given [ProjectRepost]
  /// by setting the [ProjectRepost]'s foreign key `projectId` to refer to this [Project].
  Future<void> repost(
    _i1.Session session,
    Project project,
    _i4.ProjectRepost projectRepost, {
    _i1.Transaction? transaction,
  }) async {
    if (projectRepost.id == null) {
      throw ArgumentError.notNull('projectRepost.id');
    }
    if (project.id == null) {
      throw ArgumentError.notNull('project.id');
    }

    var $projectRepost = projectRepost.copyWith(projectId: project.id);
    await session.db.updateRow<_i4.ProjectRepost>(
      $projectRepost,
      columns: [_i4.ProjectRepost.t.projectId],
      transaction: transaction,
    );
  }
}

class ProjectDetachRepository {
  const ProjectDetachRepository._();

  /// Detaches the relation between this [Project] and the given [ProjectRepost]
  /// by setting the [ProjectRepost]'s foreign key `projectId` to `null`.
  ///
  /// This removes the association between the two models without deleting
  /// the related record.
  Future<void> repost(
    _i1.Session session,
    List<_i4.ProjectRepost> projectRepost, {
    _i1.Transaction? transaction,
  }) async {
    if (projectRepost.any((e) => e.id == null)) {
      throw ArgumentError.notNull('projectRepost.id');
    }

    var $projectRepost =
        projectRepost.map((e) => e.copyWith(projectId: null)).toList();
    await session.db.update<_i4.ProjectRepost>(
      $projectRepost,
      columns: [_i4.ProjectRepost.t.projectId],
      transaction: transaction,
    );
  }
}

class ProjectDetachRowRepository {
  const ProjectDetachRowRepository._();

  /// Detaches the relation between this [Project] and the given [ProjectRepost]
  /// by setting the [ProjectRepost]'s foreign key `projectId` to `null`.
  ///
  /// This removes the association between the two models without deleting
  /// the related record.
  Future<void> repost(
    _i1.Session session,
    _i4.ProjectRepost projectRepost, {
    _i1.Transaction? transaction,
  }) async {
    if (projectRepost.id == null) {
      throw ArgumentError.notNull('projectRepost.id');
    }

    var $projectRepost = projectRepost.copyWith(projectId: null);
    await session.db.updateRow<_i4.ProjectRepost>(
      $projectRepost,
      columns: [_i4.ProjectRepost.t.projectId],
      transaction: transaction,
    );
  }
}
