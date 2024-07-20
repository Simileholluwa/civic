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
import 'protocol.dart' as _i3;

abstract class UserRecord implements _i1.SerializableModel {
  UserRecord._({
    this.id,
    this.bio,
    this.nin,
    this.phoneNumber,
    required this.userInfoId,
    this.userInfo,
    this.verifiedAccount,
    this.verifiedEmail,
    this.following,
    this.followers,
    this.posts,
    this.politicalStatus,
  });

  factory UserRecord({
    int? id,
    String? bio,
    String? nin,
    String? phoneNumber,
    required int userInfoId,
    _i2.UserInfo? userInfo,
    bool? verifiedAccount,
    bool? verifiedEmail,
    List<String>? following,
    List<String>? followers,
    List<String>? posts,
    _i3.PoliticalStatus? politicalStatus,
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
      verifiedEmail: jsonSerialization['verifiedEmail'] as bool?,
      following: (jsonSerialization['following'] as List?)
          ?.map((e) => e as String)
          .toList(),
      followers: (jsonSerialization['followers'] as List?)
          ?.map((e) => e as String)
          .toList(),
      posts: (jsonSerialization['posts'] as List?)
          ?.map((e) => e as String)
          .toList(),
      politicalStatus: jsonSerialization['politicalStatus'] == null
          ? null
          : _i3.PoliticalStatus.fromJson(
              (jsonSerialization['politicalStatus'] as int)),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  String? bio;

  String? nin;

  String? phoneNumber;

  int userInfoId;

  _i2.UserInfo? userInfo;

  bool? verifiedAccount;

  bool? verifiedEmail;

  List<String>? following;

  List<String>? followers;

  List<String>? posts;

  _i3.PoliticalStatus? politicalStatus;

  UserRecord copyWith({
    int? id,
    String? bio,
    String? nin,
    String? phoneNumber,
    int? userInfoId,
    _i2.UserInfo? userInfo,
    bool? verifiedAccount,
    bool? verifiedEmail,
    List<String>? following,
    List<String>? followers,
    List<String>? posts,
    _i3.PoliticalStatus? politicalStatus,
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
      if (verifiedEmail != null) 'verifiedEmail': verifiedEmail,
      if (following != null) 'following': following?.toJson(),
      if (followers != null) 'followers': followers?.toJson(),
      if (posts != null) 'posts': posts?.toJson(),
      if (politicalStatus != null) 'politicalStatus': politicalStatus?.toJson(),
    };
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
    bool? verifiedEmail,
    List<String>? following,
    List<String>? followers,
    List<String>? posts,
    _i3.PoliticalStatus? politicalStatus,
  }) : super._(
          id: id,
          bio: bio,
          nin: nin,
          phoneNumber: phoneNumber,
          userInfoId: userInfoId,
          userInfo: userInfo,
          verifiedAccount: verifiedAccount,
          verifiedEmail: verifiedEmail,
          following: following,
          followers: followers,
          posts: posts,
          politicalStatus: politicalStatus,
        );

  @override
  UserRecord copyWith({
    Object? id = _Undefined,
    Object? bio = _Undefined,
    Object? nin = _Undefined,
    Object? phoneNumber = _Undefined,
    int? userInfoId,
    Object? userInfo = _Undefined,
    Object? verifiedAccount = _Undefined,
    Object? verifiedEmail = _Undefined,
    Object? following = _Undefined,
    Object? followers = _Undefined,
    Object? posts = _Undefined,
    Object? politicalStatus = _Undefined,
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
      verifiedEmail:
          verifiedEmail is bool? ? verifiedEmail : this.verifiedEmail,
      following:
          following is List<String>? ? following : this.following?.clone(),
      followers:
          followers is List<String>? ? followers : this.followers?.clone(),
      posts: posts is List<String>? ? posts : this.posts?.clone(),
      politicalStatus: politicalStatus is _i3.PoliticalStatus?
          ? politicalStatus
          : this.politicalStatus,
    );
  }
}
