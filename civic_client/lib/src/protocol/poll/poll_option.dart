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

abstract class PollOption implements _i1.SerializableModel {
  PollOption._({
    this.id,
    required this.pollId,
    this.poll,
    this.option,
    this.votedBy,
  });

  factory PollOption({
    int? id,
    required int pollId,
    _i2.Poll? poll,
    String? option,
    List<int>? votedBy,
  }) = _PollOptionImpl;

  factory PollOption.fromJson(Map<String, dynamic> jsonSerialization) {
    return PollOption(
      id: jsonSerialization['id'] as int?,
      pollId: jsonSerialization['pollId'] as int,
      poll: jsonSerialization['poll'] == null
          ? null
          : _i2.Poll.fromJson(
              (jsonSerialization['poll'] as Map<String, dynamic>)),
      option: jsonSerialization['option'] as String?,
      votedBy: (jsonSerialization['votedBy'] as List?)
          ?.map((e) => e as int)
          .toList(),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int pollId;

  _i2.Poll? poll;

  String? option;

  List<int>? votedBy;

  /// Returns a shallow copy of this [PollOption]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  PollOption copyWith({
    int? id,
    int? pollId,
    _i2.Poll? poll,
    String? option,
    List<int>? votedBy,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'pollId': pollId,
      if (poll != null) 'poll': poll?.toJson(),
      if (option != null) 'option': option,
      if (votedBy != null) 'votedBy': votedBy?.toJson(),
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
    List<int>? votedBy,
  }) : super._(
          id: id,
          pollId: pollId,
          poll: poll,
          option: option,
          votedBy: votedBy,
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
    Object? votedBy = _Undefined,
  }) {
    return PollOption(
      id: id is int? ? id : this.id,
      pollId: pollId ?? this.pollId,
      poll: poll is _i2.Poll? ? poll : this.poll?.copyWith(),
      option: option is String? ? option : this.option,
      votedBy: votedBy is List<int>?
          ? votedBy
          : this.votedBy?.map((e0) => e0).toList(),
    );
  }
}
