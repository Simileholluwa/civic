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
import '../project/project_review.dart' as _i2;
import 'package:civic_client/src/protocol/protocol.dart' as _i3;

abstract class ProjectReviewWithUserState implements _i1.SerializableModel {
  ProjectReviewWithUserState._({
    required this.review,
    bool? hasLiked,
    bool? hasDisliked,
    bool? hasDeleted,
  }) : hasLiked = hasLiked ?? false,
       hasDisliked = hasDisliked ?? false,
       hasDeleted = hasDeleted ?? false;

  factory ProjectReviewWithUserState({
    required _i2.ProjectReview review,
    bool? hasLiked,
    bool? hasDisliked,
    bool? hasDeleted,
  }) = _ProjectReviewWithUserStateImpl;

  factory ProjectReviewWithUserState.fromJson(
    Map<String, dynamic> jsonSerialization,
  ) {
    return ProjectReviewWithUserState(
      review: _i3.Protocol().deserialize<_i2.ProjectReview>(
        jsonSerialization['review'],
      ),
      hasLiked: jsonSerialization['hasLiked'] as bool?,
      hasDisliked: jsonSerialization['hasDisliked'] as bool?,
      hasDeleted: jsonSerialization['hasDeleted'] as bool?,
    );
  }

  _i2.ProjectReview review;

  bool? hasLiked;

  bool? hasDisliked;

  bool? hasDeleted;

  /// Returns a shallow copy of this [ProjectReviewWithUserState]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  ProjectReviewWithUserState copyWith({
    _i2.ProjectReview? review,
    bool? hasLiked,
    bool? hasDisliked,
    bool? hasDeleted,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'ProjectReviewWithUserState',
      'review': review.toJson(),
      if (hasLiked != null) 'hasLiked': hasLiked,
      if (hasDisliked != null) 'hasDisliked': hasDisliked,
      if (hasDeleted != null) 'hasDeleted': hasDeleted,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _ProjectReviewWithUserStateImpl extends ProjectReviewWithUserState {
  _ProjectReviewWithUserStateImpl({
    required _i2.ProjectReview review,
    bool? hasLiked,
    bool? hasDisliked,
    bool? hasDeleted,
  }) : super._(
         review: review,
         hasLiked: hasLiked,
         hasDisliked: hasDisliked,
         hasDeleted: hasDeleted,
       );

  /// Returns a shallow copy of this [ProjectReviewWithUserState]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  ProjectReviewWithUserState copyWith({
    _i2.ProjectReview? review,
    Object? hasLiked = _Undefined,
    Object? hasDisliked = _Undefined,
    Object? hasDeleted = _Undefined,
  }) {
    return ProjectReviewWithUserState(
      review: review ?? this.review.copyWith(),
      hasLiked: hasLiked is bool? ? hasLiked : this.hasLiked,
      hasDisliked: hasDisliked is bool? ? hasDisliked : this.hasDisliked,
      hasDeleted: hasDeleted is bool? ? hasDeleted : this.hasDeleted,
    );
  }
}
