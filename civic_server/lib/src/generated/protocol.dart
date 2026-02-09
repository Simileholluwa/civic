/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters
// ignore_for_file: invalid_use_of_internal_member

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;
import 'package:serverpod/protocol.dart' as _i2;
import 'package:serverpod_auth_server/serverpod_auth_server.dart' as _i3;
import 'article/article.dart' as _i4;
import 'future/media_cleanup_params.dart' as _i5;
import 'general/aws_places.dart' as _i6;
import 'general/link_metadata.dart' as _i7;
import 'general/location_exception.dart' as _i8;
import 'general/post_exception.dart' as _i9;
import 'media/media_asset.dart' as _i10;
import 'media/media_kind.dart' as _i11;
import 'notification/notification.dart' as _i12;
import 'notification/notification_action_type.dart' as _i13;
import 'notification/notification_list.dart' as _i14;
import 'notification/notification_target_type.dart' as _i15;
import 'notification/notifications_settings.dart' as _i16;
import 'poll/poll.dart' as _i17;
import 'poll/poll_counts.dart' as _i18;
import 'poll/poll_option.dart' as _i19;
import 'poll/poll_option_count.dart' as _i20;
import 'poll/poll_vote.dart' as _i21;
import 'post/engagement_event.dart' as _i22;
import 'post/hashtags.dart' as _i23;
import 'post/impression_log.dart' as _i24;
import 'post/post.dart' as _i25;
import 'post/post_bookmarks.dart' as _i26;
import 'post/post_counts.dart' as _i27;
import 'post/post_impression.dart' as _i28;
import 'post/post_likes.dart' as _i29;
import 'post/post_list.dart' as _i30;
import 'post/post_not_interested.dart' as _i31;
import 'post/post_notif_sub.dart' as _i32;
import 'post/post_quotes.dart' as _i33;
import 'post/post_reposts.dart' as _i34;
import 'post/post_type_enums.dart' as _i35;
import 'post/post_with_user_state.dart' as _i36;
import 'post/posts_hashtags.dart' as _i37;
import 'project/feed_project_list.dart' as _i38;
import 'project/project.dart' as _i39;
import 'project/project_bookmarks.dart' as _i40;
import 'project/project_counts.dart' as _i41;
import 'project/project_likes.dart' as _i42;
import 'project/project_not_interested.dart' as _i43;
import 'project/project_notif_sub.dart' as _i44;
import 'project/project_rating.dart' as _i45;
import 'project/project_rating_counts.dart' as _i46;
import 'project/project_review.dart' as _i47;
import 'project/project_review_counts.dart' as _i48;
import 'project/project_review_list.dart' as _i49;
import 'project/project_review_reaction.dart' as _i50;
import 'project/project_review_with_user_state.dart' as _i51;
import 'project/project_vet_list.dart' as _i52;
import 'project/project_vetting.dart' as _i53;
import 'project/project_vetting_reaction.dart' as _i54;
import 'project/project_vetting_with_user_state.dart' as _i55;
import 'project/project_vettings_count.dart' as _i56;
import 'project/project_with_user_state.dart' as _i57;
import 'project/rating_dimension.dart' as _i58;
import 'user/political_status_enum.dart' as _i59;
import 'user/user_device.dart' as _i60;
import 'user/user_follow.dart' as _i61;
import 'user/user_record.dart' as _i62;
import 'user/users_list.dart' as _i63;
import 'package:civic_server/src/generated/general/aws_places.dart' as _i64;
import 'package:civic_server/src/generated/media/media_asset.dart' as _i65;
import 'package:civic_server/src/generated/user/user_record.dart' as _i66;
export 'article/article.dart';
export 'future/media_cleanup_params.dart';
export 'general/aws_places.dart';
export 'general/link_metadata.dart';
export 'general/location_exception.dart';
export 'general/post_exception.dart';
export 'media/media_asset.dart';
export 'media/media_kind.dart';
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
export 'post/post_quotes.dart';
export 'post/post_reposts.dart';
export 'post/post_type_enums.dart';
export 'post/post_with_user_state.dart';
export 'post/posts_hashtags.dart';
export 'project/feed_project_list.dart';
export 'project/project.dart';
export 'project/project_bookmarks.dart';
export 'project/project_counts.dart';
export 'project/project_likes.dart';
export 'project/project_not_interested.dart';
export 'project/project_notif_sub.dart';
export 'project/project_rating.dart';
export 'project/project_rating_counts.dart';
export 'project/project_review.dart';
export 'project/project_review_counts.dart';
export 'project/project_review_list.dart';
export 'project/project_review_reaction.dart';
export 'project/project_review_with_user_state.dart';
export 'project/project_vet_list.dart';
export 'project/project_vetting.dart';
export 'project/project_vetting_reaction.dart';
export 'project/project_vetting_with_user_state.dart';
export 'project/project_vettings_count.dart';
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
          columnType: _i2.ColumnType.text,
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
          columnType: _i2.ColumnType.text,
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
          onDelete: _i2.ForeignKeyAction.setNull,
          matchType: null,
        ),
        _i2.ForeignKeyDefinition(
          constraintName: 'app_notification_fk_3',
          columns: ['projectId'],
          referenceTable: 'project',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.setNull,
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
            ),
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
        ),
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'article_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        ),
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
            ),
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
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        ),
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
        ),
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'impression_log_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            ),
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
      name: 'media_asset',
      dartName: 'MediaAsset',
      schema: 'public',
      module: 'civic',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'media_asset_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'ownerId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
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
        _i2.ColumnDefinition(
          name: 'objectKey',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'publicUrl',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'contentType',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'size',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'width',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'height',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'aspectRatio',
          columnType: _i2.ColumnType.doublePrecision,
          isNullable: true,
          dartType: 'double?',
        ),
        _i2.ColumnDefinition(
          name: 'durationMs',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'kind',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'protocol:MediaKind',
        ),
        _i2.ColumnDefinition(
          name: 'createdAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
          columnDefault: 'CURRENT_TIMESTAMP',
        ),
        _i2.ColumnDefinition(
          name: 'deletedAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'media_asset_fk_0',
          columns: ['ownerId'],
          referenceTable: 'user_record',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.cascade,
          matchType: null,
        ),
        _i2.ForeignKeyDefinition(
          constraintName: 'media_asset_fk_1',
          columns: ['postId'],
          referenceTable: 'post',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.cascade,
          matchType: null,
        ),
        _i2.ForeignKeyDefinition(
          constraintName: 'media_asset_fk_2',
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
          indexName: 'media_asset_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        ),
        _i2.IndexDefinition(
          indexName: 'media_post_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'postId',
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
        _i2.IndexDefinition(
          indexName: 'media_owner_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'ownerId',
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
        _i2.IndexDefinition(
          indexName: 'post_object_key_unique',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'postId',
            ),
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'objectKey',
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
        ),
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'poll_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        ),
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
        ),
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'poll_option_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        ),
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
            ),
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
          columnType: _i2.ColumnType.text,
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
          name: 'repostCount',
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
            ),
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
            ),
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
            ),
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
            ),
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
            ),
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
      name: 'post_quotes',
      dartName: 'PostQuotes',
      schema: 'public',
      module: 'civic',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'post_quotes_id_seq\'::regclass)',
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
          constraintName: 'post_quotes_fk_0',
          columns: ['postId'],
          referenceTable: 'post',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.cascade,
          matchType: null,
        ),
        _i2.ForeignKeyDefinition(
          constraintName: 'post_quotes_fk_1',
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
          indexName: 'post_quotes_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        ),
        _i2.IndexDefinition(
          indexName: 'post_quotes_id_idx',
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
          isUnique: false,
          isPrimary: false,
        ),
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'post_reposts',
      dartName: 'PostReposts',
      schema: 'public',
      module: 'civic',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'post_reposts_id_seq\'::regclass)',
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
          constraintName: 'post_reposts_fk_0',
          columns: ['postId'],
          referenceTable: 'post',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.cascade,
          matchType: null,
        ),
        _i2.ForeignKeyDefinition(
          constraintName: 'post_reposts_fk_1',
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
          indexName: 'post_reposts_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        ),
        _i2.IndexDefinition(
          indexName: 'post_reposts_id_unique_idx',
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
            ),
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
            ),
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
          columnDefault: '\'\'::text',
        ),
        _i2.ColumnDefinition(
          name: 'fundingSubCategory',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
          columnDefault: '\'\'::text',
        ),
        _i2.ColumnDefinition(
          name: 'projectCost',
          columnType: _i2.ColumnType.doublePrecision,
          isNullable: true,
          dartType: 'double?',
          columnDefault: '0.0',
        ),
        _i2.ColumnDefinition(
          name: 'fundingNote',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
          columnDefault: '\'\'::text',
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
          name: 'impressionsCount',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
          columnDefault: '0',
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
          columnDefault: '0.0',
        ),
        _i2.ColumnDefinition(
          name: 'overallLocationRating',
          columnType: _i2.ColumnType.doublePrecision,
          isNullable: true,
          dartType: 'double?',
          columnDefault: '0.0',
        ),
        _i2.ColumnDefinition(
          name: 'overallDescriptionRating',
          columnType: _i2.ColumnType.doublePrecision,
          isNullable: true,
          dartType: 'double?',
          columnDefault: '0.0',
        ),
        _i2.ColumnDefinition(
          name: 'overallDatesRating',
          columnType: _i2.ColumnType.doublePrecision,
          isNullable: true,
          dartType: 'double?',
          columnDefault: '0.0',
        ),
        _i2.ColumnDefinition(
          name: 'overallAttachmentsRating',
          columnType: _i2.ColumnType.doublePrecision,
          isNullable: true,
          dartType: 'double?',
          columnDefault: '0.0',
        ),
        _i2.ColumnDefinition(
          name: 'overAllCategoryRating',
          columnType: _i2.ColumnType.doublePrecision,
          isNullable: true,
          dartType: 'double?',
          columnDefault: '0.0',
        ),
        _i2.ColumnDefinition(
          name: 'overallFundingRating',
          columnType: _i2.ColumnType.doublePrecision,
          isNullable: true,
          dartType: 'double?',
          columnDefault: '0.0',
        ),
        _i2.ColumnDefinition(
          name: 'isDeleted',
          columnType: _i2.ColumnType.boolean,
          isNullable: true,
          dartType: 'bool?',
          columnDefault: 'false',
        ),
        _i2.ColumnDefinition(
          name: 'lastImpressionAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
          columnDefault: 'CURRENT_TIMESTAMP',
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
        ),
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'project_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            ),
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
            ),
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
            ),
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
            ),
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
            ),
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
          columnDefault: '\'\'::text',
        ),
        _i2.ColumnDefinition(
          name: 'locationRating',
          columnType: _i2.ColumnType.doublePrecision,
          isNullable: true,
          dartType: 'double?',
          columnDefault: '0.0',
        ),
        _i2.ColumnDefinition(
          name: 'descriptionRating',
          columnType: _i2.ColumnType.doublePrecision,
          isNullable: true,
          dartType: 'double?',
          columnDefault: '0.0',
        ),
        _i2.ColumnDefinition(
          name: 'attachmentsRating',
          columnType: _i2.ColumnType.doublePrecision,
          isNullable: true,
          dartType: 'double?',
          columnDefault: '0.0',
        ),
        _i2.ColumnDefinition(
          name: 'categoryRating',
          columnType: _i2.ColumnType.doublePrecision,
          isNullable: true,
          dartType: 'double?',
          columnDefault: '0.0',
        ),
        _i2.ColumnDefinition(
          name: 'fundingRating',
          columnType: _i2.ColumnType.doublePrecision,
          isNullable: true,
          dartType: 'double?',
          columnDefault: '0.0',
        ),
        _i2.ColumnDefinition(
          name: 'datesRating',
          columnType: _i2.ColumnType.doublePrecision,
          isNullable: true,
          dartType: 'double?',
          columnDefault: '0.0',
        ),
        _i2.ColumnDefinition(
          name: 'overallRating',
          columnType: _i2.ColumnType.doublePrecision,
          isNullable: true,
          dartType: 'double?',
          columnDefault: '0.0',
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
          name: 'dislikesCount',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
          columnDefault: '0',
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
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        ),
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
            ),
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
            ),
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
          name: 'likesCount',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
          columnDefault: '0',
        ),
        _i2.ColumnDefinition(
          name: 'dislikesCount',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
          columnDefault: '0',
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
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        ),
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
            ),
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
        ),
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'user_device_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            ),
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
            ),
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
            ),
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
        ),
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'user_notification_settings_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            ),
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
          columnType: _i2.ColumnType.text,
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
        ),
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'user_record_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            ),
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

  static String? getClassNameFromObjectJson(dynamic data) {
    if (data is! Map) return null;
    final className = data['__className__'] as String?;
    return className;
  }

  @override
  T deserialize<T>(
    dynamic data, [
    Type? t,
  ]) {
    t ??= T;

    final dataClassName = getClassNameFromObjectJson(data);
    if (dataClassName != null && dataClassName != getClassNameForType(t)) {
      try {
        return deserializeByClassName({
          'className': dataClassName,
          'data': data,
        });
      } on FormatException catch (_) {
        // If the className is not recognized (e.g., older client receiving
        // data with a new subtype), fall back to deserializing without the
        // className, using the expected type T.
      }
    }

    if (t == _i4.Article) {
      return _i4.Article.fromJson(data) as T;
    }
    if (t == _i5.MediaCleanupParams) {
      return _i5.MediaCleanupParams.fromJson(data) as T;
    }
    if (t == _i6.AWSPlaces) {
      return _i6.AWSPlaces.fromJson(data) as T;
    }
    if (t == _i7.LinkMetadata) {
      return _i7.LinkMetadata.fromJson(data) as T;
    }
    if (t == _i8.LocationException) {
      return _i8.LocationException.fromJson(data) as T;
    }
    if (t == _i9.ServerSideException) {
      return _i9.ServerSideException.fromJson(data) as T;
    }
    if (t == _i10.MediaAsset) {
      return _i10.MediaAsset.fromJson(data) as T;
    }
    if (t == _i11.MediaKind) {
      return _i11.MediaKind.fromJson(data) as T;
    }
    if (t == _i12.AppNotification) {
      return _i12.AppNotification.fromJson(data) as T;
    }
    if (t == _i13.NotificationActionType) {
      return _i13.NotificationActionType.fromJson(data) as T;
    }
    if (t == _i14.NotificationList) {
      return _i14.NotificationList.fromJson(data) as T;
    }
    if (t == _i15.NotificationTargetType) {
      return _i15.NotificationTargetType.fromJson(data) as T;
    }
    if (t == _i16.UserNotificationSettings) {
      return _i16.UserNotificationSettings.fromJson(data) as T;
    }
    if (t == _i17.Poll) {
      return _i17.Poll.fromJson(data) as T;
    }
    if (t == _i18.PollCounts) {
      return _i18.PollCounts.fromJson(data) as T;
    }
    if (t == _i19.PollOption) {
      return _i19.PollOption.fromJson(data) as T;
    }
    if (t == _i20.PollOptionCount) {
      return _i20.PollOptionCount.fromJson(data) as T;
    }
    if (t == _i21.PollVote) {
      return _i21.PollVote.fromJson(data) as T;
    }
    if (t == _i22.EngagementEvent) {
      return _i22.EngagementEvent.fromJson(data) as T;
    }
    if (t == _i23.Hashtag) {
      return _i23.Hashtag.fromJson(data) as T;
    }
    if (t == _i24.ImpressionLog) {
      return _i24.ImpressionLog.fromJson(data) as T;
    }
    if (t == _i25.Post) {
      return _i25.Post.fromJson(data) as T;
    }
    if (t == _i26.PostBookmarks) {
      return _i26.PostBookmarks.fromJson(data) as T;
    }
    if (t == _i27.PostCounts) {
      return _i27.PostCounts.fromJson(data) as T;
    }
    if (t == _i28.PostImpression) {
      return _i28.PostImpression.fromJson(data) as T;
    }
    if (t == _i29.PostLikes) {
      return _i29.PostLikes.fromJson(data) as T;
    }
    if (t == _i30.PostList) {
      return _i30.PostList.fromJson(data) as T;
    }
    if (t == _i31.PostNotInterested) {
      return _i31.PostNotInterested.fromJson(data) as T;
    }
    if (t == _i32.PostSubscription) {
      return _i32.PostSubscription.fromJson(data) as T;
    }
    if (t == _i33.PostQuotes) {
      return _i33.PostQuotes.fromJson(data) as T;
    }
    if (t == _i34.PostReposts) {
      return _i34.PostReposts.fromJson(data) as T;
    }
    if (t == _i35.PostType) {
      return _i35.PostType.fromJson(data) as T;
    }
    if (t == _i36.PostWithUserState) {
      return _i36.PostWithUserState.fromJson(data) as T;
    }
    if (t == _i37.PostsHashtags) {
      return _i37.PostsHashtags.fromJson(data) as T;
    }
    if (t == _i38.FeedProjectList) {
      return _i38.FeedProjectList.fromJson(data) as T;
    }
    if (t == _i39.Project) {
      return _i39.Project.fromJson(data) as T;
    }
    if (t == _i40.ProjectBookmarks) {
      return _i40.ProjectBookmarks.fromJson(data) as T;
    }
    if (t == _i41.ProjectCounts) {
      return _i41.ProjectCounts.fromJson(data) as T;
    }
    if (t == _i42.ProjectLikes) {
      return _i42.ProjectLikes.fromJson(data) as T;
    }
    if (t == _i43.ProjectNotInterested) {
      return _i43.ProjectNotInterested.fromJson(data) as T;
    }
    if (t == _i44.ProjectSubscription) {
      return _i44.ProjectSubscription.fromJson(data) as T;
    }
    if (t == _i45.ProjectRating) {
      return _i45.ProjectRating.fromJson(data) as T;
    }
    if (t == _i46.ProjectRatingCounts) {
      return _i46.ProjectRatingCounts.fromJson(data) as T;
    }
    if (t == _i47.ProjectReview) {
      return _i47.ProjectReview.fromJson(data) as T;
    }
    if (t == _i48.ProjectReviewCounts) {
      return _i48.ProjectReviewCounts.fromJson(data) as T;
    }
    if (t == _i49.ProjectReviewList) {
      return _i49.ProjectReviewList.fromJson(data) as T;
    }
    if (t == _i50.ProjectReviewReaction) {
      return _i50.ProjectReviewReaction.fromJson(data) as T;
    }
    if (t == _i51.ProjectReviewWithUserState) {
      return _i51.ProjectReviewWithUserState.fromJson(data) as T;
    }
    if (t == _i52.ProjectVetList) {
      return _i52.ProjectVetList.fromJson(data) as T;
    }
    if (t == _i53.ProjectVetting) {
      return _i53.ProjectVetting.fromJson(data) as T;
    }
    if (t == _i54.ProjectVettingReaction) {
      return _i54.ProjectVettingReaction.fromJson(data) as T;
    }
    if (t == _i55.ProjectVettingWithUserState) {
      return _i55.ProjectVettingWithUserState.fromJson(data) as T;
    }
    if (t == _i56.ProjectVettingsCount) {
      return _i56.ProjectVettingsCount.fromJson(data) as T;
    }
    if (t == _i57.ProjectWithUserState) {
      return _i57.ProjectWithUserState.fromJson(data) as T;
    }
    if (t == _i58.RatingDimension) {
      return _i58.RatingDimension.fromJson(data) as T;
    }
    if (t == _i59.PoliticalStatus) {
      return _i59.PoliticalStatus.fromJson(data) as T;
    }
    if (t == _i60.UserDevice) {
      return _i60.UserDevice.fromJson(data) as T;
    }
    if (t == _i61.UserFollow) {
      return _i61.UserFollow.fromJson(data) as T;
    }
    if (t == _i62.UserRecord) {
      return _i62.UserRecord.fromJson(data) as T;
    }
    if (t == _i63.UsersList) {
      return _i63.UsersList.fromJson(data) as T;
    }
    if (t == _i1.getType<_i4.Article?>()) {
      return (data != null ? _i4.Article.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i5.MediaCleanupParams?>()) {
      return (data != null ? _i5.MediaCleanupParams.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i6.AWSPlaces?>()) {
      return (data != null ? _i6.AWSPlaces.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i7.LinkMetadata?>()) {
      return (data != null ? _i7.LinkMetadata.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i8.LocationException?>()) {
      return (data != null ? _i8.LocationException.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i9.ServerSideException?>()) {
      return (data != null ? _i9.ServerSideException.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i10.MediaAsset?>()) {
      return (data != null ? _i10.MediaAsset.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i11.MediaKind?>()) {
      return (data != null ? _i11.MediaKind.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i12.AppNotification?>()) {
      return (data != null ? _i12.AppNotification.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i13.NotificationActionType?>()) {
      return (data != null ? _i13.NotificationActionType.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i14.NotificationList?>()) {
      return (data != null ? _i14.NotificationList.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i15.NotificationTargetType?>()) {
      return (data != null ? _i15.NotificationTargetType.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i16.UserNotificationSettings?>()) {
      return (data != null
              ? _i16.UserNotificationSettings.fromJson(data)
              : null)
          as T;
    }
    if (t == _i1.getType<_i17.Poll?>()) {
      return (data != null ? _i17.Poll.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i18.PollCounts?>()) {
      return (data != null ? _i18.PollCounts.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i19.PollOption?>()) {
      return (data != null ? _i19.PollOption.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i20.PollOptionCount?>()) {
      return (data != null ? _i20.PollOptionCount.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i21.PollVote?>()) {
      return (data != null ? _i21.PollVote.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i22.EngagementEvent?>()) {
      return (data != null ? _i22.EngagementEvent.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i23.Hashtag?>()) {
      return (data != null ? _i23.Hashtag.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i24.ImpressionLog?>()) {
      return (data != null ? _i24.ImpressionLog.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i25.Post?>()) {
      return (data != null ? _i25.Post.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i26.PostBookmarks?>()) {
      return (data != null ? _i26.PostBookmarks.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i27.PostCounts?>()) {
      return (data != null ? _i27.PostCounts.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i28.PostImpression?>()) {
      return (data != null ? _i28.PostImpression.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i29.PostLikes?>()) {
      return (data != null ? _i29.PostLikes.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i30.PostList?>()) {
      return (data != null ? _i30.PostList.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i31.PostNotInterested?>()) {
      return (data != null ? _i31.PostNotInterested.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i32.PostSubscription?>()) {
      return (data != null ? _i32.PostSubscription.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i33.PostQuotes?>()) {
      return (data != null ? _i33.PostQuotes.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i34.PostReposts?>()) {
      return (data != null ? _i34.PostReposts.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i35.PostType?>()) {
      return (data != null ? _i35.PostType.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i36.PostWithUserState?>()) {
      return (data != null ? _i36.PostWithUserState.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i37.PostsHashtags?>()) {
      return (data != null ? _i37.PostsHashtags.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i38.FeedProjectList?>()) {
      return (data != null ? _i38.FeedProjectList.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i39.Project?>()) {
      return (data != null ? _i39.Project.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i40.ProjectBookmarks?>()) {
      return (data != null ? _i40.ProjectBookmarks.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i41.ProjectCounts?>()) {
      return (data != null ? _i41.ProjectCounts.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i42.ProjectLikes?>()) {
      return (data != null ? _i42.ProjectLikes.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i43.ProjectNotInterested?>()) {
      return (data != null ? _i43.ProjectNotInterested.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i44.ProjectSubscription?>()) {
      return (data != null ? _i44.ProjectSubscription.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i45.ProjectRating?>()) {
      return (data != null ? _i45.ProjectRating.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i46.ProjectRatingCounts?>()) {
      return (data != null ? _i46.ProjectRatingCounts.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i47.ProjectReview?>()) {
      return (data != null ? _i47.ProjectReview.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i48.ProjectReviewCounts?>()) {
      return (data != null ? _i48.ProjectReviewCounts.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i49.ProjectReviewList?>()) {
      return (data != null ? _i49.ProjectReviewList.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i50.ProjectReviewReaction?>()) {
      return (data != null ? _i50.ProjectReviewReaction.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i51.ProjectReviewWithUserState?>()) {
      return (data != null
              ? _i51.ProjectReviewWithUserState.fromJson(data)
              : null)
          as T;
    }
    if (t == _i1.getType<_i52.ProjectVetList?>()) {
      return (data != null ? _i52.ProjectVetList.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i53.ProjectVetting?>()) {
      return (data != null ? _i53.ProjectVetting.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i54.ProjectVettingReaction?>()) {
      return (data != null ? _i54.ProjectVettingReaction.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i55.ProjectVettingWithUserState?>()) {
      return (data != null
              ? _i55.ProjectVettingWithUserState.fromJson(data)
              : null)
          as T;
    }
    if (t == _i1.getType<_i56.ProjectVettingsCount?>()) {
      return (data != null ? _i56.ProjectVettingsCount.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i57.ProjectWithUserState?>()) {
      return (data != null ? _i57.ProjectWithUserState.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i58.RatingDimension?>()) {
      return (data != null ? _i58.RatingDimension.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i59.PoliticalStatus?>()) {
      return (data != null ? _i59.PoliticalStatus.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i60.UserDevice?>()) {
      return (data != null ? _i60.UserDevice.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i61.UserFollow?>()) {
      return (data != null ? _i61.UserFollow.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i62.UserRecord?>()) {
      return (data != null ? _i62.UserRecord.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i63.UsersList?>()) {
      return (data != null ? _i63.UsersList.fromJson(data) : null) as T;
    }
    if (t == List<String>) {
      return (data as List).map((e) => deserialize<String>(e)).toList() as T;
    }
    if (t == _i1.getType<List<String>?>()) {
      return (data != null
              ? (data as List).map((e) => deserialize<String>(e)).toList()
              : null)
          as T;
    }
    if (t == List<_i12.AppNotification>) {
      return (data as List)
              .map((e) => deserialize<_i12.AppNotification>(e))
              .toList()
          as T;
    }
    if (t == List<_i19.PollOption>) {
      return (data as List).map((e) => deserialize<_i19.PollOption>(e)).toList()
          as T;
    }
    if (t == _i1.getType<List<_i19.PollOption>?>()) {
      return (data != null
              ? (data as List)
                    .map((e) => deserialize<_i19.PollOption>(e))
                    .toList()
              : null)
          as T;
    }
    if (t == List<_i20.PollOptionCount>) {
      return (data as List)
              .map((e) => deserialize<_i20.PollOptionCount>(e))
              .toList()
          as T;
    }
    if (t == _i1.getType<List<_i20.PollOptionCount>?>()) {
      return (data != null
              ? (data as List)
                    .map((e) => deserialize<_i20.PollOptionCount>(e))
                    .toList()
              : null)
          as T;
    }
    if (t == List<_i37.PostsHashtags>) {
      return (data as List)
              .map((e) => deserialize<_i37.PostsHashtags>(e))
              .toList()
          as T;
    }
    if (t == _i1.getType<List<_i37.PostsHashtags>?>()) {
      return (data != null
              ? (data as List)
                    .map((e) => deserialize<_i37.PostsHashtags>(e))
                    .toList()
              : null)
          as T;
    }
    if (t == List<int>) {
      return (data as List).map((e) => deserialize<int>(e)).toList() as T;
    }
    if (t == List<_i10.MediaAsset>) {
      return (data as List).map((e) => deserialize<_i10.MediaAsset>(e)).toList()
          as T;
    }
    if (t == _i1.getType<List<_i10.MediaAsset>?>()) {
      return (data != null
              ? (data as List)
                    .map((e) => deserialize<_i10.MediaAsset>(e))
                    .toList()
              : null)
          as T;
    }
    if (t == List<_i62.UserRecord>) {
      return (data as List).map((e) => deserialize<_i62.UserRecord>(e)).toList()
          as T;
    }
    if (t == _i1.getType<List<_i62.UserRecord>?>()) {
      return (data != null
              ? (data as List)
                    .map((e) => deserialize<_i62.UserRecord>(e))
                    .toList()
              : null)
          as T;
    }
    if (t == List<_i6.AWSPlaces>) {
      return (data as List).map((e) => deserialize<_i6.AWSPlaces>(e)).toList()
          as T;
    }
    if (t == _i1.getType<List<_i6.AWSPlaces>?>()) {
      return (data != null
              ? (data as List)
                    .map((e) => deserialize<_i6.AWSPlaces>(e))
                    .toList()
              : null)
          as T;
    }
    if (t == List<_i36.PostWithUserState>) {
      return (data as List)
              .map((e) => deserialize<_i36.PostWithUserState>(e))
              .toList()
          as T;
    }
    if (t == List<_i57.ProjectWithUserState>) {
      return (data as List)
              .map((e) => deserialize<_i57.ProjectWithUserState>(e))
              .toList()
          as T;
    }
    if (t == List<_i51.ProjectReviewWithUserState>) {
      return (data as List)
              .map((e) => deserialize<_i51.ProjectReviewWithUserState>(e))
              .toList()
          as T;
    }
    if (t == List<_i55.ProjectVettingWithUserState>) {
      return (data as List)
              .map((e) => deserialize<_i55.ProjectVettingWithUserState>(e))
              .toList()
          as T;
    }
    if (t == List<String>) {
      return (data as List).map((e) => deserialize<String>(e)).toList() as T;
    }
    if (t == List<_i64.AWSPlaces>) {
      return (data as List).map((e) => deserialize<_i64.AWSPlaces>(e)).toList()
          as T;
    }
    if (t == List<double>) {
      return (data as List).map((e) => deserialize<double>(e)).toList() as T;
    }
    if (t == Map<String, String?>) {
      return (data as Map).map(
            (k, v) => MapEntry(deserialize<String>(k), deserialize<String?>(v)),
          )
          as T;
    }
    if (t == List<_i65.MediaAsset>) {
      return (data as List).map((e) => deserialize<_i65.MediaAsset>(e)).toList()
          as T;
    }
    if (t == List<int>) {
      return (data as List).map((e) => deserialize<int>(e)).toList() as T;
    }
    if (t == List<_i66.UserRecord>) {
      return (data as List).map((e) => deserialize<_i66.UserRecord>(e)).toList()
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

  static String? getClassNameForType(Type type) {
    return switch (type) {
      _i4.Article => 'Article',
      _i5.MediaCleanupParams => 'MediaCleanupParams',
      _i6.AWSPlaces => 'AWSPlaces',
      _i7.LinkMetadata => 'LinkMetadata',
      _i8.LocationException => 'LocationException',
      _i9.ServerSideException => 'ServerSideException',
      _i10.MediaAsset => 'MediaAsset',
      _i11.MediaKind => 'MediaKind',
      _i12.AppNotification => 'AppNotification',
      _i13.NotificationActionType => 'NotificationActionType',
      _i14.NotificationList => 'NotificationList',
      _i15.NotificationTargetType => 'NotificationTargetType',
      _i16.UserNotificationSettings => 'UserNotificationSettings',
      _i17.Poll => 'Poll',
      _i18.PollCounts => 'PollCounts',
      _i19.PollOption => 'PollOption',
      _i20.PollOptionCount => 'PollOptionCount',
      _i21.PollVote => 'PollVote',
      _i22.EngagementEvent => 'EngagementEvent',
      _i23.Hashtag => 'Hashtag',
      _i24.ImpressionLog => 'ImpressionLog',
      _i25.Post => 'Post',
      _i26.PostBookmarks => 'PostBookmarks',
      _i27.PostCounts => 'PostCounts',
      _i28.PostImpression => 'PostImpression',
      _i29.PostLikes => 'PostLikes',
      _i30.PostList => 'PostList',
      _i31.PostNotInterested => 'PostNotInterested',
      _i32.PostSubscription => 'PostSubscription',
      _i33.PostQuotes => 'PostQuotes',
      _i34.PostReposts => 'PostReposts',
      _i35.PostType => 'PostType',
      _i36.PostWithUserState => 'PostWithUserState',
      _i37.PostsHashtags => 'PostsHashtags',
      _i38.FeedProjectList => 'FeedProjectList',
      _i39.Project => 'Project',
      _i40.ProjectBookmarks => 'ProjectBookmarks',
      _i41.ProjectCounts => 'ProjectCounts',
      _i42.ProjectLikes => 'ProjectLikes',
      _i43.ProjectNotInterested => 'ProjectNotInterested',
      _i44.ProjectSubscription => 'ProjectSubscription',
      _i45.ProjectRating => 'ProjectRating',
      _i46.ProjectRatingCounts => 'ProjectRatingCounts',
      _i47.ProjectReview => 'ProjectReview',
      _i48.ProjectReviewCounts => 'ProjectReviewCounts',
      _i49.ProjectReviewList => 'ProjectReviewList',
      _i50.ProjectReviewReaction => 'ProjectReviewReaction',
      _i51.ProjectReviewWithUserState => 'ProjectReviewWithUserState',
      _i52.ProjectVetList => 'ProjectVetList',
      _i53.ProjectVetting => 'ProjectVetting',
      _i54.ProjectVettingReaction => 'ProjectVettingReaction',
      _i55.ProjectVettingWithUserState => 'ProjectVettingWithUserState',
      _i56.ProjectVettingsCount => 'ProjectVettingsCount',
      _i57.ProjectWithUserState => 'ProjectWithUserState',
      _i58.RatingDimension => 'RatingDimension',
      _i59.PoliticalStatus => 'PoliticalStatus',
      _i60.UserDevice => 'UserDevice',
      _i61.UserFollow => 'UserFollow',
      _i62.UserRecord => 'UserRecord',
      _i63.UsersList => 'UsersList',
      _ => null,
    };
  }

  @override
  String? getClassNameForObject(Object? data) {
    String? className = super.getClassNameForObject(data);
    if (className != null) return className;

    if (data is Map<String, dynamic> && data['__className__'] is String) {
      return (data['__className__'] as String).replaceFirst('civic.', '');
    }

    switch (data) {
      case _i4.Article():
        return 'Article';
      case _i5.MediaCleanupParams():
        return 'MediaCleanupParams';
      case _i6.AWSPlaces():
        return 'AWSPlaces';
      case _i7.LinkMetadata():
        return 'LinkMetadata';
      case _i8.LocationException():
        return 'LocationException';
      case _i9.ServerSideException():
        return 'ServerSideException';
      case _i10.MediaAsset():
        return 'MediaAsset';
      case _i11.MediaKind():
        return 'MediaKind';
      case _i12.AppNotification():
        return 'AppNotification';
      case _i13.NotificationActionType():
        return 'NotificationActionType';
      case _i14.NotificationList():
        return 'NotificationList';
      case _i15.NotificationTargetType():
        return 'NotificationTargetType';
      case _i16.UserNotificationSettings():
        return 'UserNotificationSettings';
      case _i17.Poll():
        return 'Poll';
      case _i18.PollCounts():
        return 'PollCounts';
      case _i19.PollOption():
        return 'PollOption';
      case _i20.PollOptionCount():
        return 'PollOptionCount';
      case _i21.PollVote():
        return 'PollVote';
      case _i22.EngagementEvent():
        return 'EngagementEvent';
      case _i23.Hashtag():
        return 'Hashtag';
      case _i24.ImpressionLog():
        return 'ImpressionLog';
      case _i25.Post():
        return 'Post';
      case _i26.PostBookmarks():
        return 'PostBookmarks';
      case _i27.PostCounts():
        return 'PostCounts';
      case _i28.PostImpression():
        return 'PostImpression';
      case _i29.PostLikes():
        return 'PostLikes';
      case _i30.PostList():
        return 'PostList';
      case _i31.PostNotInterested():
        return 'PostNotInterested';
      case _i32.PostSubscription():
        return 'PostSubscription';
      case _i33.PostQuotes():
        return 'PostQuotes';
      case _i34.PostReposts():
        return 'PostReposts';
      case _i35.PostType():
        return 'PostType';
      case _i36.PostWithUserState():
        return 'PostWithUserState';
      case _i37.PostsHashtags():
        return 'PostsHashtags';
      case _i38.FeedProjectList():
        return 'FeedProjectList';
      case _i39.Project():
        return 'Project';
      case _i40.ProjectBookmarks():
        return 'ProjectBookmarks';
      case _i41.ProjectCounts():
        return 'ProjectCounts';
      case _i42.ProjectLikes():
        return 'ProjectLikes';
      case _i43.ProjectNotInterested():
        return 'ProjectNotInterested';
      case _i44.ProjectSubscription():
        return 'ProjectSubscription';
      case _i45.ProjectRating():
        return 'ProjectRating';
      case _i46.ProjectRatingCounts():
        return 'ProjectRatingCounts';
      case _i47.ProjectReview():
        return 'ProjectReview';
      case _i48.ProjectReviewCounts():
        return 'ProjectReviewCounts';
      case _i49.ProjectReviewList():
        return 'ProjectReviewList';
      case _i50.ProjectReviewReaction():
        return 'ProjectReviewReaction';
      case _i51.ProjectReviewWithUserState():
        return 'ProjectReviewWithUserState';
      case _i52.ProjectVetList():
        return 'ProjectVetList';
      case _i53.ProjectVetting():
        return 'ProjectVetting';
      case _i54.ProjectVettingReaction():
        return 'ProjectVettingReaction';
      case _i55.ProjectVettingWithUserState():
        return 'ProjectVettingWithUserState';
      case _i56.ProjectVettingsCount():
        return 'ProjectVettingsCount';
      case _i57.ProjectWithUserState():
        return 'ProjectWithUserState';
      case _i58.RatingDimension():
        return 'RatingDimension';
      case _i59.PoliticalStatus():
        return 'PoliticalStatus';
      case _i60.UserDevice():
        return 'UserDevice';
      case _i61.UserFollow():
        return 'UserFollow';
      case _i62.UserRecord():
        return 'UserRecord';
      case _i63.UsersList():
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
    var dataClassName = data['className'];
    if (dataClassName is! String) {
      return super.deserializeByClassName(data);
    }
    if (dataClassName == 'Article') {
      return deserialize<_i4.Article>(data['data']);
    }
    if (dataClassName == 'MediaCleanupParams') {
      return deserialize<_i5.MediaCleanupParams>(data['data']);
    }
    if (dataClassName == 'AWSPlaces') {
      return deserialize<_i6.AWSPlaces>(data['data']);
    }
    if (dataClassName == 'LinkMetadata') {
      return deserialize<_i7.LinkMetadata>(data['data']);
    }
    if (dataClassName == 'LocationException') {
      return deserialize<_i8.LocationException>(data['data']);
    }
    if (dataClassName == 'ServerSideException') {
      return deserialize<_i9.ServerSideException>(data['data']);
    }
    if (dataClassName == 'MediaAsset') {
      return deserialize<_i10.MediaAsset>(data['data']);
    }
    if (dataClassName == 'MediaKind') {
      return deserialize<_i11.MediaKind>(data['data']);
    }
    if (dataClassName == 'AppNotification') {
      return deserialize<_i12.AppNotification>(data['data']);
    }
    if (dataClassName == 'NotificationActionType') {
      return deserialize<_i13.NotificationActionType>(data['data']);
    }
    if (dataClassName == 'NotificationList') {
      return deserialize<_i14.NotificationList>(data['data']);
    }
    if (dataClassName == 'NotificationTargetType') {
      return deserialize<_i15.NotificationTargetType>(data['data']);
    }
    if (dataClassName == 'UserNotificationSettings') {
      return deserialize<_i16.UserNotificationSettings>(data['data']);
    }
    if (dataClassName == 'Poll') {
      return deserialize<_i17.Poll>(data['data']);
    }
    if (dataClassName == 'PollCounts') {
      return deserialize<_i18.PollCounts>(data['data']);
    }
    if (dataClassName == 'PollOption') {
      return deserialize<_i19.PollOption>(data['data']);
    }
    if (dataClassName == 'PollOptionCount') {
      return deserialize<_i20.PollOptionCount>(data['data']);
    }
    if (dataClassName == 'PollVote') {
      return deserialize<_i21.PollVote>(data['data']);
    }
    if (dataClassName == 'EngagementEvent') {
      return deserialize<_i22.EngagementEvent>(data['data']);
    }
    if (dataClassName == 'Hashtag') {
      return deserialize<_i23.Hashtag>(data['data']);
    }
    if (dataClassName == 'ImpressionLog') {
      return deserialize<_i24.ImpressionLog>(data['data']);
    }
    if (dataClassName == 'Post') {
      return deserialize<_i25.Post>(data['data']);
    }
    if (dataClassName == 'PostBookmarks') {
      return deserialize<_i26.PostBookmarks>(data['data']);
    }
    if (dataClassName == 'PostCounts') {
      return deserialize<_i27.PostCounts>(data['data']);
    }
    if (dataClassName == 'PostImpression') {
      return deserialize<_i28.PostImpression>(data['data']);
    }
    if (dataClassName == 'PostLikes') {
      return deserialize<_i29.PostLikes>(data['data']);
    }
    if (dataClassName == 'PostList') {
      return deserialize<_i30.PostList>(data['data']);
    }
    if (dataClassName == 'PostNotInterested') {
      return deserialize<_i31.PostNotInterested>(data['data']);
    }
    if (dataClassName == 'PostSubscription') {
      return deserialize<_i32.PostSubscription>(data['data']);
    }
    if (dataClassName == 'PostQuotes') {
      return deserialize<_i33.PostQuotes>(data['data']);
    }
    if (dataClassName == 'PostReposts') {
      return deserialize<_i34.PostReposts>(data['data']);
    }
    if (dataClassName == 'PostType') {
      return deserialize<_i35.PostType>(data['data']);
    }
    if (dataClassName == 'PostWithUserState') {
      return deserialize<_i36.PostWithUserState>(data['data']);
    }
    if (dataClassName == 'PostsHashtags') {
      return deserialize<_i37.PostsHashtags>(data['data']);
    }
    if (dataClassName == 'FeedProjectList') {
      return deserialize<_i38.FeedProjectList>(data['data']);
    }
    if (dataClassName == 'Project') {
      return deserialize<_i39.Project>(data['data']);
    }
    if (dataClassName == 'ProjectBookmarks') {
      return deserialize<_i40.ProjectBookmarks>(data['data']);
    }
    if (dataClassName == 'ProjectCounts') {
      return deserialize<_i41.ProjectCounts>(data['data']);
    }
    if (dataClassName == 'ProjectLikes') {
      return deserialize<_i42.ProjectLikes>(data['data']);
    }
    if (dataClassName == 'ProjectNotInterested') {
      return deserialize<_i43.ProjectNotInterested>(data['data']);
    }
    if (dataClassName == 'ProjectSubscription') {
      return deserialize<_i44.ProjectSubscription>(data['data']);
    }
    if (dataClassName == 'ProjectRating') {
      return deserialize<_i45.ProjectRating>(data['data']);
    }
    if (dataClassName == 'ProjectRatingCounts') {
      return deserialize<_i46.ProjectRatingCounts>(data['data']);
    }
    if (dataClassName == 'ProjectReview') {
      return deserialize<_i47.ProjectReview>(data['data']);
    }
    if (dataClassName == 'ProjectReviewCounts') {
      return deserialize<_i48.ProjectReviewCounts>(data['data']);
    }
    if (dataClassName == 'ProjectReviewList') {
      return deserialize<_i49.ProjectReviewList>(data['data']);
    }
    if (dataClassName == 'ProjectReviewReaction') {
      return deserialize<_i50.ProjectReviewReaction>(data['data']);
    }
    if (dataClassName == 'ProjectReviewWithUserState') {
      return deserialize<_i51.ProjectReviewWithUserState>(data['data']);
    }
    if (dataClassName == 'ProjectVetList') {
      return deserialize<_i52.ProjectVetList>(data['data']);
    }
    if (dataClassName == 'ProjectVetting') {
      return deserialize<_i53.ProjectVetting>(data['data']);
    }
    if (dataClassName == 'ProjectVettingReaction') {
      return deserialize<_i54.ProjectVettingReaction>(data['data']);
    }
    if (dataClassName == 'ProjectVettingWithUserState') {
      return deserialize<_i55.ProjectVettingWithUserState>(data['data']);
    }
    if (dataClassName == 'ProjectVettingsCount') {
      return deserialize<_i56.ProjectVettingsCount>(data['data']);
    }
    if (dataClassName == 'ProjectWithUserState') {
      return deserialize<_i57.ProjectWithUserState>(data['data']);
    }
    if (dataClassName == 'RatingDimension') {
      return deserialize<_i58.RatingDimension>(data['data']);
    }
    if (dataClassName == 'PoliticalStatus') {
      return deserialize<_i59.PoliticalStatus>(data['data']);
    }
    if (dataClassName == 'UserDevice') {
      return deserialize<_i60.UserDevice>(data['data']);
    }
    if (dataClassName == 'UserFollow') {
      return deserialize<_i61.UserFollow>(data['data']);
    }
    if (dataClassName == 'UserRecord') {
      return deserialize<_i62.UserRecord>(data['data']);
    }
    if (dataClassName == 'UsersList') {
      return deserialize<_i63.UsersList>(data['data']);
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
      case _i4.Article:
        return _i4.Article.t;
      case _i10.MediaAsset:
        return _i10.MediaAsset.t;
      case _i12.AppNotification:
        return _i12.AppNotification.t;
      case _i16.UserNotificationSettings:
        return _i16.UserNotificationSettings.t;
      case _i17.Poll:
        return _i17.Poll.t;
      case _i19.PollOption:
        return _i19.PollOption.t;
      case _i21.PollVote:
        return _i21.PollVote.t;
      case _i22.EngagementEvent:
        return _i22.EngagementEvent.t;
      case _i23.Hashtag:
        return _i23.Hashtag.t;
      case _i24.ImpressionLog:
        return _i24.ImpressionLog.t;
      case _i25.Post:
        return _i25.Post.t;
      case _i26.PostBookmarks:
        return _i26.PostBookmarks.t;
      case _i28.PostImpression:
        return _i28.PostImpression.t;
      case _i29.PostLikes:
        return _i29.PostLikes.t;
      case _i31.PostNotInterested:
        return _i31.PostNotInterested.t;
      case _i32.PostSubscription:
        return _i32.PostSubscription.t;
      case _i33.PostQuotes:
        return _i33.PostQuotes.t;
      case _i34.PostReposts:
        return _i34.PostReposts.t;
      case _i37.PostsHashtags:
        return _i37.PostsHashtags.t;
      case _i39.Project:
        return _i39.Project.t;
      case _i40.ProjectBookmarks:
        return _i40.ProjectBookmarks.t;
      case _i42.ProjectLikes:
        return _i42.ProjectLikes.t;
      case _i43.ProjectNotInterested:
        return _i43.ProjectNotInterested.t;
      case _i44.ProjectSubscription:
        return _i44.ProjectSubscription.t;
      case _i45.ProjectRating:
        return _i45.ProjectRating.t;
      case _i47.ProjectReview:
        return _i47.ProjectReview.t;
      case _i50.ProjectReviewReaction:
        return _i50.ProjectReviewReaction.t;
      case _i53.ProjectVetting:
        return _i53.ProjectVetting.t;
      case _i54.ProjectVettingReaction:
        return _i54.ProjectVettingReaction.t;
      case _i60.UserDevice:
        return _i60.UserDevice.t;
      case _i61.UserFollow:
        return _i61.UserFollow.t;
      case _i62.UserRecord:
        return _i62.UserRecord.t;
    }
    return null;
  }

  @override
  List<_i2.TableDefinition> getTargetTableDefinitions() =>
      targetTableDefinitions;

  @override
  String getModuleName() => 'civic';

  /// Maps any `Record`s known to this [Protocol] to their JSON representation
  ///
  /// Throws in case the record type is not known.
  ///
  /// This method will return `null` (only) for `null` inputs.
  Map<String, dynamic>? mapRecordToJson(Record? record) {
    if (record == null) {
      return null;
    }
    try {
      return _i3.Protocol().mapRecordToJson(record);
    } catch (_) {}
    throw Exception('Unsupported record type ${record.runtimeType}');
  }
}
