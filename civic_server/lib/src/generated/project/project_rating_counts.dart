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
import 'package:serverpod/serverpod.dart' as _i1;

abstract class ProjectRatingCounts
    implements _i1.SerializableModel, _i1.ProtocolSerialization {
  ProjectRatingCounts._({
    required this.projectId,
    double? overallRating,
    double? overallLocationRating,
    double? overallDescriptionRating,
    double? overallAttachmentsRating,
    double? overallCategoryRating,
    double? overallFundingRating,
    double? overallDatesRating,
    int? totalRating,
  }) : overallRating = overallRating ?? 0.0,
       overallLocationRating = overallLocationRating ?? 0.0,
       overallDescriptionRating = overallDescriptionRating ?? 0.0,
       overallAttachmentsRating = overallAttachmentsRating ?? 0.0,
       overallCategoryRating = overallCategoryRating ?? 0.0,
       overallFundingRating = overallFundingRating ?? 0.0,
       overallDatesRating = overallDatesRating ?? 0.0,
       totalRating = totalRating ?? 0;

  factory ProjectRatingCounts({
    required int projectId,
    double? overallRating,
    double? overallLocationRating,
    double? overallDescriptionRating,
    double? overallAttachmentsRating,
    double? overallCategoryRating,
    double? overallFundingRating,
    double? overallDatesRating,
    int? totalRating,
  }) = _ProjectRatingCountsImpl;

  factory ProjectRatingCounts.fromJson(Map<String, dynamic> jsonSerialization) {
    return ProjectRatingCounts(
      projectId: jsonSerialization['projectId'] as int,
      overallRating: (jsonSerialization['overallRating'] as num?)?.toDouble(),
      overallLocationRating:
          (jsonSerialization['overallLocationRating'] as num?)?.toDouble(),
      overallDescriptionRating:
          (jsonSerialization['overallDescriptionRating'] as num?)?.toDouble(),
      overallAttachmentsRating:
          (jsonSerialization['overallAttachmentsRating'] as num?)?.toDouble(),
      overallCategoryRating:
          (jsonSerialization['overallCategoryRating'] as num?)?.toDouble(),
      overallFundingRating: (jsonSerialization['overallFundingRating'] as num?)
          ?.toDouble(),
      overallDatesRating: (jsonSerialization['overallDatesRating'] as num?)
          ?.toDouble(),
      totalRating: jsonSerialization['totalRating'] as int?,
    );
  }

  int projectId;

  double? overallRating;

  double? overallLocationRating;

  double? overallDescriptionRating;

  double? overallAttachmentsRating;

  double? overallCategoryRating;

  double? overallFundingRating;

  double? overallDatesRating;

  int totalRating;

  /// Returns a shallow copy of this [ProjectRatingCounts]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  ProjectRatingCounts copyWith({
    int? projectId,
    double? overallRating,
    double? overallLocationRating,
    double? overallDescriptionRating,
    double? overallAttachmentsRating,
    double? overallCategoryRating,
    double? overallFundingRating,
    double? overallDatesRating,
    int? totalRating,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'ProjectRatingCounts',
      'projectId': projectId,
      if (overallRating != null) 'overallRating': overallRating,
      if (overallLocationRating != null)
        'overallLocationRating': overallLocationRating,
      if (overallDescriptionRating != null)
        'overallDescriptionRating': overallDescriptionRating,
      if (overallAttachmentsRating != null)
        'overallAttachmentsRating': overallAttachmentsRating,
      if (overallCategoryRating != null)
        'overallCategoryRating': overallCategoryRating,
      if (overallFundingRating != null)
        'overallFundingRating': overallFundingRating,
      if (overallDatesRating != null) 'overallDatesRating': overallDatesRating,
      'totalRating': totalRating,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'ProjectRatingCounts',
      'projectId': projectId,
      if (overallRating != null) 'overallRating': overallRating,
      if (overallLocationRating != null)
        'overallLocationRating': overallLocationRating,
      if (overallDescriptionRating != null)
        'overallDescriptionRating': overallDescriptionRating,
      if (overallAttachmentsRating != null)
        'overallAttachmentsRating': overallAttachmentsRating,
      if (overallCategoryRating != null)
        'overallCategoryRating': overallCategoryRating,
      if (overallFundingRating != null)
        'overallFundingRating': overallFundingRating,
      if (overallDatesRating != null) 'overallDatesRating': overallDatesRating,
      'totalRating': totalRating,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _ProjectRatingCountsImpl extends ProjectRatingCounts {
  _ProjectRatingCountsImpl({
    required int projectId,
    double? overallRating,
    double? overallLocationRating,
    double? overallDescriptionRating,
    double? overallAttachmentsRating,
    double? overallCategoryRating,
    double? overallFundingRating,
    double? overallDatesRating,
    int? totalRating,
  }) : super._(
         projectId: projectId,
         overallRating: overallRating,
         overallLocationRating: overallLocationRating,
         overallDescriptionRating: overallDescriptionRating,
         overallAttachmentsRating: overallAttachmentsRating,
         overallCategoryRating: overallCategoryRating,
         overallFundingRating: overallFundingRating,
         overallDatesRating: overallDatesRating,
         totalRating: totalRating,
       );

  /// Returns a shallow copy of this [ProjectRatingCounts]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  ProjectRatingCounts copyWith({
    int? projectId,
    Object? overallRating = _Undefined,
    Object? overallLocationRating = _Undefined,
    Object? overallDescriptionRating = _Undefined,
    Object? overallAttachmentsRating = _Undefined,
    Object? overallCategoryRating = _Undefined,
    Object? overallFundingRating = _Undefined,
    Object? overallDatesRating = _Undefined,
    int? totalRating,
  }) {
    return ProjectRatingCounts(
      projectId: projectId ?? this.projectId,
      overallRating: overallRating is double?
          ? overallRating
          : this.overallRating,
      overallLocationRating: overallLocationRating is double?
          ? overallLocationRating
          : this.overallLocationRating,
      overallDescriptionRating: overallDescriptionRating is double?
          ? overallDescriptionRating
          : this.overallDescriptionRating,
      overallAttachmentsRating: overallAttachmentsRating is double?
          ? overallAttachmentsRating
          : this.overallAttachmentsRating,
      overallCategoryRating: overallCategoryRating is double?
          ? overallCategoryRating
          : this.overallCategoryRating,
      overallFundingRating: overallFundingRating is double?
          ? overallFundingRating
          : this.overallFundingRating,
      overallDatesRating: overallDatesRating is double?
          ? overallDatesRating
          : this.overallDatesRating,
      totalRating: totalRating ?? this.totalRating,
    );
  }
}
