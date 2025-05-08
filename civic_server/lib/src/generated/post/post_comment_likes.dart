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
import '../post/post_comment.dart' as _i2;
import '../user/user_record.dart' as _i3;

abstract class PostCommentLikes
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  PostCommentLikes._({
    this.id,
    required this.postCommentId,
    this.postComment,
    required this.ownerId,
    this.owner,
    this.dateCreated,
  });

  factory PostCommentLikes({
    int? id,
    required int postCommentId,
    _i2.PostComment? postComment,
    required int ownerId,
    _i3.UserRecord? owner,
    DateTime? dateCreated,
  }) = _PostCommentLikesImpl;

  factory PostCommentLikes.fromJson(Map<String, dynamic> jsonSerialization) {
    return PostCommentLikes(
      id: jsonSerialization['id'] as int?,
      postCommentId: jsonSerialization['postCommentId'] as int,
      postComment: jsonSerialization['postComment'] == null
          ? null
          : _i2.PostComment.fromJson(
              (jsonSerialization['postComment'] as Map<String, dynamic>)),
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

  static final t = PostCommentLikesTable();

  static const db = PostCommentLikesRepository._();

  @override
  int? id;

  int postCommentId;

  _i2.PostComment? postComment;

  int ownerId;

  _i3.UserRecord? owner;

  DateTime? dateCreated;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [PostCommentLikes]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  PostCommentLikes copyWith({
    int? id,
    int? postCommentId,
    _i2.PostComment? postComment,
    int? ownerId,
    _i3.UserRecord? owner,
    DateTime? dateCreated,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'postCommentId': postCommentId,
      if (postComment != null) 'postComment': postComment?.toJson(),
      'ownerId': ownerId,
      if (owner != null) 'owner': owner?.toJson(),
      if (dateCreated != null) 'dateCreated': dateCreated?.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'postCommentId': postCommentId,
      if (postComment != null) 'postComment': postComment?.toJsonForProtocol(),
      'ownerId': ownerId,
      if (owner != null) 'owner': owner?.toJsonForProtocol(),
      if (dateCreated != null) 'dateCreated': dateCreated?.toJson(),
    };
  }

  static PostCommentLikesInclude include({
    _i2.PostCommentInclude? postComment,
    _i3.UserRecordInclude? owner,
  }) {
    return PostCommentLikesInclude._(
      postComment: postComment,
      owner: owner,
    );
  }

  static PostCommentLikesIncludeList includeList({
    _i1.WhereExpressionBuilder<PostCommentLikesTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<PostCommentLikesTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<PostCommentLikesTable>? orderByList,
    PostCommentLikesInclude? include,
  }) {
    return PostCommentLikesIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(PostCommentLikes.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(PostCommentLikes.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _PostCommentLikesImpl extends PostCommentLikes {
  _PostCommentLikesImpl({
    int? id,
    required int postCommentId,
    _i2.PostComment? postComment,
    required int ownerId,
    _i3.UserRecord? owner,
    DateTime? dateCreated,
  }) : super._(
          id: id,
          postCommentId: postCommentId,
          postComment: postComment,
          ownerId: ownerId,
          owner: owner,
          dateCreated: dateCreated,
        );

  /// Returns a shallow copy of this [PostCommentLikes]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  PostCommentLikes copyWith({
    Object? id = _Undefined,
    int? postCommentId,
    Object? postComment = _Undefined,
    int? ownerId,
    Object? owner = _Undefined,
    Object? dateCreated = _Undefined,
  }) {
    return PostCommentLikes(
      id: id is int? ? id : this.id,
      postCommentId: postCommentId ?? this.postCommentId,
      postComment: postComment is _i2.PostComment?
          ? postComment
          : this.postComment?.copyWith(),
      ownerId: ownerId ?? this.ownerId,
      owner: owner is _i3.UserRecord? ? owner : this.owner?.copyWith(),
      dateCreated: dateCreated is DateTime? ? dateCreated : this.dateCreated,
    );
  }
}

class PostCommentLikesTable extends _i1.Table<int?> {
  PostCommentLikesTable({super.tableRelation})
      : super(tableName: 'post_comment_likes') {
    postCommentId = _i1.ColumnInt(
      'postCommentId',
      this,
    );
    ownerId = _i1.ColumnInt(
      'ownerId',
      this,
    );
    dateCreated = _i1.ColumnDateTime(
      'dateCreated',
      this,
    );
  }

  late final _i1.ColumnInt postCommentId;

  _i2.PostCommentTable? _postComment;

  late final _i1.ColumnInt ownerId;

  _i3.UserRecordTable? _owner;

  late final _i1.ColumnDateTime dateCreated;

  _i2.PostCommentTable get postComment {
    if (_postComment != null) return _postComment!;
    _postComment = _i1.createRelationTable(
      relationFieldName: 'postComment',
      field: PostCommentLikes.t.postCommentId,
      foreignField: _i2.PostComment.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.PostCommentTable(tableRelation: foreignTableRelation),
    );
    return _postComment!;
  }

  _i3.UserRecordTable get owner {
    if (_owner != null) return _owner!;
    _owner = _i1.createRelationTable(
      relationFieldName: 'owner',
      field: PostCommentLikes.t.ownerId,
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
        postCommentId,
        ownerId,
        dateCreated,
      ];

  @override
  _i1.Table? getRelationTable(String relationField) {
    if (relationField == 'postComment') {
      return postComment;
    }
    if (relationField == 'owner') {
      return owner;
    }
    return null;
  }
}

class PostCommentLikesInclude extends _i1.IncludeObject {
  PostCommentLikesInclude._({
    _i2.PostCommentInclude? postComment,
    _i3.UserRecordInclude? owner,
  }) {
    _postComment = postComment;
    _owner = owner;
  }

  _i2.PostCommentInclude? _postComment;

  _i3.UserRecordInclude? _owner;

  @override
  Map<String, _i1.Include?> get includes => {
        'postComment': _postComment,
        'owner': _owner,
      };

  @override
  _i1.Table<int?> get table => PostCommentLikes.t;
}

class PostCommentLikesIncludeList extends _i1.IncludeList {
  PostCommentLikesIncludeList._({
    _i1.WhereExpressionBuilder<PostCommentLikesTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(PostCommentLikes.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => PostCommentLikes.t;
}

class PostCommentLikesRepository {
  const PostCommentLikesRepository._();

  final attachRow = const PostCommentLikesAttachRowRepository._();

  /// Returns a list of [PostCommentLikes]s matching the given query parameters.
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
  Future<List<PostCommentLikes>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<PostCommentLikesTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<PostCommentLikesTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<PostCommentLikesTable>? orderByList,
    _i1.Transaction? transaction,
    PostCommentLikesInclude? include,
  }) async {
    return session.db.find<PostCommentLikes>(
      where: where?.call(PostCommentLikes.t),
      orderBy: orderBy?.call(PostCommentLikes.t),
      orderByList: orderByList?.call(PostCommentLikes.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Returns the first matching [PostCommentLikes] matching the given query parameters.
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
  Future<PostCommentLikes?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<PostCommentLikesTable>? where,
    int? offset,
    _i1.OrderByBuilder<PostCommentLikesTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<PostCommentLikesTable>? orderByList,
    _i1.Transaction? transaction,
    PostCommentLikesInclude? include,
  }) async {
    return session.db.findFirstRow<PostCommentLikes>(
      where: where?.call(PostCommentLikes.t),
      orderBy: orderBy?.call(PostCommentLikes.t),
      orderByList: orderByList?.call(PostCommentLikes.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Finds a single [PostCommentLikes] by its [id] or null if no such row exists.
  Future<PostCommentLikes?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
    PostCommentLikesInclude? include,
  }) async {
    return session.db.findById<PostCommentLikes>(
      id,
      transaction: transaction,
      include: include,
    );
  }

  /// Inserts all [PostCommentLikes]s in the list and returns the inserted rows.
  ///
  /// The returned [PostCommentLikes]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<PostCommentLikes>> insert(
    _i1.Session session,
    List<PostCommentLikes> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<PostCommentLikes>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [PostCommentLikes] and returns the inserted row.
  ///
  /// The returned [PostCommentLikes] will have its `id` field set.
  Future<PostCommentLikes> insertRow(
    _i1.Session session,
    PostCommentLikes row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<PostCommentLikes>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [PostCommentLikes]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<PostCommentLikes>> update(
    _i1.Session session,
    List<PostCommentLikes> rows, {
    _i1.ColumnSelections<PostCommentLikesTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<PostCommentLikes>(
      rows,
      columns: columns?.call(PostCommentLikes.t),
      transaction: transaction,
    );
  }

  /// Updates a single [PostCommentLikes]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<PostCommentLikes> updateRow(
    _i1.Session session,
    PostCommentLikes row, {
    _i1.ColumnSelections<PostCommentLikesTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<PostCommentLikes>(
      row,
      columns: columns?.call(PostCommentLikes.t),
      transaction: transaction,
    );
  }

  /// Deletes all [PostCommentLikes]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<PostCommentLikes>> delete(
    _i1.Session session,
    List<PostCommentLikes> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<PostCommentLikes>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [PostCommentLikes].
  Future<PostCommentLikes> deleteRow(
    _i1.Session session,
    PostCommentLikes row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<PostCommentLikes>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<PostCommentLikes>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<PostCommentLikesTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<PostCommentLikes>(
      where: where(PostCommentLikes.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<PostCommentLikesTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<PostCommentLikes>(
      where: where?.call(PostCommentLikes.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

class PostCommentLikesAttachRowRepository {
  const PostCommentLikesAttachRowRepository._();

  /// Creates a relation between the given [PostCommentLikes] and [PostComment]
  /// by setting the [PostCommentLikes]'s foreign key `postCommentId` to refer to the [PostComment].
  Future<void> postComment(
    _i1.Session session,
    PostCommentLikes postCommentLikes,
    _i2.PostComment postComment, {
    _i1.Transaction? transaction,
  }) async {
    if (postCommentLikes.id == null) {
      throw ArgumentError.notNull('postCommentLikes.id');
    }
    if (postComment.id == null) {
      throw ArgumentError.notNull('postComment.id');
    }

    var $postCommentLikes =
        postCommentLikes.copyWith(postCommentId: postComment.id);
    await session.db.updateRow<PostCommentLikes>(
      $postCommentLikes,
      columns: [PostCommentLikes.t.postCommentId],
      transaction: transaction,
    );
  }

  /// Creates a relation between the given [PostCommentLikes] and [UserRecord]
  /// by setting the [PostCommentLikes]'s foreign key `ownerId` to refer to the [UserRecord].
  Future<void> owner(
    _i1.Session session,
    PostCommentLikes postCommentLikes,
    _i3.UserRecord owner, {
    _i1.Transaction? transaction,
  }) async {
    if (postCommentLikes.id == null) {
      throw ArgumentError.notNull('postCommentLikes.id');
    }
    if (owner.id == null) {
      throw ArgumentError.notNull('owner.id');
    }

    var $postCommentLikes = postCommentLikes.copyWith(ownerId: owner.id);
    await session.db.updateRow<PostCommentLikes>(
      $postCommentLikes,
      columns: [PostCommentLikes.t.ownerId],
      transaction: transaction,
    );
  }
}
