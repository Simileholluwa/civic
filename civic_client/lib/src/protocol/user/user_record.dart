/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;
import 'package:serverpod_auth_client/serverpod_auth_client.dart' as _i2;
import '../user/political_status_enum.dart' as _i3;
import '../post/post.dart' as _i4;
import '../project/project.dart' as _i5;
import '../project/project_bookmarks.dart' as _i6;
import '../post/post_bookmarks.dart' as _i7;

abstract class UserRecord implements _i1.SerializableModel {
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
    this.following,
    this.followers,
    DateTime? createdAt,
    this.politicalStatus,
    this.credibilityScore,
    this.posts,
    this.projects,
    this.projectBookmarks,
    this.postBookmarks,
  }) : createdAt = createdAt ?? DateTime.now();

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
    List<int>? following,
    List<int>? followers,
    DateTime? createdAt,
    _i3.PoliticalStatus? politicalStatus,
    double? credibilityScore,
    List<_i4.Post>? posts,
    List<_i5.Project>? projects,
    List<_i6.ProjectBookmarks>? projectBookmarks,
    List<_i7.PostBookmarks>? postBookmarks,
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
          : _i2.UserInfo.fromJson(
              (jsonSerialization['userInfo'] as Map<String, dynamic>)),
      firstName: jsonSerialization['firstName'] as String?,
      lastName: jsonSerialization['lastName'] as String?,
      gender: jsonSerialization['gender'] as String?,
      birthdate: jsonSerialization['birthdate'] as String?,
      middleName: jsonSerialization['middleName'] as String?,
      email: jsonSerialization['email'] as String?,
      profileImage: jsonSerialization['profileImage'] as String?,
      following: (jsonSerialization['following'] as List?)
          ?.map((e) => e as int)
          .toList(),
      followers: (jsonSerialization['followers'] as List?)
          ?.map((e) => e as int)
          .toList(),
      createdAt: jsonSerialization['createdAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
      politicalStatus: jsonSerialization['politicalStatus'] == null
          ? null
          : _i3.PoliticalStatus.fromJson(
              (jsonSerialization['politicalStatus'] as int)),
      credibilityScore:
          (jsonSerialization['credibilityScore'] as num?)?.toDouble(),
      posts: (jsonSerialization['posts'] as List?)
          ?.map((e) => _i4.Post.fromJson((e as Map<String, dynamic>)))
          .toList(),
      projects: (jsonSerialization['projects'] as List?)
          ?.map((e) => _i5.Project.fromJson((e as Map<String, dynamic>)))
          .toList(),
      projectBookmarks: (jsonSerialization['projectBookmarks'] as List?)
          ?.map(
              (e) => _i6.ProjectBookmarks.fromJson((e as Map<String, dynamic>)))
          .toList(),
      postBookmarks: (jsonSerialization['postBookmarks'] as List?)
          ?.map((e) => _i7.PostBookmarks.fromJson((e as Map<String, dynamic>)))
          .toList(),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
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

  List<int>? following;

  List<int>? followers;

  DateTime? createdAt;

  _i3.PoliticalStatus? politicalStatus;

  double? credibilityScore;

  List<_i4.Post>? posts;

  List<_i5.Project>? projects;

  List<_i6.ProjectBookmarks>? projectBookmarks;

  List<_i7.PostBookmarks>? postBookmarks;

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
    List<int>? following,
    List<int>? followers,
    DateTime? createdAt,
    _i3.PoliticalStatus? politicalStatus,
    double? credibilityScore,
    List<_i4.Post>? posts,
    List<_i5.Project>? projects,
    List<_i6.ProjectBookmarks>? projectBookmarks,
    List<_i7.PostBookmarks>? postBookmarks,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
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
      if (following != null) 'following': following?.toJson(),
      if (followers != null) 'followers': followers?.toJson(),
      if (createdAt != null) 'createdAt': createdAt?.toJson(),
      if (politicalStatus != null) 'politicalStatus': politicalStatus?.toJson(),
      if (credibilityScore != null) 'credibilityScore': credibilityScore,
      if (posts != null) 'posts': posts?.toJson(valueToJson: (v) => v.toJson()),
      if (projects != null)
        'projects': projects?.toJson(valueToJson: (v) => v.toJson()),
      if (projectBookmarks != null)
        'projectBookmarks':
            projectBookmarks?.toJson(valueToJson: (v) => v.toJson()),
      if (postBookmarks != null)
        'postBookmarks': postBookmarks?.toJson(valueToJson: (v) => v.toJson()),
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
    int? userInfoId,
    _i2.UserInfo? userInfo,
    String? firstName,
    String? lastName,
    String? gender,
    String? birthdate,
    String? middleName,
    String? email,
    String? profileImage,
    List<int>? following,
    List<int>? followers,
    DateTime? createdAt,
    _i3.PoliticalStatus? politicalStatus,
    double? credibilityScore,
    List<_i4.Post>? posts,
    List<_i5.Project>? projects,
    List<_i6.ProjectBookmarks>? projectBookmarks,
    List<_i7.PostBookmarks>? postBookmarks,
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
          following: following,
          followers: followers,
          createdAt: createdAt,
          politicalStatus: politicalStatus,
          credibilityScore: credibilityScore,
          posts: posts,
          projects: projects,
          projectBookmarks: projectBookmarks,
          postBookmarks: postBookmarks,
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
    Object? following = _Undefined,
    Object? followers = _Undefined,
    Object? createdAt = _Undefined,
    Object? politicalStatus = _Undefined,
    Object? credibilityScore = _Undefined,
    Object? posts = _Undefined,
    Object? projects = _Undefined,
    Object? projectBookmarks = _Undefined,
    Object? postBookmarks = _Undefined,
  }) {
    return UserRecord(
      id: id is int? ? id : this.id,
      bio: bio is String? ? bio : this.bio,
      nin: nin is String? ? nin : this.nin,
      phoneNumber: phoneNumber is String? ? phoneNumber : this.phoneNumber,
      userInfoId: userInfoId is int? ? userInfoId : this.userInfoId,
      userInfo:
          userInfo is _i2.UserInfo? ? userInfo : this.userInfo?.copyWith(),
      firstName: firstName is String? ? firstName : this.firstName,
      lastName: lastName is String? ? lastName : this.lastName,
      gender: gender is String? ? gender : this.gender,
      birthdate: birthdate is String? ? birthdate : this.birthdate,
      middleName: middleName is String? ? middleName : this.middleName,
      email: email is String? ? email : this.email,
      profileImage: profileImage is String? ? profileImage : this.profileImage,
      following: following is List<int>?
          ? following
          : this.following?.map((e0) => e0).toList(),
      followers: followers is List<int>?
          ? followers
          : this.followers?.map((e0) => e0).toList(),
      createdAt: createdAt is DateTime? ? createdAt : this.createdAt,
      politicalStatus: politicalStatus is _i3.PoliticalStatus?
          ? politicalStatus
          : this.politicalStatus,
      credibilityScore: credibilityScore is double?
          ? credibilityScore
          : this.credibilityScore,
      posts: posts is List<_i4.Post>?
          ? posts
          : this.posts?.map((e0) => e0.copyWith()).toList(),
      projects: projects is List<_i5.Project>?
          ? projects
          : this.projects?.map((e0) => e0.copyWith()).toList(),
      projectBookmarks: projectBookmarks is List<_i6.ProjectBookmarks>?
          ? projectBookmarks
          : this.projectBookmarks?.map((e0) => e0.copyWith()).toList(),
      postBookmarks: postBookmarks is List<_i7.PostBookmarks>?
          ? postBookmarks
          : this.postBookmarks?.map((e0) => e0.copyWith()).toList(),
    );
  }
}
