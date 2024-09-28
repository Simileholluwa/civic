/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters

library protocol; // ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:serverpod_client/serverpod_client.dart' as _i1;
import 'aws_places.dart' as _i2;
import 'create_post.dart' as _i3;
import 'draft_post.dart' as _i4;
import 'example.dart' as _i5;
import 'exception_type_enum.dart' as _i6;
import 'location_exception.dart' as _i7;
import 'political_status_enum.dart' as _i8;
import 'post_exception.dart' as _i9;
import 'post_list.dart' as _i10;
import 'post_type_enums.dart' as _i11;
import 'user_exception.dart' as _i12;
import 'user_nin_record.dart' as _i13;
import 'user_record.dart' as _i14;
import 'protocol.dart' as _i15;
import 'package:civic_client/src/protocol/aws_places.dart' as _i16;
import 'package:civic_client/src/protocol/user_record.dart' as _i17;
import 'package:serverpod_auth_client/serverpod_auth_client.dart' as _i18;
export 'aws_places.dart';
export 'create_post.dart';
export 'draft_post.dart';
export 'example.dart';
export 'exception_type_enum.dart';
export 'location_exception.dart';
export 'political_status_enum.dart';
export 'post_exception.dart';
export 'post_list.dart';
export 'post_type_enums.dart';
export 'user_exception.dart';
export 'user_nin_record.dart';
export 'user_record.dart';
export 'client.dart';

class Protocol extends _i1.SerializationManager {
  Protocol._();

  factory Protocol() => _instance;

  static final Protocol _instance = Protocol._();

  @override
  T deserialize<T>(
    dynamic data, [
    Type? t,
  ]) {
    t ??= T;
    if (t == _i2.AWSPlaces) {
      return _i2.AWSPlaces.fromJson(data) as T;
    }
    if (t == _i3.Post) {
      return _i3.Post.fromJson(data) as T;
    }
    if (t == _i4.DraftPost) {
      return _i4.DraftPost.fromJson(data) as T;
    }
    if (t == _i5.Example) {
      return _i5.Example.fromJson(data) as T;
    }
    if (t == _i6.ExceptionTypes) {
      return _i6.ExceptionTypes.fromJson(data) as T;
    }
    if (t == _i7.LocationException) {
      return _i7.LocationException.fromJson(data) as T;
    }
    if (t == _i8.PoliticalStatus) {
      return _i8.PoliticalStatus.fromJson(data) as T;
    }
    if (t == _i9.PostException) {
      return _i9.PostException.fromJson(data) as T;
    }
    if (t == _i10.PostList) {
      return _i10.PostList.fromJson(data) as T;
    }
    if (t == _i11.PostType) {
      return _i11.PostType.fromJson(data) as T;
    }
    if (t == _i12.UserException) {
      return _i12.UserException.fromJson(data) as T;
    }
    if (t == _i13.UserNinRecord) {
      return _i13.UserNinRecord.fromJson(data) as T;
    }
    if (t == _i14.UserRecord) {
      return _i14.UserRecord.fromJson(data) as T;
    }
    if (t == _i1.getType<_i2.AWSPlaces?>()) {
      return (data != null ? _i2.AWSPlaces.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i3.Post?>()) {
      return (data != null ? _i3.Post.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i4.DraftPost?>()) {
      return (data != null ? _i4.DraftPost.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i5.Example?>()) {
      return (data != null ? _i5.Example.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i6.ExceptionTypes?>()) {
      return (data != null ? _i6.ExceptionTypes.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i7.LocationException?>()) {
      return (data != null ? _i7.LocationException.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i8.PoliticalStatus?>()) {
      return (data != null ? _i8.PoliticalStatus.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i9.PostException?>()) {
      return (data != null ? _i9.PostException.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i10.PostList?>()) {
      return (data != null ? _i10.PostList.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i11.PostType?>()) {
      return (data != null ? _i11.PostType.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i12.UserException?>()) {
      return (data != null ? _i12.UserException.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i13.UserNinRecord?>()) {
      return (data != null ? _i13.UserNinRecord.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i14.UserRecord?>()) {
      return (data != null ? _i14.UserRecord.fromJson(data) : null) as T;
    }
    if (t == List<String>) {
      return (data as List).map((e) => deserialize<String>(e)).toList()
          as dynamic;
    }
    if (t == List<_i15.AWSPlaces>) {
      return (data as List).map((e) => deserialize<_i15.AWSPlaces>(e)).toList()
          as dynamic;
    }
    if (t == List<_i15.Post>) {
      return (data as List).map((e) => deserialize<_i15.Post>(e)).toList()
          as dynamic;
    }
    if (t == List<int>) {
      return (data as List).map((e) => deserialize<int>(e)).toList() as dynamic;
    }
    if (t == List<_i16.AWSPlaces>) {
      return (data as List).map((e) => deserialize<_i16.AWSPlaces>(e)).toList()
          as dynamic;
    }
    if (t == List<double>) {
      return (data as List).map((e) => deserialize<double>(e)).toList()
          as dynamic;
    }
    if (t == List<_i17.UserRecord>) {
      return (data as List).map((e) => deserialize<_i17.UserRecord>(e)).toList()
          as dynamic;
    }
    if (t == List<String>) {
      return (data as List).map((e) => deserialize<String>(e)).toList()
          as dynamic;
    }
    try {
      return _i18.Protocol().deserialize<T>(data, t);
    } on _i1.DeserializationTypeNotFoundException catch (_) {}
    return super.deserialize<T>(data, t);
  }

  @override
  String? getClassNameForObject(Object? data) {
    String? className = super.getClassNameForObject(data);
    if (className != null) return className;
    if (data is _i2.AWSPlaces) {
      return 'AWSPlaces';
    }
    if (data is _i3.Post) {
      return 'Post';
    }
    if (data is _i4.DraftPost) {
      return 'DraftPost';
    }
    if (data is _i5.Example) {
      return 'Example';
    }
    if (data is _i6.ExceptionTypes) {
      return 'ExceptionTypes';
    }
    if (data is _i7.LocationException) {
      return 'LocationException';
    }
    if (data is _i8.PoliticalStatus) {
      return 'PoliticalStatus';
    }
    if (data is _i9.PostException) {
      return 'PostException';
    }
    if (data is _i10.PostList) {
      return 'PostList';
    }
    if (data is _i11.PostType) {
      return 'PostType';
    }
    if (data is _i12.UserException) {
      return 'UserException';
    }
    if (data is _i13.UserNinRecord) {
      return 'UserNinRecord';
    }
    if (data is _i14.UserRecord) {
      return 'UserRecord';
    }
    className = _i18.Protocol().getClassNameForObject(data);
    if (className != null) {
      return 'serverpod_auth.$className';
    }
    return null;
  }

  @override
  dynamic deserializeByClassName(Map<String, dynamic> data) {
    if (data['className'] == 'AWSPlaces') {
      return deserialize<_i2.AWSPlaces>(data['data']);
    }
    if (data['className'] == 'Post') {
      return deserialize<_i3.Post>(data['data']);
    }
    if (data['className'] == 'DraftPost') {
      return deserialize<_i4.DraftPost>(data['data']);
    }
    if (data['className'] == 'Example') {
      return deserialize<_i5.Example>(data['data']);
    }
    if (data['className'] == 'ExceptionTypes') {
      return deserialize<_i6.ExceptionTypes>(data['data']);
    }
    if (data['className'] == 'LocationException') {
      return deserialize<_i7.LocationException>(data['data']);
    }
    if (data['className'] == 'PoliticalStatus') {
      return deserialize<_i8.PoliticalStatus>(data['data']);
    }
    if (data['className'] == 'PostException') {
      return deserialize<_i9.PostException>(data['data']);
    }
    if (data['className'] == 'PostList') {
      return deserialize<_i10.PostList>(data['data']);
    }
    if (data['className'] == 'PostType') {
      return deserialize<_i11.PostType>(data['data']);
    }
    if (data['className'] == 'UserException') {
      return deserialize<_i12.UserException>(data['data']);
    }
    if (data['className'] == 'UserNinRecord') {
      return deserialize<_i13.UserNinRecord>(data['data']);
    }
    if (data['className'] == 'UserRecord') {
      return deserialize<_i14.UserRecord>(data['data']);
    }
    if (data['className'].startsWith('serverpod_auth.')) {
      data['className'] = data['className'].substring(15);
      return _i18.Protocol().deserializeByClassName(data);
    }
    return super.deserializeByClassName(data);
  }
}
