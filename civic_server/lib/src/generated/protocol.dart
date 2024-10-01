/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters

library protocol; // ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:serverpod/serverpod.dart' as _i1;
import 'package:serverpod/protocol.dart' as _i2;
import 'package:serverpod_auth_server/serverpod_auth_server.dart' as _i3;
import 'aws_places.dart' as _i4;
import 'create_post.dart' as _i5;
import 'draft_post.dart' as _i6;
import 'example.dart' as _i7;
import 'exception_type_enum.dart' as _i8;
import 'location_exception.dart' as _i9;
import 'political_status_enum.dart' as _i10;
import 'post_exception.dart' as _i11;
import 'post_list.dart' as _i12;
import 'post_type_enums.dart' as _i13;
import 'user_exception.dart' as _i14;
import 'user_nin_record.dart' as _i15;
import 'user_record.dart' as _i16;
import 'users_list.dart' as _i17;
import 'protocol.dart' as _i18;
import 'package:civic_server/src/generated/aws_places.dart' as _i19;
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
export 'users_list.dart';

class Protocol extends _i1.SerializationManagerServer {
  Protocol._();

  factory Protocol() => _instance;

  static final Protocol _instance = Protocol._();

  static final List<_i2.TableDefinition> targetTableDefinitions = [
    _i2.TableDefinition(
      name: 'post',
      dartName: 'Post',
      schema: 'public',
      module: 'civic',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'post_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'ownerId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'postType',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'protocol:PostType',
        ),
        _i2.ColumnDefinition(
          name: 'text',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'imageUrls',
          columnType: _i2.ColumnType.json,
          isNullable: false,
          dartType: 'List<String>',
        ),
        _i2.ColumnDefinition(
          name: 'videoUrl',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'taggedUsers',
          columnType: _i2.ColumnType.json,
          isNullable: false,
          dartType: 'List<int>',
        ),
        _i2.ColumnDefinition(
          name: 'locations',
          columnType: _i2.ColumnType.json,
          isNullable: false,
          dartType: 'List<protocol:AWSPlaces>',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'post_fk_0',
          columns: ['ownerId'],
          referenceTable: 'user_record',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        )
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'post_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        )
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'user_nin_record',
      dartName: 'UserNinRecord',
      schema: 'public',
      module: 'civic',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'user_nin_record_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'firstName',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'surname',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'telephone',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'photoUrl',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'birthdate',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'email',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'gender',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'ninNumber',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'residenceStatus',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'resisdenceAddressLine1',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'residenceTown',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'residenceState',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'residenceLga',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'ownerId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'user_nin_record_fk_0',
          columns: ['ownerId'],
          referenceTable: 'serverpod_user_info',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        )
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'user_nin_record_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        ),
        _i2.IndexDefinition(
          indexName: 'owner_id_unique_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'ownerId',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: false,
        ),
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'user_record',
      dartName: 'UserRecord',
      schema: 'public',
      module: 'civic',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'user_record_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'bio',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'nin',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'phoneNumber',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'userInfoId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'verifiedAccount',
          columnType: _i2.ColumnType.boolean,
          isNullable: false,
          dartType: 'bool',
        ),
        _i2.ColumnDefinition(
          name: 'following',
          columnType: _i2.ColumnType.json,
          isNullable: false,
          dartType: 'List<int>',
        ),
        _i2.ColumnDefinition(
          name: 'followers',
          columnType: _i2.ColumnType.json,
          isNullable: false,
          dartType: 'List<int>',
        ),
        _i2.ColumnDefinition(
          name: 'politicalStatus',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'protocol:PoliticalStatus',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'user_record_fk_0',
          columns: ['userInfoId'],
          referenceTable: 'serverpod_user_info',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        )
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'user_record_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        ),
        _i2.IndexDefinition(
          indexName: 'user_info_id_unique_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'userInfoId',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: false,
        ),
      ],
      managed: true,
    ),
    ..._i3.Protocol.targetTableDefinitions,
    ..._i2.Protocol.targetTableDefinitions,
  ];

  @override
  T deserialize<T>(
    dynamic data, [
    Type? t,
  ]) {
    t ??= T;
    if (t == _i4.AWSPlaces) {
      return _i4.AWSPlaces.fromJson(data) as T;
    }
    if (t == _i5.Post) {
      return _i5.Post.fromJson(data) as T;
    }
    if (t == _i6.DraftPost) {
      return _i6.DraftPost.fromJson(data) as T;
    }
    if (t == _i7.Example) {
      return _i7.Example.fromJson(data) as T;
    }
    if (t == _i8.ExceptionTypes) {
      return _i8.ExceptionTypes.fromJson(data) as T;
    }
    if (t == _i9.LocationException) {
      return _i9.LocationException.fromJson(data) as T;
    }
    if (t == _i10.PoliticalStatus) {
      return _i10.PoliticalStatus.fromJson(data) as T;
    }
    if (t == _i11.PostException) {
      return _i11.PostException.fromJson(data) as T;
    }
    if (t == _i12.PostList) {
      return _i12.PostList.fromJson(data) as T;
    }
    if (t == _i13.PostType) {
      return _i13.PostType.fromJson(data) as T;
    }
    if (t == _i14.UserException) {
      return _i14.UserException.fromJson(data) as T;
    }
    if (t == _i15.UserNinRecord) {
      return _i15.UserNinRecord.fromJson(data) as T;
    }
    if (t == _i16.UserRecord) {
      return _i16.UserRecord.fromJson(data) as T;
    }
    if (t == _i17.UsersList) {
      return _i17.UsersList.fromJson(data) as T;
    }
    if (t == _i1.getType<_i4.AWSPlaces?>()) {
      return (data != null ? _i4.AWSPlaces.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i5.Post?>()) {
      return (data != null ? _i5.Post.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i6.DraftPost?>()) {
      return (data != null ? _i6.DraftPost.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i7.Example?>()) {
      return (data != null ? _i7.Example.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i8.ExceptionTypes?>()) {
      return (data != null ? _i8.ExceptionTypes.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i9.LocationException?>()) {
      return (data != null ? _i9.LocationException.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i10.PoliticalStatus?>()) {
      return (data != null ? _i10.PoliticalStatus.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i11.PostException?>()) {
      return (data != null ? _i11.PostException.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i12.PostList?>()) {
      return (data != null ? _i12.PostList.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i13.PostType?>()) {
      return (data != null ? _i13.PostType.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i14.UserException?>()) {
      return (data != null ? _i14.UserException.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i15.UserNinRecord?>()) {
      return (data != null ? _i15.UserNinRecord.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i16.UserRecord?>()) {
      return (data != null ? _i16.UserRecord.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i17.UsersList?>()) {
      return (data != null ? _i17.UsersList.fromJson(data) : null) as T;
    }
    if (t == List<String>) {
      return (data as List).map((e) => deserialize<String>(e)).toList()
          as dynamic;
    }
    if (t == List<int>) {
      return (data as List).map((e) => deserialize<int>(e)).toList() as dynamic;
    }
    if (t == List<_i18.AWSPlaces>) {
      return (data as List).map((e) => deserialize<_i18.AWSPlaces>(e)).toList()
          as dynamic;
    }
    if (t == List<_i18.Post>) {
      return (data as List).map((e) => deserialize<_i18.Post>(e)).toList()
          as dynamic;
    }
    if (t == List<_i18.UserRecord>) {
      return (data as List).map((e) => deserialize<_i18.UserRecord>(e)).toList()
          as dynamic;
    }
    if (t == List<_i19.AWSPlaces>) {
      return (data as List).map((e) => deserialize<_i19.AWSPlaces>(e)).toList()
          as dynamic;
    }
    if (t == List<double>) {
      return (data as List).map((e) => deserialize<double>(e)).toList()
          as dynamic;
    }
    if (t == List<String>) {
      return (data as List).map((e) => deserialize<String>(e)).toList()
          as dynamic;
    }
    try {
      return _i3.Protocol().deserialize<T>(data, t);
    } on _i1.DeserializationTypeNotFoundException catch (_) {}
    try {
      return _i2.Protocol().deserialize<T>(data, t);
    } on _i1.DeserializationTypeNotFoundException catch (_) {}
    return super.deserialize<T>(data, t);
  }

  @override
  String? getClassNameForObject(Object? data) {
    String? className = super.getClassNameForObject(data);
    if (className != null) return className;
    if (data is _i4.AWSPlaces) {
      return 'AWSPlaces';
    }
    if (data is _i5.Post) {
      return 'Post';
    }
    if (data is _i6.DraftPost) {
      return 'DraftPost';
    }
    if (data is _i7.Example) {
      return 'Example';
    }
    if (data is _i8.ExceptionTypes) {
      return 'ExceptionTypes';
    }
    if (data is _i9.LocationException) {
      return 'LocationException';
    }
    if (data is _i10.PoliticalStatus) {
      return 'PoliticalStatus';
    }
    if (data is _i11.PostException) {
      return 'PostException';
    }
    if (data is _i12.PostList) {
      return 'PostList';
    }
    if (data is _i13.PostType) {
      return 'PostType';
    }
    if (data is _i14.UserException) {
      return 'UserException';
    }
    if (data is _i15.UserNinRecord) {
      return 'UserNinRecord';
    }
    if (data is _i16.UserRecord) {
      return 'UserRecord';
    }
    if (data is _i17.UsersList) {
      return 'UsersList';
    }
    className = _i2.Protocol().getClassNameForObject(data);
    if (className != null) {
      return 'serverpod.$className';
    }
    className = _i3.Protocol().getClassNameForObject(data);
    if (className != null) {
      return 'serverpod_auth.$className';
    }
    return null;
  }

  @override
  dynamic deserializeByClassName(Map<String, dynamic> data) {
    if (data['className'] == 'AWSPlaces') {
      return deserialize<_i4.AWSPlaces>(data['data']);
    }
    if (data['className'] == 'Post') {
      return deserialize<_i5.Post>(data['data']);
    }
    if (data['className'] == 'DraftPost') {
      return deserialize<_i6.DraftPost>(data['data']);
    }
    if (data['className'] == 'Example') {
      return deserialize<_i7.Example>(data['data']);
    }
    if (data['className'] == 'ExceptionTypes') {
      return deserialize<_i8.ExceptionTypes>(data['data']);
    }
    if (data['className'] == 'LocationException') {
      return deserialize<_i9.LocationException>(data['data']);
    }
    if (data['className'] == 'PoliticalStatus') {
      return deserialize<_i10.PoliticalStatus>(data['data']);
    }
    if (data['className'] == 'PostException') {
      return deserialize<_i11.PostException>(data['data']);
    }
    if (data['className'] == 'PostList') {
      return deserialize<_i12.PostList>(data['data']);
    }
    if (data['className'] == 'PostType') {
      return deserialize<_i13.PostType>(data['data']);
    }
    if (data['className'] == 'UserException') {
      return deserialize<_i14.UserException>(data['data']);
    }
    if (data['className'] == 'UserNinRecord') {
      return deserialize<_i15.UserNinRecord>(data['data']);
    }
    if (data['className'] == 'UserRecord') {
      return deserialize<_i16.UserRecord>(data['data']);
    }
    if (data['className'] == 'UsersList') {
      return deserialize<_i17.UsersList>(data['data']);
    }
    if (data['className'].startsWith('serverpod.')) {
      data['className'] = data['className'].substring(10);
      return _i2.Protocol().deserializeByClassName(data);
    }
    if (data['className'].startsWith('serverpod_auth.')) {
      data['className'] = data['className'].substring(15);
      return _i3.Protocol().deserializeByClassName(data);
    }
    return super.deserializeByClassName(data);
  }

  @override
  _i1.Table? getTableForType(Type t) {
    {
      var table = _i3.Protocol().getTableForType(t);
      if (table != null) {
        return table;
      }
    }
    {
      var table = _i2.Protocol().getTableForType(t);
      if (table != null) {
        return table;
      }
    }
    switch (t) {
      case _i5.Post:
        return _i5.Post.t;
      case _i15.UserNinRecord:
        return _i15.UserNinRecord.t;
      case _i16.UserRecord:
        return _i16.UserRecord.t;
    }
    return null;
  }

  @override
  List<_i2.TableDefinition> getTargetTableDefinitions() =>
      targetTableDefinitions;

  @override
  String getModuleName() => 'civic';
}
