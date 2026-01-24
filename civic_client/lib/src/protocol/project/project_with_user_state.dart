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
import 'package:civic_client/src/protocol/protocol.dart' as _i3;

abstract class ProjectWithUserState implements _i1.SerializableModel {
  ProjectWithUserState._({
    required this.project,
    bool? hasLiked,
    bool? hasBookmarked,
    bool? hasReviewed,
    bool? hasVetted,
    bool? isSubscribed,
    bool? isFollower,
  }) : hasLiked = hasLiked ?? false,
       hasBookmarked = hasBookmarked ?? false,
       hasReviewed = hasReviewed ?? false,
       hasVetted = hasVetted ?? false,
       isSubscribed = isSubscribed ?? false,
       isFollower = isFollower ?? false;

  factory ProjectWithUserState({
    required _i2.Project project,
    bool? hasLiked,
    bool? hasBookmarked,
    bool? hasReviewed,
    bool? hasVetted,
    bool? isSubscribed,
    bool? isFollower,
  }) = _ProjectWithUserStateImpl;

  factory ProjectWithUserState.fromJson(
    Map<String, dynamic> jsonSerialization,
  ) {
    return ProjectWithUserState(
      project: _i3.Protocol().deserialize<_i2.Project>(
        jsonSerialization['project'],
      ),
      hasLiked: jsonSerialization['hasLiked'] as bool?,
      hasBookmarked: jsonSerialization['hasBookmarked'] as bool?,
      hasReviewed: jsonSerialization['hasReviewed'] as bool?,
      hasVetted: jsonSerialization['hasVetted'] as bool?,
      isSubscribed: jsonSerialization['isSubscribed'] as bool?,
      isFollower: jsonSerialization['isFollower'] as bool?,
    );
  }

  _i2.Project project;

  bool? hasLiked;

  bool? hasBookmarked;

  bool? hasReviewed;

  bool? hasVetted;

  bool? isSubscribed;

  bool? isFollower;

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
    bool? isFollower,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'ProjectWithUserState',
      'project': project.toJson(),
      if (hasLiked != null) 'hasLiked': hasLiked,
      if (hasBookmarked != null) 'hasBookmarked': hasBookmarked,
      if (hasReviewed != null) 'hasReviewed': hasReviewed,
      if (hasVetted != null) 'hasVetted': hasVetted,
      if (isSubscribed != null) 'isSubscribed': isSubscribed,
      if (isFollower != null) 'isFollower': isFollower,
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
    bool? isFollower,
  }) : super._(
         project: project,
         hasLiked: hasLiked,
         hasBookmarked: hasBookmarked,
         hasReviewed: hasReviewed,
         hasVetted: hasVetted,
         isSubscribed: isSubscribed,
         isFollower: isFollower,
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
    Object? isFollower = _Undefined,
  }) {
    return ProjectWithUserState(
      project: project ?? this.project.copyWith(),
      hasLiked: hasLiked is bool? ? hasLiked : this.hasLiked,
      hasBookmarked: hasBookmarked is bool?
          ? hasBookmarked
          : this.hasBookmarked,
      hasReviewed: hasReviewed is bool? ? hasReviewed : this.hasReviewed,
      hasVetted: hasVetted is bool? ? hasVetted : this.hasVetted,
      isSubscribed: isSubscribed is bool? ? isSubscribed : this.isSubscribed,
      isFollower: isFollower is bool? ? isFollower : this.isFollower,
    );
  }
}
