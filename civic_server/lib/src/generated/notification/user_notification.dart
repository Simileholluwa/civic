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
import '../notification/notification.dart' as _i2;

abstract class UserNotification
    implements _i1.SerializableModel, _i1.ProtocolSerialization {
  UserNotification._({
    required this.notification,
    required this.title,
    this.mediaThumbnailUrl,
    required this.senderUsernames,
  });

  factory UserNotification({
    required _i2.Notification notification,
    required String title,
    String? mediaThumbnailUrl,
    required List<String> senderUsernames,
  }) = _UserNotificationImpl;

  factory UserNotification.fromJson(Map<String, dynamic> jsonSerialization) {
    return UserNotification(
      notification: _i2.Notification.fromJson(
          (jsonSerialization['notification'] as Map<String, dynamic>)),
      title: jsonSerialization['title'] as String,
      mediaThumbnailUrl: jsonSerialization['mediaThumbnailUrl'] as String?,
      senderUsernames: (jsonSerialization['senderUsernames'] as List)
          .map((e) => e as String)
          .toList(),
    );
  }

  _i2.Notification notification;

  String title;

  String? mediaThumbnailUrl;

  List<String> senderUsernames;

  /// Returns a shallow copy of this [UserNotification]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  UserNotification copyWith({
    _i2.Notification? notification,
    String? title,
    String? mediaThumbnailUrl,
    List<String>? senderUsernames,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      'notification': notification.toJson(),
      'title': title,
      if (mediaThumbnailUrl != null) 'mediaThumbnailUrl': mediaThumbnailUrl,
      'senderUsernames': senderUsernames.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      'notification': notification.toJsonForProtocol(),
      'title': title,
      if (mediaThumbnailUrl != null) 'mediaThumbnailUrl': mediaThumbnailUrl,
      'senderUsernames': senderUsernames.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _UserNotificationImpl extends UserNotification {
  _UserNotificationImpl({
    required _i2.Notification notification,
    required String title,
    String? mediaThumbnailUrl,
    required List<String> senderUsernames,
  }) : super._(
          notification: notification,
          title: title,
          mediaThumbnailUrl: mediaThumbnailUrl,
          senderUsernames: senderUsernames,
        );

  /// Returns a shallow copy of this [UserNotification]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  UserNotification copyWith({
    _i2.Notification? notification,
    String? title,
    Object? mediaThumbnailUrl = _Undefined,
    List<String>? senderUsernames,
  }) {
    return UserNotification(
      notification: notification ?? this.notification.copyWith(),
      title: title ?? this.title,
      mediaThumbnailUrl: mediaThumbnailUrl is String?
          ? mediaThumbnailUrl
          : this.mediaThumbnailUrl,
      senderUsernames:
          senderUsernames ?? this.senderUsernames.map((e0) => e0).toList(),
    );
  }
}
