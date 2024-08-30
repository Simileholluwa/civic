/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;
import 'protocol.dart' as _i2;

abstract class DraftPost implements _i1.SerializableModel {
  DraftPost._({
    required this.draftId,
    required this.postType,
    required this.text,
    required this.imageUrls,
    required this.videoUrl,
    required this.taggedUsers,
    required this.latitude,
    required this.longitude,
    required this.createdAt,
  });

  factory DraftPost({
    required int draftId,
    required _i2.PostType postType,
    required String text,
    required List<String> imageUrls,
    required String videoUrl,
    required List<String> taggedUsers,
    required double latitude,
    required double longitude,
    required DateTime createdAt,
  }) = _DraftPostImpl;

  factory DraftPost.fromJson(Map<String, dynamic> jsonSerialization) {
    return DraftPost(
      draftId: jsonSerialization['draftId'] as int,
      postType: _i2.PostType.fromJson((jsonSerialization['postType'] as int)),
      text: jsonSerialization['text'] as String,
      imageUrls: (jsonSerialization['imageUrls'] as List)
          .map((e) => e as String)
          .toList(),
      videoUrl: jsonSerialization['videoUrl'] as String,
      taggedUsers: (jsonSerialization['taggedUsers'] as List)
          .map((e) => e as String)
          .toList(),
      latitude: (jsonSerialization['latitude'] as num).toDouble(),
      longitude: (jsonSerialization['longitude'] as num).toDouble(),
      createdAt:
          _i1.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
    );
  }

  int draftId;

  _i2.PostType postType;

  String text;

  List<String> imageUrls;

  String videoUrl;

  List<String> taggedUsers;

  double latitude;

  double longitude;

  DateTime createdAt;

  DraftPost copyWith({
    int? draftId,
    _i2.PostType? postType,
    String? text,
    List<String>? imageUrls,
    String? videoUrl,
    List<String>? taggedUsers,
    double? latitude,
    double? longitude,
    DateTime? createdAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      'draftId': draftId,
      'postType': postType.toJson(),
      'text': text,
      'imageUrls': imageUrls.toJson(),
      'videoUrl': videoUrl,
      'taggedUsers': taggedUsers.toJson(),
      'latitude': latitude,
      'longitude': longitude,
      'createdAt': createdAt.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _DraftPostImpl extends DraftPost {
  _DraftPostImpl({
    required int draftId,
    required _i2.PostType postType,
    required String text,
    required List<String> imageUrls,
    required String videoUrl,
    required List<String> taggedUsers,
    required double latitude,
    required double longitude,
    required DateTime createdAt,
  }) : super._(
          draftId: draftId,
          postType: postType,
          text: text,
          imageUrls: imageUrls,
          videoUrl: videoUrl,
          taggedUsers: taggedUsers,
          latitude: latitude,
          longitude: longitude,
          createdAt: createdAt,
        );

  @override
  DraftPost copyWith({
    int? draftId,
    _i2.PostType? postType,
    String? text,
    List<String>? imageUrls,
    String? videoUrl,
    List<String>? taggedUsers,
    double? latitude,
    double? longitude,
    DateTime? createdAt,
  }) {
    return DraftPost(
      draftId: draftId ?? this.draftId,
      postType: postType ?? this.postType,
      text: text ?? this.text,
      imageUrls: imageUrls ?? this.imageUrls.clone(),
      videoUrl: videoUrl ?? this.videoUrl,
      taggedUsers: taggedUsers ?? this.taggedUsers.clone(),
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}
