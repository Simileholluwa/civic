/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters

// ignore_for_file: unnecessary_null_comparison

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;
import '../user/user_record.dart' as _i2;
import '../general/aws_places.dart' as _i3;
import '../poll/poll_option.dart' as _i4;
import '../poll/poll_hashtags.dart' as _i5;

abstract class Poll implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  Poll._({
    this.id,
    required this.ownerId,
    this.owner,
    this.question,
    this.taggedUsers,
    this.locations,
    this.mentions,
    this.options,
    this.tags,
    this.createdAt,
    this.pollDuration,
    this.hashtags,
    this.voteCount,
    this.numberOfLikes,
    this.numberOfComments,
    this.numberOfViews,
    this.imagesUrl,
    this.updatedAt,
  });

  factory Poll({
    int? id,
    required int ownerId,
    _i2.UserRecord? owner,
    String? question,
    List<_i2.UserRecord>? taggedUsers,
    List<_i3.AWSPlaces>? locations,
    List<_i2.UserRecord>? mentions,
    _i4.PollOption? options,
    List<String>? tags,
    DateTime? createdAt,
    int? pollDuration,
    List<_i5.PollsHashtags>? hashtags,
    int? voteCount,
    int? numberOfLikes,
    int? numberOfComments,
    int? numberOfViews,
    List<String>? imagesUrl,
    DateTime? updatedAt,
  }) = _PollImpl;

  factory Poll.fromJson(Map<String, dynamic> jsonSerialization) {
    return Poll(
      id: jsonSerialization['id'] as int?,
      ownerId: jsonSerialization['ownerId'] as int,
      owner: jsonSerialization['owner'] == null
          ? null
          : _i2.UserRecord.fromJson(
              (jsonSerialization['owner'] as Map<String, dynamic>)),
      question: jsonSerialization['question'] as String?,
      taggedUsers: (jsonSerialization['taggedUsers'] as List?)
          ?.map((e) => _i2.UserRecord.fromJson((e as Map<String, dynamic>)))
          .toList(),
      locations: (jsonSerialization['locations'] as List?)
          ?.map((e) => _i3.AWSPlaces.fromJson((e as Map<String, dynamic>)))
          .toList(),
      mentions: (jsonSerialization['mentions'] as List?)
          ?.map((e) => _i2.UserRecord.fromJson((e as Map<String, dynamic>)))
          .toList(),
      options: jsonSerialization['options'] == null
          ? null
          : _i4.PollOption.fromJson(
              (jsonSerialization['options'] as Map<String, dynamic>)),
      tags: (jsonSerialization['tags'] as List?)
          ?.map((e) => e as String)
          .toList(),
      createdAt: jsonSerialization['createdAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
      pollDuration: jsonSerialization['pollDuration'] as int?,
      hashtags: (jsonSerialization['hashtags'] as List?)
          ?.map((e) => _i5.PollsHashtags.fromJson((e as Map<String, dynamic>)))
          .toList(),
      voteCount: jsonSerialization['voteCount'] as int?,
      numberOfLikes: jsonSerialization['numberOfLikes'] as int?,
      numberOfComments: jsonSerialization['numberOfComments'] as int?,
      numberOfViews: jsonSerialization['numberOfViews'] as int?,
      imagesUrl: (jsonSerialization['imagesUrl'] as List?)
          ?.map((e) => e as String)
          .toList(),
      updatedAt: jsonSerialization['updatedAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['updatedAt']),
    );
  }

  static final t = PollTable();

  static const db = PollRepository._();

  @override
  int? id;

  int ownerId;

  _i2.UserRecord? owner;

  String? question;

  List<_i2.UserRecord>? taggedUsers;

  List<_i3.AWSPlaces>? locations;

  List<_i2.UserRecord>? mentions;

  _i4.PollOption? options;

  List<String>? tags;

  DateTime? createdAt;

  int? pollDuration;

  List<_i5.PollsHashtags>? hashtags;

  int? voteCount;

  int? numberOfLikes;

  int? numberOfComments;

  int? numberOfViews;

  List<String>? imagesUrl;

  DateTime? updatedAt;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [Poll]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  Poll copyWith({
    int? id,
    int? ownerId,
    _i2.UserRecord? owner,
    String? question,
    List<_i2.UserRecord>? taggedUsers,
    List<_i3.AWSPlaces>? locations,
    List<_i2.UserRecord>? mentions,
    _i4.PollOption? options,
    List<String>? tags,
    DateTime? createdAt,
    int? pollDuration,
    List<_i5.PollsHashtags>? hashtags,
    int? voteCount,
    int? numberOfLikes,
    int? numberOfComments,
    int? numberOfViews,
    List<String>? imagesUrl,
    DateTime? updatedAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'ownerId': ownerId,
      if (owner != null) 'owner': owner?.toJson(),
      if (question != null) 'question': question,
      if (taggedUsers != null)
        'taggedUsers': taggedUsers?.toJson(valueToJson: (v) => v.toJson()),
      if (locations != null)
        'locations': locations?.toJson(valueToJson: (v) => v.toJson()),
      if (mentions != null)
        'mentions': mentions?.toJson(valueToJson: (v) => v.toJson()),
      if (options != null) 'options': options?.toJson(),
      if (tags != null) 'tags': tags?.toJson(),
      if (createdAt != null) 'createdAt': createdAt?.toJson(),
      if (pollDuration != null) 'pollDuration': pollDuration,
      if (hashtags != null)
        'hashtags': hashtags?.toJson(valueToJson: (v) => v.toJson()),
      if (voteCount != null) 'voteCount': voteCount,
      if (numberOfLikes != null) 'numberOfLikes': numberOfLikes,
      if (numberOfComments != null) 'numberOfComments': numberOfComments,
      if (numberOfViews != null) 'numberOfViews': numberOfViews,
      if (imagesUrl != null) 'imagesUrl': imagesUrl?.toJson(),
      if (updatedAt != null) 'updatedAt': updatedAt?.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'ownerId': ownerId,
      if (owner != null) 'owner': owner?.toJsonForProtocol(),
      if (question != null) 'question': question,
      if (taggedUsers != null)
        'taggedUsers':
            taggedUsers?.toJson(valueToJson: (v) => v.toJsonForProtocol()),
      if (locations != null)
        'locations':
            locations?.toJson(valueToJson: (v) => v.toJsonForProtocol()),
      if (mentions != null)
        'mentions': mentions?.toJson(valueToJson: (v) => v.toJsonForProtocol()),
      if (options != null) 'options': options?.toJsonForProtocol(),
      if (tags != null) 'tags': tags?.toJson(),
      if (createdAt != null) 'createdAt': createdAt?.toJson(),
      if (pollDuration != null) 'pollDuration': pollDuration,
      if (hashtags != null)
        'hashtags': hashtags?.toJson(valueToJson: (v) => v.toJsonForProtocol()),
      if (voteCount != null) 'voteCount': voteCount,
      if (numberOfLikes != null) 'numberOfLikes': numberOfLikes,
      if (numberOfComments != null) 'numberOfComments': numberOfComments,
      if (numberOfViews != null) 'numberOfViews': numberOfViews,
      if (imagesUrl != null) 'imagesUrl': imagesUrl?.toJson(),
      if (updatedAt != null) 'updatedAt': updatedAt?.toJson(),
    };
  }

  static PollInclude include({
    _i2.UserRecordInclude? owner,
    _i5.PollsHashtagsIncludeList? hashtags,
  }) {
    return PollInclude._(
      owner: owner,
      hashtags: hashtags,
    );
  }

  static PollIncludeList includeList({
    _i1.WhereExpressionBuilder<PollTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<PollTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<PollTable>? orderByList,
    PollInclude? include,
  }) {
    return PollIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Poll.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(Poll.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _PollImpl extends Poll {
  _PollImpl({
    int? id,
    required int ownerId,
    _i2.UserRecord? owner,
    String? question,
    List<_i2.UserRecord>? taggedUsers,
    List<_i3.AWSPlaces>? locations,
    List<_i2.UserRecord>? mentions,
    _i4.PollOption? options,
    List<String>? tags,
    DateTime? createdAt,
    int? pollDuration,
    List<_i5.PollsHashtags>? hashtags,
    int? voteCount,
    int? numberOfLikes,
    int? numberOfComments,
    int? numberOfViews,
    List<String>? imagesUrl,
    DateTime? updatedAt,
  }) : super._(
          id: id,
          ownerId: ownerId,
          owner: owner,
          question: question,
          taggedUsers: taggedUsers,
          locations: locations,
          mentions: mentions,
          options: options,
          tags: tags,
          createdAt: createdAt,
          pollDuration: pollDuration,
          hashtags: hashtags,
          voteCount: voteCount,
          numberOfLikes: numberOfLikes,
          numberOfComments: numberOfComments,
          numberOfViews: numberOfViews,
          imagesUrl: imagesUrl,
          updatedAt: updatedAt,
        );

  /// Returns a shallow copy of this [Poll]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  Poll copyWith({
    Object? id = _Undefined,
    int? ownerId,
    Object? owner = _Undefined,
    Object? question = _Undefined,
    Object? taggedUsers = _Undefined,
    Object? locations = _Undefined,
    Object? mentions = _Undefined,
    Object? options = _Undefined,
    Object? tags = _Undefined,
    Object? createdAt = _Undefined,
    Object? pollDuration = _Undefined,
    Object? hashtags = _Undefined,
    Object? voteCount = _Undefined,
    Object? numberOfLikes = _Undefined,
    Object? numberOfComments = _Undefined,
    Object? numberOfViews = _Undefined,
    Object? imagesUrl = _Undefined,
    Object? updatedAt = _Undefined,
  }) {
    return Poll(
      id: id is int? ? id : this.id,
      ownerId: ownerId ?? this.ownerId,
      owner: owner is _i2.UserRecord? ? owner : this.owner?.copyWith(),
      question: question is String? ? question : this.question,
      taggedUsers: taggedUsers is List<_i2.UserRecord>?
          ? taggedUsers
          : this.taggedUsers?.map((e0) => e0.copyWith()).toList(),
      locations: locations is List<_i3.AWSPlaces>?
          ? locations
          : this.locations?.map((e0) => e0.copyWith()).toList(),
      mentions: mentions is List<_i2.UserRecord>?
          ? mentions
          : this.mentions?.map((e0) => e0.copyWith()).toList(),
      options: options is _i4.PollOption? ? options : this.options?.copyWith(),
      tags: tags is List<String>? ? tags : this.tags?.map((e0) => e0).toList(),
      createdAt: createdAt is DateTime? ? createdAt : this.createdAt,
      pollDuration: pollDuration is int? ? pollDuration : this.pollDuration,
      hashtags: hashtags is List<_i5.PollsHashtags>?
          ? hashtags
          : this.hashtags?.map((e0) => e0.copyWith()).toList(),
      voteCount: voteCount is int? ? voteCount : this.voteCount,
      numberOfLikes: numberOfLikes is int? ? numberOfLikes : this.numberOfLikes,
      numberOfComments:
          numberOfComments is int? ? numberOfComments : this.numberOfComments,
      numberOfViews: numberOfViews is int? ? numberOfViews : this.numberOfViews,
      imagesUrl: imagesUrl is List<String>?
          ? imagesUrl
          : this.imagesUrl?.map((e0) => e0).toList(),
      updatedAt: updatedAt is DateTime? ? updatedAt : this.updatedAt,
    );
  }
}

class PollTable extends _i1.Table<int?> {
  PollTable({super.tableRelation}) : super(tableName: 'poll') {
    ownerId = _i1.ColumnInt(
      'ownerId',
      this,
    );
    question = _i1.ColumnString(
      'question',
      this,
    );
    taggedUsers = _i1.ColumnSerializable(
      'taggedUsers',
      this,
    );
    locations = _i1.ColumnSerializable(
      'locations',
      this,
    );
    mentions = _i1.ColumnSerializable(
      'mentions',
      this,
    );
    options = _i1.ColumnSerializable(
      'options',
      this,
    );
    tags = _i1.ColumnSerializable(
      'tags',
      this,
    );
    createdAt = _i1.ColumnDateTime(
      'createdAt',
      this,
    );
    pollDuration = _i1.ColumnInt(
      'pollDuration',
      this,
    );
    voteCount = _i1.ColumnInt(
      'voteCount',
      this,
    );
    numberOfLikes = _i1.ColumnInt(
      'numberOfLikes',
      this,
    );
    numberOfComments = _i1.ColumnInt(
      'numberOfComments',
      this,
    );
    numberOfViews = _i1.ColumnInt(
      'numberOfViews',
      this,
    );
    imagesUrl = _i1.ColumnSerializable(
      'imagesUrl',
      this,
    );
    updatedAt = _i1.ColumnDateTime(
      'updatedAt',
      this,
    );
  }

  late final _i1.ColumnInt ownerId;

  _i2.UserRecordTable? _owner;

  late final _i1.ColumnString question;

  late final _i1.ColumnSerializable taggedUsers;

  late final _i1.ColumnSerializable locations;

  late final _i1.ColumnSerializable mentions;

  late final _i1.ColumnSerializable options;

  late final _i1.ColumnSerializable tags;

  late final _i1.ColumnDateTime createdAt;

  late final _i1.ColumnInt pollDuration;

  _i5.PollsHashtagsTable? ___hashtags;

  _i1.ManyRelation<_i5.PollsHashtagsTable>? _hashtags;

  late final _i1.ColumnInt voteCount;

  late final _i1.ColumnInt numberOfLikes;

  late final _i1.ColumnInt numberOfComments;

  late final _i1.ColumnInt numberOfViews;

  late final _i1.ColumnSerializable imagesUrl;

  late final _i1.ColumnDateTime updatedAt;

  _i2.UserRecordTable get owner {
    if (_owner != null) return _owner!;
    _owner = _i1.createRelationTable(
      relationFieldName: 'owner',
      field: Poll.t.ownerId,
      foreignField: _i2.UserRecord.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.UserRecordTable(tableRelation: foreignTableRelation),
    );
    return _owner!;
  }

  _i5.PollsHashtagsTable get __hashtags {
    if (___hashtags != null) return ___hashtags!;
    ___hashtags = _i1.createRelationTable(
      relationFieldName: '__hashtags',
      field: Poll.t.id,
      foreignField: _i5.PollsHashtags.t.pollId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i5.PollsHashtagsTable(tableRelation: foreignTableRelation),
    );
    return ___hashtags!;
  }

  _i1.ManyRelation<_i5.PollsHashtagsTable> get hashtags {
    if (_hashtags != null) return _hashtags!;
    var relationTable = _i1.createRelationTable(
      relationFieldName: 'hashtags',
      field: Poll.t.id,
      foreignField: _i5.PollsHashtags.t.pollId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i5.PollsHashtagsTable(tableRelation: foreignTableRelation),
    );
    _hashtags = _i1.ManyRelation<_i5.PollsHashtagsTable>(
      tableWithRelations: relationTable,
      table: _i5.PollsHashtagsTable(
          tableRelation: relationTable.tableRelation!.lastRelation),
    );
    return _hashtags!;
  }

  @override
  List<_i1.Column> get columns => [
        id,
        ownerId,
        question,
        taggedUsers,
        locations,
        mentions,
        options,
        tags,
        createdAt,
        pollDuration,
        voteCount,
        numberOfLikes,
        numberOfComments,
        numberOfViews,
        imagesUrl,
        updatedAt,
      ];

  @override
  _i1.Table? getRelationTable(String relationField) {
    if (relationField == 'owner') {
      return owner;
    }
    if (relationField == 'hashtags') {
      return __hashtags;
    }
    return null;
  }
}

class PollInclude extends _i1.IncludeObject {
  PollInclude._({
    _i2.UserRecordInclude? owner,
    _i5.PollsHashtagsIncludeList? hashtags,
  }) {
    _owner = owner;
    _hashtags = hashtags;
  }

  _i2.UserRecordInclude? _owner;

  _i5.PollsHashtagsIncludeList? _hashtags;

  @override
  Map<String, _i1.Include?> get includes => {
        'owner': _owner,
        'hashtags': _hashtags,
      };

  @override
  _i1.Table<int?> get table => Poll.t;
}

class PollIncludeList extends _i1.IncludeList {
  PollIncludeList._({
    _i1.WhereExpressionBuilder<PollTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(Poll.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => Poll.t;
}

class PollRepository {
  const PollRepository._();

  final attach = const PollAttachRepository._();

  final attachRow = const PollAttachRowRepository._();

  final detach = const PollDetachRepository._();

  final detachRow = const PollDetachRowRepository._();

  /// Returns a list of [Poll]s matching the given query parameters.
  ///
  /// Use [where] to specify which items to include in the return value.
  /// If none is specified, all items will be returned.
  ///
  /// To specify the order of the items use [orderBy] or [orderByList]
  /// when sorting by multiple columns.
  ///
  /// The maximum number of items can be set by [limit]. If no limit is set,
  /// all items matching the query will be returned.
  ///
  /// [offset] defines how many items to skip, after which [limit] (or all)
  /// items are read from the database.
  ///
  /// ```dart
  /// var persons = await Persons.db.find(
  ///   session,
  ///   where: (t) => t.lastName.equals('Jones'),
  ///   orderBy: (t) => t.firstName,
  ///   limit: 100,
  /// );
  /// ```
  Future<List<Poll>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<PollTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<PollTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<PollTable>? orderByList,
    _i1.Transaction? transaction,
    PollInclude? include,
  }) async {
    return session.db.find<Poll>(
      where: where?.call(Poll.t),
      orderBy: orderBy?.call(Poll.t),
      orderByList: orderByList?.call(Poll.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Returns the first matching [Poll] matching the given query parameters.
  ///
  /// Use [where] to specify which items to include in the return value.
  /// If none is specified, all items will be returned.
  ///
  /// To specify the order use [orderBy] or [orderByList]
  /// when sorting by multiple columns.
  ///
  /// [offset] defines how many items to skip, after which the next one will be picked.
  ///
  /// ```dart
  /// var youngestPerson = await Persons.db.findFirstRow(
  ///   session,
  ///   where: (t) => t.lastName.equals('Jones'),
  ///   orderBy: (t) => t.age,
  /// );
  /// ```
  Future<Poll?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<PollTable>? where,
    int? offset,
    _i1.OrderByBuilder<PollTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<PollTable>? orderByList,
    _i1.Transaction? transaction,
    PollInclude? include,
  }) async {
    return session.db.findFirstRow<Poll>(
      where: where?.call(Poll.t),
      orderBy: orderBy?.call(Poll.t),
      orderByList: orderByList?.call(Poll.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Finds a single [Poll] by its [id] or null if no such row exists.
  Future<Poll?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
    PollInclude? include,
  }) async {
    return session.db.findById<Poll>(
      id,
      transaction: transaction,
      include: include,
    );
  }

  /// Inserts all [Poll]s in the list and returns the inserted rows.
  ///
  /// The returned [Poll]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<Poll>> insert(
    _i1.Session session,
    List<Poll> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<Poll>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [Poll] and returns the inserted row.
  ///
  /// The returned [Poll] will have its `id` field set.
  Future<Poll> insertRow(
    _i1.Session session,
    Poll row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<Poll>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [Poll]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<Poll>> update(
    _i1.Session session,
    List<Poll> rows, {
    _i1.ColumnSelections<PollTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<Poll>(
      rows,
      columns: columns?.call(Poll.t),
      transaction: transaction,
    );
  }

  /// Updates a single [Poll]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<Poll> updateRow(
    _i1.Session session,
    Poll row, {
    _i1.ColumnSelections<PollTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<Poll>(
      row,
      columns: columns?.call(Poll.t),
      transaction: transaction,
    );
  }

  /// Deletes all [Poll]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<Poll>> delete(
    _i1.Session session,
    List<Poll> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<Poll>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [Poll].
  Future<Poll> deleteRow(
    _i1.Session session,
    Poll row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<Poll>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<Poll>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<PollTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<Poll>(
      where: where(Poll.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<PollTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<Poll>(
      where: where?.call(Poll.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

class PollAttachRepository {
  const PollAttachRepository._();

  /// Creates a relation between this [Poll] and the given [PollsHashtags]s
  /// by setting each [PollsHashtags]'s foreign key `pollId` to refer to this [Poll].
  Future<void> hashtags(
    _i1.Session session,
    Poll poll,
    List<_i5.PollsHashtags> pollsHashtags, {
    _i1.Transaction? transaction,
  }) async {
    if (pollsHashtags.any((e) => e.id == null)) {
      throw ArgumentError.notNull('pollsHashtags.id');
    }
    if (poll.id == null) {
      throw ArgumentError.notNull('poll.id');
    }

    var $pollsHashtags =
        pollsHashtags.map((e) => e.copyWith(pollId: poll.id)).toList();
    await session.db.update<_i5.PollsHashtags>(
      $pollsHashtags,
      columns: [_i5.PollsHashtags.t.pollId],
      transaction: transaction,
    );
  }
}

class PollAttachRowRepository {
  const PollAttachRowRepository._();

  /// Creates a relation between the given [Poll] and [UserRecord]
  /// by setting the [Poll]'s foreign key `ownerId` to refer to the [UserRecord].
  Future<void> owner(
    _i1.Session session,
    Poll poll,
    _i2.UserRecord owner, {
    _i1.Transaction? transaction,
  }) async {
    if (poll.id == null) {
      throw ArgumentError.notNull('poll.id');
    }
    if (owner.id == null) {
      throw ArgumentError.notNull('owner.id');
    }

    var $poll = poll.copyWith(ownerId: owner.id);
    await session.db.updateRow<Poll>(
      $poll,
      columns: [Poll.t.ownerId],
      transaction: transaction,
    );
  }

  /// Creates a relation between this [Poll] and the given [PollsHashtags]
  /// by setting the [PollsHashtags]'s foreign key `pollId` to refer to this [Poll].
  Future<void> hashtags(
    _i1.Session session,
    Poll poll,
    _i5.PollsHashtags pollsHashtags, {
    _i1.Transaction? transaction,
  }) async {
    if (pollsHashtags.id == null) {
      throw ArgumentError.notNull('pollsHashtags.id');
    }
    if (poll.id == null) {
      throw ArgumentError.notNull('poll.id');
    }

    var $pollsHashtags = pollsHashtags.copyWith(pollId: poll.id);
    await session.db.updateRow<_i5.PollsHashtags>(
      $pollsHashtags,
      columns: [_i5.PollsHashtags.t.pollId],
      transaction: transaction,
    );
  }
}

class PollDetachRepository {
  const PollDetachRepository._();

  /// Detaches the relation between this [Poll] and the given [PollsHashtags]
  /// by setting the [PollsHashtags]'s foreign key `pollId` to `null`.
  ///
  /// This removes the association between the two models without deleting
  /// the related record.
  Future<void> hashtags(
    _i1.Session session,
    List<_i5.PollsHashtags> pollsHashtags, {
    _i1.Transaction? transaction,
  }) async {
    if (pollsHashtags.any((e) => e.id == null)) {
      throw ArgumentError.notNull('pollsHashtags.id');
    }

    var $pollsHashtags =
        pollsHashtags.map((e) => e.copyWith(pollId: null)).toList();
    await session.db.update<_i5.PollsHashtags>(
      $pollsHashtags,
      columns: [_i5.PollsHashtags.t.pollId],
      transaction: transaction,
    );
  }
}

class PollDetachRowRepository {
  const PollDetachRowRepository._();

  /// Detaches the relation between this [Poll] and the given [PollsHashtags]
  /// by setting the [PollsHashtags]'s foreign key `pollId` to `null`.
  ///
  /// This removes the association between the two models without deleting
  /// the related record.
  Future<void> hashtags(
    _i1.Session session,
    _i5.PollsHashtags pollsHashtags, {
    _i1.Transaction? transaction,
  }) async {
    if (pollsHashtags.id == null) {
      throw ArgumentError.notNull('pollsHashtags.id');
    }

    var $pollsHashtags = pollsHashtags.copyWith(pollId: null);
    await session.db.updateRow<_i5.PollsHashtags>(
      $pollsHashtags,
      columns: [_i5.PollsHashtags.t.pollId],
      transaction: transaction,
    );
  }
}
