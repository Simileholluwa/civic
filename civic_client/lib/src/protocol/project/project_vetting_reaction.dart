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
import '../project/project_vetting.dart' as _i3;
import 'package:civic_client/src/protocol/protocol.dart' as _i4;

abstract class ProjectVettingReaction implements _i1.SerializableModel {
  ProjectVettingReaction._({
    this.id,
    required this.ownerId,
    this.owner,
    required this.vettingId,
    this.vetting,
    DateTime? dateCreated,
    this.updatedAt,
    this.isLike,
    this.isDeleted,
  }) : dateCreated = dateCreated ?? DateTime.now();

  factory ProjectVettingReaction({
    int? id,
    required int ownerId,
    _i2.UserRecord? owner,
    required int vettingId,
    _i3.ProjectVetting? vetting,
    DateTime? dateCreated,
    DateTime? updatedAt,
    bool? isLike,
    bool? isDeleted,
  }) = _ProjectVettingReactionImpl;

  factory ProjectVettingReaction.fromJson(
    Map<String, dynamic> jsonSerialization,
  ) {
    return ProjectVettingReaction(
      id: jsonSerialization['id'] as int?,
      ownerId: jsonSerialization['ownerId'] as int,
      owner: jsonSerialization['owner'] == null
          ? null
          : _i4.Protocol().deserialize<_i2.UserRecord>(
              jsonSerialization['owner'],
            ),
      vettingId: jsonSerialization['vettingId'] as int,
      vetting: jsonSerialization['vetting'] == null
          ? null
          : _i4.Protocol().deserialize<_i3.ProjectVetting>(
              jsonSerialization['vetting'],
            ),
      dateCreated: jsonSerialization['dateCreated'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(
              jsonSerialization['dateCreated'],
            ),
      updatedAt: jsonSerialization['updatedAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['updatedAt']),
      isLike: jsonSerialization['isLike'] as bool?,
      isDeleted: jsonSerialization['isDeleted'] as bool?,
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int ownerId;

  _i2.UserRecord? owner;

  int vettingId;

  _i3.ProjectVetting? vetting;

  DateTime? dateCreated;

  DateTime? updatedAt;

  bool? isLike;

  bool? isDeleted;

  /// Returns a shallow copy of this [ProjectVettingReaction]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  ProjectVettingReaction copyWith({
    int? id,
    int? ownerId,
    _i2.UserRecord? owner,
    int? vettingId,
    _i3.ProjectVetting? vetting,
    DateTime? dateCreated,
    DateTime? updatedAt,
    bool? isLike,
    bool? isDeleted,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'ProjectVettingReaction',
      if (id != null) 'id': id,
      'ownerId': ownerId,
      if (owner != null) 'owner': owner?.toJson(),
      'vettingId': vettingId,
      if (vetting != null) 'vetting': vetting?.toJson(),
      if (dateCreated != null) 'dateCreated': dateCreated?.toJson(),
      if (updatedAt != null) 'updatedAt': updatedAt?.toJson(),
      if (isLike != null) 'isLike': isLike,
      if (isDeleted != null) 'isDeleted': isDeleted,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _ProjectVettingReactionImpl extends ProjectVettingReaction {
  _ProjectVettingReactionImpl({
    int? id,
    required int ownerId,
    _i2.UserRecord? owner,
    required int vettingId,
    _i3.ProjectVetting? vetting,
    DateTime? dateCreated,
    DateTime? updatedAt,
    bool? isLike,
    bool? isDeleted,
  }) : super._(
         id: id,
         ownerId: ownerId,
         owner: owner,
         vettingId: vettingId,
         vetting: vetting,
         dateCreated: dateCreated,
         updatedAt: updatedAt,
         isLike: isLike,
         isDeleted: isDeleted,
       );

  /// Returns a shallow copy of this [ProjectVettingReaction]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  ProjectVettingReaction copyWith({
    Object? id = _Undefined,
    int? ownerId,
    Object? owner = _Undefined,
    int? vettingId,
    Object? vetting = _Undefined,
    Object? dateCreated = _Undefined,
    Object? updatedAt = _Undefined,
    Object? isLike = _Undefined,
    Object? isDeleted = _Undefined,
  }) {
    return ProjectVettingReaction(
      id: id is int? ? id : this.id,
      ownerId: ownerId ?? this.ownerId,
      owner: owner is _i2.UserRecord? ? owner : this.owner?.copyWith(),
      vettingId: vettingId ?? this.vettingId,
      vetting: vetting is _i3.ProjectVetting?
          ? vetting
          : this.vetting?.copyWith(),
      dateCreated: dateCreated is DateTime? ? dateCreated : this.dateCreated,
      updatedAt: updatedAt is DateTime? ? updatedAt : this.updatedAt,
      isLike: isLike is bool? ? isLike : this.isLike,
      isDeleted: isDeleted is bool? ? isDeleted : this.isDeleted,
    );
  }
}
