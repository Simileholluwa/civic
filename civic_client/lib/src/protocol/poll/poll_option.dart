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
import '../poll/poll.dart' as _i2;
import 'package:civic_client/src/protocol/protocol.dart' as _i3;

abstract class PollOption implements _i1.SerializableModel {
  PollOption._({
    this.id,
    required this.pollId,
    this.poll,
    this.option,
    int? votesCount,
  }) : votesCount = votesCount ?? 0;

  factory PollOption({
    int? id,
    required int pollId,
    _i2.Poll? poll,
    String? option,
    int? votesCount,
  }) = _PollOptionImpl;

  factory PollOption.fromJson(Map<String, dynamic> jsonSerialization) {
    return PollOption(
      id: jsonSerialization['id'] as int?,
      pollId: jsonSerialization['pollId'] as int,
      poll: jsonSerialization['poll'] == null
          ? null
          : _i3.Protocol().deserialize<_i2.Poll>(jsonSerialization['poll']),
      option: jsonSerialization['option'] as String?,
      votesCount: jsonSerialization['votesCount'] as int?,
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int pollId;

  _i2.Poll? poll;

  String? option;

  int? votesCount;

  /// Returns a shallow copy of this [PollOption]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  PollOption copyWith({
    int? id,
    int? pollId,
    _i2.Poll? poll,
    String? option,
    int? votesCount,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'PollOption',
      if (id != null) 'id': id,
      'pollId': pollId,
      if (poll != null) 'poll': poll?.toJson(),
      if (option != null) 'option': option,
      if (votesCount != null) 'votesCount': votesCount,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _PollOptionImpl extends PollOption {
  _PollOptionImpl({
    int? id,
    required int pollId,
    _i2.Poll? poll,
    String? option,
    int? votesCount,
  }) : super._(
         id: id,
         pollId: pollId,
         poll: poll,
         option: option,
         votesCount: votesCount,
       );

  /// Returns a shallow copy of this [PollOption]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  PollOption copyWith({
    Object? id = _Undefined,
    int? pollId,
    Object? poll = _Undefined,
    Object? option = _Undefined,
    Object? votesCount = _Undefined,
  }) {
    return PollOption(
      id: id is int? ? id : this.id,
      pollId: pollId ?? this.pollId,
      poll: poll is _i2.Poll? ? poll : this.poll?.copyWith(),
      option: option is String? ? option : this.option,
      votesCount: votesCount is int? ? votesCount : this.votesCount,
    );
  }
}
