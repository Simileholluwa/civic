/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters

// ignore_for_file: unnecessary_null_comparison

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;
import '../user/user_record.dart' as _i2;

abstract class Notification
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
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

  static final t = NotificationTable();

  static const db = NotificationRepository._();

  @override
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

  @override
  _i1.Table<int?> get table => t;

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
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'receiverId': receiverId,
      if (receiver != null) 'receiver': receiver?.toJsonForProtocol(),
      'senderId': senderId,
      if (sender != null) 'sender': sender?.toJsonForProtocol(),
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

  static NotificationInclude include({
    _i2.UserRecordInclude? receiver,
    _i2.UserRecordInclude? sender,
  }) {
    return NotificationInclude._(
      receiver: receiver,
      sender: sender,
    );
  }

  static NotificationIncludeList includeList({
    _i1.WhereExpressionBuilder<NotificationTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<NotificationTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<NotificationTable>? orderByList,
    NotificationInclude? include,
  }) {
    return NotificationIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Notification.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(Notification.t),
      include: include,
    );
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

class NotificationTable extends _i1.Table<int?> {
  NotificationTable({super.tableRelation}) : super(tableName: 'notification') {
    receiverId = _i1.ColumnInt(
      'receiverId',
      this,
    );
    senderId = _i1.ColumnInt(
      'senderId',
      this,
    );
    senderName = _i1.ColumnString(
      'senderName',
      this,
    );
    groupedSenderNames = _i1.ColumnSerializable(
      'groupedSenderNames',
      this,
    );
    triggerUser = _i1.ColumnString(
      'triggerUser',
      this,
    );
    content = _i1.ColumnString(
      'content',
      this,
    );
    groupKey = _i1.ColumnString(
      'groupKey',
      this,
    );
    actionType = _i1.ColumnString(
      'actionType',
      this,
    );
    mediaThumbnailUrl = _i1.ColumnString(
      'mediaThumbnailUrl',
      this,
    );
    targetType = _i1.ColumnString(
      'targetType',
      this,
    );
    actionRoute = _i1.ColumnString(
      'actionRoute',
      this,
    );
    targetId = _i1.ColumnInt(
      'targetId',
      this,
    );
    isRead = _i1.ColumnBool(
      'isRead',
      this,
      hasDefault: true,
    );
    createdAt = _i1.ColumnDateTime(
      'createdAt',
      this,
      hasDefault: true,
    );
    updatedAt = _i1.ColumnDateTime(
      'updatedAt',
      this,
    );
  }

  late final _i1.ColumnInt receiverId;

  _i2.UserRecordTable? _receiver;

  late final _i1.ColumnInt senderId;

  _i2.UserRecordTable? _sender;

  late final _i1.ColumnString senderName;

  late final _i1.ColumnSerializable groupedSenderNames;

  late final _i1.ColumnString triggerUser;

  late final _i1.ColumnString content;

  late final _i1.ColumnString groupKey;

  late final _i1.ColumnString actionType;

  late final _i1.ColumnString mediaThumbnailUrl;

  late final _i1.ColumnString targetType;

  late final _i1.ColumnString actionRoute;

  late final _i1.ColumnInt targetId;

  late final _i1.ColumnBool isRead;

  late final _i1.ColumnDateTime createdAt;

  late final _i1.ColumnDateTime updatedAt;

  _i2.UserRecordTable get receiver {
    if (_receiver != null) return _receiver!;
    _receiver = _i1.createRelationTable(
      relationFieldName: 'receiver',
      field: Notification.t.receiverId,
      foreignField: _i2.UserRecord.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.UserRecordTable(tableRelation: foreignTableRelation),
    );
    return _receiver!;
  }

  _i2.UserRecordTable get sender {
    if (_sender != null) return _sender!;
    _sender = _i1.createRelationTable(
      relationFieldName: 'sender',
      field: Notification.t.senderId,
      foreignField: _i2.UserRecord.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.UserRecordTable(tableRelation: foreignTableRelation),
    );
    return _sender!;
  }

  @override
  List<_i1.Column> get columns => [
        id,
        receiverId,
        senderId,
        senderName,
        groupedSenderNames,
        triggerUser,
        content,
        groupKey,
        actionType,
        mediaThumbnailUrl,
        targetType,
        actionRoute,
        targetId,
        isRead,
        createdAt,
        updatedAt,
      ];

  @override
  _i1.Table? getRelationTable(String relationField) {
    if (relationField == 'receiver') {
      return receiver;
    }
    if (relationField == 'sender') {
      return sender;
    }
    return null;
  }
}

class NotificationInclude extends _i1.IncludeObject {
  NotificationInclude._({
    _i2.UserRecordInclude? receiver,
    _i2.UserRecordInclude? sender,
  }) {
    _receiver = receiver;
    _sender = sender;
  }

  _i2.UserRecordInclude? _receiver;

  _i2.UserRecordInclude? _sender;

  @override
  Map<String, _i1.Include?> get includes => {
        'receiver': _receiver,
        'sender': _sender,
      };

  @override
  _i1.Table<int?> get table => Notification.t;
}

class NotificationIncludeList extends _i1.IncludeList {
  NotificationIncludeList._({
    _i1.WhereExpressionBuilder<NotificationTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(Notification.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => Notification.t;
}

class NotificationRepository {
  const NotificationRepository._();

  final attachRow = const NotificationAttachRowRepository._();

  /// Returns a list of [Notification]s matching the given query parameters.
  ///
  /// Use [where] to specify which items to include in the return value.
  /// If none is specified, all items will be returned.
  ///
  /// To specify the order of the items use [orderBy] or [orderByList]
  /// when sorting by multiple columns.
  ///
  /// The maximum number of items can be set by [limit]. If no limit is set,
  /// all items matching the query will be returned.
  ///
  /// [offset] defines how many items to skip, after which [limit] (or all)
  /// items are read from the database.
  ///
  /// ```dart
  /// var persons = await Persons.db.find(
  ///   session,
  ///   where: (t) => t.lastName.equals('Jones'),
  ///   orderBy: (t) => t.firstName,
  ///   limit: 100,
  /// );
  /// ```
  Future<List<Notification>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<NotificationTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<NotificationTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<NotificationTable>? orderByList,
    _i1.Transaction? transaction,
    NotificationInclude? include,
  }) async {
    return session.db.find<Notification>(
      where: where?.call(Notification.t),
      orderBy: orderBy?.call(Notification.t),
      orderByList: orderByList?.call(Notification.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Returns the first matching [Notification] matching the given query parameters.
  ///
  /// Use [where] to specify which items to include in the return value.
  /// If none is specified, all items will be returned.
  ///
  /// To specify the order use [orderBy] or [orderByList]
  /// when sorting by multiple columns.
  ///
  /// [offset] defines how many items to skip, after which the next one will be picked.
  ///
  /// ```dart
  /// var youngestPerson = await Persons.db.findFirstRow(
  ///   session,
  ///   where: (t) => t.lastName.equals('Jones'),
  ///   orderBy: (t) => t.age,
  /// );
  /// ```
  Future<Notification?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<NotificationTable>? where,
    int? offset,
    _i1.OrderByBuilder<NotificationTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<NotificationTable>? orderByList,
    _i1.Transaction? transaction,
    NotificationInclude? include,
  }) async {
    return session.db.findFirstRow<Notification>(
      where: where?.call(Notification.t),
      orderBy: orderBy?.call(Notification.t),
      orderByList: orderByList?.call(Notification.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Finds a single [Notification] by its [id] or null if no such row exists.
  Future<Notification?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
    NotificationInclude? include,
  }) async {
    return session.db.findById<Notification>(
      id,
      transaction: transaction,
      include: include,
    );
  }

  /// Inserts all [Notification]s in the list and returns the inserted rows.
  ///
  /// The returned [Notification]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<Notification>> insert(
    _i1.Session session,
    List<Notification> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<Notification>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [Notification] and returns the inserted row.
  ///
  /// The returned [Notification] will have its `id` field set.
  Future<Notification> insertRow(
    _i1.Session session,
    Notification row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<Notification>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [Notification]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<Notification>> update(
    _i1.Session session,
    List<Notification> rows, {
    _i1.ColumnSelections<NotificationTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<Notification>(
      rows,
      columns: columns?.call(Notification.t),
      transaction: transaction,
    );
  }

  /// Updates a single [Notification]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<Notification> updateRow(
    _i1.Session session,
    Notification row, {
    _i1.ColumnSelections<NotificationTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<Notification>(
      row,
      columns: columns?.call(Notification.t),
      transaction: transaction,
    );
  }

  /// Deletes all [Notification]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<Notification>> delete(
    _i1.Session session,
    List<Notification> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<Notification>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [Notification].
  Future<Notification> deleteRow(
    _i1.Session session,
    Notification row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<Notification>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<Notification>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<NotificationTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<Notification>(
      where: where(Notification.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<NotificationTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<Notification>(
      where: where?.call(Notification.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

class NotificationAttachRowRepository {
  const NotificationAttachRowRepository._();

  /// Creates a relation between the given [Notification] and [UserRecord]
  /// by setting the [Notification]'s foreign key `receiverId` to refer to the [UserRecord].
  Future<void> receiver(
    _i1.Session session,
    Notification notification,
    _i2.UserRecord receiver, {
    _i1.Transaction? transaction,
  }) async {
    if (notification.id == null) {
      throw ArgumentError.notNull('notification.id');
    }
    if (receiver.id == null) {
      throw ArgumentError.notNull('receiver.id');
    }

    var $notification = notification.copyWith(receiverId: receiver.id);
    await session.db.updateRow<Notification>(
      $notification,
      columns: [Notification.t.receiverId],
      transaction: transaction,
    );
  }

  /// Creates a relation between the given [Notification] and [UserRecord]
  /// by setting the [Notification]'s foreign key `senderId` to refer to the [UserRecord].
  Future<void> sender(
    _i1.Session session,
    Notification notification,
    _i2.UserRecord sender, {
    _i1.Transaction? transaction,
  }) async {
    if (notification.id == null) {
      throw ArgumentError.notNull('notification.id');
    }
    if (sender.id == null) {
      throw ArgumentError.notNull('sender.id');
    }

    var $notification = notification.copyWith(senderId: sender.id);
    await session.db.updateRow<Notification>(
      $notification,
      columns: [Notification.t.senderId],
      transaction: transaction,
    );
  }
}
