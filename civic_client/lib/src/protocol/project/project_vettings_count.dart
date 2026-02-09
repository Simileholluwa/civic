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

abstract class ProjectVettingsCount implements _i1.SerializableModel {
  ProjectVettingsCount._({
    required this.projectVettingId,
    int? likesCount,
    int? dislikesCount,
  }) : likesCount = likesCount ?? 0,
       dislikesCount = dislikesCount ?? 0;

  factory ProjectVettingsCount({
    required int projectVettingId,
    int? likesCount,
    int? dislikesCount,
  }) = _ProjectVettingsCountImpl;

  factory ProjectVettingsCount.fromJson(
    Map<String, dynamic> jsonSerialization,
  ) {
    return ProjectVettingsCount(
      projectVettingId: jsonSerialization['projectVettingId'] as int,
      likesCount: jsonSerialization['likesCount'] as int?,
      dislikesCount: jsonSerialization['dislikesCount'] as int?,
    );
  }

  int projectVettingId;

  int? likesCount;

  int? dislikesCount;

  /// Returns a shallow copy of this [ProjectVettingsCount]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  ProjectVettingsCount copyWith({
    int? projectVettingId,
    int? likesCount,
    int? dislikesCount,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'ProjectVettingsCount',
      'projectVettingId': projectVettingId,
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

class _ProjectVettingsCountImpl extends ProjectVettingsCount {
  _ProjectVettingsCountImpl({
    required int projectVettingId,
    int? likesCount,
    int? dislikesCount,
  }) : super._(
         projectVettingId: projectVettingId,
         likesCount: likesCount,
         dislikesCount: dislikesCount,
       );

  /// Returns a shallow copy of this [ProjectVettingsCount]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  ProjectVettingsCount copyWith({
    int? projectVettingId,
    Object? likesCount = _Undefined,
    Object? dislikesCount = _Undefined,
  }) {
    return ProjectVettingsCount(
      projectVettingId: projectVettingId ?? this.projectVettingId,
      likesCount: likesCount is int? ? likesCount : this.likesCount,
      dislikesCount: dislikesCount is int? ? dislikesCount : this.dislikesCount,
    );
  }
}
