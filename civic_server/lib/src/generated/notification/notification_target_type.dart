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

enum NotificationTargetType implements _i1.SerializableModel {
  post,
  project,
  vetting,
  review,
  comment,
  reply,
  photo,
  video,
  user,
  poll,
  article;

  static NotificationTargetType fromJson(int index) {
    switch (index) {
      case 0:
        return NotificationTargetType.post;
      case 1:
        return NotificationTargetType.project;
      case 2:
        return NotificationTargetType.vetting;
      case 3:
        return NotificationTargetType.review;
      case 4:
        return NotificationTargetType.comment;
      case 5:
        return NotificationTargetType.reply;
      case 6:
        return NotificationTargetType.photo;
      case 7:
        return NotificationTargetType.video;
      case 8:
        return NotificationTargetType.user;
      case 9:
        return NotificationTargetType.poll;
      case 10:
        return NotificationTargetType.article;
      default:
        throw ArgumentError(
            'Value "$index" cannot be converted to "NotificationTargetType"');
    }
  }

  @override
  int toJson() => index;

  @override
  String toString() => name;
}
