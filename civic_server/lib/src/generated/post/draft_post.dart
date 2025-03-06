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
import '../post/post_type_enums.dart' as _i2;
import '../user/user_record.dart' as _i3;
import '../general/aws_places.dart' as _i4;

abstract class DraftPost
    implements _i1.SerializableModel, _i1.ProtocolSerialization {
  DraftPost._({
    this.draftId,
    this.ownerId,
    required this.postType,
    required this.text,
    required this.imagesPath,
    required this.videoPath,
    required this.taggedUsers,
    required this.locations,
    this.createdAt,
    required this.mentions,
    required this.tags,
  });

  factory DraftPost({
    int? draftId,
    int? ownerId,
    required _i2.PostType postType,
    required String text,
    required List<String> imagesPath,
    required String videoPath,
    required List<_i3.UserRecord> taggedUsers,
    required List<_i4.AWSPlaces> locations,
    DateTime? createdAt,
    required List<_i3.UserRecord> mentions,
    required List<String> tags,
  }) = _DraftPostImpl;

  factory DraftPost.fromJson(Map<String, dynamic> jsonSerialization) {
    return DraftPost(
      draftId: jsonSerialization['draftId'] as int?,
      ownerId: jsonSerialization['ownerId'] as int?,
      postType: _i2.PostType.fromJson((jsonSerialization['postType'] as int)),
      text: jsonSerialization['text'] as String,
      imagesPath: (jsonSerialization['imagesPath'] as List)
          .map((e) => e as String)
          .toList(),
      videoPath: jsonSerialization['videoPath'] as String,
      taggedUsers: (jsonSerialization['taggedUsers'] as List)
          .map((e) => _i3.UserRecord.fromJson((e as Map<String, dynamic>)))
          .toList(),
      locations: (jsonSerialization['locations'] as List)
          .map((e) => _i4.AWSPlaces.fromJson((e as Map<String, dynamic>)))
          .toList(),
      createdAt: jsonSerialization['createdAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
      mentions: (jsonSerialization['mentions'] as List)
          .map((e) => _i3.UserRecord.fromJson((e as Map<String, dynamic>)))
          .toList(),
      tags:
          (jsonSerialization['tags'] as List).map((e) => e as String).toList(),
    );
  }

  int? draftId;

  int? ownerId;

  _i2.PostType postType;

  String text;

  List<String> imagesPath;

  String videoPath;

  List<_i3.UserRecord> taggedUsers;

  List<_i4.AWSPlaces> locations;

  DateTime? createdAt;

  List<_i3.UserRecord> mentions;

  List<String> tags;

  /// Returns a shallow copy of this [DraftPost]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  DraftPost copyWith({
    int? draftId,
    int? ownerId,
    _i2.PostType? postType,
    String? text,
    List<String>? imagesPath,
    String? videoPath,
    List<_i3.UserRecord>? taggedUsers,
    List<_i4.AWSPlaces>? locations,
    DateTime? createdAt,
    List<_i3.UserRecord>? mentions,
    List<String>? tags,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (draftId != null) 'draftId': draftId,
      if (ownerId != null) 'ownerId': ownerId,
      'postType': postType.toJson(),
      'text': text,
      'imagesPath': imagesPath.toJson(),
      'videoPath': videoPath,
      'taggedUsers': taggedUsers.toJson(valueToJson: (v) => v.toJson()),
      'locations': locations.toJson(valueToJson: (v) => v.toJson()),
      if (createdAt != null) 'createdAt': createdAt?.toJson(),
      'mentions': mentions.toJson(valueToJson: (v) => v.toJson()),
      'tags': tags.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (draftId != null) 'draftId': draftId,
      if (ownerId != null) 'ownerId': ownerId,
      'postType': postType.toJson(),
      'text': text,
      'imagesPath': imagesPath.toJson(),
      'videoPath': videoPath,
      'taggedUsers':
          taggedUsers.toJson(valueToJson: (v) => v.toJsonForProtocol()),
      'locations': locations.toJson(valueToJson: (v) => v.toJsonForProtocol()),
      if (createdAt != null) 'createdAt': createdAt?.toJson(),
      'mentions': mentions.toJson(valueToJson: (v) => v.toJsonForProtocol()),
      'tags': tags.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _DraftPostImpl extends DraftPost {
  _DraftPostImpl({
    int? draftId,
    int? ownerId,
    required _i2.PostType postType,
    required String text,
    required List<String> imagesPath,
    required String videoPath,
    required List<_i3.UserRecord> taggedUsers,
    required List<_i4.AWSPlaces> locations,
    DateTime? createdAt,
    required List<_i3.UserRecord> mentions,
    required List<String> tags,
  }) : super._(
          draftId: draftId,
          ownerId: ownerId,
          postType: postType,
          text: text,
          imagesPath: imagesPath,
          videoPath: videoPath,
          taggedUsers: taggedUsers,
          locations: locations,
          createdAt: createdAt,
          mentions: mentions,
          tags: tags,
        );

  /// Returns a shallow copy of this [DraftPost]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  DraftPost copyWith({
    Object? draftId = _Undefined,
    Object? ownerId = _Undefined,
    _i2.PostType? postType,
    String? text,
    List<String>? imagesPath,
    String? videoPath,
    List<_i3.UserRecord>? taggedUsers,
    List<_i4.AWSPlaces>? locations,
    Object? createdAt = _Undefined,
    List<_i3.UserRecord>? mentions,
    List<String>? tags,
  }) {
    return DraftPost(
      draftId: draftId is int? ? draftId : this.draftId,
      ownerId: ownerId is int? ? ownerId : this.ownerId,
      postType: postType ?? this.postType,
      text: text ?? this.text,
      imagesPath: imagesPath ?? this.imagesPath.map((e0) => e0).toList(),
      videoPath: videoPath ?? this.videoPath,
      taggedUsers:
          taggedUsers ?? this.taggedUsers.map((e0) => e0.copyWith()).toList(),
      locations:
          locations ?? this.locations.map((e0) => e0.copyWith()).toList(),
      createdAt: createdAt is DateTime? ? createdAt : this.createdAt,
      mentions: mentions ?? this.mentions.map((e0) => e0.copyWith()).toList(),
      tags: tags ?? this.tags.map((e0) => e0).toList(),
    );
  }
}
