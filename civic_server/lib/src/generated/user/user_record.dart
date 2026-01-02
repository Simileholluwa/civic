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
import 'package:serverpod_auth_server/serverpod_auth_server.dart' as _i2;
import '../user/political_status_enum.dart' as _i3;
import 'package:civic_server/src/generated/protocol.dart' as _i4;

abstract class UserRecord
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  UserRecord._({
    this.id,
    this.bio,
    this.nin,
    this.phoneNumber,
    this.userInfoId,
    this.userInfo,
    this.firstName,
    this.lastName,
    this.gender,
    this.birthdate,
    this.middleName,
    this.email,
    this.profileImage,
    int? followersCount,
    int? followingCount,
    DateTime? createdAt,
    this.politicalStatus,
    double? credibilityScore,
  }) : followersCount = followersCount ?? 0,
       followingCount = followingCount ?? 0,
       createdAt = createdAt ?? DateTime.now(),
       credibilityScore = credibilityScore ?? 1.0;

  factory UserRecord({
    int? id,
    String? bio,
    String? nin,
    String? phoneNumber,
    int? userInfoId,
    _i2.UserInfo? userInfo,
    String? firstName,
    String? lastName,
    String? gender,
    String? birthdate,
    String? middleName,
    String? email,
    String? profileImage,
    int? followersCount,
    int? followingCount,
    DateTime? createdAt,
    _i3.PoliticalStatus? politicalStatus,
    double? credibilityScore,
  }) = _UserRecordImpl;

  factory UserRecord.fromJson(Map<String, dynamic> jsonSerialization) {
    return UserRecord(
      id: jsonSerialization['id'] as int?,
      bio: jsonSerialization['bio'] as String?,
      nin: jsonSerialization['nin'] as String?,
      phoneNumber: jsonSerialization['phoneNumber'] as String?,
      userInfoId: jsonSerialization['userInfoId'] as int?,
      userInfo: jsonSerialization['userInfo'] == null
          ? null
          : _i4.Protocol().deserialize<_i2.UserInfo>(
              jsonSerialization['userInfo'],
            ),
      firstName: jsonSerialization['firstName'] as String?,
      lastName: jsonSerialization['lastName'] as String?,
      gender: jsonSerialization['gender'] as String?,
      birthdate: jsonSerialization['birthdate'] as String?,
      middleName: jsonSerialization['middleName'] as String?,
      email: jsonSerialization['email'] as String?,
      profileImage: jsonSerialization['profileImage'] as String?,
      followersCount: jsonSerialization['followersCount'] as int?,
      followingCount: jsonSerialization['followingCount'] as int?,
      createdAt: jsonSerialization['createdAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
      politicalStatus: jsonSerialization['politicalStatus'] == null
          ? null
          : _i3.PoliticalStatus.fromJson(
              (jsonSerialization['politicalStatus'] as String),
            ),
      credibilityScore: (jsonSerialization['credibilityScore'] as num?)
          ?.toDouble(),
    );
  }

  static final t = UserRecordTable();

  static const db = UserRecordRepository._();

  @override
  int? id;

  String? bio;

  String? nin;

  String? phoneNumber;

  int? userInfoId;

  _i2.UserInfo? userInfo;

  String? firstName;

  String? lastName;

  String? gender;

  String? birthdate;

  String? middleName;

  String? email;

  String? profileImage;

  int? followersCount;

  int? followingCount;

  DateTime? createdAt;

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
    String? firstName,
    String? lastName,
    String? gender,
    String? birthdate,
    String? middleName,
    String? email,
    String? profileImage,
    int? followersCount,
    int? followingCount,
    DateTime? createdAt,
    _i3.PoliticalStatus? politicalStatus,
    double? credibilityScore,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'UserRecord',
      if (id != null) 'id': id,
      if (bio != null) 'bio': bio,
      if (nin != null) 'nin': nin,
      if (phoneNumber != null) 'phoneNumber': phoneNumber,
      if (userInfoId != null) 'userInfoId': userInfoId,
      if (userInfo != null) 'userInfo': userInfo?.toJson(),
      if (firstName != null) 'firstName': firstName,
      if (lastName != null) 'lastName': lastName,
      if (gender != null) 'gender': gender,
      if (birthdate != null) 'birthdate': birthdate,
      if (middleName != null) 'middleName': middleName,
      if (email != null) 'email': email,
      if (profileImage != null) 'profileImage': profileImage,
      if (followersCount != null) 'followersCount': followersCount,
      if (followingCount != null) 'followingCount': followingCount,
      if (createdAt != null) 'createdAt': createdAt?.toJson(),
      if (politicalStatus != null) 'politicalStatus': politicalStatus?.toJson(),
      if (credibilityScore != null) 'credibilityScore': credibilityScore,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'UserRecord',
      if (id != null) 'id': id,
      if (bio != null) 'bio': bio,
      if (nin != null) 'nin': nin,
      if (phoneNumber != null) 'phoneNumber': phoneNumber,
      if (userInfoId != null) 'userInfoId': userInfoId,
      if (userInfo != null) 'userInfo': userInfo?.toJsonForProtocol(),
      if (firstName != null) 'firstName': firstName,
      if (lastName != null) 'lastName': lastName,
      if (gender != null) 'gender': gender,
      if (birthdate != null) 'birthdate': birthdate,
      if (middleName != null) 'middleName': middleName,
      if (email != null) 'email': email,
      if (profileImage != null) 'profileImage': profileImage,
      if (followersCount != null) 'followersCount': followersCount,
      if (followingCount != null) 'followingCount': followingCount,
      if (createdAt != null) 'createdAt': createdAt?.toJson(),
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
    int? userInfoId,
    _i2.UserInfo? userInfo,
    String? firstName,
    String? lastName,
    String? gender,
    String? birthdate,
    String? middleName,
    String? email,
    String? profileImage,
    int? followersCount,
    int? followingCount,
    DateTime? createdAt,
    _i3.PoliticalStatus? politicalStatus,
    double? credibilityScore,
  }) : super._(
         id: id,
         bio: bio,
         nin: nin,
         phoneNumber: phoneNumber,
         userInfoId: userInfoId,
         userInfo: userInfo,
         firstName: firstName,
         lastName: lastName,
         gender: gender,
         birthdate: birthdate,
         middleName: middleName,
         email: email,
         profileImage: profileImage,
         followersCount: followersCount,
         followingCount: followingCount,
         createdAt: createdAt,
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
    Object? userInfoId = _Undefined,
    Object? userInfo = _Undefined,
    Object? firstName = _Undefined,
    Object? lastName = _Undefined,
    Object? gender = _Undefined,
    Object? birthdate = _Undefined,
    Object? middleName = _Undefined,
    Object? email = _Undefined,
    Object? profileImage = _Undefined,
    Object? followersCount = _Undefined,
    Object? followingCount = _Undefined,
    Object? createdAt = _Undefined,
    Object? politicalStatus = _Undefined,
    Object? credibilityScore = _Undefined,
  }) {
    return UserRecord(
      id: id is int? ? id : this.id,
      bio: bio is String? ? bio : this.bio,
      nin: nin is String? ? nin : this.nin,
      phoneNumber: phoneNumber is String? ? phoneNumber : this.phoneNumber,
      userInfoId: userInfoId is int? ? userInfoId : this.userInfoId,
      userInfo: userInfo is _i2.UserInfo?
          ? userInfo
          : this.userInfo?.copyWith(),
      firstName: firstName is String? ? firstName : this.firstName,
      lastName: lastName is String? ? lastName : this.lastName,
      gender: gender is String? ? gender : this.gender,
      birthdate: birthdate is String? ? birthdate : this.birthdate,
      middleName: middleName is String? ? middleName : this.middleName,
      email: email is String? ? email : this.email,
      profileImage: profileImage is String? ? profileImage : this.profileImage,
      followersCount: followersCount is int?
          ? followersCount
          : this.followersCount,
      followingCount: followingCount is int?
          ? followingCount
          : this.followingCount,
      createdAt: createdAt is DateTime? ? createdAt : this.createdAt,
      politicalStatus: politicalStatus is _i3.PoliticalStatus?
          ? politicalStatus
          : this.politicalStatus,
      credibilityScore: credibilityScore is double?
          ? credibilityScore
          : this.credibilityScore,
    );
  }
}

class UserRecordUpdateTable extends _i1.UpdateTable<UserRecordTable> {
  UserRecordUpdateTable(super.table);

  _i1.ColumnValue<String, String> bio(String? value) => _i1.ColumnValue(
    table.bio,
    value,
  );

  _i1.ColumnValue<String, String> nin(String? value) => _i1.ColumnValue(
    table.nin,
    value,
  );

  _i1.ColumnValue<String, String> phoneNumber(String? value) => _i1.ColumnValue(
    table.phoneNumber,
    value,
  );

  _i1.ColumnValue<int, int> userInfoId(int? value) => _i1.ColumnValue(
    table.userInfoId,
    value,
  );

  _i1.ColumnValue<String, String> firstName(String? value) => _i1.ColumnValue(
    table.firstName,
    value,
  );

  _i1.ColumnValue<String, String> lastName(String? value) => _i1.ColumnValue(
    table.lastName,
    value,
  );

  _i1.ColumnValue<String, String> gender(String? value) => _i1.ColumnValue(
    table.gender,
    value,
  );

  _i1.ColumnValue<String, String> birthdate(String? value) => _i1.ColumnValue(
    table.birthdate,
    value,
  );

  _i1.ColumnValue<String, String> middleName(String? value) => _i1.ColumnValue(
    table.middleName,
    value,
  );

  _i1.ColumnValue<String, String> email(String? value) => _i1.ColumnValue(
    table.email,
    value,
  );

  _i1.ColumnValue<String, String> profileImage(String? value) =>
      _i1.ColumnValue(
        table.profileImage,
        value,
      );

  _i1.ColumnValue<int, int> followersCount(int? value) => _i1.ColumnValue(
    table.followersCount,
    value,
  );

  _i1.ColumnValue<int, int> followingCount(int? value) => _i1.ColumnValue(
    table.followingCount,
    value,
  );

  _i1.ColumnValue<DateTime, DateTime> createdAt(DateTime? value) =>
      _i1.ColumnValue(
        table.createdAt,
        value,
      );

  _i1.ColumnValue<_i3.PoliticalStatus, _i3.PoliticalStatus> politicalStatus(
    _i3.PoliticalStatus? value,
  ) => _i1.ColumnValue(
    table.politicalStatus,
    value,
  );

  _i1.ColumnValue<double, double> credibilityScore(double? value) =>
      _i1.ColumnValue(
        table.credibilityScore,
        value,
      );
}

class UserRecordTable extends _i1.Table<int?> {
  UserRecordTable({super.tableRelation}) : super(tableName: 'user_record') {
    updateTable = UserRecordUpdateTable(this);
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
    firstName = _i1.ColumnString(
      'firstName',
      this,
    );
    lastName = _i1.ColumnString(
      'lastName',
      this,
    );
    gender = _i1.ColumnString(
      'gender',
      this,
    );
    birthdate = _i1.ColumnString(
      'birthdate',
      this,
    );
    middleName = _i1.ColumnString(
      'middleName',
      this,
    );
    email = _i1.ColumnString(
      'email',
      this,
    );
    profileImage = _i1.ColumnString(
      'profileImage',
      this,
    );
    followersCount = _i1.ColumnInt(
      'followersCount',
      this,
      hasDefault: true,
    );
    followingCount = _i1.ColumnInt(
      'followingCount',
      this,
      hasDefault: true,
    );
    createdAt = _i1.ColumnDateTime(
      'createdAt',
      this,
      hasDefault: true,
    );
    politicalStatus = _i1.ColumnEnum(
      'politicalStatus',
      this,
      _i1.EnumSerialization.byName,
    );
    credibilityScore = _i1.ColumnDouble(
      'credibilityScore',
      this,
      hasDefault: true,
    );
  }

  late final UserRecordUpdateTable updateTable;

  late final _i1.ColumnString bio;

  late final _i1.ColumnString nin;

  late final _i1.ColumnString phoneNumber;

  late final _i1.ColumnInt userInfoId;

  _i2.UserInfoTable? _userInfo;

  late final _i1.ColumnString firstName;

  late final _i1.ColumnString lastName;

  late final _i1.ColumnString gender;

  late final _i1.ColumnString birthdate;

  late final _i1.ColumnString middleName;

  late final _i1.ColumnString email;

  late final _i1.ColumnString profileImage;

  late final _i1.ColumnInt followersCount;

  late final _i1.ColumnInt followingCount;

  late final _i1.ColumnDateTime createdAt;

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
    firstName,
    lastName,
    gender,
    birthdate,
    middleName,
    email,
    profileImage,
    followersCount,
    followingCount,
    createdAt,
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

  final detachRow = const UserRecordDetachRowRepository._();

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

  /// Updates a single [UserRecord] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<UserRecord?> updateById(
    _i1.Session session,
    int id, {
    required _i1.ColumnValueListBuilder<UserRecordUpdateTable> columnValues,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateById<UserRecord>(
      id,
      columnValues: columnValues(UserRecord.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [UserRecord]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  Future<List<UserRecord>> updateWhere(
    _i1.Session session, {
    required _i1.ColumnValueListBuilder<UserRecordUpdateTable> columnValues,
    required _i1.WhereExpressionBuilder<UserRecordTable> where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<UserRecordTable>? orderBy,
    _i1.OrderByListBuilder<UserRecordTable>? orderByList,
    bool orderDescending = false,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateWhere<UserRecord>(
      columnValues: columnValues(UserRecord.t.updateTable),
      where: where(UserRecord.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(UserRecord.t),
      orderByList: orderByList?.call(UserRecord.t),
      orderDescending: orderDescending,
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

class UserRecordDetachRowRepository {
  const UserRecordDetachRowRepository._();

  /// Detaches the relation between this [UserRecord] and the [UserInfo] set in `userInfo`
  /// by setting the [UserRecord]'s foreign key `userInfoId` to `null`.
  ///
  /// This removes the association between the two models without deleting
  /// the related record.
  Future<void> userInfo(
    _i1.Session session,
    UserRecord userRecord, {
    _i1.Transaction? transaction,
  }) async {
    if (userRecord.id == null) {
      throw ArgumentError.notNull('userRecord.id');
    }

    var $userRecord = userRecord.copyWith(userInfoId: null);
    await session.db.updateRow<UserRecord>(
      $userRecord,
      columns: [UserRecord.t.userInfoId],
      transaction: transaction,
    );
  }
}
