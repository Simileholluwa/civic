/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

library protocol; // ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:serverpod_client/serverpod_client.dart' as _i1;
import 'create_post.dart' as _i2;
import 'draft_post.dart' as _i3;
import 'example.dart' as _i4;
import 'political_status_enum.dart' as _i5;
import 'post_list.dart' as _i6;
import 'post_type_enums.dart' as _i7;
import 'user_nin_record.dart' as _i8;
import 'user_record.dart' as _i9;
import 'protocol.dart' as _i10;
import 'package:serverpod_auth_client/serverpod_auth_client.dart' as _i11;
export 'create_post.dart';
export 'draft_post.dart';
export 'example.dart';
export 'political_status_enum.dart';
export 'post_list.dart';
export 'post_type_enums.dart';
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
    if (t == _i2.Post) {
      return _i2.Post.fromJson(data) as T;
    }
    if (t == _i3.DraftPost) {
      return _i3.DraftPost.fromJson(data) as T;
    }
    if (t == _i4.Example) {
      return _i4.Example.fromJson(data) as T;
    }
    if (t == _i5.PoliticalStatus) {
      return _i5.PoliticalStatus.fromJson(data) as T;
    }
    if (t == _i6.PostList) {
      return _i6.PostList.fromJson(data) as T;
    }
    if (t == _i7.PostType) {
      return _i7.PostType.fromJson(data) as T;
    }
    if (t == _i8.UserNinRecord) {
      return _i8.UserNinRecord.fromJson(data) as T;
    }
    if (t == _i9.UserRecord) {
      return _i9.UserRecord.fromJson(data) as T;
    }
    if (t == _i1.getType<_i2.Post?>()) {
      return (data != null ? _i2.Post.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i3.DraftPost?>()) {
      return (data != null ? _i3.DraftPost.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i4.Example?>()) {
      return (data != null ? _i4.Example.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i5.PoliticalStatus?>()) {
      return (data != null ? _i5.PoliticalStatus.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i6.PostList?>()) {
      return (data != null ? _i6.PostList.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i7.PostType?>()) {
      return (data != null ? _i7.PostType.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i8.UserNinRecord?>()) {
      return (data != null ? _i8.UserNinRecord.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i9.UserRecord?>()) {
      return (data != null ? _i9.UserRecord.fromJson(data) : null) as T;
    }
    if (t == List<String>) {
      return (data as List).map((e) => deserialize<String>(e)).toList()
          as dynamic;
    }
    if (t == List<_i10.Post>) {
      return (data as List).map((e) => deserialize<_i10.Post>(e)).toList()
          as dynamic;
    }
    if (t == _i1.getType<List<String>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<String>(e)).toList()
          : null) as dynamic;
    }
    if (t == _i1.getType<List<String>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<String>(e)).toList()
          : null) as dynamic;
    }
    if (t == List<String>) {
      return (data as List).map((e) => deserialize<String>(e)).toList()
          as dynamic;
    }
    try {
      return _i11.Protocol().deserialize<T>(data, t);
    } on _i1.DeserializationTypeNotFoundException catch (_) {}
    return super.deserialize<T>(data, t);
  }

  @override
  String? getClassNameForObject(Object data) {
    String? className;
    className = _i11.Protocol().getClassNameForObject(data);
    if (className != null) {
      return 'serverpod_auth.$className';
    }
    if (data is _i2.Post) {
      return 'Post';
    }
    if (data is _i3.DraftPost) {
      return 'DraftPost';
    }
    if (data is _i4.Example) {
      return 'Example';
    }
    if (data is _i5.PoliticalStatus) {
      return 'PoliticalStatus';
    }
    if (data is _i6.PostList) {
      return 'PostList';
    }
    if (data is _i7.PostType) {
      return 'PostType';
    }
    if (data is _i8.UserNinRecord) {
      return 'UserNinRecord';
    }
    if (data is _i9.UserRecord) {
      return 'UserRecord';
    }
    return super.getClassNameForObject(data);
  }

  @override
  dynamic deserializeByClassName(Map<String, dynamic> data) {
    if (data['className'].startsWith('serverpod_auth.')) {
      data['className'] = data['className'].substring(15);
      return _i11.Protocol().deserializeByClassName(data);
    }
    if (data['className'] == 'Post') {
      return deserialize<_i2.Post>(data['data']);
    }
    if (data['className'] == 'DraftPost') {
      return deserialize<_i3.DraftPost>(data['data']);
    }
    if (data['className'] == 'Example') {
      return deserialize<_i4.Example>(data['data']);
    }
    if (data['className'] == 'PoliticalStatus') {
      return deserialize<_i5.PoliticalStatus>(data['data']);
    }
    if (data['className'] == 'PostList') {
      return deserialize<_i6.PostList>(data['data']);
    }
    if (data['className'] == 'PostType') {
      return deserialize<_i7.PostType>(data['data']);
    }
    if (data['className'] == 'UserNinRecord') {
      return deserialize<_i8.UserNinRecord>(data['data']);
    }
    if (data['className'] == 'UserRecord') {
      return deserialize<_i9.UserRecord>(data['data']);
    }
    return super.deserializeByClassName(data);
  }
}
