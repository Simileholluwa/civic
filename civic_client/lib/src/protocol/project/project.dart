/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;
import '../user/user_record.dart' as _i2;
import '../general/aws_places.dart' as _i3;

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
    this.likedBy,
    int? likesCount,
    this.reviewedBy,
    int? reviewsCount,
    this.bookmarkedBy,
    int? bookmarksCount,
    this.vettedBy,
    int? vettingsCount,
    this.subscribers,
    this.quotedBy,
    int? quoteCount,
    this.overallRating,
    this.overallLocationRating,
    this.overallDescriptionRating,
    this.overallDatesRating,
    this.overallAttachmentsRating,
    this.overAllCategoryRating,
    this.overallFundingRating,
    bool? isDeleted,
  })  : dateCreated = dateCreated ?? DateTime.now(),
        likesCount = likesCount ?? 0,
        reviewsCount = reviewsCount ?? 0,
        bookmarksCount = bookmarksCount ?? 0,
        vettingsCount = vettingsCount ?? 0,
        quoteCount = quoteCount ?? 0,
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
    List<int>? likedBy,
    int? likesCount,
    List<int>? reviewedBy,
    int? reviewsCount,
    List<int>? bookmarkedBy,
    int? bookmarksCount,
    List<int>? vettedBy,
    int? vettingsCount,
    List<int>? subscribers,
    List<int>? quotedBy,
    int? quoteCount,
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
      likedBy: (jsonSerialization['likedBy'] as List?)
          ?.map((e) => e as int)
          .toList(),
      likesCount: jsonSerialization['likesCount'] as int?,
      reviewedBy: (jsonSerialization['reviewedBy'] as List?)
          ?.map((e) => e as int)
          .toList(),
      reviewsCount: jsonSerialization['reviewsCount'] as int?,
      bookmarkedBy: (jsonSerialization['bookmarkedBy'] as List?)
          ?.map((e) => e as int)
          .toList(),
      bookmarksCount: jsonSerialization['bookmarksCount'] as int?,
      vettedBy: (jsonSerialization['vettedBy'] as List?)
          ?.map((e) => e as int)
          .toList(),
      vettingsCount: jsonSerialization['vettingsCount'] as int?,
      subscribers: (jsonSerialization['subscribers'] as List?)
          ?.map((e) => e as int)
          .toList(),
      quotedBy: (jsonSerialization['quotedBy'] as List?)
          ?.map((e) => e as int)
          .toList(),
      quoteCount: jsonSerialization['quoteCount'] as int?,
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

  List<String>? projectImageAttachments;

  List<String>? projectPDFAttachments;

  List<_i3.AWSPlaces>? physicalLocations;

  List<String>? virtualLocations;

  String? projectVideoUrl;

  DateTime? dateCreated;

  DateTime? updatedAt;

  List<int>? likedBy;

  int? likesCount;

  List<int>? reviewedBy;

  int? reviewsCount;

  List<int>? bookmarkedBy;

  int? bookmarksCount;

  List<int>? vettedBy;

  int? vettingsCount;

  List<int>? subscribers;

  List<int>? quotedBy;

  int? quoteCount;

  double? overallRating;

  double? overallLocationRating;

  double? overallDescriptionRating;

  double? overallDatesRating;

  double? overallAttachmentsRating;

  double? overAllCategoryRating;

  double? overallFundingRating;

  bool? isDeleted;

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
    List<int>? likedBy,
    int? likesCount,
    List<int>? reviewedBy,
    int? reviewsCount,
    List<int>? bookmarkedBy,
    int? bookmarksCount,
    List<int>? vettedBy,
    int? vettingsCount,
    List<int>? subscribers,
    List<int>? quotedBy,
    int? quoteCount,
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
      if (likedBy != null) 'likedBy': likedBy?.toJson(),
      if (likesCount != null) 'likesCount': likesCount,
      if (reviewedBy != null) 'reviewedBy': reviewedBy?.toJson(),
      if (reviewsCount != null) 'reviewsCount': reviewsCount,
      if (bookmarkedBy != null) 'bookmarkedBy': bookmarkedBy?.toJson(),
      if (bookmarksCount != null) 'bookmarksCount': bookmarksCount,
      if (vettedBy != null) 'vettedBy': vettedBy?.toJson(),
      if (vettingsCount != null) 'vettingsCount': vettingsCount,
      if (subscribers != null) 'subscribers': subscribers?.toJson(),
      if (quotedBy != null) 'quotedBy': quotedBy?.toJson(),
      if (quoteCount != null) 'quoteCount': quoteCount,
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
    List<int>? likedBy,
    int? likesCount,
    List<int>? reviewedBy,
    int? reviewsCount,
    List<int>? bookmarkedBy,
    int? bookmarksCount,
    List<int>? vettedBy,
    int? vettingsCount,
    List<int>? subscribers,
    List<int>? quotedBy,
    int? quoteCount,
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
          likedBy: likedBy,
          likesCount: likesCount,
          reviewedBy: reviewedBy,
          reviewsCount: reviewsCount,
          bookmarkedBy: bookmarkedBy,
          bookmarksCount: bookmarksCount,
          vettedBy: vettedBy,
          vettingsCount: vettingsCount,
          subscribers: subscribers,
          quotedBy: quotedBy,
          quoteCount: quoteCount,
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
    Object? likedBy = _Undefined,
    Object? likesCount = _Undefined,
    Object? reviewedBy = _Undefined,
    Object? reviewsCount = _Undefined,
    Object? bookmarkedBy = _Undefined,
    Object? bookmarksCount = _Undefined,
    Object? vettedBy = _Undefined,
    Object? vettingsCount = _Undefined,
    Object? subscribers = _Undefined,
    Object? quotedBy = _Undefined,
    Object? quoteCount = _Undefined,
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
      likedBy: likedBy is List<int>?
          ? likedBy
          : this.likedBy?.map((e0) => e0).toList(),
      likesCount: likesCount is int? ? likesCount : this.likesCount,
      reviewedBy: reviewedBy is List<int>?
          ? reviewedBy
          : this.reviewedBy?.map((e0) => e0).toList(),
      reviewsCount: reviewsCount is int? ? reviewsCount : this.reviewsCount,
      bookmarkedBy: bookmarkedBy is List<int>?
          ? bookmarkedBy
          : this.bookmarkedBy?.map((e0) => e0).toList(),
      bookmarksCount:
          bookmarksCount is int? ? bookmarksCount : this.bookmarksCount,
      vettedBy: vettedBy is List<int>?
          ? vettedBy
          : this.vettedBy?.map((e0) => e0).toList(),
      vettingsCount: vettingsCount is int? ? vettingsCount : this.vettingsCount,
      subscribers: subscribers is List<int>?
          ? subscribers
          : this.subscribers?.map((e0) => e0).toList(),
      quotedBy: quotedBy is List<int>?
          ? quotedBy
          : this.quotedBy?.map((e0) => e0).toList(),
      quoteCount: quoteCount is int? ? quoteCount : this.quoteCount,
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
