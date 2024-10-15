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

abstract class LinkMetadata implements _i1.SerializableModel {
  LinkMetadata._({
    required this.title,
    required this.description,
    required this.image,
    required this.url,
  });

  factory LinkMetadata({
    required String title,
    required String description,
    required String image,
    required String url,
  }) = _LinkMetadataImpl;

  factory LinkMetadata.fromJson(Map<String, dynamic> jsonSerialization) {
    return LinkMetadata(
      title: jsonSerialization['title'] as String,
      description: jsonSerialization['description'] as String,
      image: jsonSerialization['image'] as String,
      url: jsonSerialization['url'] as String,
    );
  }

  String title;

  String description;

  String image;

  String url;

  LinkMetadata copyWith({
    String? title,
    String? description,
    String? image,
    String? url,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'description': description,
      'image': image,
      'url': url,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _LinkMetadataImpl extends LinkMetadata {
  _LinkMetadataImpl({
    required String title,
    required String description,
    required String image,
    required String url,
  }) : super._(
          title: title,
          description: description,
          image: image,
          url: url,
        );

  @override
  LinkMetadata copyWith({
    String? title,
    String? description,
    String? image,
    String? url,
  }) {
    return LinkMetadata(
      title: title ?? this.title,
      description: description ?? this.description,
      image: image ?? this.image,
      url: url ?? this.url,
    );
  }
}
