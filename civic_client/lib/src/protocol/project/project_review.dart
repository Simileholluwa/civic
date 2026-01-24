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
import '../project/project.dart' as _i3;
import 'package:civic_client/src/protocol/protocol.dart' as _i4;

abstract class ProjectReview implements _i1.SerializableModel {
  ProjectReview._({
    this.id,
    required this.ownerId,
    this.owner,
    required this.projectId,
    this.project,
    this.review,
    this.locationRating,
    this.descriptionRating,
    this.attachmentsRating,
    this.categoryRating,
    this.fundingRating,
    this.datesRating,
    this.overallRating,
    DateTime? dateCreated,
    this.updatedAt,
    this.likedBy,
    this.dislikedBy,
  }) : dateCreated = dateCreated ?? DateTime.now();

  factory ProjectReview({
    int? id,
    required int ownerId,
    _i2.UserRecord? owner,
    required int projectId,
    _i3.Project? project,
    String? review,
    double? locationRating,
    double? descriptionRating,
    double? attachmentsRating,
    double? categoryRating,
    double? fundingRating,
    double? datesRating,
    double? overallRating,
    DateTime? dateCreated,
    DateTime? updatedAt,
    List<int>? likedBy,
    List<int>? dislikedBy,
  }) = _ProjectReviewImpl;

  factory ProjectReview.fromJson(Map<String, dynamic> jsonSerialization) {
    return ProjectReview(
      id: jsonSerialization['id'] as int?,
      ownerId: jsonSerialization['ownerId'] as int,
      owner: jsonSerialization['owner'] == null
          ? null
          : _i4.Protocol().deserialize<_i2.UserRecord>(
              jsonSerialization['owner'],
            ),
      projectId: jsonSerialization['projectId'] as int,
      project: jsonSerialization['project'] == null
          ? null
          : _i4.Protocol().deserialize<_i3.Project>(
              jsonSerialization['project'],
            ),
      review: jsonSerialization['review'] as String?,
      locationRating: (jsonSerialization['locationRating'] as num?)?.toDouble(),
      descriptionRating: (jsonSerialization['descriptionRating'] as num?)
          ?.toDouble(),
      attachmentsRating: (jsonSerialization['attachmentsRating'] as num?)
          ?.toDouble(),
      categoryRating: (jsonSerialization['categoryRating'] as num?)?.toDouble(),
      fundingRating: (jsonSerialization['fundingRating'] as num?)?.toDouble(),
      datesRating: (jsonSerialization['datesRating'] as num?)?.toDouble(),
      overallRating: (jsonSerialization['overallRating'] as num?)?.toDouble(),
      dateCreated: jsonSerialization['dateCreated'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(
              jsonSerialization['dateCreated'],
            ),
      updatedAt: jsonSerialization['updatedAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['updatedAt']),
      likedBy: jsonSerialization['likedBy'] == null
          ? null
          : _i4.Protocol().deserialize<List<int>>(jsonSerialization['likedBy']),
      dislikedBy: jsonSerialization['dislikedBy'] == null
          ? null
          : _i4.Protocol().deserialize<List<int>>(
              jsonSerialization['dislikedBy'],
            ),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int ownerId;

  _i2.UserRecord? owner;

  int projectId;

  _i3.Project? project;

  String? review;

  double? locationRating;

  double? descriptionRating;

  double? attachmentsRating;

  double? categoryRating;

  double? fundingRating;

  double? datesRating;

  double? overallRating;

  DateTime? dateCreated;

  DateTime? updatedAt;

  List<int>? likedBy;

  List<int>? dislikedBy;

  /// Returns a shallow copy of this [ProjectReview]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  ProjectReview copyWith({
    int? id,
    int? ownerId,
    _i2.UserRecord? owner,
    int? projectId,
    _i3.Project? project,
    String? review,
    double? locationRating,
    double? descriptionRating,
    double? attachmentsRating,
    double? categoryRating,
    double? fundingRating,
    double? datesRating,
    double? overallRating,
    DateTime? dateCreated,
    DateTime? updatedAt,
    List<int>? likedBy,
    List<int>? dislikedBy,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'ProjectReview',
      if (id != null) 'id': id,
      'ownerId': ownerId,
      if (owner != null) 'owner': owner?.toJson(),
      'projectId': projectId,
      if (project != null) 'project': project?.toJson(),
      if (review != null) 'review': review,
      if (locationRating != null) 'locationRating': locationRating,
      if (descriptionRating != null) 'descriptionRating': descriptionRating,
      if (attachmentsRating != null) 'attachmentsRating': attachmentsRating,
      if (categoryRating != null) 'categoryRating': categoryRating,
      if (fundingRating != null) 'fundingRating': fundingRating,
      if (datesRating != null) 'datesRating': datesRating,
      if (overallRating != null) 'overallRating': overallRating,
      if (dateCreated != null) 'dateCreated': dateCreated?.toJson(),
      if (updatedAt != null) 'updatedAt': updatedAt?.toJson(),
      if (likedBy != null) 'likedBy': likedBy?.toJson(),
      if (dislikedBy != null) 'dislikedBy': dislikedBy?.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _ProjectReviewImpl extends ProjectReview {
  _ProjectReviewImpl({
    int? id,
    required int ownerId,
    _i2.UserRecord? owner,
    required int projectId,
    _i3.Project? project,
    String? review,
    double? locationRating,
    double? descriptionRating,
    double? attachmentsRating,
    double? categoryRating,
    double? fundingRating,
    double? datesRating,
    double? overallRating,
    DateTime? dateCreated,
    DateTime? updatedAt,
    List<int>? likedBy,
    List<int>? dislikedBy,
  }) : super._(
         id: id,
         ownerId: ownerId,
         owner: owner,
         projectId: projectId,
         project: project,
         review: review,
         locationRating: locationRating,
         descriptionRating: descriptionRating,
         attachmentsRating: attachmentsRating,
         categoryRating: categoryRating,
         fundingRating: fundingRating,
         datesRating: datesRating,
         overallRating: overallRating,
         dateCreated: dateCreated,
         updatedAt: updatedAt,
         likedBy: likedBy,
         dislikedBy: dislikedBy,
       );

  /// Returns a shallow copy of this [ProjectReview]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  ProjectReview copyWith({
    Object? id = _Undefined,
    int? ownerId,
    Object? owner = _Undefined,
    int? projectId,
    Object? project = _Undefined,
    Object? review = _Undefined,
    Object? locationRating = _Undefined,
    Object? descriptionRating = _Undefined,
    Object? attachmentsRating = _Undefined,
    Object? categoryRating = _Undefined,
    Object? fundingRating = _Undefined,
    Object? datesRating = _Undefined,
    Object? overallRating = _Undefined,
    Object? dateCreated = _Undefined,
    Object? updatedAt = _Undefined,
    Object? likedBy = _Undefined,
    Object? dislikedBy = _Undefined,
  }) {
    return ProjectReview(
      id: id is int? ? id : this.id,
      ownerId: ownerId ?? this.ownerId,
      owner: owner is _i2.UserRecord? ? owner : this.owner?.copyWith(),
      projectId: projectId ?? this.projectId,
      project: project is _i3.Project? ? project : this.project?.copyWith(),
      review: review is String? ? review : this.review,
      locationRating: locationRating is double?
          ? locationRating
          : this.locationRating,
      descriptionRating: descriptionRating is double?
          ? descriptionRating
          : this.descriptionRating,
      attachmentsRating: attachmentsRating is double?
          ? attachmentsRating
          : this.attachmentsRating,
      categoryRating: categoryRating is double?
          ? categoryRating
          : this.categoryRating,
      fundingRating: fundingRating is double?
          ? fundingRating
          : this.fundingRating,
      datesRating: datesRating is double? ? datesRating : this.datesRating,
      overallRating: overallRating is double?
          ? overallRating
          : this.overallRating,
      dateCreated: dateCreated is DateTime? ? dateCreated : this.dateCreated,
      updatedAt: updatedAt is DateTime? ? updatedAt : this.updatedAt,
      likedBy: likedBy is List<int>?
          ? likedBy
          : this.likedBy?.map((e0) => e0).toList(),
      dislikedBy: dislikedBy is List<int>?
          ? dislikedBy
          : this.dislikedBy?.map((e0) => e0).toList(),
    );
  }
}
