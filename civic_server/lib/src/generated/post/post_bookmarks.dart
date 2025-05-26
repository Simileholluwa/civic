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

abstract class PostBookmarks
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  PostBookmarks._({
    this.id,
    required this.postId,
    this.post,
    required this.ownerId,
    this.owner,
    DateTime? dateCreated,
  }) : dateCreated = dateCreated ?? DateTime.now();

  factory PostBookmarks({
    int? id,
    required int postId,
    _i2.Post? post,
    required int ownerId,
    _i3.UserRecord? owner,
    DateTime? dateCreated,
  }) = _PostBookmarksImpl;

  factory PostBookmarks.fromJson(Map<String, dynamic> jsonSerialization) {
    return PostBookmarks(
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

  static final t = PostBookmarksTable();

  static const db = PostBookmarksRepository._();

  @override
  int? id;

  int postId;

  _i2.Post? post;

  int ownerId;

  _i3.UserRecord? owner;

  DateTime dateCreated;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [PostBookmarks]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  PostBookmarks copyWith({
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

  static PostBookmarksInclude include({
    _i2.PostInclude? post,
    _i3.UserRecordInclude? owner,
  }) {
    return PostBookmarksInclude._(
      post: post,
      owner: owner,
    );
  }

  static PostBookmarksIncludeList includeList({
    _i1.WhereExpressionBuilder<PostBookmarksTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<PostBookmarksTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<PostBookmarksTable>? orderByList,
    PostBookmarksInclude? include,
  }) {
    return PostBookmarksIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(PostBookmarks.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(PostBookmarks.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _PostBookmarksImpl extends PostBookmarks {
  _PostBookmarksImpl({
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

  /// Returns a shallow copy of this [PostBookmarks]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  PostBookmarks copyWith({
    Object? id = _Undefined,
    int? postId,
    Object? post = _Undefined,
    int? ownerId,
    Object? owner = _Undefined,
    DateTime? dateCreated,
  }) {
    return PostBookmarks(
      id: id is int? ? id : this.id,
      postId: postId ?? this.postId,
      post: post is _i2.Post? ? post : this.post?.copyWith(),
      ownerId: ownerId ?? this.ownerId,
      owner: owner is _i3.UserRecord? ? owner : this.owner?.copyWith(),
      dateCreated: dateCreated ?? this.dateCreated,
    );
  }
}

class PostBookmarksTable extends _i1.Table<int?> {
  PostBookmarksTable({super.tableRelation})
      : super(tableName: 'post_bookmarks') {
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
      field: PostBookmarks.t.postId,
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
      field: PostBookmarks.t.ownerId,
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

class PostBookmarksInclude extends _i1.IncludeObject {
  PostBookmarksInclude._({
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
  _i1.Table<int?> get table => PostBookmarks.t;
}

class PostBookmarksIncludeList extends _i1.IncludeList {
  PostBookmarksIncludeList._({
    _i1.WhereExpressionBuilder<PostBookmarksTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(PostBookmarks.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => PostBookmarks.t;
}

class PostBookmarksRepository {
  const PostBookmarksRepository._();

  final attachRow = const PostBookmarksAttachRowRepository._();

  /// Returns a list of [PostBookmarks]s matching the given query parameters.
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
  Future<List<PostBookmarks>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<PostBookmarksTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<PostBookmarksTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<PostBookmarksTable>? orderByList,
    _i1.Transaction? transaction,
    PostBookmarksInclude? include,
  }) async {
    return session.db.find<PostBookmarks>(
      where: where?.call(PostBookmarks.t),
      orderBy: orderBy?.call(PostBookmarks.t),
      orderByList: orderByList?.call(PostBookmarks.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Returns the first matching [PostBookmarks] matching the given query parameters.
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
  Future<PostBookmarks?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<PostBookmarksTable>? where,
    int? offset,
    _i1.OrderByBuilder<PostBookmarksTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<PostBookmarksTable>? orderByList,
    _i1.Transaction? transaction,
    PostBookmarksInclude? include,
  }) async {
    return session.db.findFirstRow<PostBookmarks>(
      where: where?.call(PostBookmarks.t),
      orderBy: orderBy?.call(PostBookmarks.t),
      orderByList: orderByList?.call(PostBookmarks.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Finds a single [PostBookmarks] by its [id] or null if no such row exists.
  Future<PostBookmarks?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
    PostBookmarksInclude? include,
  }) async {
    return session.db.findById<PostBookmarks>(
      id,
      transaction: transaction,
      include: include,
    );
  }

  /// Inserts all [PostBookmarks]s in the list and returns the inserted rows.
  ///
  /// The returned [PostBookmarks]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<PostBookmarks>> insert(
    _i1.Session session,
    List<PostBookmarks> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<PostBookmarks>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [PostBookmarks] and returns the inserted row.
  ///
  /// The returned [PostBookmarks] will have its `id` field set.
  Future<PostBookmarks> insertRow(
    _i1.Session session,
    PostBookmarks row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<PostBookmarks>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [PostBookmarks]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<PostBookmarks>> update(
    _i1.Session session,
    List<PostBookmarks> rows, {
    _i1.ColumnSelections<PostBookmarksTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<PostBookmarks>(
      rows,
      columns: columns?.call(PostBookmarks.t),
      transaction: transaction,
    );
  }

  /// Updates a single [PostBookmarks]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<PostBookmarks> updateRow(
    _i1.Session session,
    PostBookmarks row, {
    _i1.ColumnSelections<PostBookmarksTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<PostBookmarks>(
      row,
      columns: columns?.call(PostBookmarks.t),
      transaction: transaction,
    );
  }

  /// Deletes all [PostBookmarks]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<PostBookmarks>> delete(
    _i1.Session session,
    List<PostBookmarks> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<PostBookmarks>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [PostBookmarks].
  Future<PostBookmarks> deleteRow(
    _i1.Session session,
    PostBookmarks row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<PostBookmarks>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<PostBookmarks>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<PostBookmarksTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<PostBookmarks>(
      where: where(PostBookmarks.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<PostBookmarksTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<PostBookmarks>(
      where: where?.call(PostBookmarks.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

class PostBookmarksAttachRowRepository {
  const PostBookmarksAttachRowRepository._();

  /// Creates a relation between the given [PostBookmarks] and [Post]
  /// by setting the [PostBookmarks]'s foreign key `postId` to refer to the [Post].
  Future<void> post(
    _i1.Session session,
    PostBookmarks postBookmarks,
    _i2.Post post, {
    _i1.Transaction? transaction,
  }) async {
    if (postBookmarks.id == null) {
      throw ArgumentError.notNull('postBookmarks.id');
    }
    if (post.id == null) {
      throw ArgumentError.notNull('post.id');
    }

    var $postBookmarks = postBookmarks.copyWith(postId: post.id);
    await session.db.updateRow<PostBookmarks>(
      $postBookmarks,
      columns: [PostBookmarks.t.postId],
      transaction: transaction,
    );
  }

  /// Creates a relation between the given [PostBookmarks] and [UserRecord]
  /// by setting the [PostBookmarks]'s foreign key `ownerId` to refer to the [UserRecord].
  Future<void> owner(
    _i1.Session session,
    PostBookmarks postBookmarks,
    _i3.UserRecord owner, {
    _i1.Transaction? transaction,
  }) async {
    if (postBookmarks.id == null) {
      throw ArgumentError.notNull('postBookmarks.id');
    }
    if (owner.id == null) {
      throw ArgumentError.notNull('owner.id');
    }

    var $postBookmarks = postBookmarks.copyWith(ownerId: owner.id);
    await session.db.updateRow<PostBookmarks>(
      $postBookmarks,
      columns: [PostBookmarks.t.ownerId],
      transaction: transaction,
    );
  }
}
