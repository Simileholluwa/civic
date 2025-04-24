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
import '../user/user_record.dart' as _i3;

abstract class ProjectVetting implements _i1.SerializableModel {
  ProjectVetting._({
    this.id,
    required this.projectId,
    this.project,
    required this.ownerId,
    this.owner,
    this.images,
    this.comment,
    this.status,
    DateTime? createdAt,
    this.updatedAt,
  }) : createdAt = createdAt ?? DateTime.now();

  factory ProjectVetting({
    int? id,
    required int projectId,
    _i2.Project? project,
    required int ownerId,
    _i3.UserRecord? owner,
    List<String>? images,
    String? comment,
    String? status,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _ProjectVettingImpl;

  factory ProjectVetting.fromJson(Map<String, dynamic> jsonSerialization) {
    return ProjectVetting(
      id: jsonSerialization['id'] as int?,
      projectId: jsonSerialization['projectId'] as int,
      project: jsonSerialization['project'] == null
          ? null
          : _i2.Project.fromJson(
              (jsonSerialization['project'] as Map<String, dynamic>)),
      ownerId: jsonSerialization['ownerId'] as int,
      owner: jsonSerialization['owner'] == null
          ? null
          : _i3.UserRecord.fromJson(
              (jsonSerialization['owner'] as Map<String, dynamic>)),
      images: (jsonSerialization['images'] as List?)
          ?.map((e) => e as String)
          .toList(),
      comment: jsonSerialization['comment'] as String?,
      status: jsonSerialization['status'] as String?,
      createdAt: jsonSerialization['createdAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
      updatedAt: jsonSerialization['updatedAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['updatedAt']),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int projectId;

  _i2.Project? project;

  int ownerId;

  _i3.UserRecord? owner;

  List<String>? images;

  String? comment;

  String? status;

  DateTime? createdAt;

  DateTime? updatedAt;

  /// Returns a shallow copy of this [ProjectVetting]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  ProjectVetting copyWith({
    int? id,
    int? projectId,
    _i2.Project? project,
    int? ownerId,
    _i3.UserRecord? owner,
    List<String>? images,
    String? comment,
    String? status,
    DateTime? createdAt,
    DateTime? updatedAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'projectId': projectId,
      if (project != null) 'project': project?.toJson(),
      'ownerId': ownerId,
      if (owner != null) 'owner': owner?.toJson(),
      if (images != null) 'images': images?.toJson(),
      if (comment != null) 'comment': comment,
      if (status != null) 'status': status,
      if (createdAt != null) 'createdAt': createdAt?.toJson(),
      if (updatedAt != null) 'updatedAt': updatedAt?.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _ProjectVettingImpl extends ProjectVetting {
  _ProjectVettingImpl({
    int? id,
    required int projectId,
    _i2.Project? project,
    required int ownerId,
    _i3.UserRecord? owner,
    List<String>? images,
    String? comment,
    String? status,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) : super._(
          id: id,
          projectId: projectId,
          project: project,
          ownerId: ownerId,
          owner: owner,
          images: images,
          comment: comment,
          status: status,
          createdAt: createdAt,
          updatedAt: updatedAt,
        );

  /// Returns a shallow copy of this [ProjectVetting]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  ProjectVetting copyWith({
    Object? id = _Undefined,
    int? projectId,
    Object? project = _Undefined,
    int? ownerId,
    Object? owner = _Undefined,
    Object? images = _Undefined,
    Object? comment = _Undefined,
    Object? status = _Undefined,
    Object? createdAt = _Undefined,
    Object? updatedAt = _Undefined,
  }) {
    return ProjectVetting(
      id: id is int? ? id : this.id,
      projectId: projectId ?? this.projectId,
      project: project is _i2.Project? ? project : this.project?.copyWith(),
      ownerId: ownerId ?? this.ownerId,
      owner: owner is _i3.UserRecord? ? owner : this.owner?.copyWith(),
      images: images is List<String>?
          ? images
          : this.images?.map((e0) => e0).toList(),
      comment: comment is String? ? comment : this.comment,
      status: status is String? ? status : this.status,
      createdAt: createdAt is DateTime? ? createdAt : this.createdAt,
      updatedAt: updatedAt is DateTime? ? updatedAt : this.updatedAt,
    );
  }
}
