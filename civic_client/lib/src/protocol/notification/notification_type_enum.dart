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

enum NotificationType implements _i1.SerializableModel {
  like,
  comment,
  repost,
  quote,
  vote,
  review,
  mention,
  follow,
  system,
  tag,
  reminder;

  static NotificationType fromJson(int index) {
    switch (index) {
      case 0:
        return NotificationType.like;
      case 1:
        return NotificationType.comment;
      case 2:
        return NotificationType.repost;
      case 3:
        return NotificationType.quote;
      case 4:
        return NotificationType.vote;
      case 5:
        return NotificationType.review;
      case 6:
        return NotificationType.mention;
      case 7:
        return NotificationType.follow;
      case 8:
        return NotificationType.system;
      case 9:
        return NotificationType.tag;
      case 10:
        return NotificationType.reminder;
      default:
        throw ArgumentError(
            'Value "$index" cannot be converted to "NotificationType"');
    }
  }

  @override
  int toJson() => index;
  @override
  String toString() => name;
}
