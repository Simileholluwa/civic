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

enum PostType implements _i1.SerializableModel {
  text,
  video,
  textWithVideo,
  textWithImages,
  images,
  image,
  textWithImage,
  none;

  static PostType fromJson(int index) {
    switch (index) {
      case 0:
        return PostType.text;
      case 1:
        return PostType.video;
      case 2:
        return PostType.textWithVideo;
      case 3:
        return PostType.textWithImages;
      case 4:
        return PostType.images;
      case 5:
        return PostType.image;
      case 6:
        return PostType.textWithImage;
      case 7:
        return PostType.none;
      default:
        throw ArgumentError('Value "$index" cannot be converted to "PostType"');
    }
  }

  @override
  int toJson() => index;
  @override
  String toString() => name;
}
