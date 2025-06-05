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

abstract class PollOptionResult implements _i1.SerializableModel {
  PollOptionResult._({
    required this.optionId,
    required this.option,
    required this.voteCount,
    required this.percentage,
  });

  factory PollOptionResult({
    required int optionId,
    required String option,
    required int voteCount,
    required double percentage,
  }) = _PollOptionResultImpl;

  factory PollOptionResult.fromJson(Map<String, dynamic> jsonSerialization) {
    return PollOptionResult(
      optionId: jsonSerialization['optionId'] as int,
      option: jsonSerialization['option'] as String,
      voteCount: jsonSerialization['voteCount'] as int,
      percentage: (jsonSerialization['percentage'] as num).toDouble(),
    );
  }

  int optionId;

  String option;

  int voteCount;

  double percentage;

  /// Returns a shallow copy of this [PollOptionResult]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  PollOptionResult copyWith({
    int? optionId,
    String? option,
    int? voteCount,
    double? percentage,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      'optionId': optionId,
      'option': option,
      'voteCount': voteCount,
      'percentage': percentage,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _PollOptionResultImpl extends PollOptionResult {
  _PollOptionResultImpl({
    required int optionId,
    required String option,
    required int voteCount,
    required double percentage,
  }) : super._(
          optionId: optionId,
          option: option,
          voteCount: voteCount,
          percentage: percentage,
        );

  /// Returns a shallow copy of this [PollOptionResult]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  PollOptionResult copyWith({
    int? optionId,
    String? option,
    int? voteCount,
    double? percentage,
  }) {
    return PollOptionResult(
      optionId: optionId ?? this.optionId,
      option: option ?? this.option,
      voteCount: voteCount ?? this.voteCount,
      percentage: percentage ?? this.percentage,
    );
  }
}
