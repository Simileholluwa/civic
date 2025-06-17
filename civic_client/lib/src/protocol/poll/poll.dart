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
import '../user/user_record.dart' as _i2;
import '../poll/poll_option.dart' as _i3;

abstract class Poll implements _i1.SerializableModel {
  Poll._({
    this.id,
    required this.ownerId,
    this.owner,
    this.options,
    this.expiresAt,
    this.votedBy,
  });

  factory Poll({
    int? id,
    required int ownerId,
    _i2.UserRecord? owner,
    List<_i3.PollOption>? options,
    DateTime? expiresAt,
    List<int>? votedBy,
  }) = _PollImpl;

  factory Poll.fromJson(Map<String, dynamic> jsonSerialization) {
    return Poll(
      id: jsonSerialization['id'] as int?,
      ownerId: jsonSerialization['ownerId'] as int,
      owner: jsonSerialization['owner'] == null
          ? null
          : _i2.UserRecord.fromJson(
              (jsonSerialization['owner'] as Map<String, dynamic>)),
      options: (jsonSerialization['options'] as List?)
          ?.map((e) => _i3.PollOption.fromJson((e as Map<String, dynamic>)))
          .toList(),
      expiresAt: jsonSerialization['expiresAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['expiresAt']),
      votedBy: (jsonSerialization['votedBy'] as List?)
          ?.map((e) => e as int)
          .toList(),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int ownerId;

  _i2.UserRecord? owner;

  List<_i3.PollOption>? options;

  DateTime? expiresAt;

  List<int>? votedBy;

  /// Returns a shallow copy of this [Poll]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  Poll copyWith({
    int? id,
    int? ownerId,
    _i2.UserRecord? owner,
    List<_i3.PollOption>? options,
    DateTime? expiresAt,
    List<int>? votedBy,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'ownerId': ownerId,
      if (owner != null) 'owner': owner?.toJson(),
      if (options != null)
        'options': options?.toJson(valueToJson: (v) => v.toJson()),
      if (expiresAt != null) 'expiresAt': expiresAt?.toJson(),
      if (votedBy != null) 'votedBy': votedBy?.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _PollImpl extends Poll {
  _PollImpl({
    int? id,
    required int ownerId,
    _i2.UserRecord? owner,
    List<_i3.PollOption>? options,
    DateTime? expiresAt,
    List<int>? votedBy,
  }) : super._(
          id: id,
          ownerId: ownerId,
          owner: owner,
          options: options,
          expiresAt: expiresAt,
          votedBy: votedBy,
        );

  /// Returns a shallow copy of this [Poll]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  Poll copyWith({
    Object? id = _Undefined,
    int? ownerId,
    Object? owner = _Undefined,
    Object? options = _Undefined,
    Object? expiresAt = _Undefined,
    Object? votedBy = _Undefined,
  }) {
    return Poll(
      id: id is int? ? id : this.id,
      ownerId: ownerId ?? this.ownerId,
      owner: owner is _i2.UserRecord? ? owner : this.owner?.copyWith(),
      options: options is List<_i3.PollOption>?
          ? options
          : this.options?.map((e0) => e0.copyWith()).toList(),
      expiresAt: expiresAt is DateTime? ? expiresAt : this.expiresAt,
      votedBy: votedBy is List<int>?
          ? votedBy
          : this.votedBy?.map((e0) => e0).toList(),
    );
  }
}
