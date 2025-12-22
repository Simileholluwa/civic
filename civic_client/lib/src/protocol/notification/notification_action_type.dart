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

  static NotificationActionType fromJson(int index) {
    switch (index) {
      case 0:
        return NotificationActionType.like;
      case 1:
        return NotificationActionType.comment;
      case 2:
        return NotificationActionType.follow;
      case 3:
        return NotificationActionType.react;
      case 4:
        return NotificationActionType.tag;
      case 5:
        return NotificationActionType.mention;
      case 6:
        return NotificationActionType.repost;
      case 7:
        return NotificationActionType.quote;
      case 8:
        return NotificationActionType.review;
      case 9:
        return NotificationActionType.vet;
      case 10:
        return NotificationActionType.system;
      case 11:
        return NotificationActionType.vote;
      case 12:
        return NotificationActionType.reply;
      default:
        throw ArgumentError(
            'Value "$index" cannot be converted to "NotificationActionType"');
    }
  }

  @override
  int toJson() => index;

  @override
  String toString() => name;
}
