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
import 'article/article.dart' as _i4;
import 'article/article_draft.dart' as _i5;
import 'article/article_list.dart' as _i6;
import 'general/aws_places.dart' as _i7;
import 'general/example.dart' as _i8;
import 'general/link_metadata.dart' as _i9;
import 'general/location_exception.dart' as _i10;
import 'poll/draft_poll.dart' as _i11;
import 'poll/poll.dart' as _i12;
import 'poll/poll_hashtag.dart' as _i13;
import 'poll/poll_hashtags.dart' as _i14;
import 'poll/poll_option.dart' as _i15;
import 'poll/poll_vote.dart' as _i16;
import 'post/draft_post.dart' as _i17;
import 'post/hashtags.dart' as _i18;
import 'post/post.dart' as _i19;
import 'post/post_exception.dart' as _i20;
import 'post/post_list.dart' as _i21;
import 'post/post_type_enums.dart' as _i22;
import 'post/posts_hashtags.dart' as _i23;
import 'project/project.dart' as _i24;
import 'project/project_list.dart' as _i25;
import 'project/project_status.dart' as _i26;
import 'user/political_status_enum.dart' as _i27;
import 'user/user_exception.dart' as _i28;
import 'user/user_nin_record.dart' as _i29;
import 'user/user_record.dart' as _i30;
import 'user/users_list.dart' as _i31;
import 'protocol.dart' as _i32;
import 'package:civic_server/src/generated/general/aws_places.dart' as _i33;
import 'package:civic_server/src/generated/user/user_record.dart' as _i34;
export 'article/article.dart';
export 'article/article_draft.dart';
export 'article/article_list.dart';
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
export 'project/project.dart';
export 'project/project_list.dart';
export 'project/project_status.dart';
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
      name: 'article',
      dartName: 'Article',
      schema: 'public',
      module: 'civic',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'article_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'ownerId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'title',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'content',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'banner',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'article_fk_0',
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
          indexName: 'article_pkey',
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
          name: 'createdAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
        ),
        _i2.ColumnDefinition(
          name: 'pollDuration',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
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
      name: 'project',
      dartName: 'Project',
      schema: 'public',
      module: 'civic',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'project_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'ownerId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'title',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'description',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'category',
          columnType: _i2.ColumnType.json,
          isNullable: false,
          dartType: 'List<String>',
        ),
        _i2.ColumnDefinition(
          name: 'status',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'protocol:ProjectStatus',
        ),
        _i2.ColumnDefinition(
          name: 'images',
          columnType: _i2.ColumnType.json,
          isNullable: false,
          dartType: 'List<String>',
        ),
        _i2.ColumnDefinition(
          name: 'startDate',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
        _i2.ColumnDefinition(
          name: 'endDate',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
        _i2.ColumnDefinition(
          name: 'completionRate',
          columnType: _i2.ColumnType.doublePrecision,
          isNullable: true,
          dartType: 'double?',
        ),
        _i2.ColumnDefinition(
          name: 'cost',
          columnType: _i2.ColumnType.doublePrecision,
          isNullable: true,
          dartType: 'double?',
        ),
        _i2.ColumnDefinition(
          name: 'currency',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'locations',
          columnType: _i2.ColumnType.json,
          isNullable: true,
          dartType: 'List<protocol:AWSPlaces>?',
        ),
        _i2.ColumnDefinition(
          name: 'fundingSources',
          columnType: _i2.ColumnType.json,
          isNullable: true,
          dartType: 'List<String>?',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'project_fk_0',
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
          indexName: 'project_pkey',
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
    if (t == _i4.Article) {
      return _i4.Article.fromJson(data) as T;
    }
    if (t == _i5.ArticleDraft) {
      return _i5.ArticleDraft.fromJson(data) as T;
    }
    if (t == _i6.ArticleList) {
      return _i6.ArticleList.fromJson(data) as T;
    }
    if (t == _i7.AWSPlaces) {
      return _i7.AWSPlaces.fromJson(data) as T;
    }
    if (t == _i8.Example) {
      return _i8.Example.fromJson(data) as T;
    }
    if (t == _i9.LinkMetadata) {
      return _i9.LinkMetadata.fromJson(data) as T;
    }
    if (t == _i10.LocationException) {
      return _i10.LocationException.fromJson(data) as T;
    }
    if (t == _i11.DraftPoll) {
      return _i11.DraftPoll.fromJson(data) as T;
    }
    if (t == _i12.Poll) {
      return _i12.Poll.fromJson(data) as T;
    }
    if (t == _i13.PollHashtag) {
      return _i13.PollHashtag.fromJson(data) as T;
    }
    if (t == _i14.PollsHashtags) {
      return _i14.PollsHashtags.fromJson(data) as T;
    }
    if (t == _i15.PollOption) {
      return _i15.PollOption.fromJson(data) as T;
    }
    if (t == _i16.PollVote) {
      return _i16.PollVote.fromJson(data) as T;
    }
    if (t == _i17.DraftPost) {
      return _i17.DraftPost.fromJson(data) as T;
    }
    if (t == _i18.Hashtag) {
      return _i18.Hashtag.fromJson(data) as T;
    }
    if (t == _i19.Post) {
      return _i19.Post.fromJson(data) as T;
    }
    if (t == _i20.PostException) {
      return _i20.PostException.fromJson(data) as T;
    }
    if (t == _i21.PostList) {
      return _i21.PostList.fromJson(data) as T;
    }
    if (t == _i22.PostType) {
      return _i22.PostType.fromJson(data) as T;
    }
    if (t == _i23.PostsHashtags) {
      return _i23.PostsHashtags.fromJson(data) as T;
    }
    if (t == _i24.Project) {
      return _i24.Project.fromJson(data) as T;
    }
    if (t == _i25.ProjectList) {
      return _i25.ProjectList.fromJson(data) as T;
    }
    if (t == _i26.ProjectStatus) {
      return _i26.ProjectStatus.fromJson(data) as T;
    }
    if (t == _i27.PoliticalStatus) {
      return _i27.PoliticalStatus.fromJson(data) as T;
    }
    if (t == _i28.UserException) {
      return _i28.UserException.fromJson(data) as T;
    }
    if (t == _i29.UserNinRecord) {
      return _i29.UserNinRecord.fromJson(data) as T;
    }
    if (t == _i30.UserRecord) {
      return _i30.UserRecord.fromJson(data) as T;
    }
    if (t == _i31.UsersList) {
      return _i31.UsersList.fromJson(data) as T;
    }
    if (t == _i1.getType<_i4.Article?>()) {
      return (data != null ? _i4.Article.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i5.ArticleDraft?>()) {
      return (data != null ? _i5.ArticleDraft.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i6.ArticleList?>()) {
      return (data != null ? _i6.ArticleList.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i7.AWSPlaces?>()) {
      return (data != null ? _i7.AWSPlaces.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i8.Example?>()) {
      return (data != null ? _i8.Example.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i9.LinkMetadata?>()) {
      return (data != null ? _i9.LinkMetadata.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i10.LocationException?>()) {
      return (data != null ? _i10.LocationException.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i11.DraftPoll?>()) {
      return (data != null ? _i11.DraftPoll.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i12.Poll?>()) {
      return (data != null ? _i12.Poll.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i13.PollHashtag?>()) {
      return (data != null ? _i13.PollHashtag.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i14.PollsHashtags?>()) {
      return (data != null ? _i14.PollsHashtags.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i15.PollOption?>()) {
      return (data != null ? _i15.PollOption.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i16.PollVote?>()) {
      return (data != null ? _i16.PollVote.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i17.DraftPost?>()) {
      return (data != null ? _i17.DraftPost.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i18.Hashtag?>()) {
      return (data != null ? _i18.Hashtag.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i19.Post?>()) {
      return (data != null ? _i19.Post.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i20.PostException?>()) {
      return (data != null ? _i20.PostException.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i21.PostList?>()) {
      return (data != null ? _i21.PostList.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i22.PostType?>()) {
      return (data != null ? _i22.PostType.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i23.PostsHashtags?>()) {
      return (data != null ? _i23.PostsHashtags.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i24.Project?>()) {
      return (data != null ? _i24.Project.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i25.ProjectList?>()) {
      return (data != null ? _i25.ProjectList.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i26.ProjectStatus?>()) {
      return (data != null ? _i26.ProjectStatus.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i27.PoliticalStatus?>()) {
      return (data != null ? _i27.PoliticalStatus.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i28.UserException?>()) {
      return (data != null ? _i28.UserException.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i29.UserNinRecord?>()) {
      return (data != null ? _i29.UserNinRecord.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i30.UserRecord?>()) {
      return (data != null ? _i30.UserRecord.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i31.UsersList?>()) {
      return (data != null ? _i31.UsersList.fromJson(data) : null) as T;
    }
    if (t == List<_i32.Article>) {
      return (data as List).map((e) => deserialize<_i32.Article>(e)).toList()
          as dynamic;
    }
    if (t == List<_i32.UserRecord>) {
      return (data as List).map((e) => deserialize<_i32.UserRecord>(e)).toList()
          as dynamic;
    }
    if (t == List<_i32.AWSPlaces>) {
      return (data as List).map((e) => deserialize<_i32.AWSPlaces>(e)).toList()
          as dynamic;
    }
    if (t == List<String>) {
      return (data as List).map((e) => deserialize<String>(e)).toList()
          as dynamic;
    }
    if (t == _i1.getType<List<_i32.PollsHashtags>?>()) {
      return (data != null
          ? (data as List)
              .map((e) => deserialize<_i32.PollsHashtags>(e))
              .toList()
          : null) as dynamic;
    }
    if (t == _i1.getType<List<_i32.PollsHashtags>?>()) {
      return (data != null
          ? (data as List)
              .map((e) => deserialize<_i32.PollsHashtags>(e))
              .toList()
          : null) as dynamic;
    }
    if (t == _i1.getType<List<_i32.PostsHashtags>?>()) {
      return (data != null
          ? (data as List)
              .map((e) => deserialize<_i32.PostsHashtags>(e))
              .toList()
          : null) as dynamic;
    }
    if (t == _i1.getType<List<_i32.PostsHashtags>?>()) {
      return (data != null
          ? (data as List)
              .map((e) => deserialize<_i32.PostsHashtags>(e))
              .toList()
          : null) as dynamic;
    }
    if (t == List<_i32.Post>) {
      return (data as List).map((e) => deserialize<_i32.Post>(e)).toList()
          as dynamic;
    }
    if (t == _i1.getType<List<_i32.AWSPlaces>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<_i32.AWSPlaces>(e)).toList()
          : null) as dynamic;
    }
    if (t == _i1.getType<List<String>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<String>(e)).toList()
          : null) as dynamic;
    }
    if (t == List<_i32.Project>) {
      return (data as List).map((e) => deserialize<_i32.Project>(e)).toList()
          as dynamic;
    }
    if (t == List<int>) {
      return (data as List).map((e) => deserialize<int>(e)).toList() as dynamic;
    }
    if (t == List<String>) {
      return (data as List).map((e) => deserialize<String>(e)).toList()
          as dynamic;
    }
    if (t == List<_i33.AWSPlaces>) {
      return (data as List).map((e) => deserialize<_i33.AWSPlaces>(e)).toList()
          as dynamic;
    }
    if (t == List<double>) {
      return (data as List).map((e) => deserialize<double>(e)).toList()
          as dynamic;
    }
    if (t == List<_i34.UserRecord>) {
      return (data as List).map((e) => deserialize<_i34.UserRecord>(e)).toList()
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
    if (data is _i4.Article) {
      return 'Article';
    }
    if (data is _i5.ArticleDraft) {
      return 'ArticleDraft';
    }
    if (data is _i6.ArticleList) {
      return 'ArticleList';
    }
    if (data is _i7.AWSPlaces) {
      return 'AWSPlaces';
    }
    if (data is _i8.Example) {
      return 'Example';
    }
    if (data is _i9.LinkMetadata) {
      return 'LinkMetadata';
    }
    if (data is _i10.LocationException) {
      return 'LocationException';
    }
    if (data is _i11.DraftPoll) {
      return 'DraftPoll';
    }
    if (data is _i12.Poll) {
      return 'Poll';
    }
    if (data is _i13.PollHashtag) {
      return 'PollHashtag';
    }
    if (data is _i14.PollsHashtags) {
      return 'PollsHashtags';
    }
    if (data is _i15.PollOption) {
      return 'PollOption';
    }
    if (data is _i16.PollVote) {
      return 'PollVote';
    }
    if (data is _i17.DraftPost) {
      return 'DraftPost';
    }
    if (data is _i18.Hashtag) {
      return 'Hashtag';
    }
    if (data is _i19.Post) {
      return 'Post';
    }
    if (data is _i20.PostException) {
      return 'PostException';
    }
    if (data is _i21.PostList) {
      return 'PostList';
    }
    if (data is _i22.PostType) {
      return 'PostType';
    }
    if (data is _i23.PostsHashtags) {
      return 'PostsHashtags';
    }
    if (data is _i24.Project) {
      return 'Project';
    }
    if (data is _i25.ProjectList) {
      return 'ProjectList';
    }
    if (data is _i26.ProjectStatus) {
      return 'ProjectStatus';
    }
    if (data is _i27.PoliticalStatus) {
      return 'PoliticalStatus';
    }
    if (data is _i28.UserException) {
      return 'UserException';
    }
    if (data is _i29.UserNinRecord) {
      return 'UserNinRecord';
    }
    if (data is _i30.UserRecord) {
      return 'UserRecord';
    }
    if (data is _i31.UsersList) {
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
    if (data['className'] == 'Article') {
      return deserialize<_i4.Article>(data['data']);
    }
    if (data['className'] == 'ArticleDraft') {
      return deserialize<_i5.ArticleDraft>(data['data']);
    }
    if (data['className'] == 'ArticleList') {
      return deserialize<_i6.ArticleList>(data['data']);
    }
    if (data['className'] == 'AWSPlaces') {
      return deserialize<_i7.AWSPlaces>(data['data']);
    }
    if (data['className'] == 'Example') {
      return deserialize<_i8.Example>(data['data']);
    }
    if (data['className'] == 'LinkMetadata') {
      return deserialize<_i9.LinkMetadata>(data['data']);
    }
    if (data['className'] == 'LocationException') {
      return deserialize<_i10.LocationException>(data['data']);
    }
    if (data['className'] == 'DraftPoll') {
      return deserialize<_i11.DraftPoll>(data['data']);
    }
    if (data['className'] == 'Poll') {
      return deserialize<_i12.Poll>(data['data']);
    }
    if (data['className'] == 'PollHashtag') {
      return deserialize<_i13.PollHashtag>(data['data']);
    }
    if (data['className'] == 'PollsHashtags') {
      return deserialize<_i14.PollsHashtags>(data['data']);
    }
    if (data['className'] == 'PollOption') {
      return deserialize<_i15.PollOption>(data['data']);
    }
    if (data['className'] == 'PollVote') {
      return deserialize<_i16.PollVote>(data['data']);
    }
    if (data['className'] == 'DraftPost') {
      return deserialize<_i17.DraftPost>(data['data']);
    }
    if (data['className'] == 'Hashtag') {
      return deserialize<_i18.Hashtag>(data['data']);
    }
    if (data['className'] == 'Post') {
      return deserialize<_i19.Post>(data['data']);
    }
    if (data['className'] == 'PostException') {
      return deserialize<_i20.PostException>(data['data']);
    }
    if (data['className'] == 'PostList') {
      return deserialize<_i21.PostList>(data['data']);
    }
    if (data['className'] == 'PostType') {
      return deserialize<_i22.PostType>(data['data']);
    }
    if (data['className'] == 'PostsHashtags') {
      return deserialize<_i23.PostsHashtags>(data['data']);
    }
    if (data['className'] == 'Project') {
      return deserialize<_i24.Project>(data['data']);
    }
    if (data['className'] == 'ProjectList') {
      return deserialize<_i25.ProjectList>(data['data']);
    }
    if (data['className'] == 'ProjectStatus') {
      return deserialize<_i26.ProjectStatus>(data['data']);
    }
    if (data['className'] == 'PoliticalStatus') {
      return deserialize<_i27.PoliticalStatus>(data['data']);
    }
    if (data['className'] == 'UserException') {
      return deserialize<_i28.UserException>(data['data']);
    }
    if (data['className'] == 'UserNinRecord') {
      return deserialize<_i29.UserNinRecord>(data['data']);
    }
    if (data['className'] == 'UserRecord') {
      return deserialize<_i30.UserRecord>(data['data']);
    }
    if (data['className'] == 'UsersList') {
      return deserialize<_i31.UsersList>(data['data']);
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
      case _i4.Article:
        return _i4.Article.t;
      case _i12.Poll:
        return _i12.Poll.t;
      case _i13.PollHashtag:
        return _i13.PollHashtag.t;
      case _i14.PollsHashtags:
        return _i14.PollsHashtags.t;
      case _i16.PollVote:
        return _i16.PollVote.t;
      case _i18.Hashtag:
        return _i18.Hashtag.t;
      case _i19.Post:
        return _i19.Post.t;
      case _i23.PostsHashtags:
        return _i23.PostsHashtags.t;
      case _i24.Project:
        return _i24.Project.t;
      case _i29.UserNinRecord:
        return _i29.UserNinRecord.t;
      case _i30.UserRecord:
        return _i30.UserRecord.t;
    }
    return null;
  }

  @override
  List<_i2.TableDefinition> getTargetTableDefinitions() =>
      targetTableDefinitions;

  @override
  String getModuleName() => 'civic';
}
