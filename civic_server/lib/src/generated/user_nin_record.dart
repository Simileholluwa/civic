/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;
import 'package:serverpod_auth_server/serverpod_auth_server.dart' as _i2;

abstract class UserNinRecord extends _i1.TableRow
    implements _i1.ProtocolSerialization {
  UserNinRecord._({
    int? id,
    this.firstName,
    this.surname,
    this.telephone,
    this.photoUrl,
    this.birthdate,
    this.email,
    this.gender,
    this.ninNumber,
    this.residenceStatus,
    this.resisdenceAddressLine1,
    this.residenceTown,
    this.residenceState,
    this.residenceLga,
    required this.userInfoId,
    this.userInfo,
  }) : super(id);

  factory UserNinRecord({
    int? id,
    String? firstName,
    String? surname,
    String? telephone,
    String? photoUrl,
    String? birthdate,
    String? email,
    String? gender,
    String? ninNumber,
    String? residenceStatus,
    String? resisdenceAddressLine1,
    String? residenceTown,
    String? residenceState,
    String? residenceLga,
    required int userInfoId,
    _i2.UserInfo? userInfo,
  }) = _UserNinRecordImpl;

  factory UserNinRecord.fromJson(Map<String, dynamic> jsonSerialization) {
    return UserNinRecord(
      id: jsonSerialization['id'] as int?,
      firstName: jsonSerialization['firstName'] as String?,
      surname: jsonSerialization['surname'] as String?,
      telephone: jsonSerialization['telephone'] as String?,
      photoUrl: jsonSerialization['photoUrl'] as String?,
      birthdate: jsonSerialization['birthdate'] as String?,
      email: jsonSerialization['email'] as String?,
      gender: jsonSerialization['gender'] as String?,
      ninNumber: jsonSerialization['ninNumber'] as String?,
      residenceStatus: jsonSerialization['residenceStatus'] as String?,
      resisdenceAddressLine1:
          jsonSerialization['resisdenceAddressLine1'] as String?,
      residenceTown: jsonSerialization['residenceTown'] as String?,
      residenceState: jsonSerialization['residenceState'] as String?,
      residenceLga: jsonSerialization['residenceLga'] as String?,
      userInfoId: jsonSerialization['userInfoId'] as int,
      userInfo: jsonSerialization['userInfo'] == null
          ? null
          : _i2.UserInfo.fromJson(
              (jsonSerialization['userInfo'] as Map<String, dynamic>)),
    );
  }

  static final t = UserNinRecordTable();

  static const db = UserNinRecordRepository._();

  String? firstName;

  String? surname;

  String? telephone;

  String? photoUrl;

  String? birthdate;

  String? email;

  String? gender;

  String? ninNumber;

  String? residenceStatus;

  String? resisdenceAddressLine1;

  String? residenceTown;

  String? residenceState;

  String? residenceLga;

  int userInfoId;

  _i2.UserInfo? userInfo;

  @override
  _i1.Table get table => t;

  UserNinRecord copyWith({
    int? id,
    String? firstName,
    String? surname,
    String? telephone,
    String? photoUrl,
    String? birthdate,
    String? email,
    String? gender,
    String? ninNumber,
    String? residenceStatus,
    String? resisdenceAddressLine1,
    String? residenceTown,
    String? residenceState,
    String? residenceLga,
    int? userInfoId,
    _i2.UserInfo? userInfo,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      if (firstName != null) 'firstName': firstName,
      if (surname != null) 'surname': surname,
      if (telephone != null) 'telephone': telephone,
      if (photoUrl != null) 'photoUrl': photoUrl,
      if (birthdate != null) 'birthdate': birthdate,
      if (email != null) 'email': email,
      if (gender != null) 'gender': gender,
      if (ninNumber != null) 'ninNumber': ninNumber,
      if (residenceStatus != null) 'residenceStatus': residenceStatus,
      if (resisdenceAddressLine1 != null)
        'resisdenceAddressLine1': resisdenceAddressLine1,
      if (residenceTown != null) 'residenceTown': residenceTown,
      if (residenceState != null) 'residenceState': residenceState,
      if (residenceLga != null) 'residenceLga': residenceLga,
      'userInfoId': userInfoId,
      if (userInfo != null) 'userInfo': userInfo?.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      if (firstName != null) 'firstName': firstName,
      if (surname != null) 'surname': surname,
      if (telephone != null) 'telephone': telephone,
      if (photoUrl != null) 'photoUrl': photoUrl,
      if (birthdate != null) 'birthdate': birthdate,
      if (email != null) 'email': email,
      if (gender != null) 'gender': gender,
      if (ninNumber != null) 'ninNumber': ninNumber,
      if (residenceStatus != null) 'residenceStatus': residenceStatus,
      if (resisdenceAddressLine1 != null)
        'resisdenceAddressLine1': resisdenceAddressLine1,
      if (residenceTown != null) 'residenceTown': residenceTown,
      if (residenceState != null) 'residenceState': residenceState,
      if (residenceLga != null) 'residenceLga': residenceLga,
      'userInfoId': userInfoId,
      if (userInfo != null) 'userInfo': userInfo?.toJsonForProtocol(),
    };
  }

  static UserNinRecordInclude include({_i2.UserInfoInclude? userInfo}) {
    return UserNinRecordInclude._(userInfo: userInfo);
  }

  static UserNinRecordIncludeList includeList({
    _i1.WhereExpressionBuilder<UserNinRecordTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<UserNinRecordTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<UserNinRecordTable>? orderByList,
    UserNinRecordInclude? include,
  }) {
    return UserNinRecordIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(UserNinRecord.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(UserNinRecord.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _UserNinRecordImpl extends UserNinRecord {
  _UserNinRecordImpl({
    int? id,
    String? firstName,
    String? surname,
    String? telephone,
    String? photoUrl,
    String? birthdate,
    String? email,
    String? gender,
    String? ninNumber,
    String? residenceStatus,
    String? resisdenceAddressLine1,
    String? residenceTown,
    String? residenceState,
    String? residenceLga,
    required int userInfoId,
    _i2.UserInfo? userInfo,
  }) : super._(
          id: id,
          firstName: firstName,
          surname: surname,
          telephone: telephone,
          photoUrl: photoUrl,
          birthdate: birthdate,
          email: email,
          gender: gender,
          ninNumber: ninNumber,
          residenceStatus: residenceStatus,
          resisdenceAddressLine1: resisdenceAddressLine1,
          residenceTown: residenceTown,
          residenceState: residenceState,
          residenceLga: residenceLga,
          userInfoId: userInfoId,
          userInfo: userInfo,
        );

  @override
  UserNinRecord copyWith({
    Object? id = _Undefined,
    Object? firstName = _Undefined,
    Object? surname = _Undefined,
    Object? telephone = _Undefined,
    Object? photoUrl = _Undefined,
    Object? birthdate = _Undefined,
    Object? email = _Undefined,
    Object? gender = _Undefined,
    Object? ninNumber = _Undefined,
    Object? residenceStatus = _Undefined,
    Object? resisdenceAddressLine1 = _Undefined,
    Object? residenceTown = _Undefined,
    Object? residenceState = _Undefined,
    Object? residenceLga = _Undefined,
    int? userInfoId,
    Object? userInfo = _Undefined,
  }) {
    return UserNinRecord(
      id: id is int? ? id : this.id,
      firstName: firstName is String? ? firstName : this.firstName,
      surname: surname is String? ? surname : this.surname,
      telephone: telephone is String? ? telephone : this.telephone,
      photoUrl: photoUrl is String? ? photoUrl : this.photoUrl,
      birthdate: birthdate is String? ? birthdate : this.birthdate,
      email: email is String? ? email : this.email,
      gender: gender is String? ? gender : this.gender,
      ninNumber: ninNumber is String? ? ninNumber : this.ninNumber,
      residenceStatus:
          residenceStatus is String? ? residenceStatus : this.residenceStatus,
      resisdenceAddressLine1: resisdenceAddressLine1 is String?
          ? resisdenceAddressLine1
          : this.resisdenceAddressLine1,
      residenceTown:
          residenceTown is String? ? residenceTown : this.residenceTown,
      residenceState:
          residenceState is String? ? residenceState : this.residenceState,
      residenceLga: residenceLga is String? ? residenceLga : this.residenceLga,
      userInfoId: userInfoId ?? this.userInfoId,
      userInfo:
          userInfo is _i2.UserInfo? ? userInfo : this.userInfo?.copyWith(),
    );
  }
}

class UserNinRecordTable extends _i1.Table {
  UserNinRecordTable({super.tableRelation})
      : super(tableName: 'user_nin_record') {
    firstName = _i1.ColumnString(
      'firstName',
      this,
    );
    surname = _i1.ColumnString(
      'surname',
      this,
    );
    telephone = _i1.ColumnString(
      'telephone',
      this,
    );
    photoUrl = _i1.ColumnString(
      'photoUrl',
      this,
    );
    birthdate = _i1.ColumnString(
      'birthdate',
      this,
    );
    email = _i1.ColumnString(
      'email',
      this,
    );
    gender = _i1.ColumnString(
      'gender',
      this,
    );
    ninNumber = _i1.ColumnString(
      'ninNumber',
      this,
    );
    residenceStatus = _i1.ColumnString(
      'residenceStatus',
      this,
    );
    resisdenceAddressLine1 = _i1.ColumnString(
      'resisdenceAddressLine1',
      this,
    );
    residenceTown = _i1.ColumnString(
      'residenceTown',
      this,
    );
    residenceState = _i1.ColumnString(
      'residenceState',
      this,
    );
    residenceLga = _i1.ColumnString(
      'residenceLga',
      this,
    );
    userInfoId = _i1.ColumnInt(
      'userInfoId',
      this,
    );
  }

  late final _i1.ColumnString firstName;

  late final _i1.ColumnString surname;

  late final _i1.ColumnString telephone;

  late final _i1.ColumnString photoUrl;

  late final _i1.ColumnString birthdate;

  late final _i1.ColumnString email;

  late final _i1.ColumnString gender;

  late final _i1.ColumnString ninNumber;

  late final _i1.ColumnString residenceStatus;

  late final _i1.ColumnString resisdenceAddressLine1;

  late final _i1.ColumnString residenceTown;

  late final _i1.ColumnString residenceState;

  late final _i1.ColumnString residenceLga;

  late final _i1.ColumnInt userInfoId;

  _i2.UserInfoTable? _userInfo;

  _i2.UserInfoTable get userInfo {
    if (_userInfo != null) return _userInfo!;
    _userInfo = _i1.createRelationTable(
      relationFieldName: 'userInfo',
      field: UserNinRecord.t.userInfoId,
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
        firstName,
        surname,
        telephone,
        photoUrl,
        birthdate,
        email,
        gender,
        ninNumber,
        residenceStatus,
        resisdenceAddressLine1,
        residenceTown,
        residenceState,
        residenceLga,
        userInfoId,
      ];

  @override
  _i1.Table? getRelationTable(String relationField) {
    if (relationField == 'userInfo') {
      return userInfo;
    }
    return null;
  }
}

class UserNinRecordInclude extends _i1.IncludeObject {
  UserNinRecordInclude._({_i2.UserInfoInclude? userInfo}) {
    _userInfo = userInfo;
  }

  _i2.UserInfoInclude? _userInfo;

  @override
  Map<String, _i1.Include?> get includes => {'userInfo': _userInfo};

  @override
  _i1.Table get table => UserNinRecord.t;
}

class UserNinRecordIncludeList extends _i1.IncludeList {
  UserNinRecordIncludeList._({
    _i1.WhereExpressionBuilder<UserNinRecordTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(UserNinRecord.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table get table => UserNinRecord.t;
}

class UserNinRecordRepository {
  const UserNinRecordRepository._();

  final attachRow = const UserNinRecordAttachRowRepository._();

  Future<List<UserNinRecord>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<UserNinRecordTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<UserNinRecordTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<UserNinRecordTable>? orderByList,
    _i1.Transaction? transaction,
    UserNinRecordInclude? include,
  }) async {
    return session.db.find<UserNinRecord>(
      where: where?.call(UserNinRecord.t),
      orderBy: orderBy?.call(UserNinRecord.t),
      orderByList: orderByList?.call(UserNinRecord.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  Future<UserNinRecord?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<UserNinRecordTable>? where,
    int? offset,
    _i1.OrderByBuilder<UserNinRecordTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<UserNinRecordTable>? orderByList,
    _i1.Transaction? transaction,
    UserNinRecordInclude? include,
  }) async {
    return session.db.findFirstRow<UserNinRecord>(
      where: where?.call(UserNinRecord.t),
      orderBy: orderBy?.call(UserNinRecord.t),
      orderByList: orderByList?.call(UserNinRecord.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  Future<UserNinRecord?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
    UserNinRecordInclude? include,
  }) async {
    return session.db.findById<UserNinRecord>(
      id,
      transaction: transaction,
      include: include,
    );
  }

  Future<List<UserNinRecord>> insert(
    _i1.Session session,
    List<UserNinRecord> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<UserNinRecord>(
      rows,
      transaction: transaction,
    );
  }

  Future<UserNinRecord> insertRow(
    _i1.Session session,
    UserNinRecord row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<UserNinRecord>(
      row,
      transaction: transaction,
    );
  }

  Future<List<UserNinRecord>> update(
    _i1.Session session,
    List<UserNinRecord> rows, {
    _i1.ColumnSelections<UserNinRecordTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<UserNinRecord>(
      rows,
      columns: columns?.call(UserNinRecord.t),
      transaction: transaction,
    );
  }

  Future<UserNinRecord> updateRow(
    _i1.Session session,
    UserNinRecord row, {
    _i1.ColumnSelections<UserNinRecordTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<UserNinRecord>(
      row,
      columns: columns?.call(UserNinRecord.t),
      transaction: transaction,
    );
  }

  Future<List<UserNinRecord>> delete(
    _i1.Session session,
    List<UserNinRecord> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<UserNinRecord>(
      rows,
      transaction: transaction,
    );
  }

  Future<UserNinRecord> deleteRow(
    _i1.Session session,
    UserNinRecord row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<UserNinRecord>(
      row,
      transaction: transaction,
    );
  }

  Future<List<UserNinRecord>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<UserNinRecordTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<UserNinRecord>(
      where: where(UserNinRecord.t),
      transaction: transaction,
    );
  }

  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<UserNinRecordTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<UserNinRecord>(
      where: where?.call(UserNinRecord.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

class UserNinRecordAttachRowRepository {
  const UserNinRecordAttachRowRepository._();

  Future<void> userInfo(
    _i1.Session session,
    UserNinRecord userNinRecord,
    _i2.UserInfo userInfo,
  ) async {
    if (userNinRecord.id == null) {
      throw ArgumentError.notNull('userNinRecord.id');
    }
    if (userInfo.id == null) {
      throw ArgumentError.notNull('userInfo.id');
    }

    var $userNinRecord = userNinRecord.copyWith(userInfoId: userInfo.id);
    await session.db.updateRow<UserNinRecord>(
      $userNinRecord,
      columns: [UserNinRecord.t.userInfoId],
    );
  }
}
