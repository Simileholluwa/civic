/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;
import 'protocol.dart' as _i2;
import 'package:serverpod_serialization/serverpod_serialization.dart';

abstract class DraftPost
    implements _i1.SerializableModel, _i1.ProtocolSerialization {
  DraftPost._({
    this.draftId,
    required this.postType,
    required this.text,
    required this.imagesPath,
    required this.videoPath,
    required this.taggedUsers,
    required this.latitude,
    required this.longitude,
    this.createdAt,
  });

  factory DraftPost({
    int? draftId,
    required _i2.PostType postType,
    required String text,
    required List<String> imagesPath,
    required String videoPath,
    required List<String> taggedUsers,
    required double latitude,
    required double longitude,
    DateTime? createdAt,
  }) = _DraftPostImpl;

  factory DraftPost.fromJson(Map<String, dynamic> jsonSerialization) {
    return DraftPost(
      draftId: jsonSerialization['draftId'] as int?,
      postType: _i2.PostType.fromJson((jsonSerialization['postType'] as int)),
      text: jsonSerialization['text'] as String,
      imagesPath: (jsonSerialization['imagesPath'] as List)
          .map((e) => e as String)
          .toList(),
      videoPath: jsonSerialization['videoPath'] as String,
      taggedUsers: (jsonSerialization['taggedUsers'] as List)
          .map((e) => e as String)
          .toList(),
      latitude: (jsonSerialization['latitude'] as num).toDouble(),
      longitude: (jsonSerialization['longitude'] as num).toDouble(),
      createdAt: jsonSerialization['createdAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
    );
  }

  int? draftId;

  _i2.PostType postType;

  String text;

  List<String> imagesPath;

  String videoPath;

  List<String> taggedUsers;

  double latitude;

  double longitude;

  DateTime? createdAt;

  DraftPost copyWith({
    int? draftId,
    _i2.PostType? postType,
    String? text,
    List<String>? imagesPath,
    String? videoPath,
    List<String>? taggedUsers,
    double? latitude,
    double? longitude,
    DateTime? createdAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (draftId != null) 'draftId': draftId,
      'postType': postType.toJson(),
      'text': text,
      'imagesPath': imagesPath.toJson(),
      'videoPath': videoPath,
      'taggedUsers': taggedUsers.toJson(),
      'latitude': latitude,
      'longitude': longitude,
      if (createdAt != null) 'createdAt': createdAt?.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (draftId != null) 'draftId': draftId,
      'postType': postType.toJson(),
      'text': text,
      'imagesPath': imagesPath.toJson(),
      'videoPath': videoPath,
      'taggedUsers': taggedUsers.toJson(),
      'latitude': latitude,
      'longitude': longitude,
      if (createdAt != null) 'createdAt': createdAt?.toJson(),
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
    required _i2.PostType postType,
    required String text,
    required List<String> imagesPath,
    required String videoPath,
    required List<String> taggedUsers,
    required double latitude,
    required double longitude,
    DateTime? createdAt,
  }) : super._(
          draftId: draftId,
          postType: postType,
          text: text,
          imagesPath: imagesPath,
          videoPath: videoPath,
          taggedUsers: taggedUsers,
          latitude: latitude,
          longitude: longitude,
          createdAt: createdAt,
        );

  @override
  DraftPost copyWith({
    Object? draftId = _Undefined,
    _i2.PostType? postType,
    String? text,
    List<String>? imagesPath,
    String? videoPath,
    List<String>? taggedUsers,
    double? latitude,
    double? longitude,
    Object? createdAt = _Undefined,
  }) {
    return DraftPost(
      draftId: draftId is int? ? draftId : this.draftId,
      postType: postType ?? this.postType,
      text: text ?? this.text,
      imagesPath: imagesPath ?? this.imagesPath.clone(),
      videoPath: videoPath ?? this.videoPath,
      taggedUsers: taggedUsers ?? this.taggedUsers.clone(),
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      createdAt: createdAt is DateTime? ? createdAt : this.createdAt,
    );
  }
}
