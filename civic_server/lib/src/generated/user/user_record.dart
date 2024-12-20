/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters

// ignore_for_file: invalid_use_of_visible_for_testing_member

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;
import 'package:serverpod_auth_server/serverpod_auth_server.dart' as _i2;
import '../protocol.dart' as _i3;

abstract class UserRecord implements _i1.TableRow, _i1.ProtocolSerialization {
  UserRecord._({
    this.id,
    required this.bio,
    this.nin,
    this.phoneNumber,
    required this.userInfoId,
    this.userInfo,
    required this.verifiedAccount,
    required this.following,
    required this.followers,
    required this.politicalStatus,
    this.credibilityScore,
  });

  factory UserRecord({
    int? id,
    required String bio,
    String? nin,
    String? phoneNumber,
    required int userInfoId,
    _i2.UserInfo? userInfo,
    required bool verifiedAccount,
    required List<int> following,
    required List<int> followers,
    required _i3.PoliticalStatus politicalStatus,
    double? credibilityScore,
  }) = _UserRecordImpl;

  factory UserRecord.fromJson(Map<String, dynamic> jsonSerialization) {
    return UserRecord(
      id: jsonSerialization['id'] as int?,
      bio: jsonSerialization['bio'] as String,
      nin: jsonSerialization['nin'] as String?,
      phoneNumber: jsonSerialization['phoneNumber'] as String?,
      userInfoId: jsonSerialization['userInfoId'] as int,
      userInfo: jsonSerialization['userInfo'] == null
          ? null
          : _i2.UserInfo.fromJson(
              (jsonSerialization['userInfo'] as Map<String, dynamic>)),
      verifiedAccount: jsonSerialization['verifiedAccount'] as bool,
      following: (jsonSerialization['following'] as List)
          .map((e) => e as int)
          .toList(),
      followers: (jsonSerialization['followers'] as List)
          .map((e) => e as int)
          .toList(),
      politicalStatus: _i3.PoliticalStatus.fromJson(
          (jsonSerialization['politicalStatus'] as int)),
      credibilityScore:
          (jsonSerialization['credibilityScore'] as num?)?.toDouble(),
    );
  }

  static final t = UserRecordTable();

  static const db = UserRecordRepository._();

  @override
  int? id;

  String bio;

  String? nin;

  String? phoneNumber;

  int userInfoId;

  _i2.UserInfo? userInfo;

  bool verifiedAccount;

  List<int> following;

  List<int> followers;

  _i3.PoliticalStatus politicalStatus;

  double? credibilityScore;

  @override
  _i1.Table get table => t;

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
      'bio': bio,
      if (nin != null) 'nin': nin,
      if (phoneNumber != null) 'phoneNumber': phoneNumber,
      'userInfoId': userInfoId,
      if (userInfo != null) 'userInfo': userInfo?.toJson(),
      'verifiedAccount': verifiedAccount,
      'following': following.toJson(),
      'followers': followers.toJson(),
      'politicalStatus': politicalStatus.toJson(),
      if (credibilityScore != null) 'credibilityScore': credibilityScore,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'bio': bio,
      if (nin != null) 'nin': nin,
      if (phoneNumber != null) 'phoneNumber': phoneNumber,
      'userInfoId': userInfoId,
      if (userInfo != null) 'userInfo': userInfo?.toJsonForProtocol(),
      'verifiedAccount': verifiedAccount,
      'following': following.toJson(),
      'followers': followers.toJson(),
      'politicalStatus': politicalStatus.toJson(),
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
    required String bio,
    String? nin,
    String? phoneNumber,
    required int userInfoId,
    _i2.UserInfo? userInfo,
    required bool verifiedAccount,
    required List<int> following,
    required List<int> followers,
    required _i3.PoliticalStatus politicalStatus,
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

  @override
  UserRecord copyWith({
    Object? id = _Undefined,
    String? bio,
    Object? nin = _Undefined,
    Object? phoneNumber = _Undefined,
    int? userInfoId,
    Object? userInfo = _Undefined,
    bool? verifiedAccount,
    List<int>? following,
    List<int>? followers,
    _i3.PoliticalStatus? politicalStatus,
    Object? credibilityScore = _Undefined,
  }) {
    return UserRecord(
      id: id is int? ? id : this.id,
      bio: bio ?? this.bio,
      nin: nin is String? ? nin : this.nin,
      phoneNumber: phoneNumber is String? ? phoneNumber : this.phoneNumber,
      userInfoId: userInfoId ?? this.userInfoId,
      userInfo:
          userInfo is _i2.UserInfo? ? userInfo : this.userInfo?.copyWith(),
      verifiedAccount: verifiedAccount ?? this.verifiedAccount,
      following: following ?? this.following.map((e0) => e0).toList(),
      followers: followers ?? this.followers.map((e0) => e0).toList(),
      politicalStatus: politicalStatus ?? this.politicalStatus,
      credibilityScore: credibilityScore is double?
          ? credibilityScore
          : this.credibilityScore,
    );
  }
}

class UserRecordTable extends _i1.Table {
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
  _i1.Table get table => UserRecord.t;
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
  _i1.Table get table => UserRecord.t;
}

class UserRecordRepository {
  const UserRecordRepository._();

  final attachRow = const UserRecordAttachRowRepository._();

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
      transaction: transaction ?? session.transaction,
      include: include,
    );
  }

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
      transaction: transaction ?? session.transaction,
      include: include,
    );
  }

  Future<UserRecord?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
    UserRecordInclude? include,
  }) async {
    return session.db.findById<UserRecord>(
      id,
      transaction: transaction ?? session.transaction,
      include: include,
    );
  }

  Future<List<UserRecord>> insert(
    _i1.Session session,
    List<UserRecord> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<UserRecord>(
      rows,
      transaction: transaction ?? session.transaction,
    );
  }

  Future<UserRecord> insertRow(
    _i1.Session session,
    UserRecord row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<UserRecord>(
      row,
      transaction: transaction ?? session.transaction,
    );
  }

  Future<List<UserRecord>> update(
    _i1.Session session,
    List<UserRecord> rows, {
    _i1.ColumnSelections<UserRecordTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<UserRecord>(
      rows,
      columns: columns?.call(UserRecord.t),
      transaction: transaction ?? session.transaction,
    );
  }

  Future<UserRecord> updateRow(
    _i1.Session session,
    UserRecord row, {
    _i1.ColumnSelections<UserRecordTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<UserRecord>(
      row,
      columns: columns?.call(UserRecord.t),
      transaction: transaction ?? session.transaction,
    );
  }

  Future<List<UserRecord>> delete(
    _i1.Session session,
    List<UserRecord> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<UserRecord>(
      rows,
      transaction: transaction ?? session.transaction,
    );
  }

  Future<UserRecord> deleteRow(
    _i1.Session session,
    UserRecord row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<UserRecord>(
      row,
      transaction: transaction ?? session.transaction,
    );
  }

  Future<List<UserRecord>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<UserRecordTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<UserRecord>(
      where: where(UserRecord.t),
      transaction: transaction ?? session.transaction,
    );
  }

  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<UserRecordTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<UserRecord>(
      where: where?.call(UserRecord.t),
      limit: limit,
      transaction: transaction ?? session.transaction,
    );
  }
}

class UserRecordAttachRowRepository {
  const UserRecordAttachRowRepository._();

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
      transaction: transaction ?? session.transaction,
    );
  }
}
