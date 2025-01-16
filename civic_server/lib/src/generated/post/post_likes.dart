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
import '../post/post.dart' as _i2;
import '../user/user_record.dart' as _i3;

abstract class PostLikes implements _i1.TableRow, _i1.ProtocolSerialization {
  PostLikes._({
    this.id,
    required this.postId,
    this.post,
    required this.ownerId,
    this.owner,
    this.dateCreated,
  });

  factory PostLikes({
    int? id,
    required int postId,
    _i2.Post? post,
    required int ownerId,
    _i3.UserRecord? owner,
    DateTime? dateCreated,
  }) = _PostLikesImpl;

  factory PostLikes.fromJson(Map<String, dynamic> jsonSerialization) {
    return PostLikes(
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
      dateCreated: jsonSerialization['dateCreated'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(
              jsonSerialization['dateCreated']),
    );
  }

  static final t = PostLikesTable();

  static const db = PostLikesRepository._();

  @override
  int? id;

  int postId;

  _i2.Post? post;

  int ownerId;

  _i3.UserRecord? owner;

  DateTime? dateCreated;

  @override
  _i1.Table get table => t;

  PostLikes copyWith({
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
      if (dateCreated != null) 'dateCreated': dateCreated?.toJson(),
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
      if (dateCreated != null) 'dateCreated': dateCreated?.toJson(),
    };
  }

  static PostLikesInclude include({
    _i2.PostInclude? post,
    _i3.UserRecordInclude? owner,
  }) {
    return PostLikesInclude._(
      post: post,
      owner: owner,
    );
  }

  static PostLikesIncludeList includeList({
    _i1.WhereExpressionBuilder<PostLikesTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<PostLikesTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<PostLikesTable>? orderByList,
    PostLikesInclude? include,
  }) {
    return PostLikesIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(PostLikes.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(PostLikes.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _PostLikesImpl extends PostLikes {
  _PostLikesImpl({
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

  @override
  PostLikes copyWith({
    Object? id = _Undefined,
    int? postId,
    Object? post = _Undefined,
    int? ownerId,
    Object? owner = _Undefined,
    Object? dateCreated = _Undefined,
  }) {
    return PostLikes(
      id: id is int? ? id : this.id,
      postId: postId ?? this.postId,
      post: post is _i2.Post? ? post : this.post?.copyWith(),
      ownerId: ownerId ?? this.ownerId,
      owner: owner is _i3.UserRecord? ? owner : this.owner?.copyWith(),
      dateCreated: dateCreated is DateTime? ? dateCreated : this.dateCreated,
    );
  }
}

class PostLikesTable extends _i1.Table {
  PostLikesTable({super.tableRelation}) : super(tableName: 'post_likes') {
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
      field: PostLikes.t.postId,
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
      field: PostLikes.t.ownerId,
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

class PostLikesInclude extends _i1.IncludeObject {
  PostLikesInclude._({
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
  _i1.Table get table => PostLikes.t;
}

class PostLikesIncludeList extends _i1.IncludeList {
  PostLikesIncludeList._({
    _i1.WhereExpressionBuilder<PostLikesTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(PostLikes.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table get table => PostLikes.t;
}

class PostLikesRepository {
  const PostLikesRepository._();

  final attachRow = const PostLikesAttachRowRepository._();

  Future<List<PostLikes>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<PostLikesTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<PostLikesTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<PostLikesTable>? orderByList,
    _i1.Transaction? transaction,
    PostLikesInclude? include,
  }) async {
    return session.db.find<PostLikes>(
      where: where?.call(PostLikes.t),
      orderBy: orderBy?.call(PostLikes.t),
      orderByList: orderByList?.call(PostLikes.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  Future<PostLikes?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<PostLikesTable>? where,
    int? offset,
    _i1.OrderByBuilder<PostLikesTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<PostLikesTable>? orderByList,
    _i1.Transaction? transaction,
    PostLikesInclude? include,
  }) async {
    return session.db.findFirstRow<PostLikes>(
      where: where?.call(PostLikes.t),
      orderBy: orderBy?.call(PostLikes.t),
      orderByList: orderByList?.call(PostLikes.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  Future<PostLikes?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
    PostLikesInclude? include,
  }) async {
    return session.db.findById<PostLikes>(
      id,
      transaction: transaction,
      include: include,
    );
  }

  Future<List<PostLikes>> insert(
    _i1.Session session,
    List<PostLikes> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<PostLikes>(
      rows,
      transaction: transaction,
    );
  }

  Future<PostLikes> insertRow(
    _i1.Session session,
    PostLikes row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<PostLikes>(
      row,
      transaction: transaction,
    );
  }

  Future<List<PostLikes>> update(
    _i1.Session session,
    List<PostLikes> rows, {
    _i1.ColumnSelections<PostLikesTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<PostLikes>(
      rows,
      columns: columns?.call(PostLikes.t),
      transaction: transaction,
    );
  }

  Future<PostLikes> updateRow(
    _i1.Session session,
    PostLikes row, {
    _i1.ColumnSelections<PostLikesTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<PostLikes>(
      row,
      columns: columns?.call(PostLikes.t),
      transaction: transaction,
    );
  }

  Future<List<PostLikes>> delete(
    _i1.Session session,
    List<PostLikes> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<PostLikes>(
      rows,
      transaction: transaction,
    );
  }

  Future<PostLikes> deleteRow(
    _i1.Session session,
    PostLikes row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<PostLikes>(
      row,
      transaction: transaction,
    );
  }

  Future<List<PostLikes>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<PostLikesTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<PostLikes>(
      where: where(PostLikes.t),
      transaction: transaction,
    );
  }

  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<PostLikesTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<PostLikes>(
      where: where?.call(PostLikes.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

class PostLikesAttachRowRepository {
  const PostLikesAttachRowRepository._();

  Future<void> post(
    _i1.Session session,
    PostLikes postLikes,
    _i2.Post post, {
    _i1.Transaction? transaction,
  }) async {
    if (postLikes.id == null) {
      throw ArgumentError.notNull('postLikes.id');
    }
    if (post.id == null) {
      throw ArgumentError.notNull('post.id');
    }

    var $postLikes = postLikes.copyWith(postId: post.id);
    await session.db.updateRow<PostLikes>(
      $postLikes,
      columns: [PostLikes.t.postId],
      transaction: transaction,
    );
  }

  Future<void> owner(
    _i1.Session session,
    PostLikes postLikes,
    _i3.UserRecord owner, {
    _i1.Transaction? transaction,
  }) async {
    if (postLikes.id == null) {
      throw ArgumentError.notNull('postLikes.id');
    }
    if (owner.id == null) {
      throw ArgumentError.notNull('owner.id');
    }

    var $postLikes = postLikes.copyWith(ownerId: owner.id);
    await session.db.updateRow<PostLikes>(
      $postLikes,
      columns: [PostLikes.t.ownerId],
      transaction: transaction,
    );
  }
}
