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
import '../project/project.dart' as _i2;

abstract class ProjectWithUserState implements _i1.SerializableModel {
  ProjectWithUserState._({
    required this.project,
    bool? hasLiked,
    bool? hasBookmarked,
    bool? hasReviewed,
    bool? hasVetted,
    bool? isSubscribed,
  })  : hasLiked = hasLiked ?? false,
        hasBookmarked = hasBookmarked ?? false,
        hasReviewed = hasReviewed ?? false,
        hasVetted = hasVetted ?? false,
        isSubscribed = isSubscribed ?? false;

  factory ProjectWithUserState({
    required _i2.Project project,
    bool? hasLiked,
    bool? hasBookmarked,
    bool? hasReviewed,
    bool? hasVetted,
    bool? isSubscribed,
  }) = _ProjectWithUserStateImpl;

  factory ProjectWithUserState.fromJson(
      Map<String, dynamic> jsonSerialization) {
    return ProjectWithUserState(
      project: _i2.Project.fromJson(
          (jsonSerialization['project'] as Map<String, dynamic>)),
      hasLiked: jsonSerialization['hasLiked'] as bool?,
      hasBookmarked: jsonSerialization['hasBookmarked'] as bool?,
      hasReviewed: jsonSerialization['hasReviewed'] as bool?,
      hasVetted: jsonSerialization['hasVetted'] as bool?,
      isSubscribed: jsonSerialization['isSubscribed'] as bool?,
    );
  }

  _i2.Project project;

  bool? hasLiked;

  bool? hasBookmarked;

  bool? hasReviewed;

  bool? hasVetted;

  bool? isSubscribed;

  /// Returns a shallow copy of this [ProjectWithUserState]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  ProjectWithUserState copyWith({
    _i2.Project? project,
    bool? hasLiked,
    bool? hasBookmarked,
    bool? hasReviewed,
    bool? hasVetted,
    bool? isSubscribed,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      'project': project.toJson(),
      if (hasLiked != null) 'hasLiked': hasLiked,
      if (hasBookmarked != null) 'hasBookmarked': hasBookmarked,
      if (hasReviewed != null) 'hasReviewed': hasReviewed,
      if (hasVetted != null) 'hasVetted': hasVetted,
      if (isSubscribed != null) 'isSubscribed': isSubscribed,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _ProjectWithUserStateImpl extends ProjectWithUserState {
  _ProjectWithUserStateImpl({
    required _i2.Project project,
    bool? hasLiked,
    bool? hasBookmarked,
    bool? hasReviewed,
    bool? hasVetted,
    bool? isSubscribed,
  }) : super._(
          project: project,
          hasLiked: hasLiked,
          hasBookmarked: hasBookmarked,
          hasReviewed: hasReviewed,
          hasVetted: hasVetted,
          isSubscribed: isSubscribed,
        );

  /// Returns a shallow copy of this [ProjectWithUserState]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  ProjectWithUserState copyWith({
    _i2.Project? project,
    Object? hasLiked = _Undefined,
    Object? hasBookmarked = _Undefined,
    Object? hasReviewed = _Undefined,
    Object? hasVetted = _Undefined,
    Object? isSubscribed = _Undefined,
  }) {
    return ProjectWithUserState(
      project: project ?? this.project.copyWith(),
      hasLiked: hasLiked is bool? ? hasLiked : this.hasLiked,
      hasBookmarked:
          hasBookmarked is bool? ? hasBookmarked : this.hasBookmarked,
      hasReviewed: hasReviewed is bool? ? hasReviewed : this.hasReviewed,
      hasVetted: hasVetted is bool? ? hasVetted : this.hasVetted,
      isSubscribed: isSubscribed is bool? ? isSubscribed : this.isSubscribed,
    );
  }
}
