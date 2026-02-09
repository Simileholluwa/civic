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
import '../project/project_vetting.dart' as _i2;
import 'package:civic_server/src/generated/protocol.dart' as _i3;

abstract class ProjectVettingWithUserState
    implements _i1.SerializableModel, _i1.ProtocolSerialization {
  ProjectVettingWithUserState._({
    required this.vetting,
    bool? hasLiked,
    bool? hasDisliked,
    bool? hasDeleted,
  }) : hasLiked = hasLiked ?? false,
       hasDisliked = hasDisliked ?? false,
       hasDeleted = hasDeleted ?? false;

  factory ProjectVettingWithUserState({
    required _i2.ProjectVetting vetting,
    bool? hasLiked,
    bool? hasDisliked,
    bool? hasDeleted,
  }) = _ProjectVettingWithUserStateImpl;

  factory ProjectVettingWithUserState.fromJson(
    Map<String, dynamic> jsonSerialization,
  ) {
    return ProjectVettingWithUserState(
      vetting: _i3.Protocol().deserialize<_i2.ProjectVetting>(
        jsonSerialization['vetting'],
      ),
      hasLiked: jsonSerialization['hasLiked'] as bool?,
      hasDisliked: jsonSerialization['hasDisliked'] as bool?,
      hasDeleted: jsonSerialization['hasDeleted'] as bool?,
    );
  }

  _i2.ProjectVetting vetting;

  bool? hasLiked;

  bool? hasDisliked;

  bool? hasDeleted;

  /// Returns a shallow copy of this [ProjectVettingWithUserState]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  ProjectVettingWithUserState copyWith({
    _i2.ProjectVetting? vetting,
    bool? hasLiked,
    bool? hasDisliked,
    bool? hasDeleted,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'ProjectVettingWithUserState',
      'vetting': vetting.toJson(),
      if (hasLiked != null) 'hasLiked': hasLiked,
      if (hasDisliked != null) 'hasDisliked': hasDisliked,
      if (hasDeleted != null) 'hasDeleted': hasDeleted,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'ProjectVettingWithUserState',
      'vetting': vetting.toJsonForProtocol(),
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

class _ProjectVettingWithUserStateImpl extends ProjectVettingWithUserState {
  _ProjectVettingWithUserStateImpl({
    required _i2.ProjectVetting vetting,
    bool? hasLiked,
    bool? hasDisliked,
    bool? hasDeleted,
  }) : super._(
         vetting: vetting,
         hasLiked: hasLiked,
         hasDisliked: hasDisliked,
         hasDeleted: hasDeleted,
       );

  /// Returns a shallow copy of this [ProjectVettingWithUserState]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  ProjectVettingWithUserState copyWith({
    _i2.ProjectVetting? vetting,
    Object? hasLiked = _Undefined,
    Object? hasDisliked = _Undefined,
    Object? hasDeleted = _Undefined,
  }) {
    return ProjectVettingWithUserState(
      vetting: vetting ?? this.vetting.copyWith(),
      hasLiked: hasLiked is bool? ? hasLiked : this.hasLiked,
      hasDisliked: hasDisliked is bool? ? hasDisliked : this.hasDisliked,
      hasDeleted: hasDeleted is bool? ? hasDeleted : this.hasDeleted,
    );
  }
}
