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

abstract class ProjectReviewCounts
    implements _i1.SerializableModel, _i1.ProtocolSerialization {
  ProjectReviewCounts._({
    required this.projectReviewId,
    int? likesCount,
    int? dislikesCount,
  }) : likesCount = likesCount ?? 0,
       dislikesCount = dislikesCount ?? 0;

  factory ProjectReviewCounts({
    required int projectReviewId,
    int? likesCount,
    int? dislikesCount,
  }) = _ProjectReviewCountsImpl;

  factory ProjectReviewCounts.fromJson(Map<String, dynamic> jsonSerialization) {
    return ProjectReviewCounts(
      projectReviewId: jsonSerialization['projectReviewId'] as int,
      likesCount: jsonSerialization['likesCount'] as int?,
      dislikesCount: jsonSerialization['dislikesCount'] as int?,
    );
  }

  int projectReviewId;

  int? likesCount;

  int? dislikesCount;

  /// Returns a shallow copy of this [ProjectReviewCounts]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  ProjectReviewCounts copyWith({
    int? projectReviewId,
    int? likesCount,
    int? dislikesCount,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'ProjectReviewCounts',
      'projectReviewId': projectReviewId,
      if (likesCount != null) 'likesCount': likesCount,
      if (dislikesCount != null) 'dislikesCount': dislikesCount,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'ProjectReviewCounts',
      'projectReviewId': projectReviewId,
      if (likesCount != null) 'likesCount': likesCount,
      if (dislikesCount != null) 'dislikesCount': dislikesCount,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _ProjectReviewCountsImpl extends ProjectReviewCounts {
  _ProjectReviewCountsImpl({
    required int projectReviewId,
    int? likesCount,
    int? dislikesCount,
  }) : super._(
         projectReviewId: projectReviewId,
         likesCount: likesCount,
         dislikesCount: dislikesCount,
       );

  /// Returns a shallow copy of this [ProjectReviewCounts]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  ProjectReviewCounts copyWith({
    int? projectReviewId,
    Object? likesCount = _Undefined,
    Object? dislikesCount = _Undefined,
  }) {
    return ProjectReviewCounts(
      projectReviewId: projectReviewId ?? this.projectReviewId,
      likesCount: likesCount is int? ? likesCount : this.likesCount,
      dislikesCount: dislikesCount is int? ? dislikesCount : this.dislikesCount,
    );
  }
}
