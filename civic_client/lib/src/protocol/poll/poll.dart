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
import '../protocol.dart' as _i2;

abstract class Poll implements _i1.SerializableModel {
  Poll._({
    this.id,
    required this.ownerId,
    this.owner,
    required this.question,
    required this.taggedUsers,
    required this.locations,
    required this.mentions,
    this.options,
    required this.tags,
    this.pollDuration,
    this.hashtags,
  });

  factory Poll({
    int? id,
    required int ownerId,
    _i2.UserRecord? owner,
    required String question,
    required List<_i2.UserRecord> taggedUsers,
    required List<_i2.AWSPlaces> locations,
    required List<_i2.UserRecord> mentions,
    _i2.PollOption? options,
    required List<String> tags,
    DateTime? pollDuration,
    List<_i2.PollsHashtags>? hashtags,
  }) = _PollImpl;

  factory Poll.fromJson(Map<String, dynamic> jsonSerialization) {
    return Poll(
      id: jsonSerialization['id'] as int?,
      ownerId: jsonSerialization['ownerId'] as int,
      owner: jsonSerialization['owner'] == null
          ? null
          : _i2.UserRecord.fromJson(
              (jsonSerialization['owner'] as Map<String, dynamic>)),
      question: jsonSerialization['question'] as String,
      taggedUsers: (jsonSerialization['taggedUsers'] as List)
          .map((e) => _i2.UserRecord.fromJson((e as Map<String, dynamic>)))
          .toList(),
      locations: (jsonSerialization['locations'] as List)
          .map((e) => _i2.AWSPlaces.fromJson((e as Map<String, dynamic>)))
          .toList(),
      mentions: (jsonSerialization['mentions'] as List)
          .map((e) => _i2.UserRecord.fromJson((e as Map<String, dynamic>)))
          .toList(),
      options: jsonSerialization['options'] == null
          ? null
          : _i2.PollOption.fromJson(
              (jsonSerialization['options'] as Map<String, dynamic>)),
      tags:
          (jsonSerialization['tags'] as List).map((e) => e as String).toList(),
      pollDuration: jsonSerialization['pollDuration'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(
              jsonSerialization['pollDuration']),
      hashtags: (jsonSerialization['hashtags'] as List?)
          ?.map((e) => _i2.PollsHashtags.fromJson((e as Map<String, dynamic>)))
          .toList(),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int ownerId;

  _i2.UserRecord? owner;

  String question;

  List<_i2.UserRecord> taggedUsers;

  List<_i2.AWSPlaces> locations;

  List<_i2.UserRecord> mentions;

  _i2.PollOption? options;

  List<String> tags;

  DateTime? pollDuration;

  List<_i2.PollsHashtags>? hashtags;

  Poll copyWith({
    int? id,
    int? ownerId,
    _i2.UserRecord? owner,
    String? question,
    List<_i2.UserRecord>? taggedUsers,
    List<_i2.AWSPlaces>? locations,
    List<_i2.UserRecord>? mentions,
    _i2.PollOption? options,
    List<String>? tags,
    DateTime? pollDuration,
    List<_i2.PollsHashtags>? hashtags,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'ownerId': ownerId,
      if (owner != null) 'owner': owner?.toJson(),
      'question': question,
      'taggedUsers': taggedUsers.toJson(valueToJson: (v) => v.toJson()),
      'locations': locations.toJson(valueToJson: (v) => v.toJson()),
      'mentions': mentions.toJson(valueToJson: (v) => v.toJson()),
      if (options != null) 'options': options?.toJson(),
      'tags': tags.toJson(),
      if (pollDuration != null) 'pollDuration': pollDuration?.toJson(),
      if (hashtags != null)
        'hashtags': hashtags?.toJson(valueToJson: (v) => v.toJson()),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _PollImpl extends Poll {
  _PollImpl({
    int? id,
    required int ownerId,
    _i2.UserRecord? owner,
    required String question,
    required List<_i2.UserRecord> taggedUsers,
    required List<_i2.AWSPlaces> locations,
    required List<_i2.UserRecord> mentions,
    _i2.PollOption? options,
    required List<String> tags,
    DateTime? pollDuration,
    List<_i2.PollsHashtags>? hashtags,
  }) : super._(
          id: id,
          ownerId: ownerId,
          owner: owner,
          question: question,
          taggedUsers: taggedUsers,
          locations: locations,
          mentions: mentions,
          options: options,
          tags: tags,
          pollDuration: pollDuration,
          hashtags: hashtags,
        );

  @override
  Poll copyWith({
    Object? id = _Undefined,
    int? ownerId,
    Object? owner = _Undefined,
    String? question,
    List<_i2.UserRecord>? taggedUsers,
    List<_i2.AWSPlaces>? locations,
    List<_i2.UserRecord>? mentions,
    Object? options = _Undefined,
    List<String>? tags,
    Object? pollDuration = _Undefined,
    Object? hashtags = _Undefined,
  }) {
    return Poll(
      id: id is int? ? id : this.id,
      ownerId: ownerId ?? this.ownerId,
      owner: owner is _i2.UserRecord? ? owner : this.owner?.copyWith(),
      question: question ?? this.question,
      taggedUsers:
          taggedUsers ?? this.taggedUsers.map((e0) => e0.copyWith()).toList(),
      locations:
          locations ?? this.locations.map((e0) => e0.copyWith()).toList(),
      mentions: mentions ?? this.mentions.map((e0) => e0.copyWith()).toList(),
      options: options is _i2.PollOption? ? options : this.options?.copyWith(),
      tags: tags ?? this.tags.map((e0) => e0).toList(),
      pollDuration:
          pollDuration is DateTime? ? pollDuration : this.pollDuration,
      hashtags: hashtags is List<_i2.PollsHashtags>?
          ? hashtags
          : this.hashtags?.map((e0) => e0.copyWith()).toList(),
    );
  }
}
