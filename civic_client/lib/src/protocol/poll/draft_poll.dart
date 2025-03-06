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
import '../general/aws_places.dart' as _i3;
import '../poll/poll_option.dart' as _i4;

abstract class DraftPoll implements _i1.SerializableModel {
  DraftPoll._({
    this.draftId,
    this.ownerId,
    required this.question,
    required this.taggedUsers,
    required this.locations,
    this.createdAt,
    required this.mentions,
    this.pollDuration,
    this.options,
    required this.tags,
  });

  factory DraftPoll({
    int? draftId,
    int? ownerId,
    required String question,
    required List<_i2.UserRecord> taggedUsers,
    required List<_i3.AWSPlaces> locations,
    DateTime? createdAt,
    required List<_i2.UserRecord> mentions,
    int? pollDuration,
    _i4.PollOption? options,
    required List<String> tags,
  }) = _DraftPollImpl;

  factory DraftPoll.fromJson(Map<String, dynamic> jsonSerialization) {
    return DraftPoll(
      draftId: jsonSerialization['draftId'] as int?,
      ownerId: jsonSerialization['ownerId'] as int?,
      question: jsonSerialization['question'] as String,
      taggedUsers: (jsonSerialization['taggedUsers'] as List)
          .map((e) => _i2.UserRecord.fromJson((e as Map<String, dynamic>)))
          .toList(),
      locations: (jsonSerialization['locations'] as List)
          .map((e) => _i3.AWSPlaces.fromJson((e as Map<String, dynamic>)))
          .toList(),
      createdAt: jsonSerialization['createdAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
      mentions: (jsonSerialization['mentions'] as List)
          .map((e) => _i2.UserRecord.fromJson((e as Map<String, dynamic>)))
          .toList(),
      pollDuration: jsonSerialization['pollDuration'] as int?,
      options: jsonSerialization['options'] == null
          ? null
          : _i4.PollOption.fromJson(
              (jsonSerialization['options'] as Map<String, dynamic>)),
      tags:
          (jsonSerialization['tags'] as List).map((e) => e as String).toList(),
    );
  }

  int? draftId;

  int? ownerId;

  String question;

  List<_i2.UserRecord> taggedUsers;

  List<_i3.AWSPlaces> locations;

  DateTime? createdAt;

  List<_i2.UserRecord> mentions;

  int? pollDuration;

  _i4.PollOption? options;

  List<String> tags;

  /// Returns a shallow copy of this [DraftPoll]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  DraftPoll copyWith({
    int? draftId,
    int? ownerId,
    String? question,
    List<_i2.UserRecord>? taggedUsers,
    List<_i3.AWSPlaces>? locations,
    DateTime? createdAt,
    List<_i2.UserRecord>? mentions,
    int? pollDuration,
    _i4.PollOption? options,
    List<String>? tags,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (draftId != null) 'draftId': draftId,
      if (ownerId != null) 'ownerId': ownerId,
      'question': question,
      'taggedUsers': taggedUsers.toJson(valueToJson: (v) => v.toJson()),
      'locations': locations.toJson(valueToJson: (v) => v.toJson()),
      if (createdAt != null) 'createdAt': createdAt?.toJson(),
      'mentions': mentions.toJson(valueToJson: (v) => v.toJson()),
      if (pollDuration != null) 'pollDuration': pollDuration,
      if (options != null) 'options': options?.toJson(),
      'tags': tags.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _DraftPollImpl extends DraftPoll {
  _DraftPollImpl({
    int? draftId,
    int? ownerId,
    required String question,
    required List<_i2.UserRecord> taggedUsers,
    required List<_i3.AWSPlaces> locations,
    DateTime? createdAt,
    required List<_i2.UserRecord> mentions,
    int? pollDuration,
    _i4.PollOption? options,
    required List<String> tags,
  }) : super._(
          draftId: draftId,
          ownerId: ownerId,
          question: question,
          taggedUsers: taggedUsers,
          locations: locations,
          createdAt: createdAt,
          mentions: mentions,
          pollDuration: pollDuration,
          options: options,
          tags: tags,
        );

  /// Returns a shallow copy of this [DraftPoll]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  DraftPoll copyWith({
    Object? draftId = _Undefined,
    Object? ownerId = _Undefined,
    String? question,
    List<_i2.UserRecord>? taggedUsers,
    List<_i3.AWSPlaces>? locations,
    Object? createdAt = _Undefined,
    List<_i2.UserRecord>? mentions,
    Object? pollDuration = _Undefined,
    Object? options = _Undefined,
    List<String>? tags,
  }) {
    return DraftPoll(
      draftId: draftId is int? ? draftId : this.draftId,
      ownerId: ownerId is int? ? ownerId : this.ownerId,
      question: question ?? this.question,
      taggedUsers:
          taggedUsers ?? this.taggedUsers.map((e0) => e0.copyWith()).toList(),
      locations:
          locations ?? this.locations.map((e0) => e0.copyWith()).toList(),
      createdAt: createdAt is DateTime? ? createdAt : this.createdAt,
      mentions: mentions ?? this.mentions.map((e0) => e0.copyWith()).toList(),
      pollDuration: pollDuration is int? ? pollDuration : this.pollDuration,
      options: options is _i4.PollOption? ? options : this.options?.copyWith(),
      tags: tags ?? this.tags.map((e0) => e0).toList(),
    );
  }
}
