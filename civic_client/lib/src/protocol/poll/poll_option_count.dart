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

abstract class PollOptionCount implements _i1.SerializableModel {
  PollOptionCount._({
    required this.optionId,
    int? votesCount,
  }) : votesCount = votesCount ?? 0;

  factory PollOptionCount({
    required int optionId,
    int? votesCount,
  }) = _PollOptionCountImpl;

  factory PollOptionCount.fromJson(Map<String, dynamic> jsonSerialization) {
    return PollOptionCount(
      optionId: jsonSerialization['optionId'] as int,
      votesCount: jsonSerialization['votesCount'] as int?,
    );
  }

  int optionId;

  int? votesCount;

  /// Returns a shallow copy of this [PollOptionCount]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  PollOptionCount copyWith({
    int? optionId,
    int? votesCount,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      'optionId': optionId,
      if (votesCount != null) 'votesCount': votesCount,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _PollOptionCountImpl extends PollOptionCount {
  _PollOptionCountImpl({
    required int optionId,
    int? votesCount,
  }) : super._(
          optionId: optionId,
          votesCount: votesCount,
        );

  /// Returns a shallow copy of this [PollOptionCount]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  PollOptionCount copyWith({
    int? optionId,
    Object? votesCount = _Undefined,
  }) {
    return PollOptionCount(
      optionId: optionId ?? this.optionId,
      votesCount: votesCount is int? ? votesCount : this.votesCount,
    );
  }
}
