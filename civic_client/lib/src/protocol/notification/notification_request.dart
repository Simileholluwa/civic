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
import '../notification/notification_type_enum.dart' as _i2;

abstract class NotificationRequest implements _i1.SerializableModel {
  NotificationRequest._({
    required this.receiverId,
    this.senderId,
    required this.type,
    required this.title,
    required this.body,
    this.postId,
    this.projectId,
    this.pollId,
    this.articleId,
    this.actionRoute,
    this.groupKey,
  });

  factory NotificationRequest({
    required int receiverId,
    int? senderId,
    required _i2.NotificationType type,
    required String title,
    required String body,
    int? postId,
    int? projectId,
    int? pollId,
    int? articleId,
    String? actionRoute,
    String? groupKey,
  }) = _NotificationRequestImpl;

  factory NotificationRequest.fromJson(Map<String, dynamic> jsonSerialization) {
    return NotificationRequest(
      receiverId: jsonSerialization['receiverId'] as int,
      senderId: jsonSerialization['senderId'] as int?,
      type: _i2.NotificationType.fromJson((jsonSerialization['type'] as int)),
      title: jsonSerialization['title'] as String,
      body: jsonSerialization['body'] as String,
      postId: jsonSerialization['postId'] as int?,
      projectId: jsonSerialization['projectId'] as int?,
      pollId: jsonSerialization['pollId'] as int?,
      articleId: jsonSerialization['articleId'] as int?,
      actionRoute: jsonSerialization['actionRoute'] as String?,
      groupKey: jsonSerialization['groupKey'] as String?,
    );
  }

  int receiverId;

  int? senderId;

  _i2.NotificationType type;

  String title;

  String body;

  int? postId;

  int? projectId;

  int? pollId;

  int? articleId;

  String? actionRoute;

  String? groupKey;

  /// Returns a shallow copy of this [NotificationRequest]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  NotificationRequest copyWith({
    int? receiverId,
    int? senderId,
    _i2.NotificationType? type,
    String? title,
    String? body,
    int? postId,
    int? projectId,
    int? pollId,
    int? articleId,
    String? actionRoute,
    String? groupKey,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      'receiverId': receiverId,
      if (senderId != null) 'senderId': senderId,
      'type': type.toJson(),
      'title': title,
      'body': body,
      if (postId != null) 'postId': postId,
      if (projectId != null) 'projectId': projectId,
      if (pollId != null) 'pollId': pollId,
      if (articleId != null) 'articleId': articleId,
      if (actionRoute != null) 'actionRoute': actionRoute,
      if (groupKey != null) 'groupKey': groupKey,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _NotificationRequestImpl extends NotificationRequest {
  _NotificationRequestImpl({
    required int receiverId,
    int? senderId,
    required _i2.NotificationType type,
    required String title,
    required String body,
    int? postId,
    int? projectId,
    int? pollId,
    int? articleId,
    String? actionRoute,
    String? groupKey,
  }) : super._(
          receiverId: receiverId,
          senderId: senderId,
          type: type,
          title: title,
          body: body,
          postId: postId,
          projectId: projectId,
          pollId: pollId,
          articleId: articleId,
          actionRoute: actionRoute,
          groupKey: groupKey,
        );

  /// Returns a shallow copy of this [NotificationRequest]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  NotificationRequest copyWith({
    int? receiverId,
    Object? senderId = _Undefined,
    _i2.NotificationType? type,
    String? title,
    String? body,
    Object? postId = _Undefined,
    Object? projectId = _Undefined,
    Object? pollId = _Undefined,
    Object? articleId = _Undefined,
    Object? actionRoute = _Undefined,
    Object? groupKey = _Undefined,
  }) {
    return NotificationRequest(
      receiverId: receiverId ?? this.receiverId,
      senderId: senderId is int? ? senderId : this.senderId,
      type: type ?? this.type,
      title: title ?? this.title,
      body: body ?? this.body,
      postId: postId is int? ? postId : this.postId,
      projectId: projectId is int? ? projectId : this.projectId,
      pollId: pollId is int? ? pollId : this.pollId,
      articleId: articleId is int? ? articleId : this.articleId,
      actionRoute: actionRoute is String? ? actionRoute : this.actionRoute,
      groupKey: groupKey is String? ? groupKey : this.groupKey,
    );
  }
}
