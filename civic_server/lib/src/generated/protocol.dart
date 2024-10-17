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
import 'general/aws_places.dart' as _i4;
import 'general/example.dart' as _i5;
import 'general/link_metadata.dart' as _i6;
import 'general/location_exception.dart' as _i7;
import 'poll/draft_poll.dart' as _i8;
import 'poll/poll.dart' as _i9;
import 'poll/poll_hashtag.dart' as _i10;
import 'poll/poll_hashtags.dart' as _i11;
import 'poll/poll_option.dart' as _i12;
import 'poll/poll_vote.dart' as _i13;
import 'post/draft_post.dart' as _i14;
import 'post/hashtags.dart' as _i15;
import 'post/post.dart' as _i16;
import 'post/post_exception.dart' as _i17;
import 'post/post_list.dart' as _i18;
import 'post/post_type_enums.dart' as _i19;
import 'post/posts_hashtags.dart' as _i20;
import 'user/political_status_enum.dart' as _i21;
import 'user/user_exception.dart' as _i22;
import 'user/user_nin_record.dart' as _i23;
import 'user/user_record.dart' as _i24;
import 'user/users_list.dart' as _i25;
import 'protocol.dart' as _i26;
import 'package:civic_server/src/generated/general/aws_places.dart' as _i27;
import 'package:civic_server/src/generated/user/user_record.dart' as _i28;
export 'general/aws_places.dart';
export 'general/example.dart';
export 'general/link_metadata.dart';
export 'general/location_exception.dart';
export 'poll/draft_poll.dart';
export 'poll/poll.dart';
export 'poll/poll_hashtag.dart';
export 'poll/poll_hashtags.dart';
export 'poll/poll_option.dart';
export 'poll/poll_vote.dart';
export 'post/draft_post.dart';
export 'post/hashtags.dart';
export 'post/post.dart';
export 'post/post_exception.dart';
export 'post/post_list.dart';
export 'post/post_type_enums.dart';
export 'post/posts_hashtags.dart';
export 'user/political_status_enum.dart';
export 'user/user_exception.dart';
export 'user/user_nin_record.dart';
export 'user/user_record.dart';
export 'user/users_list.dart';

class Protocol extends _i1.SerializationManagerServer {
  Protocol._();

  factory Protocol() => _instance;

  static final Protocol _instance = Protocol._();

  static final List<_i2.TableDefinition> targetTableDefinitions = [
    _i2.TableDefinition(
      name: 'hashtag',
      dartName: 'Hashtag',
      schema: 'public',
      module: 'civic',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'hashtag_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'tag',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'usageCount',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
      ],
      foreignKeys: [],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'hashtag_pkey',
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
      name: 'poll',
      dartName: 'Poll',
      schema: 'public',
      module: 'civic',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'poll_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'ownerId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'question',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'taggedUsers',
          columnType: _i2.ColumnType.json,
          isNullable: false,
          dartType: 'List<protocol:UserRecord>',
        ),
        _i2.ColumnDefinition(
          name: 'locations',
          columnType: _i2.ColumnType.json,
          isNullable: false,
          dartType: 'List<protocol:AWSPlaces>',
        ),
        _i2.ColumnDefinition(
          name: 'mentions',
          columnType: _i2.ColumnType.json,
          isNullable: false,
          dartType: 'List<protocol:UserRecord>',
        ),
        _i2.ColumnDefinition(
          name: 'options',
          columnType: _i2.ColumnType.json,
          isNullable: true,
          dartType: 'protocol:PollOption?',
        ),
        _i2.ColumnDefinition(
          name: 'tags',
          columnType: _i2.ColumnType.json,
          isNullable: false,
          dartType: 'List<String>',
        ),
        _i2.ColumnDefinition(
          name: 'pollDuration',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'poll_fk_0',
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
          indexName: 'poll_pkey',
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
      name: 'poll_vote',
      dartName: 'PollVote',
      schema: 'public',
      module: 'civic',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'poll_vote_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'pollId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'voterId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'poll_vote_fk_0',
          columns: ['pollId'],
          referenceTable: 'poll',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        )
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'poll_vote_pkey',
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
          indexName: 'poll_vote_unique_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'pollId',
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
      name: 'pollhashtag',
      dartName: 'PollHashtag',
      schema: 'public',
      module: 'civic',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'pollhashtag_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'tag',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'usageCount',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
      ],
      foreignKeys: [],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'pollhashtag_pkey',
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
      name: 'pollshashtags',
      dartName: 'PollsHashtags',
      schema: 'public',
      module: 'civic',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'pollshashtags_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'pollId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'hashtagId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'pollshashtags_fk_0',
          columns: ['pollId'],
          referenceTable: 'poll',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        ),
        _i2.ForeignKeyDefinition(
          constraintName: 'pollshashtags_fk_1',
          columns: ['hashtagId'],
          referenceTable: 'pollhashtag',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        ),
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'pollshashtags_pkey',
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
          indexName: 'pollhashtags_index_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'pollId',
            ),
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'hashtagId',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: false,
        ),
      ],
      managed: true,
    ),
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
          dartType: 'List<protocol:UserRecord>',
        ),
        _i2.ColumnDefinition(
          name: 'locations',
          columnType: _i2.ColumnType.json,
          isNullable: false,
          dartType: 'List<protocol:AWSPlaces>',
        ),
        _i2.ColumnDefinition(
          name: 'mentions',
          columnType: _i2.ColumnType.json,
          isNullable: false,
          dartType: 'List<protocol:UserRecord>',
        ),
        _i2.ColumnDefinition(
          name: 'tags',
          columnType: _i2.ColumnType.json,
          isNullable: false,
          dartType: 'List<String>',
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
      name: 'posthashtags',
      dartName: 'PostsHashtags',
      schema: 'public',
      module: 'civic',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'posthashtags_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'postId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'hashtagId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'posthashtags_fk_0',
          columns: ['postId'],
          referenceTable: 'post',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        ),
        _i2.ForeignKeyDefinition(
          constraintName: 'posthashtags_fk_1',
          columns: ['hashtagId'],
          referenceTable: 'hashtag',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        ),
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'posthashtags_pkey',
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
          indexName: 'posthashtags_index_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'postId',
            ),
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'hashtagId',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: false,
        ),
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
    if (t == _i5.Example) {
      return _i5.Example.fromJson(data) as T;
    }
    if (t == _i6.LinkMetadata) {
      return _i6.LinkMetadata.fromJson(data) as T;
    }
    if (t == _i7.LocationException) {
      return _i7.LocationException.fromJson(data) as T;
    }
    if (t == _i8.DraftPoll) {
      return _i8.DraftPoll.fromJson(data) as T;
    }
    if (t == _i9.Poll) {
      return _i9.Poll.fromJson(data) as T;
    }
    if (t == _i10.PollHashtag) {
      return _i10.PollHashtag.fromJson(data) as T;
    }
    if (t == _i11.PollsHashtags) {
      return _i11.PollsHashtags.fromJson(data) as T;
    }
    if (t == _i12.PollOption) {
      return _i12.PollOption.fromJson(data) as T;
    }
    if (t == _i13.PollVote) {
      return _i13.PollVote.fromJson(data) as T;
    }
    if (t == _i14.DraftPost) {
      return _i14.DraftPost.fromJson(data) as T;
    }
    if (t == _i15.Hashtag) {
      return _i15.Hashtag.fromJson(data) as T;
    }
    if (t == _i16.Post) {
      return _i16.Post.fromJson(data) as T;
    }
    if (t == _i17.PostException) {
      return _i17.PostException.fromJson(data) as T;
    }
    if (t == _i18.PostList) {
      return _i18.PostList.fromJson(data) as T;
    }
    if (t == _i19.PostType) {
      return _i19.PostType.fromJson(data) as T;
    }
    if (t == _i20.PostsHashtags) {
      return _i20.PostsHashtags.fromJson(data) as T;
    }
    if (t == _i21.PoliticalStatus) {
      return _i21.PoliticalStatus.fromJson(data) as T;
    }
    if (t == _i22.UserException) {
      return _i22.UserException.fromJson(data) as T;
    }
    if (t == _i23.UserNinRecord) {
      return _i23.UserNinRecord.fromJson(data) as T;
    }
    if (t == _i24.UserRecord) {
      return _i24.UserRecord.fromJson(data) as T;
    }
    if (t == _i25.UsersList) {
      return _i25.UsersList.fromJson(data) as T;
    }
    if (t == _i1.getType<_i4.AWSPlaces?>()) {
      return (data != null ? _i4.AWSPlaces.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i5.Example?>()) {
      return (data != null ? _i5.Example.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i6.LinkMetadata?>()) {
      return (data != null ? _i6.LinkMetadata.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i7.LocationException?>()) {
      return (data != null ? _i7.LocationException.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i8.DraftPoll?>()) {
      return (data != null ? _i8.DraftPoll.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i9.Poll?>()) {
      return (data != null ? _i9.Poll.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i10.PollHashtag?>()) {
      return (data != null ? _i10.PollHashtag.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i11.PollsHashtags?>()) {
      return (data != null ? _i11.PollsHashtags.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i12.PollOption?>()) {
      return (data != null ? _i12.PollOption.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i13.PollVote?>()) {
      return (data != null ? _i13.PollVote.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i14.DraftPost?>()) {
      return (data != null ? _i14.DraftPost.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i15.Hashtag?>()) {
      return (data != null ? _i15.Hashtag.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i16.Post?>()) {
      return (data != null ? _i16.Post.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i17.PostException?>()) {
      return (data != null ? _i17.PostException.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i18.PostList?>()) {
      return (data != null ? _i18.PostList.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i19.PostType?>()) {
      return (data != null ? _i19.PostType.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i20.PostsHashtags?>()) {
      return (data != null ? _i20.PostsHashtags.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i21.PoliticalStatus?>()) {
      return (data != null ? _i21.PoliticalStatus.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i22.UserException?>()) {
      return (data != null ? _i22.UserException.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i23.UserNinRecord?>()) {
      return (data != null ? _i23.UserNinRecord.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i24.UserRecord?>()) {
      return (data != null ? _i24.UserRecord.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i25.UsersList?>()) {
      return (data != null ? _i25.UsersList.fromJson(data) : null) as T;
    }
    if (t == List<_i26.UserRecord>) {
      return (data as List).map((e) => deserialize<_i26.UserRecord>(e)).toList()
          as dynamic;
    }
    if (t == List<_i26.AWSPlaces>) {
      return (data as List).map((e) => deserialize<_i26.AWSPlaces>(e)).toList()
          as dynamic;
    }
    if (t == List<String>) {
      return (data as List).map((e) => deserialize<String>(e)).toList()
          as dynamic;
    }
    if (t == _i1.getType<List<_i26.PollsHashtags>?>()) {
      return (data != null
          ? (data as List)
              .map((e) => deserialize<_i26.PollsHashtags>(e))
              .toList()
          : null) as dynamic;
    }
    if (t == _i1.getType<List<_i26.PollsHashtags>?>()) {
      return (data != null
          ? (data as List)
              .map((e) => deserialize<_i26.PollsHashtags>(e))
              .toList()
          : null) as dynamic;
    }
    if (t == _i1.getType<List<_i26.PostsHashtags>?>()) {
      return (data != null
          ? (data as List)
              .map((e) => deserialize<_i26.PostsHashtags>(e))
              .toList()
          : null) as dynamic;
    }
    if (t == _i1.getType<List<_i26.PostsHashtags>?>()) {
      return (data != null
          ? (data as List)
              .map((e) => deserialize<_i26.PostsHashtags>(e))
              .toList()
          : null) as dynamic;
    }
    if (t == List<_i26.Post>) {
      return (data as List).map((e) => deserialize<_i26.Post>(e)).toList()
          as dynamic;
    }
    if (t == List<int>) {
      return (data as List).map((e) => deserialize<int>(e)).toList() as dynamic;
    }
    if (t == List<String>) {
      return (data as List).map((e) => deserialize<String>(e)).toList()
          as dynamic;
    }
    if (t == List<_i27.AWSPlaces>) {
      return (data as List).map((e) => deserialize<_i27.AWSPlaces>(e)).toList()
          as dynamic;
    }
    if (t == List<double>) {
      return (data as List).map((e) => deserialize<double>(e)).toList()
          as dynamic;
    }
    if (t == List<_i28.UserRecord>) {
      return (data as List).map((e) => deserialize<_i28.UserRecord>(e)).toList()
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
    if (data is _i5.Example) {
      return 'Example';
    }
    if (data is _i6.LinkMetadata) {
      return 'LinkMetadata';
    }
    if (data is _i7.LocationException) {
      return 'LocationException';
    }
    if (data is _i8.DraftPoll) {
      return 'DraftPoll';
    }
    if (data is _i9.Poll) {
      return 'Poll';
    }
    if (data is _i10.PollHashtag) {
      return 'PollHashtag';
    }
    if (data is _i11.PollsHashtags) {
      return 'PollsHashtags';
    }
    if (data is _i12.PollOption) {
      return 'PollOption';
    }
    if (data is _i13.PollVote) {
      return 'PollVote';
    }
    if (data is _i14.DraftPost) {
      return 'DraftPost';
    }
    if (data is _i15.Hashtag) {
      return 'Hashtag';
    }
    if (data is _i16.Post) {
      return 'Post';
    }
    if (data is _i17.PostException) {
      return 'PostException';
    }
    if (data is _i18.PostList) {
      return 'PostList';
    }
    if (data is _i19.PostType) {
      return 'PostType';
    }
    if (data is _i20.PostsHashtags) {
      return 'PostsHashtags';
    }
    if (data is _i21.PoliticalStatus) {
      return 'PoliticalStatus';
    }
    if (data is _i22.UserException) {
      return 'UserException';
    }
    if (data is _i23.UserNinRecord) {
      return 'UserNinRecord';
    }
    if (data is _i24.UserRecord) {
      return 'UserRecord';
    }
    if (data is _i25.UsersList) {
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
    if (data['className'] == 'Example') {
      return deserialize<_i5.Example>(data['data']);
    }
    if (data['className'] == 'LinkMetadata') {
      return deserialize<_i6.LinkMetadata>(data['data']);
    }
    if (data['className'] == 'LocationException') {
      return deserialize<_i7.LocationException>(data['data']);
    }
    if (data['className'] == 'DraftPoll') {
      return deserialize<_i8.DraftPoll>(data['data']);
    }
    if (data['className'] == 'Poll') {
      return deserialize<_i9.Poll>(data['data']);
    }
    if (data['className'] == 'PollHashtag') {
      return deserialize<_i10.PollHashtag>(data['data']);
    }
    if (data['className'] == 'PollsHashtags') {
      return deserialize<_i11.PollsHashtags>(data['data']);
    }
    if (data['className'] == 'PollOption') {
      return deserialize<_i12.PollOption>(data['data']);
    }
    if (data['className'] == 'PollVote') {
      return deserialize<_i13.PollVote>(data['data']);
    }
    if (data['className'] == 'DraftPost') {
      return deserialize<_i14.DraftPost>(data['data']);
    }
    if (data['className'] == 'Hashtag') {
      return deserialize<_i15.Hashtag>(data['data']);
    }
    if (data['className'] == 'Post') {
      return deserialize<_i16.Post>(data['data']);
    }
    if (data['className'] == 'PostException') {
      return deserialize<_i17.PostException>(data['data']);
    }
    if (data['className'] == 'PostList') {
      return deserialize<_i18.PostList>(data['data']);
    }
    if (data['className'] == 'PostType') {
      return deserialize<_i19.PostType>(data['data']);
    }
    if (data['className'] == 'PostsHashtags') {
      return deserialize<_i20.PostsHashtags>(data['data']);
    }
    if (data['className'] == 'PoliticalStatus') {
      return deserialize<_i21.PoliticalStatus>(data['data']);
    }
    if (data['className'] == 'UserException') {
      return deserialize<_i22.UserException>(data['data']);
    }
    if (data['className'] == 'UserNinRecord') {
      return deserialize<_i23.UserNinRecord>(data['data']);
    }
    if (data['className'] == 'UserRecord') {
      return deserialize<_i24.UserRecord>(data['data']);
    }
    if (data['className'] == 'UsersList') {
      return deserialize<_i25.UsersList>(data['data']);
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
      case _i9.Poll:
        return _i9.Poll.t;
      case _i10.PollHashtag:
        return _i10.PollHashtag.t;
      case _i11.PollsHashtags:
        return _i11.PollsHashtags.t;
      case _i13.PollVote:
        return _i13.PollVote.t;
      case _i15.Hashtag:
        return _i15.Hashtag.t;
      case _i16.Post:
        return _i16.Post.t;
      case _i20.PostsHashtags:
        return _i20.PostsHashtags.t;
      case _i23.UserNinRecord:
        return _i23.UserNinRecord.t;
      case _i24.UserRecord:
        return _i24.UserRecord.t;
    }
    return null;
  }

  @override
  List<_i2.TableDefinition> getTargetTableDefinitions() =>
      targetTableDefinitions;

  @override
  String getModuleName() => 'civic';
}
