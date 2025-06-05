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
import '../poll/poll_option.dart' as _i3;
import '../user/user_record.dart' as _i4;

abstract class PollVote implements _i1.SerializableModel {
  PollVote._({
    this.id,
    required this.pollId,
    this.poll,
    required this.optionId,
    this.option,
    required this.voterId,
    this.voter,
    DateTime? votedAt,
  }) : votedAt = votedAt ?? DateTime.now();

  factory PollVote({
    int? id,
    required int pollId,
    _i2.Poll? poll,
    required int optionId,
    _i3.PollOption? option,
    required int voterId,
    _i4.UserRecord? voter,
    DateTime? votedAt,
  }) = _PollVoteImpl;

  factory PollVote.fromJson(Map<String, dynamic> jsonSerialization) {
    return PollVote(
      id: jsonSerialization['id'] as int?,
      pollId: jsonSerialization['pollId'] as int,
      poll: jsonSerialization['poll'] == null
          ? null
          : _i2.Poll.fromJson(
              (jsonSerialization['poll'] as Map<String, dynamic>)),
      optionId: jsonSerialization['optionId'] as int,
      option: jsonSerialization['option'] == null
          ? null
          : _i3.PollOption.fromJson(
              (jsonSerialization['option'] as Map<String, dynamic>)),
      voterId: jsonSerialization['voterId'] as int,
      voter: jsonSerialization['voter'] == null
          ? null
          : _i4.UserRecord.fromJson(
              (jsonSerialization['voter'] as Map<String, dynamic>)),
      votedAt: jsonSerialization['votedAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['votedAt']),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int pollId;

  _i2.Poll? poll;

  int optionId;

  _i3.PollOption? option;

  int voterId;

  _i4.UserRecord? voter;

  DateTime? votedAt;

  /// Returns a shallow copy of this [PollVote]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  PollVote copyWith({
    int? id,
    int? pollId,
    _i2.Poll? poll,
    int? optionId,
    _i3.PollOption? option,
    int? voterId,
    _i4.UserRecord? voter,
    DateTime? votedAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'pollId': pollId,
      if (poll != null) 'poll': poll?.toJson(),
      'optionId': optionId,
      if (option != null) 'option': option?.toJson(),
      'voterId': voterId,
      if (voter != null) 'voter': voter?.toJson(),
      if (votedAt != null) 'votedAt': votedAt?.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _PollVoteImpl extends PollVote {
  _PollVoteImpl({
    int? id,
    required int pollId,
    _i2.Poll? poll,
    required int optionId,
    _i3.PollOption? option,
    required int voterId,
    _i4.UserRecord? voter,
    DateTime? votedAt,
  }) : super._(
          id: id,
          pollId: pollId,
          poll: poll,
          optionId: optionId,
          option: option,
          voterId: voterId,
          voter: voter,
          votedAt: votedAt,
        );

  /// Returns a shallow copy of this [PollVote]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  PollVote copyWith({
    Object? id = _Undefined,
    int? pollId,
    Object? poll = _Undefined,
    int? optionId,
    Object? option = _Undefined,
    int? voterId,
    Object? voter = _Undefined,
    Object? votedAt = _Undefined,
  }) {
    return PollVote(
      id: id is int? ? id : this.id,
      pollId: pollId ?? this.pollId,
      poll: poll is _i2.Poll? ? poll : this.poll?.copyWith(),
      optionId: optionId ?? this.optionId,
      option: option is _i3.PollOption? ? option : this.option?.copyWith(),
      voterId: voterId ?? this.voterId,
      voter: voter is _i4.UserRecord? ? voter : this.voter?.copyWith(),
      votedAt: votedAt is DateTime? ? votedAt : this.votedAt,
    );
  }
}
