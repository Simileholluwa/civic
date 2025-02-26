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
import '../project/project_review.dart' as _i3;

abstract class ProjectReviewReaction implements _i1.SerializableModel {
  ProjectReviewReaction._({
    this.id,
    required this.ownerId,
    this.owner,
    required this.reviewId,
    this.review,
    this.dateCreated,
    this.updatedAt,
    this.isLike,
    this.isDeleted,
  });

  factory ProjectReviewReaction({
    int? id,
    required int ownerId,
    _i2.UserRecord? owner,
    required int reviewId,
    _i3.ProjectReview? review,
    DateTime? dateCreated,
    DateTime? updatedAt,
    bool? isLike,
    bool? isDeleted,
  }) = _ProjectReviewReactionImpl;

  factory ProjectReviewReaction.fromJson(
      Map<String, dynamic> jsonSerialization) {
    return ProjectReviewReaction(
      id: jsonSerialization['id'] as int?,
      ownerId: jsonSerialization['ownerId'] as int,
      owner: jsonSerialization['owner'] == null
          ? null
          : _i2.UserRecord.fromJson(
              (jsonSerialization['owner'] as Map<String, dynamic>)),
      reviewId: jsonSerialization['reviewId'] as int,
      review: jsonSerialization['review'] == null
          ? null
          : _i3.ProjectReview.fromJson(
              (jsonSerialization['review'] as Map<String, dynamic>)),
      dateCreated: jsonSerialization['dateCreated'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(
              jsonSerialization['dateCreated']),
      updatedAt: jsonSerialization['updatedAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['updatedAt']),
      isLike: jsonSerialization['isLike'] as bool?,
      isDeleted: jsonSerialization['isDeleted'] as bool?,
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int ownerId;

  _i2.UserRecord? owner;

  int reviewId;

  _i3.ProjectReview? review;

  DateTime? dateCreated;

  DateTime? updatedAt;

  bool? isLike;

  bool? isDeleted;

  ProjectReviewReaction copyWith({
    int? id,
    int? ownerId,
    _i2.UserRecord? owner,
    int? reviewId,
    _i3.ProjectReview? review,
    DateTime? dateCreated,
    DateTime? updatedAt,
    bool? isLike,
    bool? isDeleted,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'ownerId': ownerId,
      if (owner != null) 'owner': owner?.toJson(),
      'reviewId': reviewId,
      if (review != null) 'review': review?.toJson(),
      if (dateCreated != null) 'dateCreated': dateCreated?.toJson(),
      if (updatedAt != null) 'updatedAt': updatedAt?.toJson(),
      if (isLike != null) 'isLike': isLike,
      if (isDeleted != null) 'isDeleted': isDeleted,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _ProjectReviewReactionImpl extends ProjectReviewReaction {
  _ProjectReviewReactionImpl({
    int? id,
    required int ownerId,
    _i2.UserRecord? owner,
    required int reviewId,
    _i3.ProjectReview? review,
    DateTime? dateCreated,
    DateTime? updatedAt,
    bool? isLike,
    bool? isDeleted,
  }) : super._(
          id: id,
          ownerId: ownerId,
          owner: owner,
          reviewId: reviewId,
          review: review,
          dateCreated: dateCreated,
          updatedAt: updatedAt,
          isLike: isLike,
          isDeleted: isDeleted,
        );

  @override
  ProjectReviewReaction copyWith({
    Object? id = _Undefined,
    int? ownerId,
    Object? owner = _Undefined,
    int? reviewId,
    Object? review = _Undefined,
    Object? dateCreated = _Undefined,
    Object? updatedAt = _Undefined,
    Object? isLike = _Undefined,
    Object? isDeleted = _Undefined,
  }) {
    return ProjectReviewReaction(
      id: id is int? ? id : this.id,
      ownerId: ownerId ?? this.ownerId,
      owner: owner is _i2.UserRecord? ? owner : this.owner?.copyWith(),
      reviewId: reviewId ?? this.reviewId,
      review: review is _i3.ProjectReview? ? review : this.review?.copyWith(),
      dateCreated: dateCreated is DateTime? ? dateCreated : this.dateCreated,
      updatedAt: updatedAt is DateTime? ? updatedAt : this.updatedAt,
      isLike: isLike is bool? ? isLike : this.isLike,
      isDeleted: isDeleted is bool? ? isDeleted : this.isDeleted,
    );
  }
}
