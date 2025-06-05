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
    DateTime? createdAt,
    this.expiresAt,
    this.hashtags,
    this.votedBy,
    int? numberOfLikes,
    int? numberOfComments,
    int? numberOfViews,
    this.imagesUrl,
    this.updatedAt,
  })  : createdAt = createdAt ?? DateTime.now(),
        numberOfLikes = numberOfLikes ?? 0,
        numberOfComments = numberOfComments ?? 0,
        numberOfViews = numberOfViews ?? 0;

  factory Poll({
    int? id,
    required int ownerId,
    _i2.UserRecord? owner,
    String? question,
    List<_i2.UserRecord>? taggedUsers,
    List<_i3.AWSPlaces>? locations,
    List<_i2.UserRecord>? mentions,
    List<_i4.PollOption>? options,
    List<String>? tags,
    DateTime? createdAt,
    DateTime? expiresAt,
    List<_i5.PollsHashtags>? hashtags,
    List<int>? votedBy,
    int? numberOfLikes,
    int? numberOfComments,
    int? numberOfViews,
    List<String>? imagesUrl,
    DateTime? updatedAt,
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
      options: (jsonSerialization['options'] as List?)
          ?.map((e) => _i4.PollOption.fromJson((e as Map<String, dynamic>)))
          .toList(),
      tags: (jsonSerialization['tags'] as List?)
          ?.map((e) => e as String)
          .toList(),
      createdAt: jsonSerialization['createdAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
      expiresAt: jsonSerialization['expiresAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['expiresAt']),
      hashtags: (jsonSerialization['hashtags'] as List?)
          ?.map((e) => _i5.PollsHashtags.fromJson((e as Map<String, dynamic>)))
          .toList(),
      votedBy: (jsonSerialization['votedBy'] as List?)
          ?.map((e) => e as int)
          .toList(),
      numberOfLikes: jsonSerialization['numberOfLikes'] as int?,
      numberOfComments: jsonSerialization['numberOfComments'] as int?,
      numberOfViews: jsonSerialization['numberOfViews'] as int?,
      imagesUrl: (jsonSerialization['imagesUrl'] as List?)
          ?.map((e) => e as String)
          .toList(),
      updatedAt: jsonSerialization['updatedAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['updatedAt']),
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

  List<_i4.PollOption>? options;

  List<String>? tags;

  DateTime? createdAt;

  DateTime? expiresAt;

  List<_i5.PollsHashtags>? hashtags;

  List<int>? votedBy;

  int? numberOfLikes;

  int? numberOfComments;

  int? numberOfViews;

  List<String>? imagesUrl;

  DateTime? updatedAt;

  /// Returns a shallow copy of this [Poll]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  Poll copyWith({
    int? id,
    int? ownerId,
    _i2.UserRecord? owner,
    String? question,
    List<_i2.UserRecord>? taggedUsers,
    List<_i3.AWSPlaces>? locations,
    List<_i2.UserRecord>? mentions,
    List<_i4.PollOption>? options,
    List<String>? tags,
    DateTime? createdAt,
    DateTime? expiresAt,
    List<_i5.PollsHashtags>? hashtags,
    List<int>? votedBy,
    int? numberOfLikes,
    int? numberOfComments,
    int? numberOfViews,
    List<String>? imagesUrl,
    DateTime? updatedAt,
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
      if (options != null)
        'options': options?.toJson(valueToJson: (v) => v.toJson()),
      if (tags != null) 'tags': tags?.toJson(),
      if (createdAt != null) 'createdAt': createdAt?.toJson(),
      if (expiresAt != null) 'expiresAt': expiresAt?.toJson(),
      if (hashtags != null)
        'hashtags': hashtags?.toJson(valueToJson: (v) => v.toJson()),
      if (votedBy != null) 'votedBy': votedBy?.toJson(),
      if (numberOfLikes != null) 'numberOfLikes': numberOfLikes,
      if (numberOfComments != null) 'numberOfComments': numberOfComments,
      if (numberOfViews != null) 'numberOfViews': numberOfViews,
      if (imagesUrl != null) 'imagesUrl': imagesUrl?.toJson(),
      if (updatedAt != null) 'updatedAt': updatedAt?.toJson(),
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
    List<_i4.PollOption>? options,
    List<String>? tags,
    DateTime? createdAt,
    DateTime? expiresAt,
    List<_i5.PollsHashtags>? hashtags,
    List<int>? votedBy,
    int? numberOfLikes,
    int? numberOfComments,
    int? numberOfViews,
    List<String>? imagesUrl,
    DateTime? updatedAt,
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
          expiresAt: expiresAt,
          hashtags: hashtags,
          votedBy: votedBy,
          numberOfLikes: numberOfLikes,
          numberOfComments: numberOfComments,
          numberOfViews: numberOfViews,
          imagesUrl: imagesUrl,
          updatedAt: updatedAt,
        );

  /// Returns a shallow copy of this [Poll]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
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
    Object? expiresAt = _Undefined,
    Object? hashtags = _Undefined,
    Object? votedBy = _Undefined,
    Object? numberOfLikes = _Undefined,
    Object? numberOfComments = _Undefined,
    Object? numberOfViews = _Undefined,
    Object? imagesUrl = _Undefined,
    Object? updatedAt = _Undefined,
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
      options: options is List<_i4.PollOption>?
          ? options
          : this.options?.map((e0) => e0.copyWith()).toList(),
      tags: tags is List<String>? ? tags : this.tags?.map((e0) => e0).toList(),
      createdAt: createdAt is DateTime? ? createdAt : this.createdAt,
      expiresAt: expiresAt is DateTime? ? expiresAt : this.expiresAt,
      hashtags: hashtags is List<_i5.PollsHashtags>?
          ? hashtags
          : this.hashtags?.map((e0) => e0.copyWith()).toList(),
      votedBy: votedBy is List<int>?
          ? votedBy
          : this.votedBy?.map((e0) => e0).toList(),
      numberOfLikes: numberOfLikes is int? ? numberOfLikes : this.numberOfLikes,
      numberOfComments:
          numberOfComments is int? ? numberOfComments : this.numberOfComments,
      numberOfViews: numberOfViews is int? ? numberOfViews : this.numberOfViews,
      imagesUrl: imagesUrl is List<String>?
          ? imagesUrl
          : this.imagesUrl?.map((e0) => e0).toList(),
      updatedAt: updatedAt is DateTime? ? updatedAt : this.updatedAt,
    );
  }
}
