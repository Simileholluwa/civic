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
import '../notification/notification_delivery_status.dart' as _i2;
import '../user/user_record.dart' as _i3;
import '../notification/notification_type_enum.dart' as _i4;
import '../post/post.dart' as _i5;
import '../project/project.dart' as _i6;
import '../poll/poll.dart' as _i7;
import '../article/article.dart' as _i8;

abstract class Notification implements _i1.SerializableModel {
  Notification._({
    this.id,
    required this.receiverId,
    this.receiver,
    this.senderId,
    this.sender,
    required this.type,
    required this.title,
    required this.body,
    this.postId,
    this.post,
    this.projectId,
    this.project,
    this.pollId,
    this.poll,
    this.articleId,
    this.article,
    this.actionRoute,
    this.groupKey,
    int? groupCount,
    this.latestSenderName,
    bool? isRead,
    bool? isSeen,
    _i2.NotificationDeliveryStatus? deliveryStatus,
    DateTime? createdAt,
    this.lastUpdatedAt,
  })  : groupCount = groupCount ?? 1,
        isRead = isRead ?? false,
        isSeen = isSeen ?? false,
        deliveryStatus =
            deliveryStatus ?? _i2.NotificationDeliveryStatus.pending,
        createdAt = createdAt ?? DateTime.now();

  factory Notification({
    int? id,
    required int receiverId,
    _i3.UserRecord? receiver,
    int? senderId,
    _i3.UserRecord? sender,
    required _i4.NotificationType type,
    required String title,
    required String body,
    int? postId,
    _i5.Post? post,
    int? projectId,
    _i6.Project? project,
    int? pollId,
    _i7.Poll? poll,
    int? articleId,
    _i8.Article? article,
    String? actionRoute,
    String? groupKey,
    int? groupCount,
    String? latestSenderName,
    bool? isRead,
    bool? isSeen,
    _i2.NotificationDeliveryStatus? deliveryStatus,
    DateTime? createdAt,
    DateTime? lastUpdatedAt,
  }) = _NotificationImpl;

  factory Notification.fromJson(Map<String, dynamic> jsonSerialization) {
    return Notification(
      id: jsonSerialization['id'] as int?,
      receiverId: jsonSerialization['receiverId'] as int,
      receiver: jsonSerialization['receiver'] == null
          ? null
          : _i3.UserRecord.fromJson(
              (jsonSerialization['receiver'] as Map<String, dynamic>)),
      senderId: jsonSerialization['senderId'] as int?,
      sender: jsonSerialization['sender'] == null
          ? null
          : _i3.UserRecord.fromJson(
              (jsonSerialization['sender'] as Map<String, dynamic>)),
      type: _i4.NotificationType.fromJson((jsonSerialization['type'] as int)),
      title: jsonSerialization['title'] as String,
      body: jsonSerialization['body'] as String,
      postId: jsonSerialization['postId'] as int?,
      post: jsonSerialization['post'] == null
          ? null
          : _i5.Post.fromJson(
              (jsonSerialization['post'] as Map<String, dynamic>)),
      projectId: jsonSerialization['projectId'] as int?,
      project: jsonSerialization['project'] == null
          ? null
          : _i6.Project.fromJson(
              (jsonSerialization['project'] as Map<String, dynamic>)),
      pollId: jsonSerialization['pollId'] as int?,
      poll: jsonSerialization['poll'] == null
          ? null
          : _i7.Poll.fromJson(
              (jsonSerialization['poll'] as Map<String, dynamic>)),
      articleId: jsonSerialization['articleId'] as int?,
      article: jsonSerialization['article'] == null
          ? null
          : _i8.Article.fromJson(
              (jsonSerialization['article'] as Map<String, dynamic>)),
      actionRoute: jsonSerialization['actionRoute'] as String?,
      groupKey: jsonSerialization['groupKey'] as String?,
      groupCount: jsonSerialization['groupCount'] as int?,
      latestSenderName: jsonSerialization['latestSenderName'] as String?,
      isRead: jsonSerialization['isRead'] as bool?,
      isSeen: jsonSerialization['isSeen'] as bool?,
      deliveryStatus: _i2.NotificationDeliveryStatus.fromJson(
          (jsonSerialization['deliveryStatus'] as int)),
      createdAt:
          _i1.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
      lastUpdatedAt: jsonSerialization['lastUpdatedAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(
              jsonSerialization['lastUpdatedAt']),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int receiverId;

  _i3.UserRecord? receiver;

  int? senderId;

  _i3.UserRecord? sender;

  _i4.NotificationType type;

  String title;

  String body;

  int? postId;

  _i5.Post? post;

  int? projectId;

  _i6.Project? project;

  int? pollId;

  _i7.Poll? poll;

  int? articleId;

  _i8.Article? article;

  String? actionRoute;

  String? groupKey;

  int? groupCount;

  String? latestSenderName;

  bool? isRead;

  bool? isSeen;

  _i2.NotificationDeliveryStatus deliveryStatus;

  DateTime createdAt;

  DateTime? lastUpdatedAt;

  /// Returns a shallow copy of this [Notification]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  Notification copyWith({
    int? id,
    int? receiverId,
    _i3.UserRecord? receiver,
    int? senderId,
    _i3.UserRecord? sender,
    _i4.NotificationType? type,
    String? title,
    String? body,
    int? postId,
    _i5.Post? post,
    int? projectId,
    _i6.Project? project,
    int? pollId,
    _i7.Poll? poll,
    int? articleId,
    _i8.Article? article,
    String? actionRoute,
    String? groupKey,
    int? groupCount,
    String? latestSenderName,
    bool? isRead,
    bool? isSeen,
    _i2.NotificationDeliveryStatus? deliveryStatus,
    DateTime? createdAt,
    DateTime? lastUpdatedAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'receiverId': receiverId,
      if (receiver != null) 'receiver': receiver?.toJson(),
      if (senderId != null) 'senderId': senderId,
      if (sender != null) 'sender': sender?.toJson(),
      'type': type.toJson(),
      'title': title,
      'body': body,
      if (postId != null) 'postId': postId,
      if (post != null) 'post': post?.toJson(),
      if (projectId != null) 'projectId': projectId,
      if (project != null) 'project': project?.toJson(),
      if (pollId != null) 'pollId': pollId,
      if (poll != null) 'poll': poll?.toJson(),
      if (articleId != null) 'articleId': articleId,
      if (article != null) 'article': article?.toJson(),
      if (actionRoute != null) 'actionRoute': actionRoute,
      if (groupKey != null) 'groupKey': groupKey,
      if (groupCount != null) 'groupCount': groupCount,
      if (latestSenderName != null) 'latestSenderName': latestSenderName,
      if (isRead != null) 'isRead': isRead,
      if (isSeen != null) 'isSeen': isSeen,
      'deliveryStatus': deliveryStatus.toJson(),
      'createdAt': createdAt.toJson(),
      if (lastUpdatedAt != null) 'lastUpdatedAt': lastUpdatedAt?.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _NotificationImpl extends Notification {
  _NotificationImpl({
    int? id,
    required int receiverId,
    _i3.UserRecord? receiver,
    int? senderId,
    _i3.UserRecord? sender,
    required _i4.NotificationType type,
    required String title,
    required String body,
    int? postId,
    _i5.Post? post,
    int? projectId,
    _i6.Project? project,
    int? pollId,
    _i7.Poll? poll,
    int? articleId,
    _i8.Article? article,
    String? actionRoute,
    String? groupKey,
    int? groupCount,
    String? latestSenderName,
    bool? isRead,
    bool? isSeen,
    _i2.NotificationDeliveryStatus? deliveryStatus,
    DateTime? createdAt,
    DateTime? lastUpdatedAt,
  }) : super._(
          id: id,
          receiverId: receiverId,
          receiver: receiver,
          senderId: senderId,
          sender: sender,
          type: type,
          title: title,
          body: body,
          postId: postId,
          post: post,
          projectId: projectId,
          project: project,
          pollId: pollId,
          poll: poll,
          articleId: articleId,
          article: article,
          actionRoute: actionRoute,
          groupKey: groupKey,
          groupCount: groupCount,
          latestSenderName: latestSenderName,
          isRead: isRead,
          isSeen: isSeen,
          deliveryStatus: deliveryStatus,
          createdAt: createdAt,
          lastUpdatedAt: lastUpdatedAt,
        );

  /// Returns a shallow copy of this [Notification]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  Notification copyWith({
    Object? id = _Undefined,
    int? receiverId,
    Object? receiver = _Undefined,
    Object? senderId = _Undefined,
    Object? sender = _Undefined,
    _i4.NotificationType? type,
    String? title,
    String? body,
    Object? postId = _Undefined,
    Object? post = _Undefined,
    Object? projectId = _Undefined,
    Object? project = _Undefined,
    Object? pollId = _Undefined,
    Object? poll = _Undefined,
    Object? articleId = _Undefined,
    Object? article = _Undefined,
    Object? actionRoute = _Undefined,
    Object? groupKey = _Undefined,
    Object? groupCount = _Undefined,
    Object? latestSenderName = _Undefined,
    Object? isRead = _Undefined,
    Object? isSeen = _Undefined,
    _i2.NotificationDeliveryStatus? deliveryStatus,
    DateTime? createdAt,
    Object? lastUpdatedAt = _Undefined,
  }) {
    return Notification(
      id: id is int? ? id : this.id,
      receiverId: receiverId ?? this.receiverId,
      receiver:
          receiver is _i3.UserRecord? ? receiver : this.receiver?.copyWith(),
      senderId: senderId is int? ? senderId : this.senderId,
      sender: sender is _i3.UserRecord? ? sender : this.sender?.copyWith(),
      type: type ?? this.type,
      title: title ?? this.title,
      body: body ?? this.body,
      postId: postId is int? ? postId : this.postId,
      post: post is _i5.Post? ? post : this.post?.copyWith(),
      projectId: projectId is int? ? projectId : this.projectId,
      project: project is _i6.Project? ? project : this.project?.copyWith(),
      pollId: pollId is int? ? pollId : this.pollId,
      poll: poll is _i7.Poll? ? poll : this.poll?.copyWith(),
      articleId: articleId is int? ? articleId : this.articleId,
      article: article is _i8.Article? ? article : this.article?.copyWith(),
      actionRoute: actionRoute is String? ? actionRoute : this.actionRoute,
      groupKey: groupKey is String? ? groupKey : this.groupKey,
      groupCount: groupCount is int? ? groupCount : this.groupCount,
      latestSenderName: latestSenderName is String?
          ? latestSenderName
          : this.latestSenderName,
      isRead: isRead is bool? ? isRead : this.isRead,
      isSeen: isSeen is bool? ? isSeen : this.isSeen,
      deliveryStatus: deliveryStatus ?? this.deliveryStatus,
      createdAt: createdAt ?? this.createdAt,
      lastUpdatedAt:
          lastUpdatedAt is DateTime? ? lastUpdatedAt : this.lastUpdatedAt,
    );
  }
}
