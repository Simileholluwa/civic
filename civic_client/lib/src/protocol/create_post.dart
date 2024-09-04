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

abstract class Post implements _i1.SerializableModel {
  Post._({
    this.id,
    required this.ownerId,
    this.owner,
    required this.postType,
    required this.text,
    required this.imageUrls,
    required this.videoUrl,
    required this.taggedUsers,
    required this.latitude,
    required this.longitude,
  });

  factory Post({
    int? id,
    required int ownerId,
    _i2.UserRecord? owner,
    required _i2.PostType postType,
    required String text,
    required List<String> imageUrls,
    required String videoUrl,
    required List<String> taggedUsers,
    required double latitude,
    required double longitude,
  }) = _PostImpl;

  factory Post.fromJson(Map<String, dynamic> jsonSerialization) {
    return Post(
      id: jsonSerialization['id'] as int?,
      ownerId: jsonSerialization['ownerId'] as int,
      owner: jsonSerialization['owner'] == null
          ? null
          : _i2.UserRecord.fromJson(
              (jsonSerialization['owner'] as Map<String, dynamic>)),
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
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int ownerId;

  _i2.UserRecord? owner;

  _i2.PostType postType;

  String text;

  List<String> imageUrls;

  String videoUrl;

  List<String> taggedUsers;

  double latitude;

  double longitude;

  Post copyWith({
    int? id,
    int? ownerId,
    _i2.UserRecord? owner,
    _i2.PostType? postType,
    String? text,
    List<String>? imageUrls,
    String? videoUrl,
    List<String>? taggedUsers,
    double? latitude,
    double? longitude,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'ownerId': ownerId,
      if (owner != null) 'owner': owner?.toJson(),
      'postType': postType.toJson(),
      'text': text,
      'imageUrls': imageUrls.toJson(),
      'videoUrl': videoUrl,
      'taggedUsers': taggedUsers.toJson(),
      'latitude': latitude,
      'longitude': longitude,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _PostImpl extends Post {
  _PostImpl({
    int? id,
    required int ownerId,
    _i2.UserRecord? owner,
    required _i2.PostType postType,
    required String text,
    required List<String> imageUrls,
    required String videoUrl,
    required List<String> taggedUsers,
    required double latitude,
    required double longitude,
  }) : super._(
          id: id,
          ownerId: ownerId,
          owner: owner,
          postType: postType,
          text: text,
          imageUrls: imageUrls,
          videoUrl: videoUrl,
          taggedUsers: taggedUsers,
          latitude: latitude,
          longitude: longitude,
        );

  @override
  Post copyWith({
    Object? id = _Undefined,
    int? ownerId,
    Object? owner = _Undefined,
    _i2.PostType? postType,
    String? text,
    List<String>? imageUrls,
    String? videoUrl,
    List<String>? taggedUsers,
    double? latitude,
    double? longitude,
  }) {
    return Post(
      id: id is int? ? id : this.id,
      ownerId: ownerId ?? this.ownerId,
      owner: owner is _i2.UserRecord? ? owner : this.owner?.copyWith(),
      postType: postType ?? this.postType,
      text: text ?? this.text,
      imageUrls: imageUrls ?? this.imageUrls.clone(),
      videoUrl: videoUrl ?? this.videoUrl,
      taggedUsers: taggedUsers ?? this.taggedUsers.clone(),
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
    );
  }
}
