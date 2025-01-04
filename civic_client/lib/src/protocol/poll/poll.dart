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
import '../poll/poll_hashtags.dart' as _i5;

abstract class Poll implements _i1.SerializableModel {
  Poll._({
    this.id,
    required this.ownerId,
    this.owner,
    this.question,
    this.taggedUsers,
    this.locations,
    this.mentions,
    this.options,
    this.tags,
    this.createdAt,
    this.pollDuration,
    this.hashtags,
  });

  factory Poll({
    int? id,
    required int ownerId,
    _i2.UserRecord? owner,
    String? question,
    List<_i2.UserRecord>? taggedUsers,
    List<_i3.AWSPlaces>? locations,
    List<_i2.UserRecord>? mentions,
    _i4.PollOption? options,
    List<String>? tags,
    DateTime? createdAt,
    int? pollDuration,
    List<_i5.PollsHashtags>? hashtags,
  }) = _PollImpl;

  factory Poll.fromJson(Map<String, dynamic> jsonSerialization) {
    return Poll(
      id: jsonSerialization['id'] as int?,
      ownerId: jsonSerialization['ownerId'] as int,
      owner: jsonSerialization['owner'] == null
          ? null
          : _i2.UserRecord.fromJson(
              (jsonSerialization['owner'] as Map<String, dynamic>)),
      question: jsonSerialization['question'] as String?,
      taggedUsers: (jsonSerialization['taggedUsers'] as List?)
          ?.map((e) => _i2.UserRecord.fromJson((e as Map<String, dynamic>)))
          .toList(),
      locations: (jsonSerialization['locations'] as List?)
          ?.map((e) => _i3.AWSPlaces.fromJson((e as Map<String, dynamic>)))
          .toList(),
      mentions: (jsonSerialization['mentions'] as List?)
          ?.map((e) => _i2.UserRecord.fromJson((e as Map<String, dynamic>)))
          .toList(),
      options: jsonSerialization['options'] == null
          ? null
          : _i4.PollOption.fromJson(
              (jsonSerialization['options'] as Map<String, dynamic>)),
      tags: (jsonSerialization['tags'] as List?)
          ?.map((e) => e as String)
          .toList(),
      createdAt: jsonSerialization['createdAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
      pollDuration: jsonSerialization['pollDuration'] as int?,
      hashtags: (jsonSerialization['hashtags'] as List?)
          ?.map((e) => _i5.PollsHashtags.fromJson((e as Map<String, dynamic>)))
          .toList(),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int ownerId;

  _i2.UserRecord? owner;

  String? question;

  List<_i2.UserRecord>? taggedUsers;

  List<_i3.AWSPlaces>? locations;

  List<_i2.UserRecord>? mentions;

  _i4.PollOption? options;

  List<String>? tags;

  DateTime? createdAt;

  int? pollDuration;

  List<_i5.PollsHashtags>? hashtags;

  Poll copyWith({
    int? id,
    int? ownerId,
    _i2.UserRecord? owner,
    String? question,
    List<_i2.UserRecord>? taggedUsers,
    List<_i3.AWSPlaces>? locations,
    List<_i2.UserRecord>? mentions,
    _i4.PollOption? options,
    List<String>? tags,
    DateTime? createdAt,
    int? pollDuration,
    List<_i5.PollsHashtags>? hashtags,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'ownerId': ownerId,
      if (owner != null) 'owner': owner?.toJson(),
      if (question != null) 'question': question,
      if (taggedUsers != null)
        'taggedUsers': taggedUsers?.toJson(valueToJson: (v) => v.toJson()),
      if (locations != null)
        'locations': locations?.toJson(valueToJson: (v) => v.toJson()),
      if (mentions != null)
        'mentions': mentions?.toJson(valueToJson: (v) => v.toJson()),
      if (options != null) 'options': options?.toJson(),
      if (tags != null) 'tags': tags?.toJson(),
      if (createdAt != null) 'createdAt': createdAt?.toJson(),
      if (pollDuration != null) 'pollDuration': pollDuration,
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
    String? question,
    List<_i2.UserRecord>? taggedUsers,
    List<_i3.AWSPlaces>? locations,
    List<_i2.UserRecord>? mentions,
    _i4.PollOption? options,
    List<String>? tags,
    DateTime? createdAt,
    int? pollDuration,
    List<_i5.PollsHashtags>? hashtags,
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
          createdAt: createdAt,
          pollDuration: pollDuration,
          hashtags: hashtags,
        );

  @override
  Poll copyWith({
    Object? id = _Undefined,
    int? ownerId,
    Object? owner = _Undefined,
    Object? question = _Undefined,
    Object? taggedUsers = _Undefined,
    Object? locations = _Undefined,
    Object? mentions = _Undefined,
    Object? options = _Undefined,
    Object? tags = _Undefined,
    Object? createdAt = _Undefined,
    Object? pollDuration = _Undefined,
    Object? hashtags = _Undefined,
  }) {
    return Poll(
      id: id is int? ? id : this.id,
      ownerId: ownerId ?? this.ownerId,
      owner: owner is _i2.UserRecord? ? owner : this.owner?.copyWith(),
      question: question is String? ? question : this.question,
      taggedUsers: taggedUsers is List<_i2.UserRecord>?
          ? taggedUsers
          : this.taggedUsers?.map((e0) => e0.copyWith()).toList(),
      locations: locations is List<_i3.AWSPlaces>?
          ? locations
          : this.locations?.map((e0) => e0.copyWith()).toList(),
      mentions: mentions is List<_i2.UserRecord>?
          ? mentions
          : this.mentions?.map((e0) => e0.copyWith()).toList(),
      options: options is _i4.PollOption? ? options : this.options?.copyWith(),
      tags: tags is List<String>? ? tags : this.tags?.map((e0) => e0).toList(),
      createdAt: createdAt is DateTime? ? createdAt : this.createdAt,
      pollDuration: pollDuration is int? ? pollDuration : this.pollDuration,
      hashtags: hashtags is List<_i5.PollsHashtags>?
          ? hashtags
          : this.hashtags?.map((e0) => e0.copyWith()).toList(),
    );
  }
}
