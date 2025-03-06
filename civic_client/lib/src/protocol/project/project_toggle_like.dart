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

abstract class ProjectToggleLikeResponse implements _i1.SerializableModel {
  ProjectToggleLikeResponse._({
    required this.likedByUser,
    required this.likes,
  });

  factory ProjectToggleLikeResponse({
    required bool likedByUser,
    required int likes,
  }) = _ProjectToggleLikeResponseImpl;

  factory ProjectToggleLikeResponse.fromJson(
      Map<String, dynamic> jsonSerialization) {
    return ProjectToggleLikeResponse(
      likedByUser: jsonSerialization['likedByUser'] as bool,
      likes: jsonSerialization['likes'] as int,
    );
  }

  bool likedByUser;

  int likes;

  /// Returns a shallow copy of this [ProjectToggleLikeResponse]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  ProjectToggleLikeResponse copyWith({
    bool? likedByUser,
    int? likes,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      'likedByUser': likedByUser,
      'likes': likes,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _ProjectToggleLikeResponseImpl extends ProjectToggleLikeResponse {
  _ProjectToggleLikeResponseImpl({
    required bool likedByUser,
    required int likes,
  }) : super._(
          likedByUser: likedByUser,
          likes: likes,
        );

  /// Returns a shallow copy of this [ProjectToggleLikeResponse]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  ProjectToggleLikeResponse copyWith({
    bool? likedByUser,
    int? likes,
  }) {
    return ProjectToggleLikeResponse(
      likedByUser: likedByUser ?? this.likedByUser,
      likes: likes ?? this.likes,
    );
  }
}
