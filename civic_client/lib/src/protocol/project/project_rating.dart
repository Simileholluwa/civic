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
import '../project/project.dart' as _i2;
import '../user/user_record.dart' as _i3;
import '../project/project_review.dart' as _i4;
import '../project/rating_dimension.dart' as _i5;
import 'package:civic_client/src/protocol/protocol.dart' as _i6;

abstract class ProjectRating implements _i1.SerializableModel {
  ProjectRating._({
    this.id,
    required this.projectId,
    this.project,
    required this.ownerId,
    this.owner,
    required this.reviewId,
    this.review,
    this.dimension,
    this.value,
    DateTime? dateCreated,
    this.updatedAt,
    bool? isDeleted,
  }) : dateCreated = dateCreated ?? DateTime.now(),
       isDeleted = isDeleted ?? false;

  factory ProjectRating({
    int? id,
    required int projectId,
    _i2.Project? project,
    required int ownerId,
    _i3.UserRecord? owner,
    required int reviewId,
    _i4.ProjectReview? review,
    _i5.RatingDimension? dimension,
    double? value,
    DateTime? dateCreated,
    DateTime? updatedAt,
    bool? isDeleted,
  }) = _ProjectRatingImpl;

  factory ProjectRating.fromJson(Map<String, dynamic> jsonSerialization) {
    return ProjectRating(
      id: jsonSerialization['id'] as int?,
      projectId: jsonSerialization['projectId'] as int,
      project: jsonSerialization['project'] == null
          ? null
          : _i6.Protocol().deserialize<_i2.Project>(
              jsonSerialization['project'],
            ),
      ownerId: jsonSerialization['ownerId'] as int,
      owner: jsonSerialization['owner'] == null
          ? null
          : _i6.Protocol().deserialize<_i3.UserRecord>(
              jsonSerialization['owner'],
            ),
      reviewId: jsonSerialization['reviewId'] as int,
      review: jsonSerialization['review'] == null
          ? null
          : _i6.Protocol().deserialize<_i4.ProjectReview>(
              jsonSerialization['review'],
            ),
      dimension: jsonSerialization['dimension'] == null
          ? null
          : _i5.RatingDimension.fromJson(
              (jsonSerialization['dimension'] as String),
            ),
      value: (jsonSerialization['value'] as num?)?.toDouble(),
      dateCreated: jsonSerialization['dateCreated'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(
              jsonSerialization['dateCreated'],
            ),
      updatedAt: jsonSerialization['updatedAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['updatedAt']),
      isDeleted: jsonSerialization['isDeleted'] as bool?,
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int projectId;

  _i2.Project? project;

  int ownerId;

  _i3.UserRecord? owner;

  int reviewId;

  _i4.ProjectReview? review;

  _i5.RatingDimension? dimension;

  double? value;

  DateTime? dateCreated;

  DateTime? updatedAt;

  bool? isDeleted;

  /// Returns a shallow copy of this [ProjectRating]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  ProjectRating copyWith({
    int? id,
    int? projectId,
    _i2.Project? project,
    int? ownerId,
    _i3.UserRecord? owner,
    int? reviewId,
    _i4.ProjectReview? review,
    _i5.RatingDimension? dimension,
    double? value,
    DateTime? dateCreated,
    DateTime? updatedAt,
    bool? isDeleted,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'ProjectRating',
      if (id != null) 'id': id,
      'projectId': projectId,
      if (project != null) 'project': project?.toJson(),
      'ownerId': ownerId,
      if (owner != null) 'owner': owner?.toJson(),
      'reviewId': reviewId,
      if (review != null) 'review': review?.toJson(),
      if (dimension != null) 'dimension': dimension?.toJson(),
      if (value != null) 'value': value,
      if (dateCreated != null) 'dateCreated': dateCreated?.toJson(),
      if (updatedAt != null) 'updatedAt': updatedAt?.toJson(),
      if (isDeleted != null) 'isDeleted': isDeleted,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _ProjectRatingImpl extends ProjectRating {
  _ProjectRatingImpl({
    int? id,
    required int projectId,
    _i2.Project? project,
    required int ownerId,
    _i3.UserRecord? owner,
    required int reviewId,
    _i4.ProjectReview? review,
    _i5.RatingDimension? dimension,
    double? value,
    DateTime? dateCreated,
    DateTime? updatedAt,
    bool? isDeleted,
  }) : super._(
         id: id,
         projectId: projectId,
         project: project,
         ownerId: ownerId,
         owner: owner,
         reviewId: reviewId,
         review: review,
         dimension: dimension,
         value: value,
         dateCreated: dateCreated,
         updatedAt: updatedAt,
         isDeleted: isDeleted,
       );

  /// Returns a shallow copy of this [ProjectRating]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  ProjectRating copyWith({
    Object? id = _Undefined,
    int? projectId,
    Object? project = _Undefined,
    int? ownerId,
    Object? owner = _Undefined,
    int? reviewId,
    Object? review = _Undefined,
    Object? dimension = _Undefined,
    Object? value = _Undefined,
    Object? dateCreated = _Undefined,
    Object? updatedAt = _Undefined,
    Object? isDeleted = _Undefined,
  }) {
    return ProjectRating(
      id: id is int? ? id : this.id,
      projectId: projectId ?? this.projectId,
      project: project is _i2.Project? ? project : this.project?.copyWith(),
      ownerId: ownerId ?? this.ownerId,
      owner: owner is _i3.UserRecord? ? owner : this.owner?.copyWith(),
      reviewId: reviewId ?? this.reviewId,
      review: review is _i4.ProjectReview? ? review : this.review?.copyWith(),
      dimension: dimension is _i5.RatingDimension? ? dimension : this.dimension,
      value: value is double? ? value : this.value,
      dateCreated: dateCreated is DateTime? ? dateCreated : this.dateCreated,
      updatedAt: updatedAt is DateTime? ? updatedAt : this.updatedAt,
      isDeleted: isDeleted is bool? ? isDeleted : this.isDeleted,
    );
  }
}
