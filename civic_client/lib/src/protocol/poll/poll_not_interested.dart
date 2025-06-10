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
import '../poll/poll.dart' as _i3;

abstract class PollNotInterested implements _i1.SerializableModel {
  PollNotInterested._({
    this.id,
    required this.userId,
    this.user,
    required this.pollId,
    this.poll,
    DateTime? dateMarked,
    required this.reason,
  }) : dateMarked = dateMarked ?? DateTime.now();

  factory PollNotInterested({
    int? id,
    required int userId,
    _i2.UserRecord? user,
    required int pollId,
    _i3.Poll? poll,
    DateTime? dateMarked,
    required String reason,
  }) = _PollNotInterestedImpl;

  factory PollNotInterested.fromJson(Map<String, dynamic> jsonSerialization) {
    return PollNotInterested(
      id: jsonSerialization['id'] as int?,
      userId: jsonSerialization['userId'] as int,
      user: jsonSerialization['user'] == null
          ? null
          : _i2.UserRecord.fromJson(
              (jsonSerialization['user'] as Map<String, dynamic>)),
      pollId: jsonSerialization['pollId'] as int,
      poll: jsonSerialization['poll'] == null
          ? null
          : _i3.Poll.fromJson(
              (jsonSerialization['poll'] as Map<String, dynamic>)),
      dateMarked: jsonSerialization['dateMarked'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['dateMarked']),
      reason: jsonSerialization['reason'] as String,
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int userId;

  _i2.UserRecord? user;

  int pollId;

  _i3.Poll? poll;

  DateTime? dateMarked;

  String reason;

  /// Returns a shallow copy of this [PollNotInterested]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  PollNotInterested copyWith({
    int? id,
    int? userId,
    _i2.UserRecord? user,
    int? pollId,
    _i3.Poll? poll,
    DateTime? dateMarked,
    String? reason,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'userId': userId,
      if (user != null) 'user': user?.toJson(),
      'pollId': pollId,
      if (poll != null) 'poll': poll?.toJson(),
      if (dateMarked != null) 'dateMarked': dateMarked?.toJson(),
      'reason': reason,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _PollNotInterestedImpl extends PollNotInterested {
  _PollNotInterestedImpl({
    int? id,
    required int userId,
    _i2.UserRecord? user,
    required int pollId,
    _i3.Poll? poll,
    DateTime? dateMarked,
    required String reason,
  }) : super._(
          id: id,
          userId: userId,
          user: user,
          pollId: pollId,
          poll: poll,
          dateMarked: dateMarked,
          reason: reason,
        );

  /// Returns a shallow copy of this [PollNotInterested]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  PollNotInterested copyWith({
    Object? id = _Undefined,
    int? userId,
    Object? user = _Undefined,
    int? pollId,
    Object? poll = _Undefined,
    Object? dateMarked = _Undefined,
    String? reason,
  }) {
    return PollNotInterested(
      id: id is int? ? id : this.id,
      userId: userId ?? this.userId,
      user: user is _i2.UserRecord? ? user : this.user?.copyWith(),
      pollId: pollId ?? this.pollId,
      poll: poll is _i3.Poll? ? poll : this.poll?.copyWith(),
      dateMarked: dateMarked is DateTime? ? dateMarked : this.dateMarked,
      reason: reason ?? this.reason,
    );
  }
}
