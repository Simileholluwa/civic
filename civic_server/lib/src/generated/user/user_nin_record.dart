/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;
import 'package:serverpod_auth_server/serverpod_auth_server.dart' as _i2;

abstract class UserNinRecord
    implements _i1.TableRow, _i1.ProtocolSerialization {
  UserNinRecord._({
    this.id,
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
    required this.ownerId,
    this.owner,
  });

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
    required int ownerId,
    _i2.UserInfo? owner,
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
      ownerId: jsonSerialization['ownerId'] as int,
      owner: jsonSerialization['owner'] == null
          ? null
          : _i2.UserInfo.fromJson(
              (jsonSerialization['owner'] as Map<String, dynamic>)),
    );
  }

  static final t = UserNinRecordTable();

  static const db = UserNinRecordRepository._();

  @override
  int? id;

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

  int ownerId;

  _i2.UserInfo? owner;

  @override
  _i1.Table get table => t;

  /// Returns a shallow copy of this [UserNinRecord]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
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
    int? ownerId,
    _i2.UserInfo? owner,
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
      'ownerId': ownerId,
      if (owner != null) 'owner': owner?.toJson(),
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
      'ownerId': ownerId,
      if (owner != null) 'owner': owner?.toJsonForProtocol(),
    };
  }

  static UserNinRecordInclude include({_i2.UserInfoInclude? owner}) {
    return UserNinRecordInclude._(owner: owner);
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
    required int ownerId,
    _i2.UserInfo? owner,
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
          ownerId: ownerId,
          owner: owner,
        );

  /// Returns a shallow copy of this [UserNinRecord]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
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
    int? ownerId,
    Object? owner = _Undefined,
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
      ownerId: ownerId ?? this.ownerId,
      owner: owner is _i2.UserInfo? ? owner : this.owner?.copyWith(),
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
    ownerId = _i1.ColumnInt(
      'ownerId',
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

  late final _i1.ColumnInt ownerId;

  _i2.UserInfoTable? _owner;

  _i2.UserInfoTable get owner {
    if (_owner != null) return _owner!;
    _owner = _i1.createRelationTable(
      relationFieldName: 'owner',
      field: UserNinRecord.t.ownerId,
      foreignField: _i2.UserInfo.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.UserInfoTable(tableRelation: foreignTableRelation),
    );
    return _owner!;
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
        ownerId,
      ];

  @override
  _i1.Table? getRelationTable(String relationField) {
    if (relationField == 'owner') {
      return owner;
    }
    return null;
  }
}

class UserNinRecordInclude extends _i1.IncludeObject {
  UserNinRecordInclude._({_i2.UserInfoInclude? owner}) {
    _owner = owner;
  }

  _i2.UserInfoInclude? _owner;

  @override
  Map<String, _i1.Include?> get includes => {'owner': _owner};

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

  /// Returns a list of [UserNinRecord]s matching the given query parameters.
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

  /// Returns the first matching [UserNinRecord] matching the given query parameters.
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

  /// Finds a single [UserNinRecord] by its [id] or null if no such row exists.
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

  /// Inserts all [UserNinRecord]s in the list and returns the inserted rows.
  ///
  /// The returned [UserNinRecord]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
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

  /// Inserts a single [UserNinRecord] and returns the inserted row.
  ///
  /// The returned [UserNinRecord] will have its `id` field set.
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

  /// Updates all [UserNinRecord]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
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

  /// Updates a single [UserNinRecord]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
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

  /// Deletes all [UserNinRecord]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
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

  /// Deletes a single [UserNinRecord].
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

  /// Deletes all rows matching the [where] expression.
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

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
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

  /// Creates a relation between the given [UserNinRecord] and [UserInfo]
  /// by setting the [UserNinRecord]'s foreign key `ownerId` to refer to the [UserInfo].
  Future<void> owner(
    _i1.Session session,
    UserNinRecord userNinRecord,
    _i2.UserInfo owner, {
    _i1.Transaction? transaction,
  }) async {
    if (userNinRecord.id == null) {
      throw ArgumentError.notNull('userNinRecord.id');
    }
    if (owner.id == null) {
      throw ArgumentError.notNull('owner.id');
    }

    var $userNinRecord = userNinRecord.copyWith(ownerId: owner.id);
    await session.db.updateRow<UserNinRecord>(
      $userNinRecord,
      columns: [UserNinRecord.t.ownerId],
      transaction: transaction,
    );
  }
}
