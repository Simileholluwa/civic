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
import '../poll/poll.dart' as _i2;
import '../user/user_record.dart' as _i3;

abstract class PollLikes implements _i1.SerializableModel {
  PollLikes._({
    this.id,
    required this.pollId,
    this.poll,
    required this.ownerId,
    this.owner,
    this.dateCreated,
  });

  factory PollLikes({
    int? id,
    required int pollId,
    _i2.Poll? poll,
    required int ownerId,
    _i3.UserRecord? owner,
    DateTime? dateCreated,
  }) = _PollLikesImpl;

  factory PollLikes.fromJson(Map<String, dynamic> jsonSerialization) {
    return PollLikes(
      id: jsonSerialization['id'] as int?,
      pollId: jsonSerialization['pollId'] as int,
      poll: jsonSerialization['poll'] == null
          ? null
          : _i2.Poll.fromJson(
              (jsonSerialization['poll'] as Map<String, dynamic>)),
      ownerId: jsonSerialization['ownerId'] as int,
      owner: jsonSerialization['owner'] == null
          ? null
          : _i3.UserRecord.fromJson(
              (jsonSerialization['owner'] as Map<String, dynamic>)),
      dateCreated: jsonSerialization['dateCreated'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(
              jsonSerialization['dateCreated']),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int pollId;

  _i2.Poll? poll;

  int ownerId;

  _i3.UserRecord? owner;

  DateTime? dateCreated;

  /// Returns a shallow copy of this [PollLikes]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  PollLikes copyWith({
    int? id,
    int? pollId,
    _i2.Poll? poll,
    int? ownerId,
    _i3.UserRecord? owner,
    DateTime? dateCreated,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'pollId': pollId,
      if (poll != null) 'poll': poll?.toJson(),
      'ownerId': ownerId,
      if (owner != null) 'owner': owner?.toJson(),
      if (dateCreated != null) 'dateCreated': dateCreated?.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _PollLikesImpl extends PollLikes {
  _PollLikesImpl({
    int? id,
    required int pollId,
    _i2.Poll? poll,
    required int ownerId,
    _i3.UserRecord? owner,
    DateTime? dateCreated,
  }) : super._(
          id: id,
          pollId: pollId,
          poll: poll,
          ownerId: ownerId,
          owner: owner,
          dateCreated: dateCreated,
        );

  /// Returns a shallow copy of this [PollLikes]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  PollLikes copyWith({
    Object? id = _Undefined,
    int? pollId,
    Object? poll = _Undefined,
    int? ownerId,
    Object? owner = _Undefined,
    Object? dateCreated = _Undefined,
  }) {
    return PollLikes(
      id: id is int? ? id : this.id,
      pollId: pollId ?? this.pollId,
      poll: poll is _i2.Poll? ? poll : this.poll?.copyWith(),
      ownerId: ownerId ?? this.ownerId,
      owner: owner is _i3.UserRecord? ? owner : this.owner?.copyWith(),
      dateCreated: dateCreated is DateTime? ? dateCreated : this.dateCreated,
    );
  }
}
