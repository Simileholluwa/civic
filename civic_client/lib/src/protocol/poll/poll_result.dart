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
import '../poll/poll_option_result.dart' as _i2;

abstract class PollResult implements _i1.SerializableModel {
  PollResult._({
    required this.pollId,
    required this.totalVotes,
    required this.options,
  });

  factory PollResult({
    required int pollId,
    required int totalVotes,
    required List<_i2.PollOptionResult> options,
  }) = _PollResultImpl;

  factory PollResult.fromJson(Map<String, dynamic> jsonSerialization) {
    return PollResult(
      pollId: jsonSerialization['pollId'] as int,
      totalVotes: jsonSerialization['totalVotes'] as int,
      options: (jsonSerialization['options'] as List)
          .map(
              (e) => _i2.PollOptionResult.fromJson((e as Map<String, dynamic>)))
          .toList(),
    );
  }

  int pollId;

  int totalVotes;

  List<_i2.PollOptionResult> options;

  /// Returns a shallow copy of this [PollResult]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  PollResult copyWith({
    int? pollId,
    int? totalVotes,
    List<_i2.PollOptionResult>? options,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      'pollId': pollId,
      'totalVotes': totalVotes,
      'options': options.toJson(valueToJson: (v) => v.toJson()),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _PollResultImpl extends PollResult {
  _PollResultImpl({
    required int pollId,
    required int totalVotes,
    required List<_i2.PollOptionResult> options,
  }) : super._(
          pollId: pollId,
          totalVotes: totalVotes,
          options: options,
        );

  /// Returns a shallow copy of this [PollResult]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  PollResult copyWith({
    int? pollId,
    int? totalVotes,
    List<_i2.PollOptionResult>? options,
  }) {
    return PollResult(
      pollId: pollId ?? this.pollId,
      totalVotes: totalVotes ?? this.totalVotes,
      options: options ?? this.options.map((e0) => e0.copyWith()).toList(),
    );
  }
}
