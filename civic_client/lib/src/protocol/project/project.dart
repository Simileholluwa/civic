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
import '../project/project_repost.dart' as _i4;

abstract class Project implements _i1.SerializableModel {
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
    this.physicalLocations,
    this.virtualLocations,
    this.manualLocations,
    this.projectVideoUrl,
    this.dateCreated,
    this.updatedAt,
    this.repost,
    this.likedBy,
    this.repostedBy,
    this.reviewedBy,
    this.verifiedBy,
    this.bookmarkedBy,
    this.overallRating,
    this.overallLocationRating,
    this.overallDescriptionRating,
    this.overallDatesRating,
    this.overallAttachmentsRating,
    this.overAllCategoryRating,
    this.overallFundingRating,
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
    List<_i3.AWSPlaces>? physicalLocations,
    List<String>? virtualLocations,
    List<String>? manualLocations,
    String? projectVideoUrl,
    DateTime? dateCreated,
    DateTime? updatedAt,
    List<_i4.ProjectRepost>? repost,
    List<int>? likedBy,
    List<int>? repostedBy,
    List<int>? reviewedBy,
    List<int>? verifiedBy,
    List<int>? bookmarkedBy,
    double? overallRating,
    double? overallLocationRating,
    double? overallDescriptionRating,
    double? overallDatesRating,
    double? overallAttachmentsRating,
    double? overAllCategoryRating,
    double? overallFundingRating,
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

  List<_i3.AWSPlaces>? physicalLocations;

  List<String>? virtualLocations;

  List<String>? manualLocations;

  String? projectVideoUrl;

  DateTime? dateCreated;

  DateTime? updatedAt;

  List<_i4.ProjectRepost>? repost;

  List<int>? likedBy;

  List<int>? repostedBy;

  List<int>? reviewedBy;

  List<int>? verifiedBy;

  List<int>? bookmarkedBy;

  double? overallRating;

  double? overallLocationRating;

  double? overallDescriptionRating;

  double? overallDatesRating;

  double? overallAttachmentsRating;

  double? overAllCategoryRating;

  double? overallFundingRating;

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
    List<_i3.AWSPlaces>? physicalLocations,
    List<String>? virtualLocations,
    List<String>? manualLocations,
    String? projectVideoUrl,
    DateTime? dateCreated,
    DateTime? updatedAt,
    List<_i4.ProjectRepost>? repost,
    List<int>? likedBy,
    List<int>? repostedBy,
    List<int>? reviewedBy,
    List<int>? verifiedBy,
    List<int>? bookmarkedBy,
    double? overallRating,
    double? overallLocationRating,
    double? overallDescriptionRating,
    double? overallDatesRating,
    double? overallAttachmentsRating,
    double? overAllCategoryRating,
    double? overallFundingRating,
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
      if (physicalLocations != null)
        'physicalLocations':
            physicalLocations?.toJson(valueToJson: (v) => v.toJson()),
      if (virtualLocations != null)
        'virtualLocations': virtualLocations?.toJson(),
      if (manualLocations != null) 'manualLocations': manualLocations?.toJson(),
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
    List<_i3.AWSPlaces>? physicalLocations,
    List<String>? virtualLocations,
    List<String>? manualLocations,
    String? projectVideoUrl,
    DateTime? dateCreated,
    DateTime? updatedAt,
    List<_i4.ProjectRepost>? repost,
    List<int>? likedBy,
    List<int>? repostedBy,
    List<int>? reviewedBy,
    List<int>? verifiedBy,
    List<int>? bookmarkedBy,
    double? overallRating,
    double? overallLocationRating,
    double? overallDescriptionRating,
    double? overallDatesRating,
    double? overallAttachmentsRating,
    double? overAllCategoryRating,
    double? overallFundingRating,
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
          physicalLocations: physicalLocations,
          virtualLocations: virtualLocations,
          manualLocations: manualLocations,
          projectVideoUrl: projectVideoUrl,
          dateCreated: dateCreated,
          updatedAt: updatedAt,
          repost: repost,
          likedBy: likedBy,
          repostedBy: repostedBy,
          reviewedBy: reviewedBy,
          verifiedBy: verifiedBy,
          bookmarkedBy: bookmarkedBy,
          overallRating: overallRating,
          overallLocationRating: overallLocationRating,
          overallDescriptionRating: overallDescriptionRating,
          overallDatesRating: overallDatesRating,
          overallAttachmentsRating: overallAttachmentsRating,
          overAllCategoryRating: overAllCategoryRating,
          overallFundingRating: overallFundingRating,
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
    Object? physicalLocations = _Undefined,
    Object? virtualLocations = _Undefined,
    Object? manualLocations = _Undefined,
    Object? projectVideoUrl = _Undefined,
    Object? dateCreated = _Undefined,
    Object? updatedAt = _Undefined,
    Object? repost = _Undefined,
    Object? likedBy = _Undefined,
    Object? repostedBy = _Undefined,
    Object? reviewedBy = _Undefined,
    Object? verifiedBy = _Undefined,
    Object? bookmarkedBy = _Undefined,
    Object? overallRating = _Undefined,
    Object? overallLocationRating = _Undefined,
    Object? overallDescriptionRating = _Undefined,
    Object? overallDatesRating = _Undefined,
    Object? overallAttachmentsRating = _Undefined,
    Object? overAllCategoryRating = _Undefined,
    Object? overallFundingRating = _Undefined,
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
    );
  }
}
