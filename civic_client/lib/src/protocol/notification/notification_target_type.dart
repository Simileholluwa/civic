/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters
// ignore_for_file: invalid_use_of_internal_member

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;

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

  static NotificationTargetType fromJson(String name) {
    switch (name) {
      case 'post':
        return NotificationTargetType.post;
      case 'project':
        return NotificationTargetType.project;
      case 'vetting':
        return NotificationTargetType.vetting;
      case 'review':
        return NotificationTargetType.review;
      case 'comment':
        return NotificationTargetType.comment;
      case 'reply':
        return NotificationTargetType.reply;
      case 'photo':
        return NotificationTargetType.photo;
      case 'video':
        return NotificationTargetType.video;
      case 'user':
        return NotificationTargetType.user;
      case 'poll':
        return NotificationTargetType.poll;
      case 'article':
        return NotificationTargetType.article;
      default:
        throw ArgumentError(
          'Value "$name" cannot be converted to "NotificationTargetType"',
        );
    }
  }

  @override
  String toJson() => name;

  @override
  String toString() => name;
}
