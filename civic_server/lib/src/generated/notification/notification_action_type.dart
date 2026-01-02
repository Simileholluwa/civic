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
import 'package:serverpod/serverpod.dart' as _i1;

enum NotificationActionType implements _i1.SerializableModel {
  like,
  comment,
  follow,
  react,
  tag,
  mention,
  repost,
  quote,
  review,
  vet,
  system,
  vote,
  reply;

  static NotificationActionType fromJson(String name) {
    switch (name) {
      case 'like':
        return NotificationActionType.like;
      case 'comment':
        return NotificationActionType.comment;
      case 'follow':
        return NotificationActionType.follow;
      case 'react':
        return NotificationActionType.react;
      case 'tag':
        return NotificationActionType.tag;
      case 'mention':
        return NotificationActionType.mention;
      case 'repost':
        return NotificationActionType.repost;
      case 'quote':
        return NotificationActionType.quote;
      case 'review':
        return NotificationActionType.review;
      case 'vet':
        return NotificationActionType.vet;
      case 'system':
        return NotificationActionType.system;
      case 'vote':
        return NotificationActionType.vote;
      case 'reply':
        return NotificationActionType.reply;
      default:
        throw ArgumentError(
          'Value "$name" cannot be converted to "NotificationActionType"',
        );
    }
  }

  @override
  String toJson() => name;

  @override
  String toString() => name;
}
