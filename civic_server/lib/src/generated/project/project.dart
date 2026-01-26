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
import '../general/aws_places.dart' as _i3;
import 'package:civic_server/src/generated/protocol.dart' as _i4;

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
    DateTime? dateCreated,
    this.updatedAt,
    int? likesCount,
    int? reviewsCount,
    int? bookmarksCount,
    int? vettingsCount,
    int? quotesCount,
    this.overallRating,
    this.overallLocationRating,
    this.overallDescriptionRating,
    this.overallDatesRating,
    this.overallAttachmentsRating,
    this.overAllCategoryRating,
    this.overallFundingRating,
    bool? isDeleted,
  }) : dateCreated = dateCreated ?? DateTime.now(),
       likesCount = likesCount ?? 0,
       reviewsCount = reviewsCount ?? 0,
       bookmarksCount = bookmarksCount ?? 0,
       vettingsCount = vettingsCount ?? 0,
       quotesCount = quotesCount ?? 0,
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
    DateTime? dateCreated,
    DateTime? updatedAt,
    int? likesCount,
    int? reviewsCount,
    int? bookmarksCount,
    int? vettingsCount,
    int? quotesCount,
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
          : _i4.Protocol().deserialize<_i2.UserRecord>(
              jsonSerialization['owner'],
            ),
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
          jsonSerialization['projectImageAttachments'] == null
          ? null
          : _i4.Protocol().deserialize<List<String>>(
              jsonSerialization['projectImageAttachments'],
            ),
      projectPDFAttachments: jsonSerialization['projectPDFAttachments'] == null
          ? null
          : _i4.Protocol().deserialize<List<String>>(
              jsonSerialization['projectPDFAttachments'],
            ),
      physicalLocations: jsonSerialization['physicalLocations'] == null
          ? null
          : _i4.Protocol().deserialize<List<_i3.AWSPlaces>>(
              jsonSerialization['physicalLocations'],
            ),
      virtualLocations: jsonSerialization['virtualLocations'] == null
          ? null
          : _i4.Protocol().deserialize<List<String>>(
              jsonSerialization['virtualLocations'],
            ),
      dateCreated: jsonSerialization['dateCreated'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(
              jsonSerialization['dateCreated'],
            ),
      updatedAt: jsonSerialization['updatedAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['updatedAt']),
      likesCount: jsonSerialization['likesCount'] as int?,
      reviewsCount: jsonSerialization['reviewsCount'] as int?,
      bookmarksCount: jsonSerialization['bookmarksCount'] as int?,
      vettingsCount: jsonSerialization['vettingsCount'] as int?,
      quotesCount: jsonSerialization['quotesCount'] as int?,
      overallRating: (jsonSerialization['overallRating'] as num?)?.toDouble(),
      overallLocationRating:
          (jsonSerialization['overallLocationRating'] as num?)?.toDouble(),
      overallDescriptionRating:
          (jsonSerialization['overallDescriptionRating'] as num?)?.toDouble(),
      overallDatesRating: (jsonSerialization['overallDatesRating'] as num?)
          ?.toDouble(),
      overallAttachmentsRating:
          (jsonSerialization['overallAttachmentsRating'] as num?)?.toDouble(),
      overAllCategoryRating:
          (jsonSerialization['overAllCategoryRating'] as num?)?.toDouble(),
      overallFundingRating: (jsonSerialization['overallFundingRating'] as num?)
          ?.toDouble(),
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

  DateTime? dateCreated;

  DateTime? updatedAt;

  int? likesCount;

  int? reviewsCount;

  int? bookmarksCount;

  int? vettingsCount;

  int? quotesCount;

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
    DateTime? dateCreated,
    DateTime? updatedAt,
    int? likesCount,
    int? reviewsCount,
    int? bookmarksCount,
    int? vettingsCount,
    int? quotesCount,
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
      '__className__': 'Project',
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
        'physicalLocations': physicalLocations?.toJson(
          valueToJson: (v) => v.toJson(),
        ),
      if (virtualLocations != null)
        'virtualLocations': virtualLocations?.toJson(),
      if (dateCreated != null) 'dateCreated': dateCreated?.toJson(),
      if (updatedAt != null) 'updatedAt': updatedAt?.toJson(),
      if (likesCount != null) 'likesCount': likesCount,
      if (reviewsCount != null) 'reviewsCount': reviewsCount,
      if (bookmarksCount != null) 'bookmarksCount': bookmarksCount,
      if (vettingsCount != null) 'vettingsCount': vettingsCount,
      if (quotesCount != null) 'quotesCount': quotesCount,
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
      '__className__': 'Project',
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
          valueToJson: (v) => v.toJsonForProtocol(),
        ),
      if (virtualLocations != null)
        'virtualLocations': virtualLocations?.toJson(),
      if (dateCreated != null) 'dateCreated': dateCreated?.toJson(),
      if (updatedAt != null) 'updatedAt': updatedAt?.toJson(),
      if (likesCount != null) 'likesCount': likesCount,
      if (reviewsCount != null) 'reviewsCount': reviewsCount,
      if (bookmarksCount != null) 'bookmarksCount': bookmarksCount,
      if (vettingsCount != null) 'vettingsCount': vettingsCount,
      if (quotesCount != null) 'quotesCount': quotesCount,
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
    DateTime? dateCreated,
    DateTime? updatedAt,
    int? likesCount,
    int? reviewsCount,
    int? bookmarksCount,
    int? vettingsCount,
    int? quotesCount,
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
         dateCreated: dateCreated,
         updatedAt: updatedAt,
         likesCount: likesCount,
         reviewsCount: reviewsCount,
         bookmarksCount: bookmarksCount,
         vettingsCount: vettingsCount,
         quotesCount: quotesCount,
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
    Object? dateCreated = _Undefined,
    Object? updatedAt = _Undefined,
    Object? likesCount = _Undefined,
    Object? reviewsCount = _Undefined,
    Object? bookmarksCount = _Undefined,
    Object? vettingsCount = _Undefined,
    Object? quotesCount = _Undefined,
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
      projectCategory: projectCategory is String?
          ? projectCategory
          : this.projectCategory,
      projectSubCategory: projectSubCategory is String?
          ? projectSubCategory
          : this.projectSubCategory,
      startDate: startDate is DateTime? ? startDate : this.startDate,
      endDate: endDate is DateTime? ? endDate : this.endDate,
      currency: currency is String? ? currency : this.currency,
      fundingCategory: fundingCategory is String?
          ? fundingCategory
          : this.fundingCategory,
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
      dateCreated: dateCreated is DateTime? ? dateCreated : this.dateCreated,
      updatedAt: updatedAt is DateTime? ? updatedAt : this.updatedAt,
      likesCount: likesCount is int? ? likesCount : this.likesCount,
      reviewsCount: reviewsCount is int? ? reviewsCount : this.reviewsCount,
      bookmarksCount: bookmarksCount is int?
          ? bookmarksCount
          : this.bookmarksCount,
      vettingsCount: vettingsCount is int? ? vettingsCount : this.vettingsCount,
      quotesCount: quotesCount is int? ? quotesCount : this.quotesCount,
      overallRating: overallRating is double?
          ? overallRating
          : this.overallRating,
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

class ProjectUpdateTable extends _i1.UpdateTable<ProjectTable> {
  ProjectUpdateTable(super.table);

  _i1.ColumnValue<int, int> ownerId(int value) => _i1.ColumnValue(
    table.ownerId,
    value,
  );

  _i1.ColumnValue<String, String> title(String? value) => _i1.ColumnValue(
    table.title,
    value,
  );

  _i1.ColumnValue<String, String> description(String? value) => _i1.ColumnValue(
    table.description,
    value,
  );

  _i1.ColumnValue<String, String> projectCategory(String? value) =>
      _i1.ColumnValue(
        table.projectCategory,
        value,
      );

  _i1.ColumnValue<String, String> projectSubCategory(String? value) =>
      _i1.ColumnValue(
        table.projectSubCategory,
        value,
      );

  _i1.ColumnValue<DateTime, DateTime> startDate(DateTime? value) =>
      _i1.ColumnValue(
        table.startDate,
        value,
      );

  _i1.ColumnValue<DateTime, DateTime> endDate(DateTime? value) =>
      _i1.ColumnValue(
        table.endDate,
        value,
      );

  _i1.ColumnValue<String, String> currency(String? value) => _i1.ColumnValue(
    table.currency,
    value,
  );

  _i1.ColumnValue<String, String> fundingCategory(String? value) =>
      _i1.ColumnValue(
        table.fundingCategory,
        value,
      );

  _i1.ColumnValue<String, String> fundingSubCategory(String? value) =>
      _i1.ColumnValue(
        table.fundingSubCategory,
        value,
      );

  _i1.ColumnValue<double, double> projectCost(double? value) => _i1.ColumnValue(
    table.projectCost,
    value,
  );

  _i1.ColumnValue<String, String> fundingNote(String? value) => _i1.ColumnValue(
    table.fundingNote,
    value,
  );

  _i1.ColumnValue<List<String>, List<String>> projectImageAttachments(
    List<String>? value,
  ) => _i1.ColumnValue(
    table.projectImageAttachments,
    value,
  );

  _i1.ColumnValue<List<String>, List<String>> projectPDFAttachments(
    List<String>? value,
  ) => _i1.ColumnValue(
    table.projectPDFAttachments,
    value,
  );

  _i1.ColumnValue<List<_i3.AWSPlaces>, List<_i3.AWSPlaces>> physicalLocations(
    List<_i3.AWSPlaces>? value,
  ) => _i1.ColumnValue(
    table.physicalLocations,
    value,
  );

  _i1.ColumnValue<List<String>, List<String>> virtualLocations(
    List<String>? value,
  ) => _i1.ColumnValue(
    table.virtualLocations,
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

  _i1.ColumnValue<int, int> reviewsCount(int? value) => _i1.ColumnValue(
    table.reviewsCount,
    value,
  );

  _i1.ColumnValue<int, int> bookmarksCount(int? value) => _i1.ColumnValue(
    table.bookmarksCount,
    value,
  );

  _i1.ColumnValue<int, int> vettingsCount(int? value) => _i1.ColumnValue(
    table.vettingsCount,
    value,
  );

  _i1.ColumnValue<int, int> quotesCount(int? value) => _i1.ColumnValue(
    table.quotesCount,
    value,
  );

  _i1.ColumnValue<double, double> overallRating(double? value) =>
      _i1.ColumnValue(
        table.overallRating,
        value,
      );

  _i1.ColumnValue<double, double> overallLocationRating(double? value) =>
      _i1.ColumnValue(
        table.overallLocationRating,
        value,
      );

  _i1.ColumnValue<double, double> overallDescriptionRating(double? value) =>
      _i1.ColumnValue(
        table.overallDescriptionRating,
        value,
      );

  _i1.ColumnValue<double, double> overallDatesRating(double? value) =>
      _i1.ColumnValue(
        table.overallDatesRating,
        value,
      );

  _i1.ColumnValue<double, double> overallAttachmentsRating(double? value) =>
      _i1.ColumnValue(
        table.overallAttachmentsRating,
        value,
      );

  _i1.ColumnValue<double, double> overAllCategoryRating(double? value) =>
      _i1.ColumnValue(
        table.overAllCategoryRating,
        value,
      );

  _i1.ColumnValue<double, double> overallFundingRating(double? value) =>
      _i1.ColumnValue(
        table.overallFundingRating,
        value,
      );

  _i1.ColumnValue<bool, bool> isDeleted(bool? value) => _i1.ColumnValue(
    table.isDeleted,
    value,
  );
}

class ProjectTable extends _i1.Table<int?> {
  ProjectTable({super.tableRelation}) : super(tableName: 'project') {
    updateTable = ProjectUpdateTable(this);
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
    projectImageAttachments = _i1.ColumnSerializable<List<String>>(
      'projectImageAttachments',
      this,
    );
    projectPDFAttachments = _i1.ColumnSerializable<List<String>>(
      'projectPDFAttachments',
      this,
    );
    physicalLocations = _i1.ColumnSerializable<List<_i3.AWSPlaces>>(
      'physicalLocations',
      this,
    );
    virtualLocations = _i1.ColumnSerializable<List<String>>(
      'virtualLocations',
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
    likesCount = _i1.ColumnInt(
      'likesCount',
      this,
      hasDefault: true,
    );
    reviewsCount = _i1.ColumnInt(
      'reviewsCount',
      this,
      hasDefault: true,
    );
    bookmarksCount = _i1.ColumnInt(
      'bookmarksCount',
      this,
      hasDefault: true,
    );
    vettingsCount = _i1.ColumnInt(
      'vettingsCount',
      this,
      hasDefault: true,
    );
    quotesCount = _i1.ColumnInt(
      'quotesCount',
      this,
      hasDefault: true,
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

  late final ProjectUpdateTable updateTable;

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

  late final _i1.ColumnSerializable<List<String>> projectImageAttachments;

  late final _i1.ColumnSerializable<List<String>> projectPDFAttachments;

  late final _i1.ColumnSerializable<List<_i3.AWSPlaces>> physicalLocations;

  late final _i1.ColumnSerializable<List<String>> virtualLocations;

  late final _i1.ColumnDateTime dateCreated;

  late final _i1.ColumnDateTime updatedAt;

  late final _i1.ColumnInt likesCount;

  late final _i1.ColumnInt reviewsCount;

  late final _i1.ColumnInt bookmarksCount;

  late final _i1.ColumnInt vettingsCount;

  late final _i1.ColumnInt quotesCount;

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
    dateCreated,
    updatedAt,
    likesCount,
    reviewsCount,
    bookmarksCount,
    vettingsCount,
    quotesCount,
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

  final attachRow = const ProjectAttachRowRepository._();

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

  /// Updates a single [Project] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<Project?> updateById(
    _i1.Session session,
    int id, {
    required _i1.ColumnValueListBuilder<ProjectUpdateTable> columnValues,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateById<Project>(
      id,
      columnValues: columnValues(Project.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [Project]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  Future<List<Project>> updateWhere(
    _i1.Session session, {
    required _i1.ColumnValueListBuilder<ProjectUpdateTable> columnValues,
    required _i1.WhereExpressionBuilder<ProjectTable> where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<ProjectTable>? orderBy,
    _i1.OrderByListBuilder<ProjectTable>? orderByList,
    bool orderDescending = false,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateWhere<Project>(
      columnValues: columnValues(Project.t.updateTable),
      where: where(Project.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Project.t),
      orderByList: orderByList?.call(Project.t),
      orderDescending: orderDescending,
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
}
