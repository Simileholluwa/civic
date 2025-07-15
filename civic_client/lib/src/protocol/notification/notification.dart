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
import '../user/user_record.dart' as _i2;

abstract class Notification implements _i1.SerializableModel {
  Notification._({
    this.id,
    required this.receiverId,
    this.receiver,
    required this.senderId,
    this.sender,
    this.senderName,
    this.groupedSenderNames,
    this.triggerUser,
    this.content,
    this.groupKey,
    required this.actionType,
    required this.mediaThumbnailUrl,
    required this.targetType,
    required this.actionRoute,
    required this.targetId,
    bool? isRead,
    DateTime? createdAt,
    this.updatedAt,
  })  : isRead = isRead ?? false,
        createdAt = createdAt ?? DateTime.now();

  factory Notification({
    int? id,
    required int receiverId,
    _i2.UserRecord? receiver,
    required int senderId,
    _i2.UserRecord? sender,
    String? senderName,
    List<String>? groupedSenderNames,
    String? triggerUser,
    String? content,
    String? groupKey,
    required String actionType,
    required String mediaThumbnailUrl,
    required String targetType,
    required String actionRoute,
    required int targetId,
    bool? isRead,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _NotificationImpl;

  factory Notification.fromJson(Map<String, dynamic> jsonSerialization) {
    return Notification(
      id: jsonSerialization['id'] as int?,
      receiverId: jsonSerialization['receiverId'] as int,
      receiver: jsonSerialization['receiver'] == null
          ? null
          : _i2.UserRecord.fromJson(
              (jsonSerialization['receiver'] as Map<String, dynamic>)),
      senderId: jsonSerialization['senderId'] as int,
      sender: jsonSerialization['sender'] == null
          ? null
          : _i2.UserRecord.fromJson(
              (jsonSerialization['sender'] as Map<String, dynamic>)),
      senderName: jsonSerialization['senderName'] as String?,
      groupedSenderNames: (jsonSerialization['groupedSenderNames'] as List?)
          ?.map((e) => e as String)
          .toList(),
      triggerUser: jsonSerialization['triggerUser'] as String?,
      content: jsonSerialization['content'] as String?,
      groupKey: jsonSerialization['groupKey'] as String?,
      actionType: jsonSerialization['actionType'] as String,
      mediaThumbnailUrl: jsonSerialization['mediaThumbnailUrl'] as String,
      targetType: jsonSerialization['targetType'] as String,
      actionRoute: jsonSerialization['actionRoute'] as String,
      targetId: jsonSerialization['targetId'] as int,
      isRead: jsonSerialization['isRead'] as bool,
      createdAt:
          _i1.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
      updatedAt: jsonSerialization['updatedAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['updatedAt']),
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

  String? triggerUser;

  String? content;

  String? groupKey;

  String actionType;

  String mediaThumbnailUrl;

  String targetType;

  String actionRoute;

  int targetId;

  bool isRead;

  DateTime createdAt;

  DateTime? updatedAt;

  /// Returns a shallow copy of this [Notification]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  Notification copyWith({
    int? id,
    int? receiverId,
    _i2.UserRecord? receiver,
    int? senderId,
    _i2.UserRecord? sender,
    String? senderName,
    List<String>? groupedSenderNames,
    String? triggerUser,
    String? content,
    String? groupKey,
    String? actionType,
    String? mediaThumbnailUrl,
    String? targetType,
    String? actionRoute,
    int? targetId,
    bool? isRead,
    DateTime? createdAt,
    DateTime? updatedAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'receiverId': receiverId,
      if (receiver != null) 'receiver': receiver?.toJson(),
      'senderId': senderId,
      if (sender != null) 'sender': sender?.toJson(),
      if (senderName != null) 'senderName': senderName,
      if (groupedSenderNames != null)
        'groupedSenderNames': groupedSenderNames?.toJson(),
      if (triggerUser != null) 'triggerUser': triggerUser,
      if (content != null) 'content': content,
      if (groupKey != null) 'groupKey': groupKey,
      'actionType': actionType,
      'mediaThumbnailUrl': mediaThumbnailUrl,
      'targetType': targetType,
      'actionRoute': actionRoute,
      'targetId': targetId,
      'isRead': isRead,
      'createdAt': createdAt.toJson(),
      if (updatedAt != null) 'updatedAt': updatedAt?.toJson(),
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
    _i2.UserRecord? receiver,
    required int senderId,
    _i2.UserRecord? sender,
    String? senderName,
    List<String>? groupedSenderNames,
    String? triggerUser,
    String? content,
    String? groupKey,
    required String actionType,
    required String mediaThumbnailUrl,
    required String targetType,
    required String actionRoute,
    required int targetId,
    bool? isRead,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) : super._(
          id: id,
          receiverId: receiverId,
          receiver: receiver,
          senderId: senderId,
          sender: sender,
          senderName: senderName,
          groupedSenderNames: groupedSenderNames,
          triggerUser: triggerUser,
          content: content,
          groupKey: groupKey,
          actionType: actionType,
          mediaThumbnailUrl: mediaThumbnailUrl,
          targetType: targetType,
          actionRoute: actionRoute,
          targetId: targetId,
          isRead: isRead,
          createdAt: createdAt,
          updatedAt: updatedAt,
        );

  /// Returns a shallow copy of this [Notification]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  Notification copyWith({
    Object? id = _Undefined,
    int? receiverId,
    Object? receiver = _Undefined,
    int? senderId,
    Object? sender = _Undefined,
    Object? senderName = _Undefined,
    Object? groupedSenderNames = _Undefined,
    Object? triggerUser = _Undefined,
    Object? content = _Undefined,
    Object? groupKey = _Undefined,
    String? actionType,
    String? mediaThumbnailUrl,
    String? targetType,
    String? actionRoute,
    int? targetId,
    bool? isRead,
    DateTime? createdAt,
    Object? updatedAt = _Undefined,
  }) {
    return Notification(
      id: id is int? ? id : this.id,
      receiverId: receiverId ?? this.receiverId,
      receiver:
          receiver is _i2.UserRecord? ? receiver : this.receiver?.copyWith(),
      senderId: senderId ?? this.senderId,
      sender: sender is _i2.UserRecord? ? sender : this.sender?.copyWith(),
      senderName: senderName is String? ? senderName : this.senderName,
      groupedSenderNames: groupedSenderNames is List<String>?
          ? groupedSenderNames
          : this.groupedSenderNames?.map((e0) => e0).toList(),
      triggerUser: triggerUser is String? ? triggerUser : this.triggerUser,
      content: content is String? ? content : this.content,
      groupKey: groupKey is String? ? groupKey : this.groupKey,
      actionType: actionType ?? this.actionType,
      mediaThumbnailUrl: mediaThumbnailUrl ?? this.mediaThumbnailUrl,
      targetType: targetType ?? this.targetType,
      actionRoute: actionRoute ?? this.actionRoute,
      targetId: targetId ?? this.targetId,
      isRead: isRead ?? this.isRead,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt is DateTime? ? updatedAt : this.updatedAt,
    );
  }
}
