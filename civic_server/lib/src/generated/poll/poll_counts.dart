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
import 'package:serverpod/serverpod.dart' as _i1;
import '../poll/poll_option_count.dart' as _i2;
import 'package:civic_server/src/generated/protocol.dart' as _i3;

abstract class PollCounts
    implements _i1.SerializableModel, _i1.ProtocolSerialization {
  PollCounts._({
    required this.pollId,
    int? votesCount,
    this.options,
  }) : votesCount = votesCount ?? 0;

  factory PollCounts({
    required int pollId,
    int? votesCount,
    List<_i2.PollOptionCount>? options,
  }) = _PollCountsImpl;

  factory PollCounts.fromJson(Map<String, dynamic> jsonSerialization) {
    return PollCounts(
      pollId: jsonSerialization['pollId'] as int,
      votesCount: jsonSerialization['votesCount'] as int?,
      options: jsonSerialization['options'] == null
          ? null
          : _i3.Protocol().deserialize<List<_i2.PollOptionCount>>(
              jsonSerialization['options'],
            ),
    );
  }

  int pollId;

  int? votesCount;

  List<_i2.PollOptionCount>? options;

  /// Returns a shallow copy of this [PollCounts]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  PollCounts copyWith({
    int? pollId,
    int? votesCount,
    List<_i2.PollOptionCount>? options,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'PollCounts',
      'pollId': pollId,
      if (votesCount != null) 'votesCount': votesCount,
      if (options != null)
        'options': options?.toJson(valueToJson: (v) => v.toJson()),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'PollCounts',
      'pollId': pollId,
      if (votesCount != null) 'votesCount': votesCount,
      if (options != null)
        'options': options?.toJson(valueToJson: (v) => v.toJsonForProtocol()),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _PollCountsImpl extends PollCounts {
  _PollCountsImpl({
    required int pollId,
    int? votesCount,
    List<_i2.PollOptionCount>? options,
  }) : super._(
         pollId: pollId,
         votesCount: votesCount,
         options: options,
       );

  /// Returns a shallow copy of this [PollCounts]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  PollCounts copyWith({
    int? pollId,
    Object? votesCount = _Undefined,
    Object? options = _Undefined,
  }) {
    return PollCounts(
      pollId: pollId ?? this.pollId,
      votesCount: votesCount is int? ? votesCount : this.votesCount,
      options: options is List<_i2.PollOptionCount>?
          ? options
          : this.options?.map((e0) => e0.copyWith()).toList(),
    );
  }
}
