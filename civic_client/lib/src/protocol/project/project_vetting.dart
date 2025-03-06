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
    required this.images,
    this.text,
  });

  factory ProjectVetting({
    int? id,
    required int projectId,
    _i2.Project? project,
    required int ownerId,
    _i3.UserRecord? owner,
    required List<String> images,
    String? text,
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
      images: (jsonSerialization['images'] as List)
          .map((e) => e as String)
          .toList(),
      text: jsonSerialization['text'] as String?,
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

  List<String> images;

  String? text;

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
    String? text,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'projectId': projectId,
      if (project != null) 'project': project?.toJson(),
      'ownerId': ownerId,
      if (owner != null) 'owner': owner?.toJson(),
      'images': images.toJson(),
      if (text != null) 'text': text,
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
    required List<String> images,
    String? text,
  }) : super._(
          id: id,
          projectId: projectId,
          project: project,
          ownerId: ownerId,
          owner: owner,
          images: images,
          text: text,
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
    List<String>? images,
    Object? text = _Undefined,
  }) {
    return ProjectVetting(
      id: id is int? ? id : this.id,
      projectId: projectId ?? this.projectId,
      project: project is _i2.Project? ? project : this.project?.copyWith(),
      ownerId: ownerId ?? this.ownerId,
      owner: owner is _i3.UserRecord? ? owner : this.owner?.copyWith(),
      images: images ?? this.images.map((e0) => e0).toList(),
      text: text is String? ? text : this.text,
    );
  }
}
