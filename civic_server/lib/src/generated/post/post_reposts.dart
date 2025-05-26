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

abstract class PostReposts
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  PostReposts._({
    this.id,
    required this.postId,
    this.post,
    required this.parentId,
    this.parent,
    required this.ownerId,
    this.owner,
    DateTime? dateCreated,
  }) : dateCreated = dateCreated ?? DateTime.now();

  factory PostReposts({
    int? id,
    required int postId,
    _i2.Post? post,
    required int parentId,
    _i2.Post? parent,
    required int ownerId,
    _i3.UserRecord? owner,
    DateTime? dateCreated,
  }) = _PostRepostsImpl;

  factory PostReposts.fromJson(Map<String, dynamic> jsonSerialization) {
    return PostReposts(
      id: jsonSerialization['id'] as int?,
      postId: jsonSerialization['postId'] as int,
      post: jsonSerialization['post'] == null
          ? null
          : _i2.Post.fromJson(
              (jsonSerialization['post'] as Map<String, dynamic>)),
      parentId: jsonSerialization['parentId'] as int,
      parent: jsonSerialization['parent'] == null
          ? null
          : _i2.Post.fromJson(
              (jsonSerialization['parent'] as Map<String, dynamic>)),
      ownerId: jsonSerialization['ownerId'] as int,
      owner: jsonSerialization['owner'] == null
          ? null
          : _i3.UserRecord.fromJson(
              (jsonSerialization['owner'] as Map<String, dynamic>)),
      dateCreated: jsonSerialization['dateCreated'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(
              jsonSerialization['dateCreated']),
    );
  }

  static final t = PostRepostsTable();

  static const db = PostRepostsRepository._();

  @override
  int? id;

  int postId;

  _i2.Post? post;

  int parentId;

  _i2.Post? parent;

  int ownerId;

  _i3.UserRecord? owner;

  DateTime? dateCreated;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [PostReposts]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  PostReposts copyWith({
    int? id,
    int? postId,
    _i2.Post? post,
    int? parentId,
    _i2.Post? parent,
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
      'parentId': parentId,
      if (parent != null) 'parent': parent?.toJson(),
      'ownerId': ownerId,
      if (owner != null) 'owner': owner?.toJson(),
      if (dateCreated != null) 'dateCreated': dateCreated?.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'postId': postId,
      if (post != null) 'post': post?.toJsonForProtocol(),
      'parentId': parentId,
      if (parent != null) 'parent': parent?.toJsonForProtocol(),
      'ownerId': ownerId,
      if (owner != null) 'owner': owner?.toJsonForProtocol(),
      if (dateCreated != null) 'dateCreated': dateCreated?.toJson(),
    };
  }

  static PostRepostsInclude include({
    _i2.PostInclude? post,
    _i2.PostInclude? parent,
    _i3.UserRecordInclude? owner,
  }) {
    return PostRepostsInclude._(
      post: post,
      parent: parent,
      owner: owner,
    );
  }

  static PostRepostsIncludeList includeList({
    _i1.WhereExpressionBuilder<PostRepostsTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<PostRepostsTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<PostRepostsTable>? orderByList,
    PostRepostsInclude? include,
  }) {
    return PostRepostsIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(PostReposts.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(PostReposts.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _PostRepostsImpl extends PostReposts {
  _PostRepostsImpl({
    int? id,
    required int postId,
    _i2.Post? post,
    required int parentId,
    _i2.Post? parent,
    required int ownerId,
    _i3.UserRecord? owner,
    DateTime? dateCreated,
  }) : super._(
          id: id,
          postId: postId,
          post: post,
          parentId: parentId,
          parent: parent,
          ownerId: ownerId,
          owner: owner,
          dateCreated: dateCreated,
        );

  /// Returns a shallow copy of this [PostReposts]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  PostReposts copyWith({
    Object? id = _Undefined,
    int? postId,
    Object? post = _Undefined,
    int? parentId,
    Object? parent = _Undefined,
    int? ownerId,
    Object? owner = _Undefined,
    Object? dateCreated = _Undefined,
  }) {
    return PostReposts(
      id: id is int? ? id : this.id,
      postId: postId ?? this.postId,
      post: post is _i2.Post? ? post : this.post?.copyWith(),
      parentId: parentId ?? this.parentId,
      parent: parent is _i2.Post? ? parent : this.parent?.copyWith(),
      ownerId: ownerId ?? this.ownerId,
      owner: owner is _i3.UserRecord? ? owner : this.owner?.copyWith(),
      dateCreated: dateCreated is DateTime? ? dateCreated : this.dateCreated,
    );
  }
}

class PostRepostsTable extends _i1.Table<int?> {
  PostRepostsTable({super.tableRelation}) : super(tableName: 'post_reposts') {
    postId = _i1.ColumnInt(
      'postId',
      this,
    );
    parentId = _i1.ColumnInt(
      'parentId',
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

  late final _i1.ColumnInt parentId;

  _i2.PostTable? _parent;

  late final _i1.ColumnInt ownerId;

  _i3.UserRecordTable? _owner;

  late final _i1.ColumnDateTime dateCreated;

  _i2.PostTable get post {
    if (_post != null) return _post!;
    _post = _i1.createRelationTable(
      relationFieldName: 'post',
      field: PostReposts.t.postId,
      foreignField: _i2.Post.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.PostTable(tableRelation: foreignTableRelation),
    );
    return _post!;
  }

  _i2.PostTable get parent {
    if (_parent != null) return _parent!;
    _parent = _i1.createRelationTable(
      relationFieldName: 'parent',
      field: PostReposts.t.parentId,
      foreignField: _i2.Post.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.PostTable(tableRelation: foreignTableRelation),
    );
    return _parent!;
  }

  _i3.UserRecordTable get owner {
    if (_owner != null) return _owner!;
    _owner = _i1.createRelationTable(
      relationFieldName: 'owner',
      field: PostReposts.t.ownerId,
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
        parentId,
        ownerId,
        dateCreated,
      ];

  @override
  _i1.Table? getRelationTable(String relationField) {
    if (relationField == 'post') {
      return post;
    }
    if (relationField == 'parent') {
      return parent;
    }
    if (relationField == 'owner') {
      return owner;
    }
    return null;
  }
}

class PostRepostsInclude extends _i1.IncludeObject {
  PostRepostsInclude._({
    _i2.PostInclude? post,
    _i2.PostInclude? parent,
    _i3.UserRecordInclude? owner,
  }) {
    _post = post;
    _parent = parent;
    _owner = owner;
  }

  _i2.PostInclude? _post;

  _i2.PostInclude? _parent;

  _i3.UserRecordInclude? _owner;

  @override
  Map<String, _i1.Include?> get includes => {
        'post': _post,
        'parent': _parent,
        'owner': _owner,
      };

  @override
  _i1.Table<int?> get table => PostReposts.t;
}

class PostRepostsIncludeList extends _i1.IncludeList {
  PostRepostsIncludeList._({
    _i1.WhereExpressionBuilder<PostRepostsTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(PostReposts.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => PostReposts.t;
}

class PostRepostsRepository {
  const PostRepostsRepository._();

  final attachRow = const PostRepostsAttachRowRepository._();

  /// Returns a list of [PostReposts]s matching the given query parameters.
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
  Future<List<PostReposts>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<PostRepostsTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<PostRepostsTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<PostRepostsTable>? orderByList,
    _i1.Transaction? transaction,
    PostRepostsInclude? include,
  }) async {
    return session.db.find<PostReposts>(
      where: where?.call(PostReposts.t),
      orderBy: orderBy?.call(PostReposts.t),
      orderByList: orderByList?.call(PostReposts.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Returns the first matching [PostReposts] matching the given query parameters.
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
  Future<PostReposts?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<PostRepostsTable>? where,
    int? offset,
    _i1.OrderByBuilder<PostRepostsTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<PostRepostsTable>? orderByList,
    _i1.Transaction? transaction,
    PostRepostsInclude? include,
  }) async {
    return session.db.findFirstRow<PostReposts>(
      where: where?.call(PostReposts.t),
      orderBy: orderBy?.call(PostReposts.t),
      orderByList: orderByList?.call(PostReposts.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Finds a single [PostReposts] by its [id] or null if no such row exists.
  Future<PostReposts?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
    PostRepostsInclude? include,
  }) async {
    return session.db.findById<PostReposts>(
      id,
      transaction: transaction,
      include: include,
    );
  }

  /// Inserts all [PostReposts]s in the list and returns the inserted rows.
  ///
  /// The returned [PostReposts]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<PostReposts>> insert(
    _i1.Session session,
    List<PostReposts> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<PostReposts>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [PostReposts] and returns the inserted row.
  ///
  /// The returned [PostReposts] will have its `id` field set.
  Future<PostReposts> insertRow(
    _i1.Session session,
    PostReposts row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<PostReposts>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [PostReposts]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<PostReposts>> update(
    _i1.Session session,
    List<PostReposts> rows, {
    _i1.ColumnSelections<PostRepostsTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<PostReposts>(
      rows,
      columns: columns?.call(PostReposts.t),
      transaction: transaction,
    );
  }

  /// Updates a single [PostReposts]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<PostReposts> updateRow(
    _i1.Session session,
    PostReposts row, {
    _i1.ColumnSelections<PostRepostsTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<PostReposts>(
      row,
      columns: columns?.call(PostReposts.t),
      transaction: transaction,
    );
  }

  /// Deletes all [PostReposts]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<PostReposts>> delete(
    _i1.Session session,
    List<PostReposts> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<PostReposts>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [PostReposts].
  Future<PostReposts> deleteRow(
    _i1.Session session,
    PostReposts row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<PostReposts>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<PostReposts>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<PostRepostsTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<PostReposts>(
      where: where(PostReposts.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<PostRepostsTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<PostReposts>(
      where: where?.call(PostReposts.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

class PostRepostsAttachRowRepository {
  const PostRepostsAttachRowRepository._();

  /// Creates a relation between the given [PostReposts] and [Post]
  /// by setting the [PostReposts]'s foreign key `postId` to refer to the [Post].
  Future<void> post(
    _i1.Session session,
    PostReposts postReposts,
    _i2.Post post, {
    _i1.Transaction? transaction,
  }) async {
    if (postReposts.id == null) {
      throw ArgumentError.notNull('postReposts.id');
    }
    if (post.id == null) {
      throw ArgumentError.notNull('post.id');
    }

    var $postReposts = postReposts.copyWith(postId: post.id);
    await session.db.updateRow<PostReposts>(
      $postReposts,
      columns: [PostReposts.t.postId],
      transaction: transaction,
    );
  }

  /// Creates a relation between the given [PostReposts] and [Post]
  /// by setting the [PostReposts]'s foreign key `parentId` to refer to the [Post].
  Future<void> parent(
    _i1.Session session,
    PostReposts postReposts,
    _i2.Post parent, {
    _i1.Transaction? transaction,
  }) async {
    if (postReposts.id == null) {
      throw ArgumentError.notNull('postReposts.id');
    }
    if (parent.id == null) {
      throw ArgumentError.notNull('parent.id');
    }

    var $postReposts = postReposts.copyWith(parentId: parent.id);
    await session.db.updateRow<PostReposts>(
      $postReposts,
      columns: [PostReposts.t.parentId],
      transaction: transaction,
    );
  }

  /// Creates a relation between the given [PostReposts] and [UserRecord]
  /// by setting the [PostReposts]'s foreign key `ownerId` to refer to the [UserRecord].
  Future<void> owner(
    _i1.Session session,
    PostReposts postReposts,
    _i3.UserRecord owner, {
    _i1.Transaction? transaction,
  }) async {
    if (postReposts.id == null) {
      throw ArgumentError.notNull('postReposts.id');
    }
    if (owner.id == null) {
      throw ArgumentError.notNull('owner.id');
    }

    var $postReposts = postReposts.copyWith(ownerId: owner.id);
    await session.db.updateRow<PostReposts>(
      $postReposts,
      columns: [PostReposts.t.ownerId],
      transaction: transaction,
    );
  }
}
