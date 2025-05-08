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
import 'package:serverpod_auth_server/serverpod_auth_server.dart' as _i2;
import '../user/political_status_enum.dart' as _i3;

abstract class UserRecord
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  UserRecord._({
    this.id,
    this.bio,
    this.nin,
    this.phoneNumber,
    required this.userInfoId,
    this.userInfo,
    this.verifiedAccount,
    this.following,
    this.followers,
    this.politicalStatus,
    this.credibilityScore,
  });

  factory UserRecord({
    int? id,
    String? bio,
    String? nin,
    String? phoneNumber,
    required int userInfoId,
    _i2.UserInfo? userInfo,
    bool? verifiedAccount,
    List<int>? following,
    List<int>? followers,
    _i3.PoliticalStatus? politicalStatus,
    double? credibilityScore,
  }) = _UserRecordImpl;

  factory UserRecord.fromJson(Map<String, dynamic> jsonSerialization) {
    return UserRecord(
      id: jsonSerialization['id'] as int?,
      bio: jsonSerialization['bio'] as String?,
      nin: jsonSerialization['nin'] as String?,
      phoneNumber: jsonSerialization['phoneNumber'] as String?,
      userInfoId: jsonSerialization['userInfoId'] as int,
      userInfo: jsonSerialization['userInfo'] == null
          ? null
          : _i2.UserInfo.fromJson(
              (jsonSerialization['userInfo'] as Map<String, dynamic>)),
      verifiedAccount: jsonSerialization['verifiedAccount'] as bool?,
      following: (jsonSerialization['following'] as List?)
          ?.map((e) => e as int)
          .toList(),
      followers: (jsonSerialization['followers'] as List?)
          ?.map((e) => e as int)
          .toList(),
      politicalStatus: jsonSerialization['politicalStatus'] == null
          ? null
          : _i3.PoliticalStatus.fromJson(
              (jsonSerialization['politicalStatus'] as int)),
      credibilityScore:
          (jsonSerialization['credibilityScore'] as num?)?.toDouble(),
    );
  }

  static final t = UserRecordTable();

  static const db = UserRecordRepository._();

  @override
  int? id;

  String? bio;

  String? nin;

  String? phoneNumber;

  int userInfoId;

  _i2.UserInfo? userInfo;

  bool? verifiedAccount;

  List<int>? following;

  List<int>? followers;

  _i3.PoliticalStatus? politicalStatus;

  double? credibilityScore;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [UserRecord]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  UserRecord copyWith({
    int? id,
    String? bio,
    String? nin,
    String? phoneNumber,
    int? userInfoId,
    _i2.UserInfo? userInfo,
    bool? verifiedAccount,
    List<int>? following,
    List<int>? followers,
    _i3.PoliticalStatus? politicalStatus,
    double? credibilityScore,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      if (bio != null) 'bio': bio,
      if (nin != null) 'nin': nin,
      if (phoneNumber != null) 'phoneNumber': phoneNumber,
      'userInfoId': userInfoId,
      if (userInfo != null) 'userInfo': userInfo?.toJson(),
      if (verifiedAccount != null) 'verifiedAccount': verifiedAccount,
      if (following != null) 'following': following?.toJson(),
      if (followers != null) 'followers': followers?.toJson(),
      if (politicalStatus != null) 'politicalStatus': politicalStatus?.toJson(),
      if (credibilityScore != null) 'credibilityScore': credibilityScore,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      if (bio != null) 'bio': bio,
      if (nin != null) 'nin': nin,
      if (phoneNumber != null) 'phoneNumber': phoneNumber,
      'userInfoId': userInfoId,
      if (userInfo != null) 'userInfo': userInfo?.toJsonForProtocol(),
      if (verifiedAccount != null) 'verifiedAccount': verifiedAccount,
      if (following != null) 'following': following?.toJson(),
      if (followers != null) 'followers': followers?.toJson(),
      if (politicalStatus != null) 'politicalStatus': politicalStatus?.toJson(),
      if (credibilityScore != null) 'credibilityScore': credibilityScore,
    };
  }

  static UserRecordInclude include({_i2.UserInfoInclude? userInfo}) {
    return UserRecordInclude._(userInfo: userInfo);
  }

  static UserRecordIncludeList includeList({
    _i1.WhereExpressionBuilder<UserRecordTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<UserRecordTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<UserRecordTable>? orderByList,
    UserRecordInclude? include,
  }) {
    return UserRecordIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(UserRecord.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(UserRecord.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _UserRecordImpl extends UserRecord {
  _UserRecordImpl({
    int? id,
    String? bio,
    String? nin,
    String? phoneNumber,
    required int userInfoId,
    _i2.UserInfo? userInfo,
    bool? verifiedAccount,
    List<int>? following,
    List<int>? followers,
    _i3.PoliticalStatus? politicalStatus,
    double? credibilityScore,
  }) : super._(
          id: id,
          bio: bio,
          nin: nin,
          phoneNumber: phoneNumber,
          userInfoId: userInfoId,
          userInfo: userInfo,
          verifiedAccount: verifiedAccount,
          following: following,
          followers: followers,
          politicalStatus: politicalStatus,
          credibilityScore: credibilityScore,
        );

  /// Returns a shallow copy of this [UserRecord]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  UserRecord copyWith({
    Object? id = _Undefined,
    Object? bio = _Undefined,
    Object? nin = _Undefined,
    Object? phoneNumber = _Undefined,
    int? userInfoId,
    Object? userInfo = _Undefined,
    Object? verifiedAccount = _Undefined,
    Object? following = _Undefined,
    Object? followers = _Undefined,
    Object? politicalStatus = _Undefined,
    Object? credibilityScore = _Undefined,
  }) {
    return UserRecord(
      id: id is int? ? id : this.id,
      bio: bio is String? ? bio : this.bio,
      nin: nin is String? ? nin : this.nin,
      phoneNumber: phoneNumber is String? ? phoneNumber : this.phoneNumber,
      userInfoId: userInfoId ?? this.userInfoId,
      userInfo:
          userInfo is _i2.UserInfo? ? userInfo : this.userInfo?.copyWith(),
      verifiedAccount:
          verifiedAccount is bool? ? verifiedAccount : this.verifiedAccount,
      following: following is List<int>?
          ? following
          : this.following?.map((e0) => e0).toList(),
      followers: followers is List<int>?
          ? followers
          : this.followers?.map((e0) => e0).toList(),
      politicalStatus: politicalStatus is _i3.PoliticalStatus?
          ? politicalStatus
          : this.politicalStatus,
      credibilityScore: credibilityScore is double?
          ? credibilityScore
          : this.credibilityScore,
    );
  }
}

class UserRecordTable extends _i1.Table<int?> {
  UserRecordTable({super.tableRelation}) : super(tableName: 'user_record') {
    bio = _i1.ColumnString(
      'bio',
      this,
    );
    nin = _i1.ColumnString(
      'nin',
      this,
    );
    phoneNumber = _i1.ColumnString(
      'phoneNumber',
      this,
    );
    userInfoId = _i1.ColumnInt(
      'userInfoId',
      this,
    );
    verifiedAccount = _i1.ColumnBool(
      'verifiedAccount',
      this,
    );
    following = _i1.ColumnSerializable(
      'following',
      this,
    );
    followers = _i1.ColumnSerializable(
      'followers',
      this,
    );
    politicalStatus = _i1.ColumnEnum(
      'politicalStatus',
      this,
      _i1.EnumSerialization.byIndex,
    );
    credibilityScore = _i1.ColumnDouble(
      'credibilityScore',
      this,
    );
  }

  late final _i1.ColumnString bio;

  late final _i1.ColumnString nin;

  late final _i1.ColumnString phoneNumber;

  late final _i1.ColumnInt userInfoId;

  _i2.UserInfoTable? _userInfo;

  late final _i1.ColumnBool verifiedAccount;

  late final _i1.ColumnSerializable following;

  late final _i1.ColumnSerializable followers;

  late final _i1.ColumnEnum<_i3.PoliticalStatus> politicalStatus;

  late final _i1.ColumnDouble credibilityScore;

  _i2.UserInfoTable get userInfo {
    if (_userInfo != null) return _userInfo!;
    _userInfo = _i1.createRelationTable(
      relationFieldName: 'userInfo',
      field: UserRecord.t.userInfoId,
      foreignField: _i2.UserInfo.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.UserInfoTable(tableRelation: foreignTableRelation),
    );
    return _userInfo!;
  }

  @override
  List<_i1.Column> get columns => [
        id,
        bio,
        nin,
        phoneNumber,
        userInfoId,
        verifiedAccount,
        following,
        followers,
        politicalStatus,
        credibilityScore,
      ];

  @override
  _i1.Table? getRelationTable(String relationField) {
    if (relationField == 'userInfo') {
      return userInfo;
    }
    return null;
  }
}

class UserRecordInclude extends _i1.IncludeObject {
  UserRecordInclude._({_i2.UserInfoInclude? userInfo}) {
    _userInfo = userInfo;
  }

  _i2.UserInfoInclude? _userInfo;

  @override
  Map<String, _i1.Include?> get includes => {'userInfo': _userInfo};

  @override
  _i1.Table<int?> get table => UserRecord.t;
}

class UserRecordIncludeList extends _i1.IncludeList {
  UserRecordIncludeList._({
    _i1.WhereExpressionBuilder<UserRecordTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(UserRecord.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => UserRecord.t;
}

class UserRecordRepository {
  const UserRecordRepository._();

  final attachRow = const UserRecordAttachRowRepository._();

  /// Returns a list of [UserRecord]s matching the given query parameters.
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
  Future<List<UserRecord>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<UserRecordTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<UserRecordTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<UserRecordTable>? orderByList,
    _i1.Transaction? transaction,
    UserRecordInclude? include,
  }) async {
    return session.db.find<UserRecord>(
      where: where?.call(UserRecord.t),
      orderBy: orderBy?.call(UserRecord.t),
      orderByList: orderByList?.call(UserRecord.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Returns the first matching [UserRecord] matching the given query parameters.
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
  Future<UserRecord?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<UserRecordTable>? where,
    int? offset,
    _i1.OrderByBuilder<UserRecordTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<UserRecordTable>? orderByList,
    _i1.Transaction? transaction,
    UserRecordInclude? include,
  }) async {
    return session.db.findFirstRow<UserRecord>(
      where: where?.call(UserRecord.t),
      orderBy: orderBy?.call(UserRecord.t),
      orderByList: orderByList?.call(UserRecord.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Finds a single [UserRecord] by its [id] or null if no such row exists.
  Future<UserRecord?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
    UserRecordInclude? include,
  }) async {
    return session.db.findById<UserRecord>(
      id,
      transaction: transaction,
      include: include,
    );
  }

  /// Inserts all [UserRecord]s in the list and returns the inserted rows.
  ///
  /// The returned [UserRecord]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<UserRecord>> insert(
    _i1.Session session,
    List<UserRecord> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<UserRecord>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [UserRecord] and returns the inserted row.
  ///
  /// The returned [UserRecord] will have its `id` field set.
  Future<UserRecord> insertRow(
    _i1.Session session,
    UserRecord row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<UserRecord>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [UserRecord]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<UserRecord>> update(
    _i1.Session session,
    List<UserRecord> rows, {
    _i1.ColumnSelections<UserRecordTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<UserRecord>(
      rows,
      columns: columns?.call(UserRecord.t),
      transaction: transaction,
    );
  }

  /// Updates a single [UserRecord]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<UserRecord> updateRow(
    _i1.Session session,
    UserRecord row, {
    _i1.ColumnSelections<UserRecordTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<UserRecord>(
      row,
      columns: columns?.call(UserRecord.t),
      transaction: transaction,
    );
  }

  /// Deletes all [UserRecord]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<UserRecord>> delete(
    _i1.Session session,
    List<UserRecord> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<UserRecord>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [UserRecord].
  Future<UserRecord> deleteRow(
    _i1.Session session,
    UserRecord row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<UserRecord>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<UserRecord>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<UserRecordTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<UserRecord>(
      where: where(UserRecord.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<UserRecordTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<UserRecord>(
      where: where?.call(UserRecord.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

class UserRecordAttachRowRepository {
  const UserRecordAttachRowRepository._();

  /// Creates a relation between the given [UserRecord] and [UserInfo]
  /// by setting the [UserRecord]'s foreign key `userInfoId` to refer to the [UserInfo].
  Future<void> userInfo(
    _i1.Session session,
    UserRecord userRecord,
    _i2.UserInfo userInfo, {
    _i1.Transaction? transaction,
  }) async {
    if (userRecord.id == null) {
      throw ArgumentError.notNull('userRecord.id');
    }
    if (userInfo.id == null) {
      throw ArgumentError.notNull('userInfo.id');
    }

    var $userRecord = userRecord.copyWith(userInfoId: userInfo.id);
    await session.db.updateRow<UserRecord>(
      $userRecord,
      columns: [UserRecord.t.userInfoId],
      transaction: transaction,
    );
  }
}
