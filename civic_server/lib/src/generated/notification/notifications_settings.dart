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

abstract class UserNotificationSettings
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
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
  })  : pauseAllPush = pauseAllPush ?? false,
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
      Map<String, dynamic> jsonSerialization) {
    return UserNotificationSettings(
      id: jsonSerialization['id'] as int?,
      userId: jsonSerialization['userId'] as int,
      user: jsonSerialization['user'] == null
          ? null
          : _i2.UserRecord.fromJson(
              (jsonSerialization['user'] as Map<String, dynamic>)),
      pauseAllPush: jsonSerialization['pauseAllPush'] as bool,
      allowComments: jsonSerialization['allowComments'] as bool,
      pushComments: jsonSerialization['pushComments'] as bool,
      allowLikes: jsonSerialization['allowLikes'] as bool,
      pushLikes: jsonSerialization['pushLikes'] as bool,
      allowRepostsAndQuotes: jsonSerialization['allowRepostsAndQuotes'] as bool,
      pushRepostsAndQuotes: jsonSerialization['pushRepostsAndQuotes'] as bool,
      allowNewReviews: jsonSerialization['allowNewReviews'] as bool,
      pushNewReviews: jsonSerialization['pushNewReviews'] as bool,
      allowNewVettings: jsonSerialization['allowNewVettings'] as bool,
      pushNewVettings: jsonSerialization['pushNewVettings'] as bool,
      allowReactions: jsonSerialization['allowReactions'] as bool,
      pushReactions: jsonSerialization['pushReactions'] as bool,
      allowHelpfulReviews: jsonSerialization['allowHelpfulReviews'] as bool,
      pushHelpfulReviews: jsonSerialization['pushHelpfulReviews'] as bool,
      allowSubscribedContent:
          jsonSerialization['allowSubscribedContent'] as bool,
      pushSubscribedContent: jsonSerialization['pushSubscribedContent'] as bool,
      allowMentions: jsonSerialization['allowMentions'] as bool,
      pushMentions: jsonSerialization['pushMentions'] as bool,
      allowTags: jsonSerialization['allowTags'] as bool,
      pushTags: jsonSerialization['pushTags'] as bool,
      allowNewFollowers: jsonSerialization['allowNewFollowers'] as bool,
      pushNewFollowers: jsonSerialization['pushNewFollowers'] as bool,
      allowPlatformUpdates: jsonSerialization['allowPlatformUpdates'] as bool,
      pushPlatformUpdates: jsonSerialization['pushPlatformUpdates'] as bool,
    );
  }

  static final t = UserNotificationSettingsTable();

  static const db = UserNotificationSettingsRepository._();

  @override
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

  @override
  _i1.Table<int?> get table => t;

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
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'userId': userId,
      if (user != null) 'user': user?.toJsonForProtocol(),
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

  static UserNotificationSettingsInclude include(
      {_i2.UserRecordInclude? user}) {
    return UserNotificationSettingsInclude._(user: user);
  }

  static UserNotificationSettingsIncludeList includeList({
    _i1.WhereExpressionBuilder<UserNotificationSettingsTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<UserNotificationSettingsTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<UserNotificationSettingsTable>? orderByList,
    UserNotificationSettingsInclude? include,
  }) {
    return UserNotificationSettingsIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(UserNotificationSettings.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(UserNotificationSettings.t),
      include: include,
    );
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

class UserNotificationSettingsTable extends _i1.Table<int?> {
  UserNotificationSettingsTable({super.tableRelation})
      : super(tableName: 'user_notification_settings') {
    userId = _i1.ColumnInt(
      'userId',
      this,
    );
    pauseAllPush = _i1.ColumnBool(
      'pauseAllPush',
      this,
      hasDefault: true,
    );
    allowComments = _i1.ColumnBool(
      'allowComments',
      this,
      hasDefault: true,
    );
    pushComments = _i1.ColumnBool(
      'pushComments',
      this,
      hasDefault: true,
    );
    allowLikes = _i1.ColumnBool(
      'allowLikes',
      this,
      hasDefault: true,
    );
    pushLikes = _i1.ColumnBool(
      'pushLikes',
      this,
      hasDefault: true,
    );
    allowRepostsAndQuotes = _i1.ColumnBool(
      'allowRepostsAndQuotes',
      this,
      hasDefault: true,
    );
    pushRepostsAndQuotes = _i1.ColumnBool(
      'pushRepostsAndQuotes',
      this,
      hasDefault: true,
    );
    allowNewReviews = _i1.ColumnBool(
      'allowNewReviews',
      this,
      hasDefault: true,
    );
    pushNewReviews = _i1.ColumnBool(
      'pushNewReviews',
      this,
      hasDefault: true,
    );
    allowNewVettings = _i1.ColumnBool(
      'allowNewVettings',
      this,
      hasDefault: true,
    );
    pushNewVettings = _i1.ColumnBool(
      'pushNewVettings',
      this,
      hasDefault: true,
    );
    allowReactions = _i1.ColumnBool(
      'allowReactions',
      this,
      hasDefault: true,
    );
    pushReactions = _i1.ColumnBool(
      'pushReactions',
      this,
      hasDefault: true,
    );
    allowHelpfulReviews = _i1.ColumnBool(
      'allowHelpfulReviews',
      this,
      hasDefault: true,
    );
    pushHelpfulReviews = _i1.ColumnBool(
      'pushHelpfulReviews',
      this,
      hasDefault: true,
    );
    allowSubscribedContent = _i1.ColumnBool(
      'allowSubscribedContent',
      this,
      hasDefault: true,
    );
    pushSubscribedContent = _i1.ColumnBool(
      'pushSubscribedContent',
      this,
      hasDefault: true,
    );
    allowMentions = _i1.ColumnBool(
      'allowMentions',
      this,
      hasDefault: true,
    );
    pushMentions = _i1.ColumnBool(
      'pushMentions',
      this,
      hasDefault: true,
    );
    allowTags = _i1.ColumnBool(
      'allowTags',
      this,
      hasDefault: true,
    );
    pushTags = _i1.ColumnBool(
      'pushTags',
      this,
      hasDefault: true,
    );
    allowNewFollowers = _i1.ColumnBool(
      'allowNewFollowers',
      this,
      hasDefault: true,
    );
    pushNewFollowers = _i1.ColumnBool(
      'pushNewFollowers',
      this,
      hasDefault: true,
    );
    allowPlatformUpdates = _i1.ColumnBool(
      'allowPlatformUpdates',
      this,
      hasDefault: true,
    );
    pushPlatformUpdates = _i1.ColumnBool(
      'pushPlatformUpdates',
      this,
      hasDefault: true,
    );
  }

  late final _i1.ColumnInt userId;

  _i2.UserRecordTable? _user;

  late final _i1.ColumnBool pauseAllPush;

  late final _i1.ColumnBool allowComments;

  late final _i1.ColumnBool pushComments;

  late final _i1.ColumnBool allowLikes;

  late final _i1.ColumnBool pushLikes;

  late final _i1.ColumnBool allowRepostsAndQuotes;

  late final _i1.ColumnBool pushRepostsAndQuotes;

  late final _i1.ColumnBool allowNewReviews;

  late final _i1.ColumnBool pushNewReviews;

  late final _i1.ColumnBool allowNewVettings;

  late final _i1.ColumnBool pushNewVettings;

  late final _i1.ColumnBool allowReactions;

  late final _i1.ColumnBool pushReactions;

  late final _i1.ColumnBool allowHelpfulReviews;

  late final _i1.ColumnBool pushHelpfulReviews;

  late final _i1.ColumnBool allowSubscribedContent;

  late final _i1.ColumnBool pushSubscribedContent;

  late final _i1.ColumnBool allowMentions;

  late final _i1.ColumnBool pushMentions;

  late final _i1.ColumnBool allowTags;

  late final _i1.ColumnBool pushTags;

  late final _i1.ColumnBool allowNewFollowers;

  late final _i1.ColumnBool pushNewFollowers;

  late final _i1.ColumnBool allowPlatformUpdates;

  late final _i1.ColumnBool pushPlatformUpdates;

  _i2.UserRecordTable get user {
    if (_user != null) return _user!;
    _user = _i1.createRelationTable(
      relationFieldName: 'user',
      field: UserNotificationSettings.t.userId,
      foreignField: _i2.UserRecord.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.UserRecordTable(tableRelation: foreignTableRelation),
    );
    return _user!;
  }

  @override
  List<_i1.Column> get columns => [
        id,
        userId,
        pauseAllPush,
        allowComments,
        pushComments,
        allowLikes,
        pushLikes,
        allowRepostsAndQuotes,
        pushRepostsAndQuotes,
        allowNewReviews,
        pushNewReviews,
        allowNewVettings,
        pushNewVettings,
        allowReactions,
        pushReactions,
        allowHelpfulReviews,
        pushHelpfulReviews,
        allowSubscribedContent,
        pushSubscribedContent,
        allowMentions,
        pushMentions,
        allowTags,
        pushTags,
        allowNewFollowers,
        pushNewFollowers,
        allowPlatformUpdates,
        pushPlatformUpdates,
      ];

  @override
  _i1.Table? getRelationTable(String relationField) {
    if (relationField == 'user') {
      return user;
    }
    return null;
  }
}

class UserNotificationSettingsInclude extends _i1.IncludeObject {
  UserNotificationSettingsInclude._({_i2.UserRecordInclude? user}) {
    _user = user;
  }

  _i2.UserRecordInclude? _user;

  @override
  Map<String, _i1.Include?> get includes => {'user': _user};

  @override
  _i1.Table<int?> get table => UserNotificationSettings.t;
}

class UserNotificationSettingsIncludeList extends _i1.IncludeList {
  UserNotificationSettingsIncludeList._({
    _i1.WhereExpressionBuilder<UserNotificationSettingsTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(UserNotificationSettings.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => UserNotificationSettings.t;
}

class UserNotificationSettingsRepository {
  const UserNotificationSettingsRepository._();

  final attachRow = const UserNotificationSettingsAttachRowRepository._();

  /// Returns a list of [UserNotificationSettings]s matching the given query parameters.
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
  Future<List<UserNotificationSettings>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<UserNotificationSettingsTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<UserNotificationSettingsTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<UserNotificationSettingsTable>? orderByList,
    _i1.Transaction? transaction,
    UserNotificationSettingsInclude? include,
  }) async {
    return session.db.find<UserNotificationSettings>(
      where: where?.call(UserNotificationSettings.t),
      orderBy: orderBy?.call(UserNotificationSettings.t),
      orderByList: orderByList?.call(UserNotificationSettings.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Returns the first matching [UserNotificationSettings] matching the given query parameters.
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
  Future<UserNotificationSettings?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<UserNotificationSettingsTable>? where,
    int? offset,
    _i1.OrderByBuilder<UserNotificationSettingsTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<UserNotificationSettingsTable>? orderByList,
    _i1.Transaction? transaction,
    UserNotificationSettingsInclude? include,
  }) async {
    return session.db.findFirstRow<UserNotificationSettings>(
      where: where?.call(UserNotificationSettings.t),
      orderBy: orderBy?.call(UserNotificationSettings.t),
      orderByList: orderByList?.call(UserNotificationSettings.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Finds a single [UserNotificationSettings] by its [id] or null if no such row exists.
  Future<UserNotificationSettings?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
    UserNotificationSettingsInclude? include,
  }) async {
    return session.db.findById<UserNotificationSettings>(
      id,
      transaction: transaction,
      include: include,
    );
  }

  /// Inserts all [UserNotificationSettings]s in the list and returns the inserted rows.
  ///
  /// The returned [UserNotificationSettings]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<UserNotificationSettings>> insert(
    _i1.Session session,
    List<UserNotificationSettings> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<UserNotificationSettings>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [UserNotificationSettings] and returns the inserted row.
  ///
  /// The returned [UserNotificationSettings] will have its `id` field set.
  Future<UserNotificationSettings> insertRow(
    _i1.Session session,
    UserNotificationSettings row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<UserNotificationSettings>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [UserNotificationSettings]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<UserNotificationSettings>> update(
    _i1.Session session,
    List<UserNotificationSettings> rows, {
    _i1.ColumnSelections<UserNotificationSettingsTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<UserNotificationSettings>(
      rows,
      columns: columns?.call(UserNotificationSettings.t),
      transaction: transaction,
    );
  }

  /// Updates a single [UserNotificationSettings]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<UserNotificationSettings> updateRow(
    _i1.Session session,
    UserNotificationSettings row, {
    _i1.ColumnSelections<UserNotificationSettingsTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<UserNotificationSettings>(
      row,
      columns: columns?.call(UserNotificationSettings.t),
      transaction: transaction,
    );
  }

  /// Deletes all [UserNotificationSettings]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<UserNotificationSettings>> delete(
    _i1.Session session,
    List<UserNotificationSettings> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<UserNotificationSettings>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [UserNotificationSettings].
  Future<UserNotificationSettings> deleteRow(
    _i1.Session session,
    UserNotificationSettings row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<UserNotificationSettings>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<UserNotificationSettings>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<UserNotificationSettingsTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<UserNotificationSettings>(
      where: where(UserNotificationSettings.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<UserNotificationSettingsTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<UserNotificationSettings>(
      where: where?.call(UserNotificationSettings.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

class UserNotificationSettingsAttachRowRepository {
  const UserNotificationSettingsAttachRowRepository._();

  /// Creates a relation between the given [UserNotificationSettings] and [UserRecord]
  /// by setting the [UserNotificationSettings]'s foreign key `userId` to refer to the [UserRecord].
  Future<void> user(
    _i1.Session session,
    UserNotificationSettings userNotificationSettings,
    _i2.UserRecord user, {
    _i1.Transaction? transaction,
  }) async {
    if (userNotificationSettings.id == null) {
      throw ArgumentError.notNull('userNotificationSettings.id');
    }
    if (user.id == null) {
      throw ArgumentError.notNull('user.id');
    }

    var $userNotificationSettings =
        userNotificationSettings.copyWith(userId: user.id);
    await session.db.updateRow<UserNotificationSettings>(
      $userNotificationSettings,
      columns: [UserNotificationSettings.t.userId],
      transaction: transaction,
    );
  }
}
