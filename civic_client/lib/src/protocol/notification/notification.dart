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
import '../notification/notification_action_type.dart' as _i3;
import '../notification/notification_target_type.dart' as _i4;
import '../post/post.dart' as _i5;
import '../project/project.dart' as _i6;
import 'package:civic_client/src/protocol/protocol.dart' as _i7;

abstract class AppNotification implements _i1.SerializableModel {
  AppNotification._({
    this.id,
    required this.receiverId,
    this.receiver,
    required this.senderId,
    this.sender,
    this.senderName,
    this.groupedSenderNames,
    required this.title,
    this.body,
    this.groupKey,
    required this.actionType,
    this.senderAvatarUrl,
    required this.targetType,
    required this.actionRoute,
    required this.targetId,
    bool? isRead,
    DateTime? createdAt,
    this.updatedAt,
    this.postId,
    this.post,
    this.projectId,
    this.project,
  }) : isRead = isRead ?? false,
       createdAt = createdAt ?? DateTime.now();

  factory AppNotification({
    int? id,
    required int receiverId,
    _i2.UserRecord? receiver,
    required int senderId,
    _i2.UserRecord? sender,
    String? senderName,
    List<String>? groupedSenderNames,
    required String title,
    String? body,
    String? groupKey,
    required _i3.NotificationActionType actionType,
    String? senderAvatarUrl,
    required _i4.NotificationTargetType targetType,
    required String actionRoute,
    required int targetId,
    bool? isRead,
    DateTime? createdAt,
    DateTime? updatedAt,
    int? postId,
    _i5.Post? post,
    int? projectId,
    _i6.Project? project,
  }) = _AppNotificationImpl;

  factory AppNotification.fromJson(Map<String, dynamic> jsonSerialization) {
    return AppNotification(
      id: jsonSerialization['id'] as int?,
      receiverId: jsonSerialization['receiverId'] as int,
      receiver: jsonSerialization['receiver'] == null
          ? null
          : _i7.Protocol().deserialize<_i2.UserRecord>(
              jsonSerialization['receiver'],
            ),
      senderId: jsonSerialization['senderId'] as int,
      sender: jsonSerialization['sender'] == null
          ? null
          : _i7.Protocol().deserialize<_i2.UserRecord>(
              jsonSerialization['sender'],
            ),
      senderName: jsonSerialization['senderName'] as String?,
      groupedSenderNames: jsonSerialization['groupedSenderNames'] == null
          ? null
          : _i7.Protocol().deserialize<List<String>>(
              jsonSerialization['groupedSenderNames'],
            ),
      title: jsonSerialization['title'] as String,
      body: jsonSerialization['body'] as String?,
      groupKey: jsonSerialization['groupKey'] as String?,
      actionType: _i3.NotificationActionType.fromJson(
        (jsonSerialization['actionType'] as String),
      ),
      senderAvatarUrl: jsonSerialization['senderAvatarUrl'] as String?,
      targetType: _i4.NotificationTargetType.fromJson(
        (jsonSerialization['targetType'] as String),
      ),
      actionRoute: jsonSerialization['actionRoute'] as String,
      targetId: jsonSerialization['targetId'] as int,
      isRead: jsonSerialization['isRead'] as bool?,
      createdAt: jsonSerialization['createdAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
      updatedAt: jsonSerialization['updatedAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['updatedAt']),
      postId: jsonSerialization['postId'] as int?,
      post: jsonSerialization['post'] == null
          ? null
          : _i7.Protocol().deserialize<_i5.Post>(jsonSerialization['post']),
      projectId: jsonSerialization['projectId'] as int?,
      project: jsonSerialization['project'] == null
          ? null
          : _i7.Protocol().deserialize<_i6.Project>(
              jsonSerialization['project'],
            ),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int receiverId;

  _i2.UserRecord? receiver;

  int senderId;

  _i2.UserRecord? sender;

  String? senderName;

  List<String>? groupedSenderNames;

  String title;

  String? body;

  String? groupKey;

  _i3.NotificationActionType actionType;

  String? senderAvatarUrl;

  _i4.NotificationTargetType targetType;

  String actionRoute;

  int targetId;

  bool isRead;

  DateTime createdAt;

  DateTime? updatedAt;

  int? postId;

  _i5.Post? post;

  int? projectId;

  _i6.Project? project;

  /// Returns a shallow copy of this [AppNotification]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  AppNotification copyWith({
    int? id,
    int? receiverId,
    _i2.UserRecord? receiver,
    int? senderId,
    _i2.UserRecord? sender,
    String? senderName,
    List<String>? groupedSenderNames,
    String? title,
    String? body,
    String? groupKey,
    _i3.NotificationActionType? actionType,
    String? senderAvatarUrl,
    _i4.NotificationTargetType? targetType,
    String? actionRoute,
    int? targetId,
    bool? isRead,
    DateTime? createdAt,
    DateTime? updatedAt,
    int? postId,
    _i5.Post? post,
    int? projectId,
    _i6.Project? project,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'AppNotification',
      if (id != null) 'id': id,
      'receiverId': receiverId,
      if (receiver != null) 'receiver': receiver?.toJson(),
      'senderId': senderId,
      if (sender != null) 'sender': sender?.toJson(),
      if (senderName != null) 'senderName': senderName,
      if (groupedSenderNames != null)
        'groupedSenderNames': groupedSenderNames?.toJson(),
      'title': title,
      if (body != null) 'body': body,
      if (groupKey != null) 'groupKey': groupKey,
      'actionType': actionType.toJson(),
      if (senderAvatarUrl != null) 'senderAvatarUrl': senderAvatarUrl,
      'targetType': targetType.toJson(),
      'actionRoute': actionRoute,
      'targetId': targetId,
      'isRead': isRead,
      'createdAt': createdAt.toJson(),
      if (updatedAt != null) 'updatedAt': updatedAt?.toJson(),
      if (postId != null) 'postId': postId,
      if (post != null) 'post': post?.toJson(),
      if (projectId != null) 'projectId': projectId,
      if (project != null) 'project': project?.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _AppNotificationImpl extends AppNotification {
  _AppNotificationImpl({
    int? id,
    required int receiverId,
    _i2.UserRecord? receiver,
    required int senderId,
    _i2.UserRecord? sender,
    String? senderName,
    List<String>? groupedSenderNames,
    required String title,
    String? body,
    String? groupKey,
    required _i3.NotificationActionType actionType,
    String? senderAvatarUrl,
    required _i4.NotificationTargetType targetType,
    required String actionRoute,
    required int targetId,
    bool? isRead,
    DateTime? createdAt,
    DateTime? updatedAt,
    int? postId,
    _i5.Post? post,
    int? projectId,
    _i6.Project? project,
  }) : super._(
         id: id,
         receiverId: receiverId,
         receiver: receiver,
         senderId: senderId,
         sender: sender,
         senderName: senderName,
         groupedSenderNames: groupedSenderNames,
         title: title,
         body: body,
         groupKey: groupKey,
         actionType: actionType,
         senderAvatarUrl: senderAvatarUrl,
         targetType: targetType,
         actionRoute: actionRoute,
         targetId: targetId,
         isRead: isRead,
         createdAt: createdAt,
         updatedAt: updatedAt,
         postId: postId,
         post: post,
         projectId: projectId,
         project: project,
       );

  /// Returns a shallow copy of this [AppNotification]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  AppNotification copyWith({
    Object? id = _Undefined,
    int? receiverId,
    Object? receiver = _Undefined,
    int? senderId,
    Object? sender = _Undefined,
    Object? senderName = _Undefined,
    Object? groupedSenderNames = _Undefined,
    String? title,
    Object? body = _Undefined,
    Object? groupKey = _Undefined,
    _i3.NotificationActionType? actionType,
    Object? senderAvatarUrl = _Undefined,
    _i4.NotificationTargetType? targetType,
    String? actionRoute,
    int? targetId,
    bool? isRead,
    DateTime? createdAt,
    Object? updatedAt = _Undefined,
    Object? postId = _Undefined,
    Object? post = _Undefined,
    Object? projectId = _Undefined,
    Object? project = _Undefined,
  }) {
    return AppNotification(
      id: id is int? ? id : this.id,
      receiverId: receiverId ?? this.receiverId,
      receiver: receiver is _i2.UserRecord?
          ? receiver
          : this.receiver?.copyWith(),
      senderId: senderId ?? this.senderId,
      sender: sender is _i2.UserRecord? ? sender : this.sender?.copyWith(),
      senderName: senderName is String? ? senderName : this.senderName,
      groupedSenderNames: groupedSenderNames is List<String>?
          ? groupedSenderNames
          : this.groupedSenderNames?.map((e0) => e0).toList(),
      title: title ?? this.title,
      body: body is String? ? body : this.body,
      groupKey: groupKey is String? ? groupKey : this.groupKey,
      actionType: actionType ?? this.actionType,
      senderAvatarUrl: senderAvatarUrl is String?
          ? senderAvatarUrl
          : this.senderAvatarUrl,
      targetType: targetType ?? this.targetType,
      actionRoute: actionRoute ?? this.actionRoute,
      targetId: targetId ?? this.targetId,
      isRead: isRead ?? this.isRead,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt is DateTime? ? updatedAt : this.updatedAt,
      postId: postId is int? ? postId : this.postId,
      post: post is _i5.Post? ? post : this.post?.copyWith(),
      projectId: projectId is int? ? projectId : this.projectId,
      project: project is _i6.Project? ? project : this.project?.copyWith(),
    );
  }
}
