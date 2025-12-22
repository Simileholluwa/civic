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
import '../post/post.dart' as _i2;
import '../user/user_record.dart' as _i3;

abstract class PostQuotes
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  PostQuotes._({
    this.id,
    required this.postId,
    this.post,
    required this.ownerId,
    this.owner,
    DateTime? dateCreated,
  }) : dateCreated = dateCreated ?? DateTime.now();

  factory PostQuotes({
    int? id,
    required int postId,
    _i2.Post? post,
    required int ownerId,
    _i3.UserRecord? owner,
    DateTime? dateCreated,
  }) = _PostQuotesImpl;

  factory PostQuotes.fromJson(Map<String, dynamic> jsonSerialization) {
    return PostQuotes(
      id: jsonSerialization['id'] as int?,
      postId: jsonSerialization['postId'] as int,
      post: jsonSerialization['post'] == null
          ? null
          : _i2.Post.fromJson(
              (jsonSerialization['post'] as Map<String, dynamic>)),
      ownerId: jsonSerialization['ownerId'] as int,
      owner: jsonSerialization['owner'] == null
          ? null
          : _i3.UserRecord.fromJson(
              (jsonSerialization['owner'] as Map<String, dynamic>)),
      dateCreated:
          _i1.DateTimeJsonExtension.fromJson(jsonSerialization['dateCreated']),
    );
  }

  static final t = PostQuotesTable();

  static const db = PostQuotesRepository._();

  @override
  int? id;

  int postId;

  _i2.Post? post;

  int ownerId;

  _i3.UserRecord? owner;

  DateTime dateCreated;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [PostQuotes]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  PostQuotes copyWith({
    int? id,
    int? postId,
    _i2.Post? post,
    int? ownerId,
    _i3.UserRecord? owner,
    DateTime? dateCreated,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'postId': postId,
      if (post != null) 'post': post?.toJson(),
      'ownerId': ownerId,
      if (owner != null) 'owner': owner?.toJson(),
      'dateCreated': dateCreated.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'postId': postId,
      if (post != null) 'post': post?.toJsonForProtocol(),
      'ownerId': ownerId,
      if (owner != null) 'owner': owner?.toJsonForProtocol(),
      'dateCreated': dateCreated.toJson(),
    };
  }

  static PostQuotesInclude include({
    _i2.PostInclude? post,
    _i3.UserRecordInclude? owner,
  }) {
    return PostQuotesInclude._(
      post: post,
      owner: owner,
    );
  }

  static PostQuotesIncludeList includeList({
    _i1.WhereExpressionBuilder<PostQuotesTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<PostQuotesTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<PostQuotesTable>? orderByList,
    PostQuotesInclude? include,
  }) {
    return PostQuotesIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(PostQuotes.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(PostQuotes.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _PostQuotesImpl extends PostQuotes {
  _PostQuotesImpl({
    int? id,
    required int postId,
    _i2.Post? post,
    required int ownerId,
    _i3.UserRecord? owner,
    DateTime? dateCreated,
  }) : super._(
          id: id,
          postId: postId,
          post: post,
          ownerId: ownerId,
          owner: owner,
          dateCreated: dateCreated,
        );

  /// Returns a shallow copy of this [PostQuotes]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  PostQuotes copyWith({
    Object? id = _Undefined,
    int? postId,
    Object? post = _Undefined,
    int? ownerId,
    Object? owner = _Undefined,
    DateTime? dateCreated,
  }) {
    return PostQuotes(
      id: id is int? ? id : this.id,
      postId: postId ?? this.postId,
      post: post is _i2.Post? ? post : this.post?.copyWith(),
      ownerId: ownerId ?? this.ownerId,
      owner: owner is _i3.UserRecord? ? owner : this.owner?.copyWith(),
      dateCreated: dateCreated ?? this.dateCreated,
    );
  }
}

class PostQuotesTable extends _i1.Table<int?> {
  PostQuotesTable({super.tableRelation}) : super(tableName: 'post_quotes') {
    postId = _i1.ColumnInt(
      'postId',
      this,
    );
    ownerId = _i1.ColumnInt(
      'ownerId',
      this,
    );
    dateCreated = _i1.ColumnDateTime(
      'dateCreated',
      this,
      hasDefault: true,
    );
  }

  late final _i1.ColumnInt postId;

  _i2.PostTable? _post;

  late final _i1.ColumnInt ownerId;

  _i3.UserRecordTable? _owner;

  late final _i1.ColumnDateTime dateCreated;

  _i2.PostTable get post {
    if (_post != null) return _post!;
    _post = _i1.createRelationTable(
      relationFieldName: 'post',
      field: PostQuotes.t.postId,
      foreignField: _i2.Post.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.PostTable(tableRelation: foreignTableRelation),
    );
    return _post!;
  }

  _i3.UserRecordTable get owner {
    if (_owner != null) return _owner!;
    _owner = _i1.createRelationTable(
      relationFieldName: 'owner',
      field: PostQuotes.t.ownerId,
      foreignField: _i3.UserRecord.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i3.UserRecordTable(tableRelation: foreignTableRelation),
    );
    return _owner!;
  }

  @override
  List<_i1.Column> get columns => [
        id,
        postId,
        ownerId,
        dateCreated,
      ];

  @override
  _i1.Table? getRelationTable(String relationField) {
    if (relationField == 'post') {
      return post;
    }
    if (relationField == 'owner') {
      return owner;
    }
    return null;
  }
}

class PostQuotesInclude extends _i1.IncludeObject {
  PostQuotesInclude._({
    _i2.PostInclude? post,
    _i3.UserRecordInclude? owner,
  }) {
    _post = post;
    _owner = owner;
  }

  _i2.PostInclude? _post;

  _i3.UserRecordInclude? _owner;

  @override
  Map<String, _i1.Include?> get includes => {
        'post': _post,
        'owner': _owner,
      };

  @override
  _i1.Table<int?> get table => PostQuotes.t;
}

class PostQuotesIncludeList extends _i1.IncludeList {
  PostQuotesIncludeList._({
    _i1.WhereExpressionBuilder<PostQuotesTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(PostQuotes.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => PostQuotes.t;
}

class PostQuotesRepository {
  const PostQuotesRepository._();

  final attachRow = const PostQuotesAttachRowRepository._();

  /// Returns a list of [PostQuotes]s matching the given query parameters.
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
  Future<List<PostQuotes>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<PostQuotesTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<PostQuotesTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<PostQuotesTable>? orderByList,
    _i1.Transaction? transaction,
    PostQuotesInclude? include,
  }) async {
    return session.db.find<PostQuotes>(
      where: where?.call(PostQuotes.t),
      orderBy: orderBy?.call(PostQuotes.t),
      orderByList: orderByList?.call(PostQuotes.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Returns the first matching [PostQuotes] matching the given query parameters.
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
  Future<PostQuotes?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<PostQuotesTable>? where,
    int? offset,
    _i1.OrderByBuilder<PostQuotesTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<PostQuotesTable>? orderByList,
    _i1.Transaction? transaction,
    PostQuotesInclude? include,
  }) async {
    return session.db.findFirstRow<PostQuotes>(
      where: where?.call(PostQuotes.t),
      orderBy: orderBy?.call(PostQuotes.t),
      orderByList: orderByList?.call(PostQuotes.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Finds a single [PostQuotes] by its [id] or null if no such row exists.
  Future<PostQuotes?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
    PostQuotesInclude? include,
  }) async {
    return session.db.findById<PostQuotes>(
      id,
      transaction: transaction,
      include: include,
    );
  }

  /// Inserts all [PostQuotes]s in the list and returns the inserted rows.
  ///
  /// The returned [PostQuotes]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<PostQuotes>> insert(
    _i1.Session session,
    List<PostQuotes> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<PostQuotes>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [PostQuotes] and returns the inserted row.
  ///
  /// The returned [PostQuotes] will have its `id` field set.
  Future<PostQuotes> insertRow(
    _i1.Session session,
    PostQuotes row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<PostQuotes>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [PostQuotes]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<PostQuotes>> update(
    _i1.Session session,
    List<PostQuotes> rows, {
    _i1.ColumnSelections<PostQuotesTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<PostQuotes>(
      rows,
      columns: columns?.call(PostQuotes.t),
      transaction: transaction,
    );
  }

  /// Updates a single [PostQuotes]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<PostQuotes> updateRow(
    _i1.Session session,
    PostQuotes row, {
    _i1.ColumnSelections<PostQuotesTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<PostQuotes>(
      row,
      columns: columns?.call(PostQuotes.t),
      transaction: transaction,
    );
  }

  /// Deletes all [PostQuotes]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<PostQuotes>> delete(
    _i1.Session session,
    List<PostQuotes> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<PostQuotes>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [PostQuotes].
  Future<PostQuotes> deleteRow(
    _i1.Session session,
    PostQuotes row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<PostQuotes>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<PostQuotes>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<PostQuotesTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<PostQuotes>(
      where: where(PostQuotes.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<PostQuotesTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<PostQuotes>(
      where: where?.call(PostQuotes.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

class PostQuotesAttachRowRepository {
  const PostQuotesAttachRowRepository._();

  /// Creates a relation between the given [PostQuotes] and [Post]
  /// by setting the [PostQuotes]'s foreign key `postId` to refer to the [Post].
  Future<void> post(
    _i1.Session session,
    PostQuotes postQuotes,
    _i2.Post post, {
    _i1.Transaction? transaction,
  }) async {
    if (postQuotes.id == null) {
      throw ArgumentError.notNull('postQuotes.id');
    }
    if (post.id == null) {
      throw ArgumentError.notNull('post.id');
    }

    var $postQuotes = postQuotes.copyWith(postId: post.id);
    await session.db.updateRow<PostQuotes>(
      $postQuotes,
      columns: [PostQuotes.t.postId],
      transaction: transaction,
    );
  }

  /// Creates a relation between the given [PostQuotes] and [UserRecord]
  /// by setting the [PostQuotes]'s foreign key `ownerId` to refer to the [UserRecord].
  Future<void> owner(
    _i1.Session session,
    PostQuotes postQuotes,
    _i3.UserRecord owner, {
    _i1.Transaction? transaction,
  }) async {
    if (postQuotes.id == null) {
      throw ArgumentError.notNull('postQuotes.id');
    }
    if (owner.id == null) {
      throw ArgumentError.notNull('owner.id');
    }

    var $postQuotes = postQuotes.copyWith(ownerId: owner.id);
    await session.db.updateRow<PostQuotes>(
      $postQuotes,
      columns: [PostQuotes.t.ownerId],
      transaction: transaction,
    );
  }
}
