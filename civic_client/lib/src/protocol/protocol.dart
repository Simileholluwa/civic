/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

library protocol; // ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:serverpod_client/serverpod_client.dart' as _i1;
import 'example.dart' as _i2;
import 'political_status_enum.dart' as _i3;
import 'user_nin_record.dart' as _i4;
import 'user_record.dart' as _i5;
import 'package:serverpod_auth_client/serverpod_auth_client.dart' as _i6;
export 'example.dart';
export 'political_status_enum.dart';
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
    if (t == _i2.Example) {
      return _i2.Example.fromJson(data) as T;
    }
    if (t == _i3.PoliticalStatus) {
      return _i3.PoliticalStatus.fromJson(data) as T;
    }
    if (t == _i4.UserNinRecord) {
      return _i4.UserNinRecord.fromJson(data) as T;
    }
    if (t == _i5.UserRecord) {
      return _i5.UserRecord.fromJson(data) as T;
    }
    if (t == _i1.getType<_i2.Example?>()) {
      return (data != null ? _i2.Example.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i3.PoliticalStatus?>()) {
      return (data != null ? _i3.PoliticalStatus.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i4.UserNinRecord?>()) {
      return (data != null ? _i4.UserNinRecord.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i5.UserRecord?>()) {
      return (data != null ? _i5.UserRecord.fromJson(data) : null) as T;
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
      return _i6.Protocol().deserialize<T>(data, t);
    } on _i1.DeserializationTypeNotFoundException catch (_) {}
    return super.deserialize<T>(data, t);
  }

  @override
  String? getClassNameForObject(Object data) {
    String? className;
    className = _i6.Protocol().getClassNameForObject(data);
    if (className != null) {
      return 'serverpod_auth.$className';
    }
    if (data is _i2.Example) {
      return 'Example';
    }
    if (data is _i3.PoliticalStatus) {
      return 'PoliticalStatus';
    }
    if (data is _i4.UserNinRecord) {
      return 'UserNinRecord';
    }
    if (data is _i5.UserRecord) {
      return 'UserRecord';
    }
    return super.getClassNameForObject(data);
  }

  @override
  dynamic deserializeByClassName(Map<String, dynamic> data) {
    if (data['className'].startsWith('serverpod_auth.')) {
      data['className'] = data['className'].substring(15);
      return _i6.Protocol().deserializeByClassName(data);
    }
    if (data['className'] == 'Example') {
      return deserialize<_i2.Example>(data['data']);
    }
    if (data['className'] == 'PoliticalStatus') {
      return deserialize<_i3.PoliticalStatus>(data['data']);
    }
    if (data['className'] == 'UserNinRecord') {
      return deserialize<_i4.UserNinRecord>(data['data']);
    }
    if (data['className'] == 'UserRecord') {
      return deserialize<_i5.UserRecord>(data['data']);
    }
    return super.deserializeByClassName(data);
  }
}