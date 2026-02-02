/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters
// ignore_for_file: invalid_use_of_internal_member

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;
import '../user/user_record.dart' as _i2;
import '../media/media_asset.dart' as _i3;
import '../general/aws_places.dart' as _i4;
import 'package:civic_client/src/protocol/protocol.dart' as _i5;

abstract class Project implements _i1.SerializableModel {
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
    String? fundingCategory,
    String? fundingSubCategory,
    double? projectCost,
    String? fundingNote,
    this.projectMediaAssets,
    this.physicalLocations,
    this.virtualLocations,
    DateTime? dateCreated,
    this.updatedAt,
    int? impressionsCount,
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
    DateTime? lastImpressionAt,
  }) : fundingCategory = fundingCategory ?? '',
       fundingSubCategory = fundingSubCategory ?? '',
       projectCost = projectCost ?? 0.0,
       fundingNote = fundingNote ?? '',
       dateCreated = dateCreated ?? DateTime.now(),
       impressionsCount = impressionsCount ?? 0,
       likesCount = likesCount ?? 0,
       reviewsCount = reviewsCount ?? 0,
       bookmarksCount = bookmarksCount ?? 0,
       vettingsCount = vettingsCount ?? 0,
       quotesCount = quotesCount ?? 0,
       overallRating = overallRating ?? 0.0,
       overallLocationRating = overallLocationRating ?? 0.0,
       overallDescriptionRating = overallDescriptionRating ?? 0.0,
       overallDatesRating = overallDatesRating ?? 0.0,
       overallAttachmentsRating = overallAttachmentsRating ?? 0.0,
       overAllCategoryRating = overAllCategoryRating ?? 0.0,
       overallFundingRating = overallFundingRating ?? 0.0,
       isDeleted = isDeleted ?? false,
       lastImpressionAt = lastImpressionAt ?? DateTime.now();

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
    List<_i3.MediaAsset>? projectMediaAssets,
    List<_i4.AWSPlaces>? physicalLocations,
    List<String>? virtualLocations,
    DateTime? dateCreated,
    DateTime? updatedAt,
    int? impressionsCount,
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
    DateTime? lastImpressionAt,
  }) = _ProjectImpl;

  factory Project.fromJson(Map<String, dynamic> jsonSerialization) {
    return Project(
      id: jsonSerialization['id'] as int?,
      ownerId: jsonSerialization['ownerId'] as int,
      owner: jsonSerialization['owner'] == null
          ? null
          : _i5.Protocol().deserialize<_i2.UserRecord>(
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
      projectMediaAssets: jsonSerialization['projectMediaAssets'] == null
          ? null
          : _i5.Protocol().deserialize<List<_i3.MediaAsset>>(
              jsonSerialization['projectMediaAssets'],
            ),
      physicalLocations: jsonSerialization['physicalLocations'] == null
          ? null
          : _i5.Protocol().deserialize<List<_i4.AWSPlaces>>(
              jsonSerialization['physicalLocations'],
            ),
      virtualLocations: jsonSerialization['virtualLocations'] == null
          ? null
          : _i5.Protocol().deserialize<List<String>>(
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
      impressionsCount: jsonSerialization['impressionsCount'] as int?,
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
      lastImpressionAt: jsonSerialization['lastImpressionAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(
              jsonSerialization['lastImpressionAt'],
            ),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
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

  List<_i3.MediaAsset>? projectMediaAssets;

  List<_i4.AWSPlaces>? physicalLocations;

  List<String>? virtualLocations;

  DateTime? dateCreated;

  DateTime? updatedAt;

  int? impressionsCount;

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

  DateTime? lastImpressionAt;

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
    List<_i3.MediaAsset>? projectMediaAssets,
    List<_i4.AWSPlaces>? physicalLocations,
    List<String>? virtualLocations,
    DateTime? dateCreated,
    DateTime? updatedAt,
    int? impressionsCount,
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
    DateTime? lastImpressionAt,
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
      if (projectMediaAssets != null)
        'projectMediaAssets': projectMediaAssets?.toJson(
          valueToJson: (v) => v.toJson(),
        ),
      if (physicalLocations != null)
        'physicalLocations': physicalLocations?.toJson(
          valueToJson: (v) => v.toJson(),
        ),
      if (virtualLocations != null)
        'virtualLocations': virtualLocations?.toJson(),
      if (dateCreated != null) 'dateCreated': dateCreated?.toJson(),
      if (updatedAt != null) 'updatedAt': updatedAt?.toJson(),
      if (impressionsCount != null) 'impressionsCount': impressionsCount,
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
      if (lastImpressionAt != null)
        'lastImpressionAt': lastImpressionAt?.toJson(),
    };
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
    List<_i3.MediaAsset>? projectMediaAssets,
    List<_i4.AWSPlaces>? physicalLocations,
    List<String>? virtualLocations,
    DateTime? dateCreated,
    DateTime? updatedAt,
    int? impressionsCount,
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
    DateTime? lastImpressionAt,
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
         projectMediaAssets: projectMediaAssets,
         physicalLocations: physicalLocations,
         virtualLocations: virtualLocations,
         dateCreated: dateCreated,
         updatedAt: updatedAt,
         impressionsCount: impressionsCount,
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
         lastImpressionAt: lastImpressionAt,
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
    Object? projectMediaAssets = _Undefined,
    Object? physicalLocations = _Undefined,
    Object? virtualLocations = _Undefined,
    Object? dateCreated = _Undefined,
    Object? updatedAt = _Undefined,
    Object? impressionsCount = _Undefined,
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
    Object? lastImpressionAt = _Undefined,
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
      projectMediaAssets: projectMediaAssets is List<_i3.MediaAsset>?
          ? projectMediaAssets
          : this.projectMediaAssets?.map((e0) => e0.copyWith()).toList(),
      physicalLocations: physicalLocations is List<_i4.AWSPlaces>?
          ? physicalLocations
          : this.physicalLocations?.map((e0) => e0.copyWith()).toList(),
      virtualLocations: virtualLocations is List<String>?
          ? virtualLocations
          : this.virtualLocations?.map((e0) => e0).toList(),
      dateCreated: dateCreated is DateTime? ? dateCreated : this.dateCreated,
      updatedAt: updatedAt is DateTime? ? updatedAt : this.updatedAt,
      impressionsCount: impressionsCount is int?
          ? impressionsCount
          : this.impressionsCount,
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
      lastImpressionAt: lastImpressionAt is DateTime?
          ? lastImpressionAt
          : this.lastImpressionAt,
    );
  }
}
