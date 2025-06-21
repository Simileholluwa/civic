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
import '../notification/notification_delivery_status.dart' as _i2;
import '../user/user_record.dart' as _i3;
import '../notification/notification_type_enum.dart' as _i4;
import '../post/post.dart' as _i5;
import '../project/project.dart' as _i6;
import '../poll/poll.dart' as _i7;
import '../article/article.dart' as _i8;

abstract class Notification
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
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

  static final t = NotificationTable();

  static const db = NotificationRepository._();

  @override
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

  @override
  _i1.Table<int?> get table => t;

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
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'receiverId': receiverId,
      if (receiver != null) 'receiver': receiver?.toJsonForProtocol(),
      if (senderId != null) 'senderId': senderId,
      if (sender != null) 'sender': sender?.toJsonForProtocol(),
      'type': type.toJson(),
      'title': title,
      'body': body,
      if (postId != null) 'postId': postId,
      if (post != null) 'post': post?.toJsonForProtocol(),
      if (projectId != null) 'projectId': projectId,
      if (project != null) 'project': project?.toJsonForProtocol(),
      if (pollId != null) 'pollId': pollId,
      if (poll != null) 'poll': poll?.toJsonForProtocol(),
      if (articleId != null) 'articleId': articleId,
      if (article != null) 'article': article?.toJsonForProtocol(),
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

  static NotificationInclude include({
    _i3.UserRecordInclude? receiver,
    _i3.UserRecordInclude? sender,
    _i5.PostInclude? post,
    _i6.ProjectInclude? project,
    _i7.PollInclude? poll,
    _i8.ArticleInclude? article,
  }) {
    return NotificationInclude._(
      receiver: receiver,
      sender: sender,
      post: post,
      project: project,
      poll: poll,
      article: article,
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
    type = _i1.ColumnEnum(
      'type',
      this,
      _i1.EnumSerialization.byIndex,
    );
    title = _i1.ColumnString(
      'title',
      this,
    );
    body = _i1.ColumnString(
      'body',
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
    pollId = _i1.ColumnInt(
      'pollId',
      this,
    );
    articleId = _i1.ColumnInt(
      'articleId',
      this,
    );
    actionRoute = _i1.ColumnString(
      'actionRoute',
      this,
    );
    groupKey = _i1.ColumnString(
      'groupKey',
      this,
    );
    groupCount = _i1.ColumnInt(
      'groupCount',
      this,
      hasDefault: true,
    );
    latestSenderName = _i1.ColumnString(
      'latestSenderName',
      this,
    );
    isRead = _i1.ColumnBool(
      'isRead',
      this,
      hasDefault: true,
    );
    isSeen = _i1.ColumnBool(
      'isSeen',
      this,
      hasDefault: true,
    );
    deliveryStatus = _i1.ColumnEnum(
      'deliveryStatus',
      this,
      _i1.EnumSerialization.byIndex,
      hasDefault: true,
    );
    createdAt = _i1.ColumnDateTime(
      'createdAt',
      this,
      hasDefault: true,
    );
    lastUpdatedAt = _i1.ColumnDateTime(
      'lastUpdatedAt',
      this,
    );
  }

  late final _i1.ColumnInt receiverId;

  _i3.UserRecordTable? _receiver;

  late final _i1.ColumnInt senderId;

  _i3.UserRecordTable? _sender;

  late final _i1.ColumnEnum<_i4.NotificationType> type;

  late final _i1.ColumnString title;

  late final _i1.ColumnString body;

  late final _i1.ColumnInt postId;

  _i5.PostTable? _post;

  late final _i1.ColumnInt projectId;

  _i6.ProjectTable? _project;

  late final _i1.ColumnInt pollId;

  _i7.PollTable? _poll;

  late final _i1.ColumnInt articleId;

  _i8.ArticleTable? _article;

  late final _i1.ColumnString actionRoute;

  late final _i1.ColumnString groupKey;

  late final _i1.ColumnInt groupCount;

  late final _i1.ColumnString latestSenderName;

  late final _i1.ColumnBool isRead;

  late final _i1.ColumnBool isSeen;

  late final _i1.ColumnEnum<_i2.NotificationDeliveryStatus> deliveryStatus;

  late final _i1.ColumnDateTime createdAt;

  late final _i1.ColumnDateTime lastUpdatedAt;

  _i3.UserRecordTable get receiver {
    if (_receiver != null) return _receiver!;
    _receiver = _i1.createRelationTable(
      relationFieldName: 'receiver',
      field: Notification.t.receiverId,
      foreignField: _i3.UserRecord.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i3.UserRecordTable(tableRelation: foreignTableRelation),
    );
    return _receiver!;
  }

  _i3.UserRecordTable get sender {
    if (_sender != null) return _sender!;
    _sender = _i1.createRelationTable(
      relationFieldName: 'sender',
      field: Notification.t.senderId,
      foreignField: _i3.UserRecord.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i3.UserRecordTable(tableRelation: foreignTableRelation),
    );
    return _sender!;
  }

  _i5.PostTable get post {
    if (_post != null) return _post!;
    _post = _i1.createRelationTable(
      relationFieldName: 'post',
      field: Notification.t.postId,
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
      field: Notification.t.projectId,
      foreignField: _i6.Project.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i6.ProjectTable(tableRelation: foreignTableRelation),
    );
    return _project!;
  }

  _i7.PollTable get poll {
    if (_poll != null) return _poll!;
    _poll = _i1.createRelationTable(
      relationFieldName: 'poll',
      field: Notification.t.pollId,
      foreignField: _i7.Poll.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i7.PollTable(tableRelation: foreignTableRelation),
    );
    return _poll!;
  }

  _i8.ArticleTable get article {
    if (_article != null) return _article!;
    _article = _i1.createRelationTable(
      relationFieldName: 'article',
      field: Notification.t.articleId,
      foreignField: _i8.Article.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i8.ArticleTable(tableRelation: foreignTableRelation),
    );
    return _article!;
  }

  @override
  List<_i1.Column> get columns => [
        id,
        receiverId,
        senderId,
        type,
        title,
        body,
        postId,
        projectId,
        pollId,
        articleId,
        actionRoute,
        groupKey,
        groupCount,
        latestSenderName,
        isRead,
        isSeen,
        deliveryStatus,
        createdAt,
        lastUpdatedAt,
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
    if (relationField == 'poll') {
      return poll;
    }
    if (relationField == 'article') {
      return article;
    }
    return null;
  }
}

class NotificationInclude extends _i1.IncludeObject {
  NotificationInclude._({
    _i3.UserRecordInclude? receiver,
    _i3.UserRecordInclude? sender,
    _i5.PostInclude? post,
    _i6.ProjectInclude? project,
    _i7.PollInclude? poll,
    _i8.ArticleInclude? article,
  }) {
    _receiver = receiver;
    _sender = sender;
    _post = post;
    _project = project;
    _poll = poll;
    _article = article;
  }

  _i3.UserRecordInclude? _receiver;

  _i3.UserRecordInclude? _sender;

  _i5.PostInclude? _post;

  _i6.ProjectInclude? _project;

  _i7.PollInclude? _poll;

  _i8.ArticleInclude? _article;

  @override
  Map<String, _i1.Include?> get includes => {
        'receiver': _receiver,
        'sender': _sender,
        'post': _post,
        'project': _project,
        'poll': _poll,
        'article': _article,
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

  final detachRow = const NotificationDetachRowRepository._();

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
    _i3.UserRecord receiver, {
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
    _i3.UserRecord sender, {
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

  /// Creates a relation between the given [Notification] and [Post]
  /// by setting the [Notification]'s foreign key `postId` to refer to the [Post].
  Future<void> post(
    _i1.Session session,
    Notification notification,
    _i5.Post post, {
    _i1.Transaction? transaction,
  }) async {
    if (notification.id == null) {
      throw ArgumentError.notNull('notification.id');
    }
    if (post.id == null) {
      throw ArgumentError.notNull('post.id');
    }

    var $notification = notification.copyWith(postId: post.id);
    await session.db.updateRow<Notification>(
      $notification,
      columns: [Notification.t.postId],
      transaction: transaction,
    );
  }

  /// Creates a relation between the given [Notification] and [Project]
  /// by setting the [Notification]'s foreign key `projectId` to refer to the [Project].
  Future<void> project(
    _i1.Session session,
    Notification notification,
    _i6.Project project, {
    _i1.Transaction? transaction,
  }) async {
    if (notification.id == null) {
      throw ArgumentError.notNull('notification.id');
    }
    if (project.id == null) {
      throw ArgumentError.notNull('project.id');
    }

    var $notification = notification.copyWith(projectId: project.id);
    await session.db.updateRow<Notification>(
      $notification,
      columns: [Notification.t.projectId],
      transaction: transaction,
    );
  }

  /// Creates a relation between the given [Notification] and [Poll]
  /// by setting the [Notification]'s foreign key `pollId` to refer to the [Poll].
  Future<void> poll(
    _i1.Session session,
    Notification notification,
    _i7.Poll poll, {
    _i1.Transaction? transaction,
  }) async {
    if (notification.id == null) {
      throw ArgumentError.notNull('notification.id');
    }
    if (poll.id == null) {
      throw ArgumentError.notNull('poll.id');
    }

    var $notification = notification.copyWith(pollId: poll.id);
    await session.db.updateRow<Notification>(
      $notification,
      columns: [Notification.t.pollId],
      transaction: transaction,
    );
  }

  /// Creates a relation between the given [Notification] and [Article]
  /// by setting the [Notification]'s foreign key `articleId` to refer to the [Article].
  Future<void> article(
    _i1.Session session,
    Notification notification,
    _i8.Article article, {
    _i1.Transaction? transaction,
  }) async {
    if (notification.id == null) {
      throw ArgumentError.notNull('notification.id');
    }
    if (article.id == null) {
      throw ArgumentError.notNull('article.id');
    }

    var $notification = notification.copyWith(articleId: article.id);
    await session.db.updateRow<Notification>(
      $notification,
      columns: [Notification.t.articleId],
      transaction: transaction,
    );
  }
}

class NotificationDetachRowRepository {
  const NotificationDetachRowRepository._();

  /// Detaches the relation between this [Notification] and the [UserRecord] set in `sender`
  /// by setting the [Notification]'s foreign key `senderId` to `null`.
  ///
  /// This removes the association between the two models without deleting
  /// the related record.
  Future<void> sender(
    _i1.Session session,
    Notification notification, {
    _i1.Transaction? transaction,
  }) async {
    if (notification.id == null) {
      throw ArgumentError.notNull('notification.id');
    }

    var $notification = notification.copyWith(senderId: null);
    await session.db.updateRow<Notification>(
      $notification,
      columns: [Notification.t.senderId],
      transaction: transaction,
    );
  }

  /// Detaches the relation between this [Notification] and the [Post] set in `post`
  /// by setting the [Notification]'s foreign key `postId` to `null`.
  ///
  /// This removes the association between the two models without deleting
  /// the related record.
  Future<void> post(
    _i1.Session session,
    Notification notification, {
    _i1.Transaction? transaction,
  }) async {
    if (notification.id == null) {
      throw ArgumentError.notNull('notification.id');
    }

    var $notification = notification.copyWith(postId: null);
    await session.db.updateRow<Notification>(
      $notification,
      columns: [Notification.t.postId],
      transaction: transaction,
    );
  }

  /// Detaches the relation between this [Notification] and the [Project] set in `project`
  /// by setting the [Notification]'s foreign key `projectId` to `null`.
  ///
  /// This removes the association between the two models without deleting
  /// the related record.
  Future<void> project(
    _i1.Session session,
    Notification notification, {
    _i1.Transaction? transaction,
  }) async {
    if (notification.id == null) {
      throw ArgumentError.notNull('notification.id');
    }

    var $notification = notification.copyWith(projectId: null);
    await session.db.updateRow<Notification>(
      $notification,
      columns: [Notification.t.projectId],
      transaction: transaction,
    );
  }

  /// Detaches the relation between this [Notification] and the [Poll] set in `poll`
  /// by setting the [Notification]'s foreign key `pollId` to `null`.
  ///
  /// This removes the association between the two models without deleting
  /// the related record.
  Future<void> poll(
    _i1.Session session,
    Notification notification, {
    _i1.Transaction? transaction,
  }) async {
    if (notification.id == null) {
      throw ArgumentError.notNull('notification.id');
    }

    var $notification = notification.copyWith(pollId: null);
    await session.db.updateRow<Notification>(
      $notification,
      columns: [Notification.t.pollId],
      transaction: transaction,
    );
  }

  /// Detaches the relation between this [Notification] and the [Article] set in `article`
  /// by setting the [Notification]'s foreign key `articleId` to `null`.
  ///
  /// This removes the association between the two models without deleting
  /// the related record.
  Future<void> article(
    _i1.Session session,
    Notification notification, {
    _i1.Transaction? transaction,
  }) async {
    if (notification.id == null) {
      throw ArgumentError.notNull('notification.id');
    }

    var $notification = notification.copyWith(articleId: null);
    await session.db.updateRow<Notification>(
      $notification,
      columns: [Notification.t.articleId],
      transaction: transaction,
    );
  }
}
