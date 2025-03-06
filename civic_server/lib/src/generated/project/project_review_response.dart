/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;

abstract class ProjectReviewResponse
    implements _i1.SerializableModel, _i1.ProtocolSerialization {
  ProjectReviewResponse._({
    required this.likes,
    required this.dislikes,
    required this.isLiked,
    required this.isDisliked,
    required this.isDeleted,
  });

  factory ProjectReviewResponse({
    required int likes,
    required int dislikes,
    required bool isLiked,
    required bool isDisliked,
    required bool isDeleted,
  }) = _ProjectReviewResponseImpl;

  factory ProjectReviewResponse.fromJson(
      Map<String, dynamic> jsonSerialization) {
    return ProjectReviewResponse(
      likes: jsonSerialization['likes'] as int,
      dislikes: jsonSerialization['dislikes'] as int,
      isLiked: jsonSerialization['isLiked'] as bool,
      isDisliked: jsonSerialization['isDisliked'] as bool,
      isDeleted: jsonSerialization['isDeleted'] as bool,
    );
  }

  int likes;

  int dislikes;

  bool isLiked;

  bool isDisliked;

  bool isDeleted;

  /// Returns a shallow copy of this [ProjectReviewResponse]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  ProjectReviewResponse copyWith({
    int? likes,
    int? dislikes,
    bool? isLiked,
    bool? isDisliked,
    bool? isDeleted,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      'likes': likes,
      'dislikes': dislikes,
      'isLiked': isLiked,
      'isDisliked': isDisliked,
      'isDeleted': isDeleted,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      'likes': likes,
      'dislikes': dislikes,
      'isLiked': isLiked,
      'isDisliked': isDisliked,
      'isDeleted': isDeleted,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _ProjectReviewResponseImpl extends ProjectReviewResponse {
  _ProjectReviewResponseImpl({
    required int likes,
    required int dislikes,
    required bool isLiked,
    required bool isDisliked,
    required bool isDeleted,
  }) : super._(
          likes: likes,
          dislikes: dislikes,
          isLiked: isLiked,
          isDisliked: isDisliked,
          isDeleted: isDeleted,
        );

  /// Returns a shallow copy of this [ProjectReviewResponse]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  ProjectReviewResponse copyWith({
    int? likes,
    int? dislikes,
    bool? isLiked,
    bool? isDisliked,
    bool? isDeleted,
  }) {
    return ProjectReviewResponse(
      likes: likes ?? this.likes,
      dislikes: dislikes ?? this.dislikes,
      isLiked: isLiked ?? this.isLiked,
      isDisliked: isDisliked ?? this.isDisliked,
      isDeleted: isDeleted ?? this.isDeleted,
    );
  }
}
