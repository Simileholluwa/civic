/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;
import '../user/user_record.dart' as _i2;

abstract class PollOption
    implements _i1.SerializableModel, _i1.ProtocolSerialization {
  PollOption._({
    required this.option,
    required this.votes,
    required this.voters,
  });

  factory PollOption({
    required List<String> option,
    required List<int> votes,
    required List<_i2.UserRecord> voters,
  }) = _PollOptionImpl;

  factory PollOption.fromJson(Map<String, dynamic> jsonSerialization) {
    return PollOption(
      option: (jsonSerialization['option'] as List)
          .map((e) => e as String)
          .toList(),
      votes: (jsonSerialization['votes'] as List).map((e) => e as int).toList(),
      voters: (jsonSerialization['voters'] as List)
          .map((e) => _i2.UserRecord.fromJson((e as Map<String, dynamic>)))
          .toList(),
    );
  }

  List<String> option;

  List<int> votes;

  List<_i2.UserRecord> voters;

  /// Returns a shallow copy of this [PollOption]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  PollOption copyWith({
    List<String>? option,
    List<int>? votes,
    List<_i2.UserRecord>? voters,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      'option': option.toJson(),
      'votes': votes.toJson(),
      'voters': voters.toJson(valueToJson: (v) => v.toJson()),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      'option': option.toJson(),
      'votes': votes.toJson(),
      'voters': voters.toJson(valueToJson: (v) => v.toJsonForProtocol()),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _PollOptionImpl extends PollOption {
  _PollOptionImpl({
    required List<String> option,
    required List<int> votes,
    required List<_i2.UserRecord> voters,
  }) : super._(
          option: option,
          votes: votes,
          voters: voters,
        );

  /// Returns a shallow copy of this [PollOption]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  PollOption copyWith({
    List<String>? option,
    List<int>? votes,
    List<_i2.UserRecord>? voters,
  }) {
    return PollOption(
      option: option ?? this.option.map((e0) => e0).toList(),
      votes: votes ?? this.votes.map((e0) => e0).toList(),
      voters: voters ?? this.voters.map((e0) => e0.copyWith()).toList(),
    );
  }
}
