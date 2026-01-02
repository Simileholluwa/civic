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

abstract class ProjectSubscription implements _i1.SerializableModel {
  ProjectSubscription._({
    this.id,
    required this.userId,
    this.user,
    required this.projectId,
    this.project,
    DateTime? createdAt,
  }) : createdAt = createdAt ?? DateTime.now();

  factory ProjectSubscription({
    int? id,
    required int userId,
    _i2.UserRecord? user,
    required int projectId,
    _i3.Project? project,
    DateTime? createdAt,
  }) = _ProjectSubscriptionImpl;

  factory ProjectSubscription.fromJson(Map<String, dynamic> jsonSerialization) {
    return ProjectSubscription(
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
      createdAt: jsonSerialization['createdAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
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

  DateTime? createdAt;

  /// Returns a shallow copy of this [ProjectSubscription]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  ProjectSubscription copyWith({
    int? id,
    int? userId,
    _i2.UserRecord? user,
    int? projectId,
    _i3.Project? project,
    DateTime? createdAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'ProjectSubscription',
      if (id != null) 'id': id,
      'userId': userId,
      if (user != null) 'user': user?.toJson(),
      'projectId': projectId,
      if (project != null) 'project': project?.toJson(),
      if (createdAt != null) 'createdAt': createdAt?.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _ProjectSubscriptionImpl extends ProjectSubscription {
  _ProjectSubscriptionImpl({
    int? id,
    required int userId,
    _i2.UserRecord? user,
    required int projectId,
    _i3.Project? project,
    DateTime? createdAt,
  }) : super._(
         id: id,
         userId: userId,
         user: user,
         projectId: projectId,
         project: project,
         createdAt: createdAt,
       );

  /// Returns a shallow copy of this [ProjectSubscription]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  ProjectSubscription copyWith({
    Object? id = _Undefined,
    int? userId,
    Object? user = _Undefined,
    int? projectId,
    Object? project = _Undefined,
    Object? createdAt = _Undefined,
  }) {
    return ProjectSubscription(
      id: id is int? ? id : this.id,
      userId: userId ?? this.userId,
      user: user is _i2.UserRecord? ? user : this.user?.copyWith(),
      projectId: projectId ?? this.projectId,
      project: project is _i3.Project? ? project : this.project?.copyWith(),
      createdAt: createdAt is DateTime? ? createdAt : this.createdAt,
    );
  }
}
