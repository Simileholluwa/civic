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
import 'package:serverpod/protocol.dart' as _i2;
import 'package:serverpod_auth_server/serverpod_auth_server.dart' as _i3;
import 'post/hashtags.dart' as _i4;
import 'general/aws_places.dart' as _i5;
import 'general/link_metadata.dart' as _i6;
import 'general/location_exception.dart' as _i7;
import 'general/post_exception.dart' as _i8;
import 'notification/notification.dart' as _i9;
import 'notification/notification_action_type.dart' as _i10;
import 'notification/notification_list.dart' as _i11;
import 'notification/notification_target_type.dart' as _i12;
import 'notification/notifications_settings.dart' as _i13;
import 'poll/poll.dart' as _i14;
import 'poll/poll_counts.dart' as _i15;
import 'poll/poll_option.dart' as _i16;
import 'poll/poll_option_count.dart' as _i17;
import 'poll/poll_vote.dart' as _i18;
import 'post/engagement_event.dart' as _i19;
import 'article/article.dart' as _i20;
import 'post/impression_log.dart' as _i21;
import 'post/post.dart' as _i22;
import 'post/post_bookmarks.dart' as _i23;
import 'post/post_counts.dart' as _i24;
import 'post/post_impression.dart' as _i25;
import 'post/post_likes.dart' as _i26;
import 'post/post_list.dart' as _i27;
import 'post/post_not_interested.dart' as _i28;
import 'post/post_notif_sub.dart' as _i29;
import 'post/post_type_enums.dart' as _i30;
import 'post/post_with_user_state.dart' as _i31;
import 'post/posts_hashtags.dart' as _i32;
import 'project/feed_project_list.dart' as _i33;
import 'project/project.dart' as _i34;
import 'project/project_bookmarks.dart' as _i35;
import 'user/users_list.dart' as _i36;
import 'project/project_not_interested.dart' as _i37;
import 'project/project_notif_sub.dart' as _i38;
import 'project/project_rating.dart' as _i39;
import 'project/project_review.dart' as _i40;
import 'project/project_review_list.dart' as _i41;
import 'project/project_review_reaction.dart' as _i42;
import 'project/project_vet_list.dart' as _i43;
import 'project/project_vetting.dart' as _i44;
import 'project/project_vetting_reaction.dart' as _i45;
import 'project/project_with_user_state.dart' as _i46;
import 'project/rating_dimension.dart' as _i47;
import 'user/political_status_enum.dart' as _i48;
import 'user/user_device.dart' as _i49;
import 'user/user_follow.dart' as _i50;
import 'user/user_record.dart' as _i51;
import 'project/project_likes.dart' as _i52;
import 'package:civic_server/src/generated/general/aws_places.dart' as _i53;
import 'package:civic_server/src/generated/user/user_record.dart' as _i54;
export 'article/article.dart';
export 'general/aws_places.dart';
export 'general/link_metadata.dart';
export 'general/location_exception.dart';
export 'general/post_exception.dart';
export 'notification/notification.dart';
export 'notification/notification_action_type.dart';
export 'notification/notification_list.dart';
export 'notification/notification_target_type.dart';
export 'notification/notifications_settings.dart';
export 'poll/poll.dart';
export 'poll/poll_counts.dart';
export 'poll/poll_option.dart';
export 'poll/poll_option_count.dart';
export 'poll/poll_vote.dart';
export 'post/engagement_event.dart';
export 'post/hashtags.dart';
export 'post/impression_log.dart';
export 'post/post.dart';
export 'post/post_bookmarks.dart';
export 'post/post_counts.dart';
export 'post/post_impression.dart';
export 'post/post_likes.dart';
export 'post/post_list.dart';
export 'post/post_not_interested.dart';
export 'post/post_notif_sub.dart';
export 'post/post_type_enums.dart';
export 'post/post_with_user_state.dart';
export 'post/posts_hashtags.dart';
export 'project/feed_project_list.dart';
export 'project/project.dart';
export 'project/project_bookmarks.dart';
export 'project/project_likes.dart';
export 'project/project_not_interested.dart';
export 'project/project_notif_sub.dart';
export 'project/project_rating.dart';
export 'project/project_review.dart';
export 'project/project_review_list.dart';
export 'project/project_review_reaction.dart';
export 'project/project_vet_list.dart';
export 'project/project_vetting.dart';
export 'project/project_vetting_reaction.dart';
export 'project/project_with_user_state.dart';
export 'project/rating_dimension.dart';
export 'user/political_status_enum.dart';
export 'user/user_device.dart';
export 'user/user_follow.dart';
export 'user/user_record.dart';
export 'user/users_list.dart';

class Protocol extends _i1.SerializationManagerServer {
  Protocol._();

  factory Protocol() => _instance;

  static final Protocol _instance = Protocol._();

  static final List<_i2.TableDefinition> targetTableDefinitions = [
    _i2.TableDefinition(
      name: 'app_notification',
      dartName: 'AppNotification',
      schema: 'public',
      module: 'civic',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'app_notification_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'receiverId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'senderId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'senderName',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'groupedSenderNames',
          columnType: _i2.ColumnType.json,
          isNullable: true,
          dartType: 'List<String>?',
        ),
        _i2.ColumnDefinition(
          name: 'title',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'body',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'groupKey',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'actionType',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'protocol:NotificationActionType',
        ),
        _i2.ColumnDefinition(
          name: 'senderAvatarUrl',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'targetType',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'protocol:NotificationTargetType',
        ),
        _i2.ColumnDefinition(
          name: 'actionRoute',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'targetId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'isRead',
          columnType: _i2.ColumnType.boolean,
          isNullable: false,
          dartType: 'bool',
          columnDefault: 'false',
        ),
        _i2.ColumnDefinition(
          name: 'createdAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
          columnDefault: 'CURRENT_TIMESTAMP',
        ),
        _i2.ColumnDefinition(
          name: 'updatedAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
        ),
        _i2.ColumnDefinition(
          name: 'postId',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'projectId',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'app_notification_fk_0',
          columns: ['receiverId'],
          referenceTable: 'user_record',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.cascade,
          matchType: null,
        ),
        _i2.ForeignKeyDefinition(
          constraintName: 'app_notification_fk_1',
          columns: ['senderId'],
          referenceTable: 'user_record',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.setNull,
          matchType: null,
        ),
        _i2.ForeignKeyDefinition(
          constraintName: 'app_notification_fk_2',
          columns: ['postId'],
          referenceTable: 'post',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        ),
        _i2.ForeignKeyDefinition(
          constraintName: 'app_notification_fk_3',
          columns: ['projectId'],
          referenceTable: 'project',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        ),
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'app_notification_pkey',
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
          indexName: 'notification_receiver_isread_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'receiverId',
            ),
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'isRead',
            ),
          ],
          type: 'btree',
          isUnique: false,
          isPrimary: false,
        ),
        _i2.IndexDefinition(
          indexName: 'notification_receiver_createdat_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'receiverId',
            ),
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'createdAt',
            ),
          ],
          type: 'btree',
          isUnique: false,
          isPrimary: false,
        ),
      ],
      managed: true,
    ),
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
          name: 'content',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
          columnDefault: '\'\'::text',
        ),
        _i2.ColumnDefinition(
          name: 'tag',
          columnType: _i2.ColumnType.json,
          isNullable: true,
          dartType: 'List<String>?',
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
          onDelete: _i2.ForeignKeyAction.cascade,
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
      name: 'engagement_event',
      dartName: 'EngagementEvent',
      schema: 'public',
      module: 'civic',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'engagement_event_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'userId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'postId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'type',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'createdAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
          columnDefault: 'CURRENT_TIMESTAMP',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'engagement_event_fk_0',
          columns: ['userId'],
          referenceTable: 'user_record',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.cascade,
          matchType: null,
        ),
        _i2.ForeignKeyDefinition(
          constraintName: 'engagement_event_fk_1',
          columns: ['postId'],
          referenceTable: 'post',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.cascade,
          matchType: null,
        ),
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'engagement_event_pkey',
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
          indexName: 'engagement_event_user_post_type_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'userId',
            ),
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'postId',
            ),
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'type',
            ),
          ],
          type: 'btree',
          isUnique: false,
          isPrimary: false,
        ),
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
      name: 'impression_log',
      dartName: 'ImpressionLog',
      schema: 'public',
      module: 'civic',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'impression_log_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'userId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'postIds',
          columnType: _i2.ColumnType.json,
          isNullable: false,
          dartType: 'List<int>',
        ),
        _i2.ColumnDefinition(
          name: 'page',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'createdAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
          columnDefault: 'CURRENT_TIMESTAMP',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'impression_log_fk_0',
          columns: ['userId'],
          referenceTable: 'user_record',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.cascade,
          matchType: null,
        )
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'impression_log_pkey',
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
          indexName: 'impression_log_user_created_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'userId',
            ),
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'createdAt',
            ),
          ],
          type: 'btree',
          isUnique: false,
          isPrimary: false,
        ),
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
          name: 'expiresAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
        ),
        _i2.ColumnDefinition(
          name: 'votesCount',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
          columnDefault: '0',
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
          onDelete: _i2.ForeignKeyAction.cascade,
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
      name: 'poll_option',
      dartName: 'PollOption',
      schema: 'public',
      module: 'civic',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'poll_option_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'pollId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'option',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'votesCount',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
          columnDefault: '0',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'poll_option_fk_0',
          columns: ['pollId'],
          referenceTable: 'poll',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.cascade,
          matchType: null,
        )
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'poll_option_pkey',
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
          name: 'optionId',
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
        _i2.ColumnDefinition(
          name: 'votedAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
          columnDefault: 'CURRENT_TIMESTAMP',
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
          onDelete: _i2.ForeignKeyAction.cascade,
          matchType: null,
        ),
        _i2.ForeignKeyDefinition(
          constraintName: 'poll_vote_fk_1',
          columns: ['optionId'],
          referenceTable: 'poll_option',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.cascade,
          matchType: null,
        ),
        _i2.ForeignKeyDefinition(
          constraintName: 'poll_vote_fk_2',
          columns: ['voterId'],
          referenceTable: 'user_record',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        ),
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
            ),
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'voterId',
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
          isNullable: true,
          dartType: 'protocol:PostType?',
        ),
        _i2.ColumnDefinition(
          name: 'text',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'imageUrls',
          columnType: _i2.ColumnType.json,
          isNullable: true,
          dartType: 'List<String>?',
        ),
        _i2.ColumnDefinition(
          name: 'videoUrl',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
          columnDefault: '\'\'::text',
        ),
        _i2.ColumnDefinition(
          name: 'taggedUsers',
          columnType: _i2.ColumnType.json,
          isNullable: true,
          dartType: 'List<protocol:UserRecord>?',
        ),
        _i2.ColumnDefinition(
          name: 'locations',
          columnType: _i2.ColumnType.json,
          isNullable: true,
          dartType: 'List<protocol:AWSPlaces>?',
        ),
        _i2.ColumnDefinition(
          name: 'mentions',
          columnType: _i2.ColumnType.json,
          isNullable: true,
          dartType: 'List<protocol:UserRecord>?',
        ),
        _i2.ColumnDefinition(
          name: 'tags',
          columnType: _i2.ColumnType.json,
          isNullable: true,
          dartType: 'List<String>?',
        ),
        _i2.ColumnDefinition(
          name: 'dateCreated',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
          columnDefault: 'CURRENT_TIMESTAMP',
        ),
        _i2.ColumnDefinition(
          name: 'updatedAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
        ),
        _i2.ColumnDefinition(
          name: 'likesCount',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
          columnDefault: '0',
        ),
        _i2.ColumnDefinition(
          name: 'bookmarksCount',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
          columnDefault: '0',
        ),
        _i2.ColumnDefinition(
          name: 'commentCount',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
          columnDefault: '0',
        ),
        _i2.ColumnDefinition(
          name: 'pollId',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'articleId',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'projectId',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'parentId',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'isDeleted',
          columnType: _i2.ColumnType.boolean,
          isNullable: true,
          dartType: 'bool?',
          columnDefault: 'false',
        ),
        _i2.ColumnDefinition(
          name: 'impressionsCount',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
          columnDefault: '0',
        ),
        _i2.ColumnDefinition(
          name: 'lastImpressionAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
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
          onDelete: _i2.ForeignKeyAction.cascade,
          matchType: null,
        ),
        _i2.ForeignKeyDefinition(
          constraintName: 'post_fk_1',
          columns: ['pollId'],
          referenceTable: 'poll',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.cascade,
          matchType: null,
        ),
        _i2.ForeignKeyDefinition(
          constraintName: 'post_fk_2',
          columns: ['articleId'],
          referenceTable: 'article',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.cascade,
          matchType: null,
        ),
        _i2.ForeignKeyDefinition(
          constraintName: 'post_fk_3',
          columns: ['projectId'],
          referenceTable: 'project',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.cascade,
          matchType: null,
        ),
        _i2.ForeignKeyDefinition(
          constraintName: 'post_fk_4',
          columns: ['parentId'],
          referenceTable: 'post',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.cascade,
          matchType: null,
        ),
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
        ),
        _i2.IndexDefinition(
          indexName: 'post_type_date_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'postType',
            ),
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'dateCreated',
            ),
          ],
          type: 'btree',
          isUnique: false,
          isPrimary: false,
        ),
        _i2.IndexDefinition(
          indexName: 'post_owner_date_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'ownerId',
            ),
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'dateCreated',
            ),
          ],
          type: 'btree',
          isUnique: false,
          isPrimary: false,
        ),
        _i2.IndexDefinition(
          indexName: 'post_parent_date_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'parentId',
            ),
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'dateCreated',
            ),
          ],
          type: 'btree',
          isUnique: false,
          isPrimary: false,
        ),
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'post_bookmarks',
      dartName: 'PostBookmarks',
      schema: 'public',
      module: 'civic',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'post_bookmarks_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'postId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'ownerId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'dateCreated',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
          columnDefault: 'CURRENT_TIMESTAMP',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'post_bookmarks_fk_0',
          columns: ['postId'],
          referenceTable: 'post',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.cascade,
          matchType: null,
        ),
        _i2.ForeignKeyDefinition(
          constraintName: 'post_bookmarks_fk_1',
          columns: ['ownerId'],
          referenceTable: 'user_record',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.cascade,
          matchType: null,
        ),
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'post_bookmarks_pkey',
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
          indexName: 'post_bookmarks_id_unique_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'postId',
            ),
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'ownerId',
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
      name: 'post_impression',
      dartName: 'PostImpression',
      schema: 'public',
      module: 'civic',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'post_impression_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'postId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'viewerId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'sessionId',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'source',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'hourBucket',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
        ),
        _i2.ColumnDefinition(
          name: 'createdAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
          columnDefault: 'CURRENT_TIMESTAMP',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'post_impression_fk_0',
          columns: ['postId'],
          referenceTable: 'post',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.cascade,
          matchType: null,
        ),
        _i2.ForeignKeyDefinition(
          constraintName: 'post_impression_fk_1',
          columns: ['viewerId'],
          referenceTable: 'user_record',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.cascade,
          matchType: null,
        ),
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'post_impression_pkey',
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
          indexName: 'post_impression_unique_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'postId',
            ),
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'hourBucket',
            ),
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'viewerId',
            ),
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'sessionId',
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
      name: 'post_likes',
      dartName: 'PostLikes',
      schema: 'public',
      module: 'civic',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'post_likes_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'postId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'ownerId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'dateCreated',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'post_likes_fk_0',
          columns: ['postId'],
          referenceTable: 'post',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.cascade,
          matchType: null,
        ),
        _i2.ForeignKeyDefinition(
          constraintName: 'post_likes_fk_1',
          columns: ['ownerId'],
          referenceTable: 'user_record',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.cascade,
          matchType: null,
        ),
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'post_likes_pkey',
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
          indexName: 'post_id_unique_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'postId',
            ),
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'ownerId',
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
      name: 'post_not_interested',
      dartName: 'PostNotInterested',
      schema: 'public',
      module: 'civic',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'post_not_interested_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'userId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'postId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'dateMarked',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
          columnDefault: 'CURRENT_TIMESTAMP',
        ),
        _i2.ColumnDefinition(
          name: 'reason',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'post_not_interested_fk_0',
          columns: ['userId'],
          referenceTable: 'user_record',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.cascade,
          matchType: null,
        ),
        _i2.ForeignKeyDefinition(
          constraintName: 'post_not_interested_fk_1',
          columns: ['postId'],
          referenceTable: 'post',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.cascade,
          matchType: null,
        ),
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'post_not_interested_pkey',
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
          indexName: 'post_not_interested_id_unique_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'userId',
            ),
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'postId',
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
      name: 'post_subscription',
      dartName: 'PostSubscription',
      schema: 'public',
      module: 'civic',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'post_subscription_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'userId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'postId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'createdAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
          columnDefault: 'CURRENT_TIMESTAMP',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'post_subscription_fk_0',
          columns: ['userId'],
          referenceTable: 'user_record',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.cascade,
          matchType: null,
        ),
        _i2.ForeignKeyDefinition(
          constraintName: 'post_subscription_fk_1',
          columns: ['postId'],
          referenceTable: 'post',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.cascade,
          matchType: null,
        ),
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'post_subscription_pkey',
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
          indexName: 'post_notif_unique_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'userId',
            ),
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'postId',
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
          onDelete: _i2.ForeignKeyAction.cascade,
          matchType: null,
        ),
        _i2.ForeignKeyDefinition(
          constraintName: 'posthashtags_fk_1',
          columns: ['hashtagId'],
          referenceTable: 'hashtag',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.cascade,
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
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'description',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'projectCategory',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'projectSubCategory',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'startDate',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
        ),
        _i2.ColumnDefinition(
          name: 'endDate',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
        ),
        _i2.ColumnDefinition(
          name: 'currency',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'fundingCategory',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'fundingSubCategory',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'projectCost',
          columnType: _i2.ColumnType.doublePrecision,
          isNullable: true,
          dartType: 'double?',
        ),
        _i2.ColumnDefinition(
          name: 'fundingNote',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'projectImageAttachments',
          columnType: _i2.ColumnType.json,
          isNullable: true,
          dartType: 'List<String>?',
        ),
        _i2.ColumnDefinition(
          name: 'projectPDFAttachments',
          columnType: _i2.ColumnType.json,
          isNullable: true,
          dartType: 'List<String>?',
        ),
        _i2.ColumnDefinition(
          name: 'physicalLocations',
          columnType: _i2.ColumnType.json,
          isNullable: true,
          dartType: 'List<protocol:AWSPlaces>?',
        ),
        _i2.ColumnDefinition(
          name: 'virtualLocations',
          columnType: _i2.ColumnType.json,
          isNullable: true,
          dartType: 'List<String>?',
        ),
        _i2.ColumnDefinition(
          name: 'dateCreated',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
          columnDefault: 'CURRENT_TIMESTAMP',
        ),
        _i2.ColumnDefinition(
          name: 'updatedAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
        ),
        _i2.ColumnDefinition(
          name: 'likesCount',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
          columnDefault: '0',
        ),
        _i2.ColumnDefinition(
          name: 'reviewsCount',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
          columnDefault: '0',
        ),
        _i2.ColumnDefinition(
          name: 'bookmarksCount',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
          columnDefault: '0',
        ),
        _i2.ColumnDefinition(
          name: 'vettingsCount',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
          columnDefault: '0',
        ),
        _i2.ColumnDefinition(
          name: 'quotesCount',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
          columnDefault: '0',
        ),
        _i2.ColumnDefinition(
          name: 'overallRating',
          columnType: _i2.ColumnType.doublePrecision,
          isNullable: true,
          dartType: 'double?',
        ),
        _i2.ColumnDefinition(
          name: 'overallLocationRating',
          columnType: _i2.ColumnType.doublePrecision,
          isNullable: true,
          dartType: 'double?',
        ),
        _i2.ColumnDefinition(
          name: 'overallDescriptionRating',
          columnType: _i2.ColumnType.doublePrecision,
          isNullable: true,
          dartType: 'double?',
        ),
        _i2.ColumnDefinition(
          name: 'overallDatesRating',
          columnType: _i2.ColumnType.doublePrecision,
          isNullable: true,
          dartType: 'double?',
        ),
        _i2.ColumnDefinition(
          name: 'overallAttachmentsRating',
          columnType: _i2.ColumnType.doublePrecision,
          isNullable: true,
          dartType: 'double?',
        ),
        _i2.ColumnDefinition(
          name: 'overAllCategoryRating',
          columnType: _i2.ColumnType.doublePrecision,
          isNullable: true,
          dartType: 'double?',
        ),
        _i2.ColumnDefinition(
          name: 'overallFundingRating',
          columnType: _i2.ColumnType.doublePrecision,
          isNullable: true,
          dartType: 'double?',
        ),
        _i2.ColumnDefinition(
          name: 'isDeleted',
          columnType: _i2.ColumnType.boolean,
          isNullable: true,
          dartType: 'bool?',
          columnDefault: 'false',
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
          onDelete: _i2.ForeignKeyAction.cascade,
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
        ),
        _i2.IndexDefinition(
          indexName: 'project_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'ownerId',
            ),
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'title',
            ),
          ],
          type: 'btree',
          isUnique: false,
          isPrimary: false,
        ),
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'project_bookmarks',
      dartName: 'ProjectBookmarks',
      schema: 'public',
      module: 'civic',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'project_bookmarks_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'projectId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'ownerId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'dateCreated',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
          columnDefault: 'CURRENT_TIMESTAMP',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'project_bookmarks_fk_0',
          columns: ['projectId'],
          referenceTable: 'project',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.cascade,
          matchType: null,
        ),
        _i2.ForeignKeyDefinition(
          constraintName: 'project_bookmarks_fk_1',
          columns: ['ownerId'],
          referenceTable: 'user_record',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.cascade,
          matchType: null,
        ),
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'project_bookmarks_pkey',
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
          indexName: 'project_bookmarks_id_unique_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'projectId',
            ),
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'ownerId',
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
      name: 'project_likes',
      dartName: 'ProjectLikes',
      schema: 'public',
      module: 'civic',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'project_likes_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'projectId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'ownerId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'dateCreated',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
          columnDefault: 'CURRENT_TIMESTAMP',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'project_likes_fk_0',
          columns: ['projectId'],
          referenceTable: 'project',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.cascade,
          matchType: null,
        ),
        _i2.ForeignKeyDefinition(
          constraintName: 'project_likes_fk_1',
          columns: ['ownerId'],
          referenceTable: 'user_record',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.cascade,
          matchType: null,
        ),
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'project_likes_pkey',
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
          indexName: 'project_id_unique_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'projectId',
            ),
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'ownerId',
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
      name: 'project_not_interested',
      dartName: 'ProjectNotInterested',
      schema: 'public',
      module: 'civic',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'project_not_interested_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'userId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'projectId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'dateMarked',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
          columnDefault: 'CURRENT_TIMESTAMP',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'project_not_interested_fk_0',
          columns: ['userId'],
          referenceTable: 'user_record',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.cascade,
          matchType: null,
        ),
        _i2.ForeignKeyDefinition(
          constraintName: 'project_not_interested_fk_1',
          columns: ['projectId'],
          referenceTable: 'project',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.cascade,
          matchType: null,
        ),
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'project_not_interested_pkey',
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
          indexName: 'project_not_interested_id_unique_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'userId',
            ),
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'projectId',
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
      name: 'project_rating',
      dartName: 'ProjectRating',
      schema: 'public',
      module: 'civic',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'project_rating_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'projectId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'ownerId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'reviewId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'dimension',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'protocol:RatingDimension?',
        ),
        _i2.ColumnDefinition(
          name: 'value',
          columnType: _i2.ColumnType.doublePrecision,
          isNullable: true,
          dartType: 'double?',
        ),
        _i2.ColumnDefinition(
          name: 'dateCreated',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
          columnDefault: 'CURRENT_TIMESTAMP',
        ),
        _i2.ColumnDefinition(
          name: 'updatedAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
        ),
        _i2.ColumnDefinition(
          name: 'isDeleted',
          columnType: _i2.ColumnType.boolean,
          isNullable: true,
          dartType: 'bool?',
          columnDefault: 'false',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'project_rating_fk_0',
          columns: ['projectId'],
          referenceTable: 'project',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.cascade,
          matchType: null,
        ),
        _i2.ForeignKeyDefinition(
          constraintName: 'project_rating_fk_1',
          columns: ['ownerId'],
          referenceTable: 'user_record',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.cascade,
          matchType: null,
        ),
        _i2.ForeignKeyDefinition(
          constraintName: 'project_rating_fk_2',
          columns: ['reviewId'],
          referenceTable: 'project_review',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.setNull,
          matchType: null,
        ),
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'project_rating_pkey',
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
          indexName: 'project_rating_unique',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'projectId',
            ),
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'ownerId',
            ),
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'dimension',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: false,
        ),
        _i2.IndexDefinition(
          indexName: 'project_rating_project_dim_created_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'projectId',
            ),
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'dimension',
            ),
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'dateCreated',
            ),
          ],
          type: 'btree',
          isUnique: false,
          isPrimary: false,
        ),
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'project_review',
      dartName: 'ProjectReview',
      schema: 'public',
      module: 'civic',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'project_review_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'ownerId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'projectId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'review',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'locationRating',
          columnType: _i2.ColumnType.doublePrecision,
          isNullable: true,
          dartType: 'double?',
        ),
        _i2.ColumnDefinition(
          name: 'descriptionRating',
          columnType: _i2.ColumnType.doublePrecision,
          isNullable: true,
          dartType: 'double?',
        ),
        _i2.ColumnDefinition(
          name: 'attachmentsRating',
          columnType: _i2.ColumnType.doublePrecision,
          isNullable: true,
          dartType: 'double?',
        ),
        _i2.ColumnDefinition(
          name: 'categoryRating',
          columnType: _i2.ColumnType.doublePrecision,
          isNullable: true,
          dartType: 'double?',
        ),
        _i2.ColumnDefinition(
          name: 'fundingRating',
          columnType: _i2.ColumnType.doublePrecision,
          isNullable: true,
          dartType: 'double?',
        ),
        _i2.ColumnDefinition(
          name: 'datesRating',
          columnType: _i2.ColumnType.doublePrecision,
          isNullable: true,
          dartType: 'double?',
        ),
        _i2.ColumnDefinition(
          name: 'overallRating',
          columnType: _i2.ColumnType.doublePrecision,
          isNullable: true,
          dartType: 'double?',
        ),
        _i2.ColumnDefinition(
          name: 'dateCreated',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
          columnDefault: 'CURRENT_TIMESTAMP',
        ),
        _i2.ColumnDefinition(
          name: 'updatedAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
        ),
        _i2.ColumnDefinition(
          name: 'likedBy',
          columnType: _i2.ColumnType.json,
          isNullable: true,
          dartType: 'List<int>?',
        ),
        _i2.ColumnDefinition(
          name: 'dislikedBy',
          columnType: _i2.ColumnType.json,
          isNullable: true,
          dartType: 'List<int>?',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'project_review_fk_0',
          columns: ['ownerId'],
          referenceTable: 'user_record',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.cascade,
          matchType: null,
        ),
        _i2.ForeignKeyDefinition(
          constraintName: 'project_review_fk_1',
          columns: ['projectId'],
          referenceTable: 'project',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.cascade,
          matchType: null,
        ),
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'project_review_pkey',
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
      name: 'project_review_reaction',
      dartName: 'ProjectReviewReaction',
      schema: 'public',
      module: 'civic',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault:
              'nextval(\'project_review_reaction_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'ownerId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'reviewId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'dateCreated',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
          columnDefault: 'CURRENT_TIMESTAMP',
        ),
        _i2.ColumnDefinition(
          name: 'updatedAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
        ),
        _i2.ColumnDefinition(
          name: 'isLike',
          columnType: _i2.ColumnType.boolean,
          isNullable: true,
          dartType: 'bool?',
        ),
        _i2.ColumnDefinition(
          name: 'isDeleted',
          columnType: _i2.ColumnType.boolean,
          isNullable: true,
          dartType: 'bool?',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'project_review_reaction_fk_0',
          columns: ['ownerId'],
          referenceTable: 'user_record',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.cascade,
          matchType: null,
        ),
        _i2.ForeignKeyDefinition(
          constraintName: 'project_review_reaction_fk_1',
          columns: ['reviewId'],
          referenceTable: 'project_review',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.cascade,
          matchType: null,
        ),
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'project_review_reaction_pkey',
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
          indexName: 'review_id_unique_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'reviewId',
            ),
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'ownerId',
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
      name: 'project_subscription',
      dartName: 'ProjectSubscription',
      schema: 'public',
      module: 'civic',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'project_subscription_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'userId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'projectId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'createdAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
          columnDefault: 'CURRENT_TIMESTAMP',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'project_subscription_fk_0',
          columns: ['userId'],
          referenceTable: 'user_record',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.cascade,
          matchType: null,
        ),
        _i2.ForeignKeyDefinition(
          constraintName: 'project_subscription_fk_1',
          columns: ['projectId'],
          referenceTable: 'project',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.cascade,
          matchType: null,
        ),
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'project_subscription_pkey',
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
          indexName: 'project_notif_unique_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'userId',
            ),
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'projectId',
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
      name: 'project_vetting',
      dartName: 'ProjectVetting',
      schema: 'public',
      module: 'civic',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'project_vetting_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'projectId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'ownerId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'images',
          columnType: _i2.ColumnType.json,
          isNullable: true,
          dartType: 'List<String>?',
        ),
        _i2.ColumnDefinition(
          name: 'comment',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'status',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'createdAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
          columnDefault: 'CURRENT_TIMESTAMP',
        ),
        _i2.ColumnDefinition(
          name: 'updatedAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
        ),
        _i2.ColumnDefinition(
          name: 'likedBy',
          columnType: _i2.ColumnType.json,
          isNullable: true,
          dartType: 'List<int>?',
        ),
        _i2.ColumnDefinition(
          name: 'dislikedBy',
          columnType: _i2.ColumnType.json,
          isNullable: true,
          dartType: 'List<int>?',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'project_vetting_fk_0',
          columns: ['projectId'],
          referenceTable: 'project',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.cascade,
          matchType: null,
        ),
        _i2.ForeignKeyDefinition(
          constraintName: 'project_vetting_fk_1',
          columns: ['ownerId'],
          referenceTable: 'user_record',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.cascade,
          matchType: null,
        ),
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'project_vetting_pkey',
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
      name: 'project_vetting_reaction',
      dartName: 'ProjectVettingReaction',
      schema: 'public',
      module: 'civic',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault:
              'nextval(\'project_vetting_reaction_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'ownerId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'vettingId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'dateCreated',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
          columnDefault: 'CURRENT_TIMESTAMP',
        ),
        _i2.ColumnDefinition(
          name: 'updatedAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
        ),
        _i2.ColumnDefinition(
          name: 'isLike',
          columnType: _i2.ColumnType.boolean,
          isNullable: true,
          dartType: 'bool?',
        ),
        _i2.ColumnDefinition(
          name: 'isDeleted',
          columnType: _i2.ColumnType.boolean,
          isNullable: true,
          dartType: 'bool?',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'project_vetting_reaction_fk_0',
          columns: ['ownerId'],
          referenceTable: 'user_record',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.cascade,
          matchType: null,
        ),
        _i2.ForeignKeyDefinition(
          constraintName: 'project_vetting_reaction_fk_1',
          columns: ['vettingId'],
          referenceTable: 'project_vetting',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.cascade,
          matchType: null,
        ),
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'project_vetting_reaction_pkey',
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
          indexName: 'vetting_id_unique_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'vettingId',
            ),
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'ownerId',
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
      name: 'user_device',
      dartName: 'UserDevice',
      schema: 'public',
      module: 'civic',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'user_device_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'userInfoId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'token',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'user_device_fk_0',
          columns: ['userInfoId'],
          referenceTable: 'user_record',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.cascade,
          matchType: null,
        )
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'user_device_pkey',
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
          indexName: 'user_device_token_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'token',
            )
          ],
          type: 'btree',
          isUnique: false,
          isPrimary: false,
        ),
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'user_follow',
      dartName: 'UserFollow',
      schema: 'public',
      module: 'civic',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'user_follow_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'followerId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'followeeId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'createdAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
          columnDefault: 'CURRENT_TIMESTAMP',
        ),
      ],
      foreignKeys: [],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'user_follow_pkey',
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
          indexName: 'follower_followee_unique_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'followerId',
            ),
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'followeeId',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: false,
        ),
        _i2.IndexDefinition(
          indexName: 'follower_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'followerId',
            )
          ],
          type: 'btree',
          isUnique: false,
          isPrimary: false,
        ),
        _i2.IndexDefinition(
          indexName: 'followee_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'followeeId',
            )
          ],
          type: 'btree',
          isUnique: false,
          isPrimary: false,
        ),
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'user_notification_settings',
      dartName: 'UserNotificationSettings',
      schema: 'public',
      module: 'civic',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault:
              'nextval(\'user_notification_settings_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'userId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'pauseAllPush',
          columnType: _i2.ColumnType.boolean,
          isNullable: false,
          dartType: 'bool',
          columnDefault: 'false',
        ),
        _i2.ColumnDefinition(
          name: 'allowComments',
          columnType: _i2.ColumnType.boolean,
          isNullable: false,
          dartType: 'bool',
          columnDefault: 'true',
        ),
        _i2.ColumnDefinition(
          name: 'pushComments',
          columnType: _i2.ColumnType.boolean,
          isNullable: false,
          dartType: 'bool',
          columnDefault: 'true',
        ),
        _i2.ColumnDefinition(
          name: 'allowLikes',
          columnType: _i2.ColumnType.boolean,
          isNullable: false,
          dartType: 'bool',
          columnDefault: 'true',
        ),
        _i2.ColumnDefinition(
          name: 'pushLikes',
          columnType: _i2.ColumnType.boolean,
          isNullable: false,
          dartType: 'bool',
          columnDefault: 'true',
        ),
        _i2.ColumnDefinition(
          name: 'allowRepostsAndQuotes',
          columnType: _i2.ColumnType.boolean,
          isNullable: false,
          dartType: 'bool',
          columnDefault: 'true',
        ),
        _i2.ColumnDefinition(
          name: 'pushRepostsAndQuotes',
          columnType: _i2.ColumnType.boolean,
          isNullable: false,
          dartType: 'bool',
          columnDefault: 'true',
        ),
        _i2.ColumnDefinition(
          name: 'allowNewReviews',
          columnType: _i2.ColumnType.boolean,
          isNullable: false,
          dartType: 'bool',
          columnDefault: 'true',
        ),
        _i2.ColumnDefinition(
          name: 'pushNewReviews',
          columnType: _i2.ColumnType.boolean,
          isNullable: false,
          dartType: 'bool',
          columnDefault: 'true',
        ),
        _i2.ColumnDefinition(
          name: 'allowNewVettings',
          columnType: _i2.ColumnType.boolean,
          isNullable: false,
          dartType: 'bool',
          columnDefault: 'true',
        ),
        _i2.ColumnDefinition(
          name: 'pushNewVettings',
          columnType: _i2.ColumnType.boolean,
          isNullable: false,
          dartType: 'bool',
          columnDefault: 'true',
        ),
        _i2.ColumnDefinition(
          name: 'allowReactions',
          columnType: _i2.ColumnType.boolean,
          isNullable: false,
          dartType: 'bool',
          columnDefault: 'true',
        ),
        _i2.ColumnDefinition(
          name: 'pushReactions',
          columnType: _i2.ColumnType.boolean,
          isNullable: false,
          dartType: 'bool',
          columnDefault: 'true',
        ),
        _i2.ColumnDefinition(
          name: 'allowHelpfulReviews',
          columnType: _i2.ColumnType.boolean,
          isNullable: false,
          dartType: 'bool',
          columnDefault: 'true',
        ),
        _i2.ColumnDefinition(
          name: 'pushHelpfulReviews',
          columnType: _i2.ColumnType.boolean,
          isNullable: false,
          dartType: 'bool',
          columnDefault: 'true',
        ),
        _i2.ColumnDefinition(
          name: 'allowSubscribedContent',
          columnType: _i2.ColumnType.boolean,
          isNullable: false,
          dartType: 'bool',
          columnDefault: 'true',
        ),
        _i2.ColumnDefinition(
          name: 'pushSubscribedContent',
          columnType: _i2.ColumnType.boolean,
          isNullable: false,
          dartType: 'bool',
          columnDefault: 'true',
        ),
        _i2.ColumnDefinition(
          name: 'allowMentions',
          columnType: _i2.ColumnType.boolean,
          isNullable: false,
          dartType: 'bool',
          columnDefault: 'true',
        ),
        _i2.ColumnDefinition(
          name: 'pushMentions',
          columnType: _i2.ColumnType.boolean,
          isNullable: false,
          dartType: 'bool',
          columnDefault: 'true',
        ),
        _i2.ColumnDefinition(
          name: 'allowTags',
          columnType: _i2.ColumnType.boolean,
          isNullable: false,
          dartType: 'bool',
          columnDefault: 'true',
        ),
        _i2.ColumnDefinition(
          name: 'pushTags',
          columnType: _i2.ColumnType.boolean,
          isNullable: false,
          dartType: 'bool',
          columnDefault: 'true',
        ),
        _i2.ColumnDefinition(
          name: 'allowNewFollowers',
          columnType: _i2.ColumnType.boolean,
          isNullable: false,
          dartType: 'bool',
          columnDefault: 'true',
        ),
        _i2.ColumnDefinition(
          name: 'pushNewFollowers',
          columnType: _i2.ColumnType.boolean,
          isNullable: false,
          dartType: 'bool',
          columnDefault: 'true',
        ),
        _i2.ColumnDefinition(
          name: 'allowPlatformUpdates',
          columnType: _i2.ColumnType.boolean,
          isNullable: false,
          dartType: 'bool',
          columnDefault: 'true',
        ),
        _i2.ColumnDefinition(
          name: 'pushPlatformUpdates',
          columnType: _i2.ColumnType.boolean,
          isNullable: false,
          dartType: 'bool',
          columnDefault: 'true',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'user_notification_settings_fk_0',
          columns: ['userId'],
          referenceTable: 'user_record',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.cascade,
          matchType: null,
        )
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'user_notification_settings_pkey',
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
          indexName: 'notification_settings_user_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'userId',
            )
          ],
          type: 'btree',
          isUnique: false,
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
          isNullable: true,
          dartType: 'String?',
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
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'firstName',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'lastName',
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
          name: 'birthdate',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'middleName',
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
          name: 'profileImage',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'followersCount',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
          columnDefault: '0',
        ),
        _i2.ColumnDefinition(
          name: 'followingCount',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
          columnDefault: '0',
        ),
        _i2.ColumnDefinition(
          name: 'createdAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
          columnDefault: 'CURRENT_TIMESTAMP',
        ),
        _i2.ColumnDefinition(
          name: 'politicalStatus',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'protocol:PoliticalStatus?',
        ),
        _i2.ColumnDefinition(
          name: 'credibilityScore',
          columnType: _i2.ColumnType.doublePrecision,
          isNullable: true,
          dartType: 'double?',
          columnDefault: '1',
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
          onDelete: _i2.ForeignKeyAction.cascade,
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
            ),
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'email',
            ),
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
    if (t == _i4.Hashtag) {
      return _i4.Hashtag.fromJson(data) as T;
    }
    if (t == _i5.AWSPlaces) {
      return _i5.AWSPlaces.fromJson(data) as T;
    }
    if (t == _i6.LinkMetadata) {
      return _i6.LinkMetadata.fromJson(data) as T;
    }
    if (t == _i7.LocationException) {
      return _i7.LocationException.fromJson(data) as T;
    }
    if (t == _i8.ServerSideException) {
      return _i8.ServerSideException.fromJson(data) as T;
    }
    if (t == _i9.AppNotification) {
      return _i9.AppNotification.fromJson(data) as T;
    }
    if (t == _i10.NotificationActionType) {
      return _i10.NotificationActionType.fromJson(data) as T;
    }
    if (t == _i11.NotificationList) {
      return _i11.NotificationList.fromJson(data) as T;
    }
    if (t == _i12.NotificationTargetType) {
      return _i12.NotificationTargetType.fromJson(data) as T;
    }
    if (t == _i13.UserNotificationSettings) {
      return _i13.UserNotificationSettings.fromJson(data) as T;
    }
    if (t == _i14.Poll) {
      return _i14.Poll.fromJson(data) as T;
    }
    if (t == _i15.PollCounts) {
      return _i15.PollCounts.fromJson(data) as T;
    }
    if (t == _i16.PollOption) {
      return _i16.PollOption.fromJson(data) as T;
    }
    if (t == _i17.PollOptionCount) {
      return _i17.PollOptionCount.fromJson(data) as T;
    }
    if (t == _i18.PollVote) {
      return _i18.PollVote.fromJson(data) as T;
    }
    if (t == _i19.EngagementEvent) {
      return _i19.EngagementEvent.fromJson(data) as T;
    }
    if (t == _i20.Article) {
      return _i20.Article.fromJson(data) as T;
    }
    if (t == _i21.ImpressionLog) {
      return _i21.ImpressionLog.fromJson(data) as T;
    }
    if (t == _i22.Post) {
      return _i22.Post.fromJson(data) as T;
    }
    if (t == _i23.PostBookmarks) {
      return _i23.PostBookmarks.fromJson(data) as T;
    }
    if (t == _i24.PostCounts) {
      return _i24.PostCounts.fromJson(data) as T;
    }
    if (t == _i25.PostImpression) {
      return _i25.PostImpression.fromJson(data) as T;
    }
    if (t == _i26.PostLikes) {
      return _i26.PostLikes.fromJson(data) as T;
    }
    if (t == _i27.PostList) {
      return _i27.PostList.fromJson(data) as T;
    }
    if (t == _i28.PostNotInterested) {
      return _i28.PostNotInterested.fromJson(data) as T;
    }
    if (t == _i29.PostSubscription) {
      return _i29.PostSubscription.fromJson(data) as T;
    }
    if (t == _i30.PostType) {
      return _i30.PostType.fromJson(data) as T;
    }
    if (t == _i31.PostWithUserState) {
      return _i31.PostWithUserState.fromJson(data) as T;
    }
    if (t == _i32.PostsHashtags) {
      return _i32.PostsHashtags.fromJson(data) as T;
    }
    if (t == _i33.FeedProjectList) {
      return _i33.FeedProjectList.fromJson(data) as T;
    }
    if (t == _i34.Project) {
      return _i34.Project.fromJson(data) as T;
    }
    if (t == _i35.ProjectBookmarks) {
      return _i35.ProjectBookmarks.fromJson(data) as T;
    }
    if (t == _i36.UsersList) {
      return _i36.UsersList.fromJson(data) as T;
    }
    if (t == _i37.ProjectNotInterested) {
      return _i37.ProjectNotInterested.fromJson(data) as T;
    }
    if (t == _i38.ProjectSubscription) {
      return _i38.ProjectSubscription.fromJson(data) as T;
    }
    if (t == _i39.ProjectRating) {
      return _i39.ProjectRating.fromJson(data) as T;
    }
    if (t == _i40.ProjectReview) {
      return _i40.ProjectReview.fromJson(data) as T;
    }
    if (t == _i41.ProjectReviewList) {
      return _i41.ProjectReviewList.fromJson(data) as T;
    }
    if (t == _i42.ProjectReviewReaction) {
      return _i42.ProjectReviewReaction.fromJson(data) as T;
    }
    if (t == _i43.ProjectVetList) {
      return _i43.ProjectVetList.fromJson(data) as T;
    }
    if (t == _i44.ProjectVetting) {
      return _i44.ProjectVetting.fromJson(data) as T;
    }
    if (t == _i45.ProjectVettingReaction) {
      return _i45.ProjectVettingReaction.fromJson(data) as T;
    }
    if (t == _i46.ProjectWithUserState) {
      return _i46.ProjectWithUserState.fromJson(data) as T;
    }
    if (t == _i47.RatingDimension) {
      return _i47.RatingDimension.fromJson(data) as T;
    }
    if (t == _i48.PoliticalStatus) {
      return _i48.PoliticalStatus.fromJson(data) as T;
    }
    if (t == _i49.UserDevice) {
      return _i49.UserDevice.fromJson(data) as T;
    }
    if (t == _i50.UserFollow) {
      return _i50.UserFollow.fromJson(data) as T;
    }
    if (t == _i51.UserRecord) {
      return _i51.UserRecord.fromJson(data) as T;
    }
    if (t == _i52.ProjectLikes) {
      return _i52.ProjectLikes.fromJson(data) as T;
    }
    if (t == _i1.getType<_i4.Hashtag?>()) {
      return (data != null ? _i4.Hashtag.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i5.AWSPlaces?>()) {
      return (data != null ? _i5.AWSPlaces.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i6.LinkMetadata?>()) {
      return (data != null ? _i6.LinkMetadata.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i7.LocationException?>()) {
      return (data != null ? _i7.LocationException.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i8.ServerSideException?>()) {
      return (data != null ? _i8.ServerSideException.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i9.AppNotification?>()) {
      return (data != null ? _i9.AppNotification.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i10.NotificationActionType?>()) {
      return (data != null ? _i10.NotificationActionType.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i11.NotificationList?>()) {
      return (data != null ? _i11.NotificationList.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i12.NotificationTargetType?>()) {
      return (data != null ? _i12.NotificationTargetType.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i13.UserNotificationSettings?>()) {
      return (data != null
          ? _i13.UserNotificationSettings.fromJson(data)
          : null) as T;
    }
    if (t == _i1.getType<_i14.Poll?>()) {
      return (data != null ? _i14.Poll.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i15.PollCounts?>()) {
      return (data != null ? _i15.PollCounts.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i16.PollOption?>()) {
      return (data != null ? _i16.PollOption.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i17.PollOptionCount?>()) {
      return (data != null ? _i17.PollOptionCount.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i18.PollVote?>()) {
      return (data != null ? _i18.PollVote.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i19.EngagementEvent?>()) {
      return (data != null ? _i19.EngagementEvent.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i20.Article?>()) {
      return (data != null ? _i20.Article.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i21.ImpressionLog?>()) {
      return (data != null ? _i21.ImpressionLog.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i22.Post?>()) {
      return (data != null ? _i22.Post.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i23.PostBookmarks?>()) {
      return (data != null ? _i23.PostBookmarks.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i24.PostCounts?>()) {
      return (data != null ? _i24.PostCounts.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i25.PostImpression?>()) {
      return (data != null ? _i25.PostImpression.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i26.PostLikes?>()) {
      return (data != null ? _i26.PostLikes.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i27.PostList?>()) {
      return (data != null ? _i27.PostList.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i28.PostNotInterested?>()) {
      return (data != null ? _i28.PostNotInterested.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i29.PostSubscription?>()) {
      return (data != null ? _i29.PostSubscription.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i30.PostType?>()) {
      return (data != null ? _i30.PostType.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i31.PostWithUserState?>()) {
      return (data != null ? _i31.PostWithUserState.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i32.PostsHashtags?>()) {
      return (data != null ? _i32.PostsHashtags.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i33.FeedProjectList?>()) {
      return (data != null ? _i33.FeedProjectList.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i34.Project?>()) {
      return (data != null ? _i34.Project.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i35.ProjectBookmarks?>()) {
      return (data != null ? _i35.ProjectBookmarks.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i36.UsersList?>()) {
      return (data != null ? _i36.UsersList.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i37.ProjectNotInterested?>()) {
      return (data != null ? _i37.ProjectNotInterested.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i38.ProjectSubscription?>()) {
      return (data != null ? _i38.ProjectSubscription.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i39.ProjectRating?>()) {
      return (data != null ? _i39.ProjectRating.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i40.ProjectReview?>()) {
      return (data != null ? _i40.ProjectReview.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i41.ProjectReviewList?>()) {
      return (data != null ? _i41.ProjectReviewList.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i42.ProjectReviewReaction?>()) {
      return (data != null ? _i42.ProjectReviewReaction.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i43.ProjectVetList?>()) {
      return (data != null ? _i43.ProjectVetList.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i44.ProjectVetting?>()) {
      return (data != null ? _i44.ProjectVetting.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i45.ProjectVettingReaction?>()) {
      return (data != null ? _i45.ProjectVettingReaction.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i46.ProjectWithUserState?>()) {
      return (data != null ? _i46.ProjectWithUserState.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i47.RatingDimension?>()) {
      return (data != null ? _i47.RatingDimension.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i48.PoliticalStatus?>()) {
      return (data != null ? _i48.PoliticalStatus.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i49.UserDevice?>()) {
      return (data != null ? _i49.UserDevice.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i50.UserFollow?>()) {
      return (data != null ? _i50.UserFollow.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i51.UserRecord?>()) {
      return (data != null ? _i51.UserRecord.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i52.ProjectLikes?>()) {
      return (data != null ? _i52.ProjectLikes.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<List<_i32.PostsHashtags>?>()) {
      return (data != null
          ? (data as List)
              .map((e) => deserialize<_i32.PostsHashtags>(e))
              .toList()
          : null) as T;
    }
    if (t == _i1.getType<List<String>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<String>(e)).toList()
          : null) as T;
    }
    if (t == List<_i9.AppNotification>) {
      return (data as List)
          .map((e) => deserialize<_i9.AppNotification>(e))
          .toList() as T;
    }
    if (t == _i1.getType<List<_i16.PollOption>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<_i16.PollOption>(e)).toList()
          : null) as T;
    }
    if (t == _i1.getType<List<_i17.PollOptionCount>?>()) {
      return (data != null
          ? (data as List)
              .map((e) => deserialize<_i17.PollOptionCount>(e))
              .toList()
          : null) as T;
    }
    if (t == _i1.getType<List<String>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<String>(e)).toList()
          : null) as T;
    }
    if (t == List<int>) {
      return (data as List).map((e) => deserialize<int>(e)).toList() as T;
    }
    if (t == _i1.getType<List<String>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<String>(e)).toList()
          : null) as T;
    }
    if (t == _i1.getType<List<_i51.UserRecord>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<_i51.UserRecord>(e)).toList()
          : null) as T;
    }
    if (t == _i1.getType<List<_i5.AWSPlaces>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<_i5.AWSPlaces>(e)).toList()
          : null) as T;
    }
    if (t == _i1.getType<List<_i51.UserRecord>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<_i51.UserRecord>(e)).toList()
          : null) as T;
    }
    if (t == _i1.getType<List<String>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<String>(e)).toList()
          : null) as T;
    }
    if (t == _i1.getType<List<_i32.PostsHashtags>?>()) {
      return (data != null
          ? (data as List)
              .map((e) => deserialize<_i32.PostsHashtags>(e))
              .toList()
          : null) as T;
    }
    if (t == List<_i31.PostWithUserState>) {
      return (data as List)
          .map((e) => deserialize<_i31.PostWithUserState>(e))
          .toList() as T;
    }
    if (t == List<_i46.ProjectWithUserState>) {
      return (data as List)
          .map((e) => deserialize<_i46.ProjectWithUserState>(e))
          .toList() as T;
    }
    if (t == _i1.getType<List<String>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<String>(e)).toList()
          : null) as T;
    }
    if (t == _i1.getType<List<String>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<String>(e)).toList()
          : null) as T;
    }
    if (t == _i1.getType<List<_i5.AWSPlaces>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<_i5.AWSPlaces>(e)).toList()
          : null) as T;
    }
    if (t == _i1.getType<List<String>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<String>(e)).toList()
          : null) as T;
    }
    if (t == List<_i51.UserRecord>) {
      return (data as List).map((e) => deserialize<_i51.UserRecord>(e)).toList()
          as T;
    }
    if (t == _i1.getType<List<int>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<int>(e)).toList()
          : null) as T;
    }
    if (t == _i1.getType<List<int>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<int>(e)).toList()
          : null) as T;
    }
    if (t == List<_i40.ProjectReview>) {
      return (data as List)
          .map((e) => deserialize<_i40.ProjectReview>(e))
          .toList() as T;
    }
    if (t == List<_i44.ProjectVetting>) {
      return (data as List)
          .map((e) => deserialize<_i44.ProjectVetting>(e))
          .toList() as T;
    }
    if (t == _i1.getType<List<String>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<String>(e)).toList()
          : null) as T;
    }
    if (t == _i1.getType<List<int>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<int>(e)).toList()
          : null) as T;
    }
    if (t == _i1.getType<List<int>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<int>(e)).toList()
          : null) as T;
    }
    if (t == List<String>) {
      return (data as List).map((e) => deserialize<String>(e)).toList() as T;
    }
    if (t == List<_i53.AWSPlaces>) {
      return (data as List).map((e) => deserialize<_i53.AWSPlaces>(e)).toList()
          as T;
    }
    if (t == List<double>) {
      return (data as List).map((e) => deserialize<double>(e)).toList() as T;
    }
    if (t == List<int>) {
      return (data as List).map((e) => deserialize<int>(e)).toList() as T;
    }
    if (t == List<_i54.UserRecord>) {
      return (data as List).map((e) => deserialize<_i54.UserRecord>(e)).toList()
          as T;
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
    if (data is _i4.Hashtag) {
      return 'Hashtag';
    }
    if (data is _i5.AWSPlaces) {
      return 'AWSPlaces';
    }
    if (data is _i6.LinkMetadata) {
      return 'LinkMetadata';
    }
    if (data is _i7.LocationException) {
      return 'LocationException';
    }
    if (data is _i8.ServerSideException) {
      return 'ServerSideException';
    }
    if (data is _i9.AppNotification) {
      return 'AppNotification';
    }
    if (data is _i10.NotificationActionType) {
      return 'NotificationActionType';
    }
    if (data is _i11.NotificationList) {
      return 'NotificationList';
    }
    if (data is _i12.NotificationTargetType) {
      return 'NotificationTargetType';
    }
    if (data is _i13.UserNotificationSettings) {
      return 'UserNotificationSettings';
    }
    if (data is _i14.Poll) {
      return 'Poll';
    }
    if (data is _i15.PollCounts) {
      return 'PollCounts';
    }
    if (data is _i16.PollOption) {
      return 'PollOption';
    }
    if (data is _i17.PollOptionCount) {
      return 'PollOptionCount';
    }
    if (data is _i18.PollVote) {
      return 'PollVote';
    }
    if (data is _i19.EngagementEvent) {
      return 'EngagementEvent';
    }
    if (data is _i20.Article) {
      return 'Article';
    }
    if (data is _i21.ImpressionLog) {
      return 'ImpressionLog';
    }
    if (data is _i22.Post) {
      return 'Post';
    }
    if (data is _i23.PostBookmarks) {
      return 'PostBookmarks';
    }
    if (data is _i24.PostCounts) {
      return 'PostCounts';
    }
    if (data is _i25.PostImpression) {
      return 'PostImpression';
    }
    if (data is _i26.PostLikes) {
      return 'PostLikes';
    }
    if (data is _i27.PostList) {
      return 'PostList';
    }
    if (data is _i28.PostNotInterested) {
      return 'PostNotInterested';
    }
    if (data is _i29.PostSubscription) {
      return 'PostSubscription';
    }
    if (data is _i30.PostType) {
      return 'PostType';
    }
    if (data is _i31.PostWithUserState) {
      return 'PostWithUserState';
    }
    if (data is _i32.PostsHashtags) {
      return 'PostsHashtags';
    }
    if (data is _i33.FeedProjectList) {
      return 'FeedProjectList';
    }
    if (data is _i34.Project) {
      return 'Project';
    }
    if (data is _i35.ProjectBookmarks) {
      return 'ProjectBookmarks';
    }
    if (data is _i36.UsersList) {
      return 'UsersList';
    }
    if (data is _i37.ProjectNotInterested) {
      return 'ProjectNotInterested';
    }
    if (data is _i38.ProjectSubscription) {
      return 'ProjectSubscription';
    }
    if (data is _i39.ProjectRating) {
      return 'ProjectRating';
    }
    if (data is _i40.ProjectReview) {
      return 'ProjectReview';
    }
    if (data is _i41.ProjectReviewList) {
      return 'ProjectReviewList';
    }
    if (data is _i42.ProjectReviewReaction) {
      return 'ProjectReviewReaction';
    }
    if (data is _i43.ProjectVetList) {
      return 'ProjectVetList';
    }
    if (data is _i44.ProjectVetting) {
      return 'ProjectVetting';
    }
    if (data is _i45.ProjectVettingReaction) {
      return 'ProjectVettingReaction';
    }
    if (data is _i46.ProjectWithUserState) {
      return 'ProjectWithUserState';
    }
    if (data is _i47.RatingDimension) {
      return 'RatingDimension';
    }
    if (data is _i48.PoliticalStatus) {
      return 'PoliticalStatus';
    }
    if (data is _i49.UserDevice) {
      return 'UserDevice';
    }
    if (data is _i50.UserFollow) {
      return 'UserFollow';
    }
    if (data is _i51.UserRecord) {
      return 'UserRecord';
    }
    if (data is _i52.ProjectLikes) {
      return 'ProjectLikes';
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
    var dataClassName = data['className'];
    if (dataClassName is! String) {
      return super.deserializeByClassName(data);
    }
    if (dataClassName == 'Hashtag') {
      return deserialize<_i4.Hashtag>(data['data']);
    }
    if (dataClassName == 'AWSPlaces') {
      return deserialize<_i5.AWSPlaces>(data['data']);
    }
    if (dataClassName == 'LinkMetadata') {
      return deserialize<_i6.LinkMetadata>(data['data']);
    }
    if (dataClassName == 'LocationException') {
      return deserialize<_i7.LocationException>(data['data']);
    }
    if (dataClassName == 'ServerSideException') {
      return deserialize<_i8.ServerSideException>(data['data']);
    }
    if (dataClassName == 'AppNotification') {
      return deserialize<_i9.AppNotification>(data['data']);
    }
    if (dataClassName == 'NotificationActionType') {
      return deserialize<_i10.NotificationActionType>(data['data']);
    }
    if (dataClassName == 'NotificationList') {
      return deserialize<_i11.NotificationList>(data['data']);
    }
    if (dataClassName == 'NotificationTargetType') {
      return deserialize<_i12.NotificationTargetType>(data['data']);
    }
    if (dataClassName == 'UserNotificationSettings') {
      return deserialize<_i13.UserNotificationSettings>(data['data']);
    }
    if (dataClassName == 'Poll') {
      return deserialize<_i14.Poll>(data['data']);
    }
    if (dataClassName == 'PollCounts') {
      return deserialize<_i15.PollCounts>(data['data']);
    }
    if (dataClassName == 'PollOption') {
      return deserialize<_i16.PollOption>(data['data']);
    }
    if (dataClassName == 'PollOptionCount') {
      return deserialize<_i17.PollOptionCount>(data['data']);
    }
    if (dataClassName == 'PollVote') {
      return deserialize<_i18.PollVote>(data['data']);
    }
    if (dataClassName == 'EngagementEvent') {
      return deserialize<_i19.EngagementEvent>(data['data']);
    }
    if (dataClassName == 'Article') {
      return deserialize<_i20.Article>(data['data']);
    }
    if (dataClassName == 'ImpressionLog') {
      return deserialize<_i21.ImpressionLog>(data['data']);
    }
    if (dataClassName == 'Post') {
      return deserialize<_i22.Post>(data['data']);
    }
    if (dataClassName == 'PostBookmarks') {
      return deserialize<_i23.PostBookmarks>(data['data']);
    }
    if (dataClassName == 'PostCounts') {
      return deserialize<_i24.PostCounts>(data['data']);
    }
    if (dataClassName == 'PostImpression') {
      return deserialize<_i25.PostImpression>(data['data']);
    }
    if (dataClassName == 'PostLikes') {
      return deserialize<_i26.PostLikes>(data['data']);
    }
    if (dataClassName == 'PostList') {
      return deserialize<_i27.PostList>(data['data']);
    }
    if (dataClassName == 'PostNotInterested') {
      return deserialize<_i28.PostNotInterested>(data['data']);
    }
    if (dataClassName == 'PostSubscription') {
      return deserialize<_i29.PostSubscription>(data['data']);
    }
    if (dataClassName == 'PostType') {
      return deserialize<_i30.PostType>(data['data']);
    }
    if (dataClassName == 'PostWithUserState') {
      return deserialize<_i31.PostWithUserState>(data['data']);
    }
    if (dataClassName == 'PostsHashtags') {
      return deserialize<_i32.PostsHashtags>(data['data']);
    }
    if (dataClassName == 'FeedProjectList') {
      return deserialize<_i33.FeedProjectList>(data['data']);
    }
    if (dataClassName == 'Project') {
      return deserialize<_i34.Project>(data['data']);
    }
    if (dataClassName == 'ProjectBookmarks') {
      return deserialize<_i35.ProjectBookmarks>(data['data']);
    }
    if (dataClassName == 'UsersList') {
      return deserialize<_i36.UsersList>(data['data']);
    }
    if (dataClassName == 'ProjectNotInterested') {
      return deserialize<_i37.ProjectNotInterested>(data['data']);
    }
    if (dataClassName == 'ProjectSubscription') {
      return deserialize<_i38.ProjectSubscription>(data['data']);
    }
    if (dataClassName == 'ProjectRating') {
      return deserialize<_i39.ProjectRating>(data['data']);
    }
    if (dataClassName == 'ProjectReview') {
      return deserialize<_i40.ProjectReview>(data['data']);
    }
    if (dataClassName == 'ProjectReviewList') {
      return deserialize<_i41.ProjectReviewList>(data['data']);
    }
    if (dataClassName == 'ProjectReviewReaction') {
      return deserialize<_i42.ProjectReviewReaction>(data['data']);
    }
    if (dataClassName == 'ProjectVetList') {
      return deserialize<_i43.ProjectVetList>(data['data']);
    }
    if (dataClassName == 'ProjectVetting') {
      return deserialize<_i44.ProjectVetting>(data['data']);
    }
    if (dataClassName == 'ProjectVettingReaction') {
      return deserialize<_i45.ProjectVettingReaction>(data['data']);
    }
    if (dataClassName == 'ProjectWithUserState') {
      return deserialize<_i46.ProjectWithUserState>(data['data']);
    }
    if (dataClassName == 'RatingDimension') {
      return deserialize<_i47.RatingDimension>(data['data']);
    }
    if (dataClassName == 'PoliticalStatus') {
      return deserialize<_i48.PoliticalStatus>(data['data']);
    }
    if (dataClassName == 'UserDevice') {
      return deserialize<_i49.UserDevice>(data['data']);
    }
    if (dataClassName == 'UserFollow') {
      return deserialize<_i50.UserFollow>(data['data']);
    }
    if (dataClassName == 'UserRecord') {
      return deserialize<_i51.UserRecord>(data['data']);
    }
    if (dataClassName == 'ProjectLikes') {
      return deserialize<_i52.ProjectLikes>(data['data']);
    }
    if (dataClassName.startsWith('serverpod.')) {
      data['className'] = dataClassName.substring(10);
      return _i2.Protocol().deserializeByClassName(data);
    }
    if (dataClassName.startsWith('serverpod_auth.')) {
      data['className'] = dataClassName.substring(15);
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
      case _i20.Article:
        return _i20.Article.t;
      case _i9.AppNotification:
        return _i9.AppNotification.t;
      case _i13.UserNotificationSettings:
        return _i13.UserNotificationSettings.t;
      case _i14.Poll:
        return _i14.Poll.t;
      case _i16.PollOption:
        return _i16.PollOption.t;
      case _i18.PollVote:
        return _i18.PollVote.t;
      case _i19.EngagementEvent:
        return _i19.EngagementEvent.t;
      case _i4.Hashtag:
        return _i4.Hashtag.t;
      case _i21.ImpressionLog:
        return _i21.ImpressionLog.t;
      case _i22.Post:
        return _i22.Post.t;
      case _i23.PostBookmarks:
        return _i23.PostBookmarks.t;
      case _i25.PostImpression:
        return _i25.PostImpression.t;
      case _i26.PostLikes:
        return _i26.PostLikes.t;
      case _i28.PostNotInterested:
        return _i28.PostNotInterested.t;
      case _i29.PostSubscription:
        return _i29.PostSubscription.t;
      case _i32.PostsHashtags:
        return _i32.PostsHashtags.t;
      case _i34.Project:
        return _i34.Project.t;
      case _i35.ProjectBookmarks:
        return _i35.ProjectBookmarks.t;
      case _i52.ProjectLikes:
        return _i52.ProjectLikes.t;
      case _i37.ProjectNotInterested:
        return _i37.ProjectNotInterested.t;
      case _i38.ProjectSubscription:
        return _i38.ProjectSubscription.t;
      case _i39.ProjectRating:
        return _i39.ProjectRating.t;
      case _i40.ProjectReview:
        return _i40.ProjectReview.t;
      case _i42.ProjectReviewReaction:
        return _i42.ProjectReviewReaction.t;
      case _i44.ProjectVetting:
        return _i44.ProjectVetting.t;
      case _i45.ProjectVettingReaction:
        return _i45.ProjectVettingReaction.t;
      case _i49.UserDevice:
        return _i49.UserDevice.t;
      case _i50.UserFollow:
        return _i50.UserFollow.t;
      case _i51.UserRecord:
        return _i51.UserRecord.t;
    }
    return null;
  }

  @override
  List<_i2.TableDefinition> getTargetTableDefinitions() =>
      targetTableDefinitions;

  @override
  String getModuleName() => 'civic';
}
