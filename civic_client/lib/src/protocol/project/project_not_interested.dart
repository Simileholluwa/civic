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
import '../user/user_record.dart' as _i2;
import '../project/project.dart' as _i3;
import 'package:civic_client/src/protocol/protocol.dart' as _i4;

abstract class ProjectNotInterested implements _i1.SerializableModel {
  ProjectNotInterested._({
    this.id,
    required this.userId,
    this.user,
    required this.projectId,
    this.project,
    DateTime? dateMarked,
  }) : dateMarked = dateMarked ?? DateTime.now();

  factory ProjectNotInterested({
    int? id,
    required int userId,
    _i2.UserRecord? user,
    required int projectId,
    _i3.Project? project,
    DateTime? dateMarked,
  }) = _ProjectNotInterestedImpl;

  factory ProjectNotInterested.fromJson(
    Map<String, dynamic> jsonSerialization,
  ) {
    return ProjectNotInterested(
      id: jsonSerialization['id'] as int?,
      userId: jsonSerialization['userId'] as int,
      user: jsonSerialization['user'] == null
          ? null
          : _i4.Protocol().deserialize<_i2.UserRecord>(
              jsonSerialization['user'],
            ),
      projectId: jsonSerialization['projectId'] as int,
      project: jsonSerialization['project'] == null
          ? null
          : _i4.Protocol().deserialize<_i3.Project>(
              jsonSerialization['project'],
            ),
      dateMarked: jsonSerialization['dateMarked'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['dateMarked']),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int userId;

  _i2.UserRecord? user;

  int projectId;

  _i3.Project? project;

  DateTime? dateMarked;

  /// Returns a shallow copy of this [ProjectNotInterested]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  ProjectNotInterested copyWith({
    int? id,
    int? userId,
    _i2.UserRecord? user,
    int? projectId,
    _i3.Project? project,
    DateTime? dateMarked,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'ProjectNotInterested',
      if (id != null) 'id': id,
      'userId': userId,
      if (user != null) 'user': user?.toJson(),
      'projectId': projectId,
      if (project != null) 'project': project?.toJson(),
      if (dateMarked != null) 'dateMarked': dateMarked?.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _ProjectNotInterestedImpl extends ProjectNotInterested {
  _ProjectNotInterestedImpl({
    int? id,
    required int userId,
    _i2.UserRecord? user,
    required int projectId,
    _i3.Project? project,
    DateTime? dateMarked,
  }) : super._(
         id: id,
         userId: userId,
         user: user,
         projectId: projectId,
         project: project,
         dateMarked: dateMarked,
       );

  /// Returns a shallow copy of this [ProjectNotInterested]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  ProjectNotInterested copyWith({
    Object? id = _Undefined,
    int? userId,
    Object? user = _Undefined,
    int? projectId,
    Object? project = _Undefined,
    Object? dateMarked = _Undefined,
  }) {
    return ProjectNotInterested(
      id: id is int? ? id : this.id,
      userId: userId ?? this.userId,
      user: user is _i2.UserRecord? ? user : this.user?.copyWith(),
      projectId: projectId ?? this.projectId,
      project: project is _i3.Project? ? project : this.project?.copyWith(),
      dateMarked: dateMarked is DateTime? ? dateMarked : this.dateMarked,
    );
  }
}
