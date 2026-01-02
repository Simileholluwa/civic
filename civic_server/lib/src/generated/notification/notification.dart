/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters
// ignore_for_file: invalid_use_of_internal_member

// ignore_for_file: unnecessary_null_comparison

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;
import '../user/user_record.dart' as _i2;
import '../notification/notification_action_type.dart' as _i3;
import '../notification/notification_target_type.dart' as _i4;
import '../post/post.dart' as _i5;
import '../project/project.dart' as _i6;
import 'package:civic_server/src/generated/protocol.dart' as _i7;

abstract class AppNotification
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
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
      isRead: jsonSerialization['isRead'] as bool,
      createdAt: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['createdAt'],
      ),
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

  static final t = AppNotificationTable();

  static const db = AppNotificationRepository._();

  @override
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

  @override
  _i1.Table<int?> get table => t;

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
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'AppNotification',
      if (id != null) 'id': id,
      'receiverId': receiverId,
      if (receiver != null) 'receiver': receiver?.toJsonForProtocol(),
      'senderId': senderId,
      if (sender != null) 'sender': sender?.toJsonForProtocol(),
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
      if (post != null) 'post': post?.toJsonForProtocol(),
      if (projectId != null) 'projectId': projectId,
      if (project != null) 'project': project?.toJsonForProtocol(),
    };
  }

  static AppNotificationInclude include({
    _i2.UserRecordInclude? receiver,
    _i2.UserRecordInclude? sender,
    _i5.PostInclude? post,
    _i6.ProjectInclude? project,
  }) {
    return AppNotificationInclude._(
      receiver: receiver,
      sender: sender,
      post: post,
      project: project,
    );
  }

  static AppNotificationIncludeList includeList({
    _i1.WhereExpressionBuilder<AppNotificationTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<AppNotificationTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<AppNotificationTable>? orderByList,
    AppNotificationInclude? include,
  }) {
    return AppNotificationIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(AppNotification.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(AppNotification.t),
      include: include,
    );
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

class AppNotificationUpdateTable extends _i1.UpdateTable<AppNotificationTable> {
  AppNotificationUpdateTable(super.table);

  _i1.ColumnValue<int, int> receiverId(int value) => _i1.ColumnValue(
    table.receiverId,
    value,
  );

  _i1.ColumnValue<int, int> senderId(int value) => _i1.ColumnValue(
    table.senderId,
    value,
  );

  _i1.ColumnValue<String, String> senderName(String? value) => _i1.ColumnValue(
    table.senderName,
    value,
  );

  _i1.ColumnValue<List<String>, List<String>> groupedSenderNames(
    List<String>? value,
  ) => _i1.ColumnValue(
    table.groupedSenderNames,
    value,
  );

  _i1.ColumnValue<String, String> title(String value) => _i1.ColumnValue(
    table.title,
    value,
  );

  _i1.ColumnValue<String, String> body(String? value) => _i1.ColumnValue(
    table.body,
    value,
  );

  _i1.ColumnValue<String, String> groupKey(String? value) => _i1.ColumnValue(
    table.groupKey,
    value,
  );

  _i1.ColumnValue<_i3.NotificationActionType, _i3.NotificationActionType>
  actionType(_i3.NotificationActionType value) => _i1.ColumnValue(
    table.actionType,
    value,
  );

  _i1.ColumnValue<String, String> senderAvatarUrl(String? value) =>
      _i1.ColumnValue(
        table.senderAvatarUrl,
        value,
      );

  _i1.ColumnValue<_i4.NotificationTargetType, _i4.NotificationTargetType>
  targetType(_i4.NotificationTargetType value) => _i1.ColumnValue(
    table.targetType,
    value,
  );

  _i1.ColumnValue<String, String> actionRoute(String value) => _i1.ColumnValue(
    table.actionRoute,
    value,
  );

  _i1.ColumnValue<int, int> targetId(int value) => _i1.ColumnValue(
    table.targetId,
    value,
  );

  _i1.ColumnValue<bool, bool> isRead(bool value) => _i1.ColumnValue(
    table.isRead,
    value,
  );

  _i1.ColumnValue<DateTime, DateTime> createdAt(DateTime value) =>
      _i1.ColumnValue(
        table.createdAt,
        value,
      );

  _i1.ColumnValue<DateTime, DateTime> updatedAt(DateTime? value) =>
      _i1.ColumnValue(
        table.updatedAt,
        value,
      );

  _i1.ColumnValue<int, int> postId(int? value) => _i1.ColumnValue(
    table.postId,
    value,
  );

  _i1.ColumnValue<int, int> projectId(int? value) => _i1.ColumnValue(
    table.projectId,
    value,
  );
}

class AppNotificationTable extends _i1.Table<int?> {
  AppNotificationTable({super.tableRelation})
    : super(tableName: 'app_notification') {
    updateTable = AppNotificationUpdateTable(this);
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
    groupedSenderNames = _i1.ColumnSerializable<List<String>>(
      'groupedSenderNames',
      this,
    );
    title = _i1.ColumnString(
      'title',
      this,
    );
    body = _i1.ColumnString(
      'body',
      this,
    );
    groupKey = _i1.ColumnString(
      'groupKey',
      this,
    );
    actionType = _i1.ColumnEnum(
      'actionType',
      this,
      _i1.EnumSerialization.byName,
    );
    senderAvatarUrl = _i1.ColumnString(
      'senderAvatarUrl',
      this,
    );
    targetType = _i1.ColumnEnum(
      'targetType',
      this,
      _i1.EnumSerialization.byName,
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
    postId = _i1.ColumnInt(
      'postId',
      this,
    );
    projectId = _i1.ColumnInt(
      'projectId',
      this,
    );
  }

  late final AppNotificationUpdateTable updateTable;

  late final _i1.ColumnInt receiverId;

  _i2.UserRecordTable? _receiver;

  late final _i1.ColumnInt senderId;

  _i2.UserRecordTable? _sender;

  late final _i1.ColumnString senderName;

  late final _i1.ColumnSerializable<List<String>> groupedSenderNames;

  late final _i1.ColumnString title;

  late final _i1.ColumnString body;

  late final _i1.ColumnString groupKey;

  late final _i1.ColumnEnum<_i3.NotificationActionType> actionType;

  late final _i1.ColumnString senderAvatarUrl;

  late final _i1.ColumnEnum<_i4.NotificationTargetType> targetType;

  late final _i1.ColumnString actionRoute;

  late final _i1.ColumnInt targetId;

  late final _i1.ColumnBool isRead;

  late final _i1.ColumnDateTime createdAt;

  late final _i1.ColumnDateTime updatedAt;

  late final _i1.ColumnInt postId;

  _i5.PostTable? _post;

  late final _i1.ColumnInt projectId;

  _i6.ProjectTable? _project;

  _i2.UserRecordTable get receiver {
    if (_receiver != null) return _receiver!;
    _receiver = _i1.createRelationTable(
      relationFieldName: 'receiver',
      field: AppNotification.t.receiverId,
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
      field: AppNotification.t.senderId,
      foreignField: _i2.UserRecord.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.UserRecordTable(tableRelation: foreignTableRelation),
    );
    return _sender!;
  }

  _i5.PostTable get post {
    if (_post != null) return _post!;
    _post = _i1.createRelationTable(
      relationFieldName: 'post',
      field: AppNotification.t.postId,
      foreignField: _i5.Post.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i5.PostTable(tableRelation: foreignTableRelation),
    );
    return _post!;
  }

  _i6.ProjectTable get project {
    if (_project != null) return _project!;
    _project = _i1.createRelationTable(
      relationFieldName: 'project',
      field: AppNotification.t.projectId,
      foreignField: _i6.Project.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i6.ProjectTable(tableRelation: foreignTableRelation),
    );
    return _project!;
  }

  @override
  List<_i1.Column> get columns => [
    id,
    receiverId,
    senderId,
    senderName,
    groupedSenderNames,
    title,
    body,
    groupKey,
    actionType,
    senderAvatarUrl,
    targetType,
    actionRoute,
    targetId,
    isRead,
    createdAt,
    updatedAt,
    postId,
    projectId,
  ];

  @override
  _i1.Table? getRelationTable(String relationField) {
    if (relationField == 'receiver') {
      return receiver;
    }
    if (relationField == 'sender') {
      return sender;
    }
    if (relationField == 'post') {
      return post;
    }
    if (relationField == 'project') {
      return project;
    }
    return null;
  }
}

class AppNotificationInclude extends _i1.IncludeObject {
  AppNotificationInclude._({
    _i2.UserRecordInclude? receiver,
    _i2.UserRecordInclude? sender,
    _i5.PostInclude? post,
    _i6.ProjectInclude? project,
  }) {
    _receiver = receiver;
    _sender = sender;
    _post = post;
    _project = project;
  }

  _i2.UserRecordInclude? _receiver;

  _i2.UserRecordInclude? _sender;

  _i5.PostInclude? _post;

  _i6.ProjectInclude? _project;

  @override
  Map<String, _i1.Include?> get includes => {
    'receiver': _receiver,
    'sender': _sender,
    'post': _post,
    'project': _project,
  };

  @override
  _i1.Table<int?> get table => AppNotification.t;
}

class AppNotificationIncludeList extends _i1.IncludeList {
  AppNotificationIncludeList._({
    _i1.WhereExpressionBuilder<AppNotificationTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(AppNotification.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => AppNotification.t;
}

class AppNotificationRepository {
  const AppNotificationRepository._();

  final attachRow = const AppNotificationAttachRowRepository._();

  final detachRow = const AppNotificationDetachRowRepository._();

  /// Returns a list of [AppNotification]s matching the given query parameters.
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
  Future<List<AppNotification>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<AppNotificationTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<AppNotificationTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<AppNotificationTable>? orderByList,
    _i1.Transaction? transaction,
    AppNotificationInclude? include,
  }) async {
    return session.db.find<AppNotification>(
      where: where?.call(AppNotification.t),
      orderBy: orderBy?.call(AppNotification.t),
      orderByList: orderByList?.call(AppNotification.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Returns the first matching [AppNotification] matching the given query parameters.
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
  Future<AppNotification?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<AppNotificationTable>? where,
    int? offset,
    _i1.OrderByBuilder<AppNotificationTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<AppNotificationTable>? orderByList,
    _i1.Transaction? transaction,
    AppNotificationInclude? include,
  }) async {
    return session.db.findFirstRow<AppNotification>(
      where: where?.call(AppNotification.t),
      orderBy: orderBy?.call(AppNotification.t),
      orderByList: orderByList?.call(AppNotification.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Finds a single [AppNotification] by its [id] or null if no such row exists.
  Future<AppNotification?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
    AppNotificationInclude? include,
  }) async {
    return session.db.findById<AppNotification>(
      id,
      transaction: transaction,
      include: include,
    );
  }

  /// Inserts all [AppNotification]s in the list and returns the inserted rows.
  ///
  /// The returned [AppNotification]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<AppNotification>> insert(
    _i1.Session session,
    List<AppNotification> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<AppNotification>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [AppNotification] and returns the inserted row.
  ///
  /// The returned [AppNotification] will have its `id` field set.
  Future<AppNotification> insertRow(
    _i1.Session session,
    AppNotification row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<AppNotification>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [AppNotification]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<AppNotification>> update(
    _i1.Session session,
    List<AppNotification> rows, {
    _i1.ColumnSelections<AppNotificationTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<AppNotification>(
      rows,
      columns: columns?.call(AppNotification.t),
      transaction: transaction,
    );
  }

  /// Updates a single [AppNotification]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<AppNotification> updateRow(
    _i1.Session session,
    AppNotification row, {
    _i1.ColumnSelections<AppNotificationTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<AppNotification>(
      row,
      columns: columns?.call(AppNotification.t),
      transaction: transaction,
    );
  }

  /// Updates a single [AppNotification] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<AppNotification?> updateById(
    _i1.Session session,
    int id, {
    required _i1.ColumnValueListBuilder<AppNotificationUpdateTable>
    columnValues,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateById<AppNotification>(
      id,
      columnValues: columnValues(AppNotification.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [AppNotification]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  Future<List<AppNotification>> updateWhere(
    _i1.Session session, {
    required _i1.ColumnValueListBuilder<AppNotificationUpdateTable>
    columnValues,
    required _i1.WhereExpressionBuilder<AppNotificationTable> where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<AppNotificationTable>? orderBy,
    _i1.OrderByListBuilder<AppNotificationTable>? orderByList,
    bool orderDescending = false,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateWhere<AppNotification>(
      columnValues: columnValues(AppNotification.t.updateTable),
      where: where(AppNotification.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(AppNotification.t),
      orderByList: orderByList?.call(AppNotification.t),
      orderDescending: orderDescending,
      transaction: transaction,
    );
  }

  /// Deletes all [AppNotification]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<AppNotification>> delete(
    _i1.Session session,
    List<AppNotification> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<AppNotification>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [AppNotification].
  Future<AppNotification> deleteRow(
    _i1.Session session,
    AppNotification row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<AppNotification>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<AppNotification>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<AppNotificationTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<AppNotification>(
      where: where(AppNotification.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<AppNotificationTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<AppNotification>(
      where: where?.call(AppNotification.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

class AppNotificationAttachRowRepository {
  const AppNotificationAttachRowRepository._();

  /// Creates a relation between the given [AppNotification] and [UserRecord]
  /// by setting the [AppNotification]'s foreign key `receiverId` to refer to the [UserRecord].
  Future<void> receiver(
    _i1.Session session,
    AppNotification appNotification,
    _i2.UserRecord receiver, {
    _i1.Transaction? transaction,
  }) async {
    if (appNotification.id == null) {
      throw ArgumentError.notNull('appNotification.id');
    }
    if (receiver.id == null) {
      throw ArgumentError.notNull('receiver.id');
    }

    var $appNotification = appNotification.copyWith(receiverId: receiver.id);
    await session.db.updateRow<AppNotification>(
      $appNotification,
      columns: [AppNotification.t.receiverId],
      transaction: transaction,
    );
  }

  /// Creates a relation between the given [AppNotification] and [UserRecord]
  /// by setting the [AppNotification]'s foreign key `senderId` to refer to the [UserRecord].
  Future<void> sender(
    _i1.Session session,
    AppNotification appNotification,
    _i2.UserRecord sender, {
    _i1.Transaction? transaction,
  }) async {
    if (appNotification.id == null) {
      throw ArgumentError.notNull('appNotification.id');
    }
    if (sender.id == null) {
      throw ArgumentError.notNull('sender.id');
    }

    var $appNotification = appNotification.copyWith(senderId: sender.id);
    await session.db.updateRow<AppNotification>(
      $appNotification,
      columns: [AppNotification.t.senderId],
      transaction: transaction,
    );
  }

  /// Creates a relation between the given [AppNotification] and [Post]
  /// by setting the [AppNotification]'s foreign key `postId` to refer to the [Post].
  Future<void> post(
    _i1.Session session,
    AppNotification appNotification,
    _i5.Post post, {
    _i1.Transaction? transaction,
  }) async {
    if (appNotification.id == null) {
      throw ArgumentError.notNull('appNotification.id');
    }
    if (post.id == null) {
      throw ArgumentError.notNull('post.id');
    }

    var $appNotification = appNotification.copyWith(postId: post.id);
    await session.db.updateRow<AppNotification>(
      $appNotification,
      columns: [AppNotification.t.postId],
      transaction: transaction,
    );
  }

  /// Creates a relation between the given [AppNotification] and [Project]
  /// by setting the [AppNotification]'s foreign key `projectId` to refer to the [Project].
  Future<void> project(
    _i1.Session session,
    AppNotification appNotification,
    _i6.Project project, {
    _i1.Transaction? transaction,
  }) async {
    if (appNotification.id == null) {
      throw ArgumentError.notNull('appNotification.id');
    }
    if (project.id == null) {
      throw ArgumentError.notNull('project.id');
    }

    var $appNotification = appNotification.copyWith(projectId: project.id);
    await session.db.updateRow<AppNotification>(
      $appNotification,
      columns: [AppNotification.t.projectId],
      transaction: transaction,
    );
  }
}

class AppNotificationDetachRowRepository {
  const AppNotificationDetachRowRepository._();

  /// Detaches the relation between this [AppNotification] and the [Post] set in `post`
  /// by setting the [AppNotification]'s foreign key `postId` to `null`.
  ///
  /// This removes the association between the two models without deleting
  /// the related record.
  Future<void> post(
    _i1.Session session,
    AppNotification appNotification, {
    _i1.Transaction? transaction,
  }) async {
    if (appNotification.id == null) {
      throw ArgumentError.notNull('appNotification.id');
    }

    var $appNotification = appNotification.copyWith(postId: null);
    await session.db.updateRow<AppNotification>(
      $appNotification,
      columns: [AppNotification.t.postId],
      transaction: transaction,
    );
  }

  /// Detaches the relation between this [AppNotification] and the [Project] set in `project`
  /// by setting the [AppNotification]'s foreign key `projectId` to `null`.
  ///
  /// This removes the association between the two models without deleting
  /// the related record.
  Future<void> project(
    _i1.Session session,
    AppNotification appNotification, {
    _i1.Transaction? transaction,
  }) async {
    if (appNotification.id == null) {
      throw ArgumentError.notNull('appNotification.id');
    }

    var $appNotification = appNotification.copyWith(projectId: null);
    await session.db.updateRow<AppNotification>(
      $appNotification,
      columns: [AppNotification.t.projectId],
      transaction: transaction,
    );
  }
}
