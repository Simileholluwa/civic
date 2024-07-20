/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;
import 'package:serverpod_auth_client/serverpod_auth_client.dart' as _i2;

abstract class UserNinRecord implements _i1.SerializableModel {
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
    required this.userInfoId,
    this.userInfo,
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

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
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

  int userInfoId;

  _i2.UserInfo? userInfo;

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
