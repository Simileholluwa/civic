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
import '../user/user_record.dart' as _i2;
import 'package:civic_client/src/protocol/protocol.dart' as _i3;

abstract class UserNotificationSettings implements _i1.SerializableModel {
  UserNotificationSettings._({
    this.id,
    required this.userId,
    this.user,
    bool? pauseAllPush,
    bool? allowComments,
    bool? pushComments,
    bool? allowLikes,
    bool? pushLikes,
    bool? allowRepostsAndQuotes,
    bool? pushRepostsAndQuotes,
    bool? allowNewReviews,
    bool? pushNewReviews,
    bool? allowNewVettings,
    bool? pushNewVettings,
    bool? allowReactions,
    bool? pushReactions,
    bool? allowHelpfulReviews,
    bool? pushHelpfulReviews,
    bool? allowSubscribedContent,
    bool? pushSubscribedContent,
    bool? allowMentions,
    bool? pushMentions,
    bool? allowTags,
    bool? pushTags,
    bool? allowNewFollowers,
    bool? pushNewFollowers,
    bool? allowPlatformUpdates,
    bool? pushPlatformUpdates,
  }) : pauseAllPush = pauseAllPush ?? false,
       allowComments = allowComments ?? true,
       pushComments = pushComments ?? true,
       allowLikes = allowLikes ?? true,
       pushLikes = pushLikes ?? true,
       allowRepostsAndQuotes = allowRepostsAndQuotes ?? true,
       pushRepostsAndQuotes = pushRepostsAndQuotes ?? true,
       allowNewReviews = allowNewReviews ?? true,
       pushNewReviews = pushNewReviews ?? true,
       allowNewVettings = allowNewVettings ?? true,
       pushNewVettings = pushNewVettings ?? true,
       allowReactions = allowReactions ?? true,
       pushReactions = pushReactions ?? true,
       allowHelpfulReviews = allowHelpfulReviews ?? true,
       pushHelpfulReviews = pushHelpfulReviews ?? true,
       allowSubscribedContent = allowSubscribedContent ?? true,
       pushSubscribedContent = pushSubscribedContent ?? true,
       allowMentions = allowMentions ?? true,
       pushMentions = pushMentions ?? true,
       allowTags = allowTags ?? true,
       pushTags = pushTags ?? true,
       allowNewFollowers = allowNewFollowers ?? true,
       pushNewFollowers = pushNewFollowers ?? true,
       allowPlatformUpdates = allowPlatformUpdates ?? true,
       pushPlatformUpdates = pushPlatformUpdates ?? true;

  factory UserNotificationSettings({
    int? id,
    required int userId,
    _i2.UserRecord? user,
    bool? pauseAllPush,
    bool? allowComments,
    bool? pushComments,
    bool? allowLikes,
    bool? pushLikes,
    bool? allowRepostsAndQuotes,
    bool? pushRepostsAndQuotes,
    bool? allowNewReviews,
    bool? pushNewReviews,
    bool? allowNewVettings,
    bool? pushNewVettings,
    bool? allowReactions,
    bool? pushReactions,
    bool? allowHelpfulReviews,
    bool? pushHelpfulReviews,
    bool? allowSubscribedContent,
    bool? pushSubscribedContent,
    bool? allowMentions,
    bool? pushMentions,
    bool? allowTags,
    bool? pushTags,
    bool? allowNewFollowers,
    bool? pushNewFollowers,
    bool? allowPlatformUpdates,
    bool? pushPlatformUpdates,
  }) = _UserNotificationSettingsImpl;

  factory UserNotificationSettings.fromJson(
    Map<String, dynamic> jsonSerialization,
  ) {
    return UserNotificationSettings(
      id: jsonSerialization['id'] as int?,
      userId: jsonSerialization['userId'] as int,
      user: jsonSerialization['user'] == null
          ? null
          : _i3.Protocol().deserialize<_i2.UserRecord>(
              jsonSerialization['user'],
            ),
      pauseAllPush: jsonSerialization['pauseAllPush'] as bool?,
      allowComments: jsonSerialization['allowComments'] as bool?,
      pushComments: jsonSerialization['pushComments'] as bool?,
      allowLikes: jsonSerialization['allowLikes'] as bool?,
      pushLikes: jsonSerialization['pushLikes'] as bool?,
      allowRepostsAndQuotes:
          jsonSerialization['allowRepostsAndQuotes'] as bool?,
      pushRepostsAndQuotes: jsonSerialization['pushRepostsAndQuotes'] as bool?,
      allowNewReviews: jsonSerialization['allowNewReviews'] as bool?,
      pushNewReviews: jsonSerialization['pushNewReviews'] as bool?,
      allowNewVettings: jsonSerialization['allowNewVettings'] as bool?,
      pushNewVettings: jsonSerialization['pushNewVettings'] as bool?,
      allowReactions: jsonSerialization['allowReactions'] as bool?,
      pushReactions: jsonSerialization['pushReactions'] as bool?,
      allowHelpfulReviews: jsonSerialization['allowHelpfulReviews'] as bool?,
      pushHelpfulReviews: jsonSerialization['pushHelpfulReviews'] as bool?,
      allowSubscribedContent:
          jsonSerialization['allowSubscribedContent'] as bool?,
      pushSubscribedContent:
          jsonSerialization['pushSubscribedContent'] as bool?,
      allowMentions: jsonSerialization['allowMentions'] as bool?,
      pushMentions: jsonSerialization['pushMentions'] as bool?,
      allowTags: jsonSerialization['allowTags'] as bool?,
      pushTags: jsonSerialization['pushTags'] as bool?,
      allowNewFollowers: jsonSerialization['allowNewFollowers'] as bool?,
      pushNewFollowers: jsonSerialization['pushNewFollowers'] as bool?,
      allowPlatformUpdates: jsonSerialization['allowPlatformUpdates'] as bool?,
      pushPlatformUpdates: jsonSerialization['pushPlatformUpdates'] as bool?,
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int userId;

  _i2.UserRecord? user;

  bool pauseAllPush;

  bool allowComments;

  bool pushComments;

  bool allowLikes;

  bool pushLikes;

  bool allowRepostsAndQuotes;

  bool pushRepostsAndQuotes;

  bool allowNewReviews;

  bool pushNewReviews;

  bool allowNewVettings;

  bool pushNewVettings;

  bool allowReactions;

  bool pushReactions;

  bool allowHelpfulReviews;

  bool pushHelpfulReviews;

  bool allowSubscribedContent;

  bool pushSubscribedContent;

  bool allowMentions;

  bool pushMentions;

  bool allowTags;

  bool pushTags;

  bool allowNewFollowers;

  bool pushNewFollowers;

  bool allowPlatformUpdates;

  bool pushPlatformUpdates;

  /// Returns a shallow copy of this [UserNotificationSettings]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  UserNotificationSettings copyWith({
    int? id,
    int? userId,
    _i2.UserRecord? user,
    bool? pauseAllPush,
    bool? allowComments,
    bool? pushComments,
    bool? allowLikes,
    bool? pushLikes,
    bool? allowRepostsAndQuotes,
    bool? pushRepostsAndQuotes,
    bool? allowNewReviews,
    bool? pushNewReviews,
    bool? allowNewVettings,
    bool? pushNewVettings,
    bool? allowReactions,
    bool? pushReactions,
    bool? allowHelpfulReviews,
    bool? pushHelpfulReviews,
    bool? allowSubscribedContent,
    bool? pushSubscribedContent,
    bool? allowMentions,
    bool? pushMentions,
    bool? allowTags,
    bool? pushTags,
    bool? allowNewFollowers,
    bool? pushNewFollowers,
    bool? allowPlatformUpdates,
    bool? pushPlatformUpdates,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'UserNotificationSettings',
      if (id != null) 'id': id,
      'userId': userId,
      if (user != null) 'user': user?.toJson(),
      'pauseAllPush': pauseAllPush,
      'allowComments': allowComments,
      'pushComments': pushComments,
      'allowLikes': allowLikes,
      'pushLikes': pushLikes,
      'allowRepostsAndQuotes': allowRepostsAndQuotes,
      'pushRepostsAndQuotes': pushRepostsAndQuotes,
      'allowNewReviews': allowNewReviews,
      'pushNewReviews': pushNewReviews,
      'allowNewVettings': allowNewVettings,
      'pushNewVettings': pushNewVettings,
      'allowReactions': allowReactions,
      'pushReactions': pushReactions,
      'allowHelpfulReviews': allowHelpfulReviews,
      'pushHelpfulReviews': pushHelpfulReviews,
      'allowSubscribedContent': allowSubscribedContent,
      'pushSubscribedContent': pushSubscribedContent,
      'allowMentions': allowMentions,
      'pushMentions': pushMentions,
      'allowTags': allowTags,
      'pushTags': pushTags,
      'allowNewFollowers': allowNewFollowers,
      'pushNewFollowers': pushNewFollowers,
      'allowPlatformUpdates': allowPlatformUpdates,
      'pushPlatformUpdates': pushPlatformUpdates,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _UserNotificationSettingsImpl extends UserNotificationSettings {
  _UserNotificationSettingsImpl({
    int? id,
    required int userId,
    _i2.UserRecord? user,
    bool? pauseAllPush,
    bool? allowComments,
    bool? pushComments,
    bool? allowLikes,
    bool? pushLikes,
    bool? allowRepostsAndQuotes,
    bool? pushRepostsAndQuotes,
    bool? allowNewReviews,
    bool? pushNewReviews,
    bool? allowNewVettings,
    bool? pushNewVettings,
    bool? allowReactions,
    bool? pushReactions,
    bool? allowHelpfulReviews,
    bool? pushHelpfulReviews,
    bool? allowSubscribedContent,
    bool? pushSubscribedContent,
    bool? allowMentions,
    bool? pushMentions,
    bool? allowTags,
    bool? pushTags,
    bool? allowNewFollowers,
    bool? pushNewFollowers,
    bool? allowPlatformUpdates,
    bool? pushPlatformUpdates,
  }) : super._(
         id: id,
         userId: userId,
         user: user,
         pauseAllPush: pauseAllPush,
         allowComments: allowComments,
         pushComments: pushComments,
         allowLikes: allowLikes,
         pushLikes: pushLikes,
         allowRepostsAndQuotes: allowRepostsAndQuotes,
         pushRepostsAndQuotes: pushRepostsAndQuotes,
         allowNewReviews: allowNewReviews,
         pushNewReviews: pushNewReviews,
         allowNewVettings: allowNewVettings,
         pushNewVettings: pushNewVettings,
         allowReactions: allowReactions,
         pushReactions: pushReactions,
         allowHelpfulReviews: allowHelpfulReviews,
         pushHelpfulReviews: pushHelpfulReviews,
         allowSubscribedContent: allowSubscribedContent,
         pushSubscribedContent: pushSubscribedContent,
         allowMentions: allowMentions,
         pushMentions: pushMentions,
         allowTags: allowTags,
         pushTags: pushTags,
         allowNewFollowers: allowNewFollowers,
         pushNewFollowers: pushNewFollowers,
         allowPlatformUpdates: allowPlatformUpdates,
         pushPlatformUpdates: pushPlatformUpdates,
       );

  /// Returns a shallow copy of this [UserNotificationSettings]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  UserNotificationSettings copyWith({
    Object? id = _Undefined,
    int? userId,
    Object? user = _Undefined,
    bool? pauseAllPush,
    bool? allowComments,
    bool? pushComments,
    bool? allowLikes,
    bool? pushLikes,
    bool? allowRepostsAndQuotes,
    bool? pushRepostsAndQuotes,
    bool? allowNewReviews,
    bool? pushNewReviews,
    bool? allowNewVettings,
    bool? pushNewVettings,
    bool? allowReactions,
    bool? pushReactions,
    bool? allowHelpfulReviews,
    bool? pushHelpfulReviews,
    bool? allowSubscribedContent,
    bool? pushSubscribedContent,
    bool? allowMentions,
    bool? pushMentions,
    bool? allowTags,
    bool? pushTags,
    bool? allowNewFollowers,
    bool? pushNewFollowers,
    bool? allowPlatformUpdates,
    bool? pushPlatformUpdates,
  }) {
    return UserNotificationSettings(
      id: id is int? ? id : this.id,
      userId: userId ?? this.userId,
      user: user is _i2.UserRecord? ? user : this.user?.copyWith(),
      pauseAllPush: pauseAllPush ?? this.pauseAllPush,
      allowComments: allowComments ?? this.allowComments,
      pushComments: pushComments ?? this.pushComments,
      allowLikes: allowLikes ?? this.allowLikes,
      pushLikes: pushLikes ?? this.pushLikes,
      allowRepostsAndQuotes:
          allowRepostsAndQuotes ?? this.allowRepostsAndQuotes,
      pushRepostsAndQuotes: pushRepostsAndQuotes ?? this.pushRepostsAndQuotes,
      allowNewReviews: allowNewReviews ?? this.allowNewReviews,
      pushNewReviews: pushNewReviews ?? this.pushNewReviews,
      allowNewVettings: allowNewVettings ?? this.allowNewVettings,
      pushNewVettings: pushNewVettings ?? this.pushNewVettings,
      allowReactions: allowReactions ?? this.allowReactions,
      pushReactions: pushReactions ?? this.pushReactions,
      allowHelpfulReviews: allowHelpfulReviews ?? this.allowHelpfulReviews,
      pushHelpfulReviews: pushHelpfulReviews ?? this.pushHelpfulReviews,
      allowSubscribedContent:
          allowSubscribedContent ?? this.allowSubscribedContent,
      pushSubscribedContent:
          pushSubscribedContent ?? this.pushSubscribedContent,
      allowMentions: allowMentions ?? this.allowMentions,
      pushMentions: pushMentions ?? this.pushMentions,
      allowTags: allowTags ?? this.allowTags,
      pushTags: pushTags ?? this.pushTags,
      allowNewFollowers: allowNewFollowers ?? this.allowNewFollowers,
      pushNewFollowers: pushNewFollowers ?? this.pushNewFollowers,
      allowPlatformUpdates: allowPlatformUpdates ?? this.allowPlatformUpdates,
      pushPlatformUpdates: pushPlatformUpdates ?? this.pushPlatformUpdates,
    );
  }
}
