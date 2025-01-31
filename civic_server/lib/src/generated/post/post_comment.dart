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
import '../post/post_comment.dart' as _i4;

abstract class PostComment implements _i1.TableRow, _i1.ProtocolSerialization {
  PostComment._({
    this.id,
    required this.postId,
    this.post,
    required this.ownerId,
    this.owner,
    this.text,
    this.dateCreated,
    this.dateUpdated,
    this.imageUrls,
    this.videoUrl,
    this.likedBy,
    this.replyBy,
    this.parentId,
    this.parent,
  });

  factory PostComment({
    int? id,
    required int postId,
    _i2.Post? post,
    required int ownerId,
    _i3.UserRecord? owner,
    String? text,
    DateTime? dateCreated,
    DateTime? dateUpdated,
    List<String>? imageUrls,
    String? videoUrl,
    List<int>? likedBy,
    List<int>? replyBy,
    int? parentId,
    _i4.PostComment? parent,
  }) = _PostCommentImpl;

  factory PostComment.fromJson(Map<String, dynamic> jsonSerialization) {
    return PostComment(
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
      text: jsonSerialization['text'] as String?,
      dateCreated: jsonSerialization['dateCreated'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(
              jsonSerialization['dateCreated']),
      dateUpdated: jsonSerialization['dateUpdated'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(
              jsonSerialization['dateUpdated']),
      imageUrls: (jsonSerialization['imageUrls'] as List?)
          ?.map((e) => e as String)
          .toList(),
      videoUrl: jsonSerialization['videoUrl'] as String?,
      likedBy: (jsonSerialization['likedBy'] as List?)
          ?.map((e) => e as int)
          .toList(),
      replyBy: (jsonSerialization['replyBy'] as List?)
          ?.map((e) => e as int)
          .toList(),
      parentId: jsonSerialization['parentId'] as int?,
      parent: jsonSerialization['parent'] == null
          ? null
          : _i4.PostComment.fromJson(
              (jsonSerialization['parent'] as Map<String, dynamic>)),
    );
  }

  static final t = PostCommentTable();

  static const db = PostCommentRepository._();

  @override
  int? id;

  int postId;

  _i2.Post? post;

  int ownerId;

  _i3.UserRecord? owner;

  String? text;

  DateTime? dateCreated;

  DateTime? dateUpdated;

  List<String>? imageUrls;

  String? videoUrl;

  List<int>? likedBy;

  List<int>? replyBy;

  int? parentId;

  _i4.PostComment? parent;

  @override
  _i1.Table get table => t;

  PostComment copyWith({
    int? id,
    int? postId,
    _i2.Post? post,
    int? ownerId,
    _i3.UserRecord? owner,
    String? text,
    DateTime? dateCreated,
    DateTime? dateUpdated,
    List<String>? imageUrls,
    String? videoUrl,
    List<int>? likedBy,
    List<int>? replyBy,
    int? parentId,
    _i4.PostComment? parent,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'postId': postId,
      if (post != null) 'post': post?.toJson(),
      'ownerId': ownerId,
      if (owner != null) 'owner': owner?.toJson(),
      if (text != null) 'text': text,
      if (dateCreated != null) 'dateCreated': dateCreated?.toJson(),
      if (dateUpdated != null) 'dateUpdated': dateUpdated?.toJson(),
      if (imageUrls != null) 'imageUrls': imageUrls?.toJson(),
      if (videoUrl != null) 'videoUrl': videoUrl,
      if (likedBy != null) 'likedBy': likedBy?.toJson(),
      if (replyBy != null) 'replyBy': replyBy?.toJson(),
      if (parentId != null) 'parentId': parentId,
      if (parent != null) 'parent': parent?.toJson(),
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
      if (text != null) 'text': text,
      if (dateCreated != null) 'dateCreated': dateCreated?.toJson(),
      if (dateUpdated != null) 'dateUpdated': dateUpdated?.toJson(),
      if (imageUrls != null) 'imageUrls': imageUrls?.toJson(),
      if (videoUrl != null) 'videoUrl': videoUrl,
      if (likedBy != null) 'likedBy': likedBy?.toJson(),
      if (replyBy != null) 'replyBy': replyBy?.toJson(),
      if (parentId != null) 'parentId': parentId,
      if (parent != null) 'parent': parent?.toJsonForProtocol(),
    };
  }

  static PostCommentInclude include({
    _i2.PostInclude? post,
    _i3.UserRecordInclude? owner,
    _i4.PostCommentInclude? parent,
  }) {
    return PostCommentInclude._(
      post: post,
      owner: owner,
      parent: parent,
    );
  }

  static PostCommentIncludeList includeList({
    _i1.WhereExpressionBuilder<PostCommentTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<PostCommentTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<PostCommentTable>? orderByList,
    PostCommentInclude? include,
  }) {
    return PostCommentIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(PostComment.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(PostComment.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _PostCommentImpl extends PostComment {
  _PostCommentImpl({
    int? id,
    required int postId,
    _i2.Post? post,
    required int ownerId,
    _i3.UserRecord? owner,
    String? text,
    DateTime? dateCreated,
    DateTime? dateUpdated,
    List<String>? imageUrls,
    String? videoUrl,
    List<int>? likedBy,
    List<int>? replyBy,
    int? parentId,
    _i4.PostComment? parent,
  }) : super._(
          id: id,
          postId: postId,
          post: post,
          ownerId: ownerId,
          owner: owner,
          text: text,
          dateCreated: dateCreated,
          dateUpdated: dateUpdated,
          imageUrls: imageUrls,
          videoUrl: videoUrl,
          likedBy: likedBy,
          replyBy: replyBy,
          parentId: parentId,
          parent: parent,
        );

  @override
  PostComment copyWith({
    Object? id = _Undefined,
    int? postId,
    Object? post = _Undefined,
    int? ownerId,
    Object? owner = _Undefined,
    Object? text = _Undefined,
    Object? dateCreated = _Undefined,
    Object? dateUpdated = _Undefined,
    Object? imageUrls = _Undefined,
    Object? videoUrl = _Undefined,
    Object? likedBy = _Undefined,
    Object? replyBy = _Undefined,
    Object? parentId = _Undefined,
    Object? parent = _Undefined,
  }) {
    return PostComment(
      id: id is int? ? id : this.id,
      postId: postId ?? this.postId,
      post: post is _i2.Post? ? post : this.post?.copyWith(),
      ownerId: ownerId ?? this.ownerId,
      owner: owner is _i3.UserRecord? ? owner : this.owner?.copyWith(),
      text: text is String? ? text : this.text,
      dateCreated: dateCreated is DateTime? ? dateCreated : this.dateCreated,
      dateUpdated: dateUpdated is DateTime? ? dateUpdated : this.dateUpdated,
      imageUrls: imageUrls is List<String>?
          ? imageUrls
          : this.imageUrls?.map((e0) => e0).toList(),
      videoUrl: videoUrl is String? ? videoUrl : this.videoUrl,
      likedBy: likedBy is List<int>?
          ? likedBy
          : this.likedBy?.map((e0) => e0).toList(),
      replyBy: replyBy is List<int>?
          ? replyBy
          : this.replyBy?.map((e0) => e0).toList(),
      parentId: parentId is int? ? parentId : this.parentId,
      parent: parent is _i4.PostComment? ? parent : this.parent?.copyWith(),
    );
  }
}

class PostCommentTable extends _i1.Table {
  PostCommentTable({super.tableRelation}) : super(tableName: 'post_comment') {
    postId = _i1.ColumnInt(
      'postId',
      this,
    );
    ownerId = _i1.ColumnInt(
      'ownerId',
      this,
    );
    text = _i1.ColumnString(
      'text',
      this,
    );
    dateCreated = _i1.ColumnDateTime(
      'dateCreated',
      this,
    );
    dateUpdated = _i1.ColumnDateTime(
      'dateUpdated',
      this,
    );
    imageUrls = _i1.ColumnSerializable(
      'imageUrls',
      this,
    );
    videoUrl = _i1.ColumnString(
      'videoUrl',
      this,
    );
    likedBy = _i1.ColumnSerializable(
      'likedBy',
      this,
    );
    replyBy = _i1.ColumnSerializable(
      'replyBy',
      this,
    );
    parentId = _i1.ColumnInt(
      'parentId',
      this,
    );
  }

  late final _i1.ColumnInt postId;

  _i2.PostTable? _post;

  late final _i1.ColumnInt ownerId;

  _i3.UserRecordTable? _owner;

  late final _i1.ColumnString text;

  late final _i1.ColumnDateTime dateCreated;

  late final _i1.ColumnDateTime dateUpdated;

  late final _i1.ColumnSerializable imageUrls;

  late final _i1.ColumnString videoUrl;

  late final _i1.ColumnSerializable likedBy;

  late final _i1.ColumnSerializable replyBy;

  late final _i1.ColumnInt parentId;

  _i4.PostCommentTable? _parent;

  _i2.PostTable get post {
    if (_post != null) return _post!;
    _post = _i1.createRelationTable(
      relationFieldName: 'post',
      field: PostComment.t.postId,
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
      field: PostComment.t.ownerId,
      foreignField: _i3.UserRecord.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i3.UserRecordTable(tableRelation: foreignTableRelation),
    );
    return _owner!;
  }

  _i4.PostCommentTable get parent {
    if (_parent != null) return _parent!;
    _parent = _i1.createRelationTable(
      relationFieldName: 'parent',
      field: PostComment.t.parentId,
      foreignField: _i4.PostComment.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i4.PostCommentTable(tableRelation: foreignTableRelation),
    );
    return _parent!;
  }

  @override
  List<_i1.Column> get columns => [
        id,
        postId,
        ownerId,
        text,
        dateCreated,
        dateUpdated,
        imageUrls,
        videoUrl,
        likedBy,
        replyBy,
        parentId,
      ];

  @override
  _i1.Table? getRelationTable(String relationField) {
    if (relationField == 'post') {
      return post;
    }
    if (relationField == 'owner') {
      return owner;
    }
    if (relationField == 'parent') {
      return parent;
    }
    return null;
  }
}

class PostCommentInclude extends _i1.IncludeObject {
  PostCommentInclude._({
    _i2.PostInclude? post,
    _i3.UserRecordInclude? owner,
    _i4.PostCommentInclude? parent,
  }) {
    _post = post;
    _owner = owner;
    _parent = parent;
  }

  _i2.PostInclude? _post;

  _i3.UserRecordInclude? _owner;

  _i4.PostCommentInclude? _parent;

  @override
  Map<String, _i1.Include?> get includes => {
        'post': _post,
        'owner': _owner,
        'parent': _parent,
      };

  @override
  _i1.Table get table => PostComment.t;
}

class PostCommentIncludeList extends _i1.IncludeList {
  PostCommentIncludeList._({
    _i1.WhereExpressionBuilder<PostCommentTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(PostComment.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table get table => PostComment.t;
}

class PostCommentRepository {
  const PostCommentRepository._();

  final attachRow = const PostCommentAttachRowRepository._();

  final detachRow = const PostCommentDetachRowRepository._();

  Future<List<PostComment>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<PostCommentTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<PostCommentTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<PostCommentTable>? orderByList,
    _i1.Transaction? transaction,
    PostCommentInclude? include,
  }) async {
    return session.db.find<PostComment>(
      where: where?.call(PostComment.t),
      orderBy: orderBy?.call(PostComment.t),
      orderByList: orderByList?.call(PostComment.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  Future<PostComment?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<PostCommentTable>? where,
    int? offset,
    _i1.OrderByBuilder<PostCommentTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<PostCommentTable>? orderByList,
    _i1.Transaction? transaction,
    PostCommentInclude? include,
  }) async {
    return session.db.findFirstRow<PostComment>(
      where: where?.call(PostComment.t),
      orderBy: orderBy?.call(PostComment.t),
      orderByList: orderByList?.call(PostComment.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  Future<PostComment?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
    PostCommentInclude? include,
  }) async {
    return session.db.findById<PostComment>(
      id,
      transaction: transaction,
      include: include,
    );
  }

  Future<List<PostComment>> insert(
    _i1.Session session,
    List<PostComment> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<PostComment>(
      rows,
      transaction: transaction,
    );
  }

  Future<PostComment> insertRow(
    _i1.Session session,
    PostComment row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<PostComment>(
      row,
      transaction: transaction,
    );
  }

  Future<List<PostComment>> update(
    _i1.Session session,
    List<PostComment> rows, {
    _i1.ColumnSelections<PostCommentTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<PostComment>(
      rows,
      columns: columns?.call(PostComment.t),
      transaction: transaction,
    );
  }

  Future<PostComment> updateRow(
    _i1.Session session,
    PostComment row, {
    _i1.ColumnSelections<PostCommentTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<PostComment>(
      row,
      columns: columns?.call(PostComment.t),
      transaction: transaction,
    );
  }

  Future<List<PostComment>> delete(
    _i1.Session session,
    List<PostComment> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<PostComment>(
      rows,
      transaction: transaction,
    );
  }

  Future<PostComment> deleteRow(
    _i1.Session session,
    PostComment row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<PostComment>(
      row,
      transaction: transaction,
    );
  }

  Future<List<PostComment>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<PostCommentTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<PostComment>(
      where: where(PostComment.t),
      transaction: transaction,
    );
  }

  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<PostCommentTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<PostComment>(
      where: where?.call(PostComment.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

class PostCommentAttachRowRepository {
  const PostCommentAttachRowRepository._();

  Future<void> post(
    _i1.Session session,
    PostComment postComment,
    _i2.Post post, {
    _i1.Transaction? transaction,
  }) async {
    if (postComment.id == null) {
      throw ArgumentError.notNull('postComment.id');
    }
    if (post.id == null) {
      throw ArgumentError.notNull('post.id');
    }

    var $postComment = postComment.copyWith(postId: post.id);
    await session.db.updateRow<PostComment>(
      $postComment,
      columns: [PostComment.t.postId],
      transaction: transaction,
    );
  }

  Future<void> owner(
    _i1.Session session,
    PostComment postComment,
    _i3.UserRecord owner, {
    _i1.Transaction? transaction,
  }) async {
    if (postComment.id == null) {
      throw ArgumentError.notNull('postComment.id');
    }
    if (owner.id == null) {
      throw ArgumentError.notNull('owner.id');
    }

    var $postComment = postComment.copyWith(ownerId: owner.id);
    await session.db.updateRow<PostComment>(
      $postComment,
      columns: [PostComment.t.ownerId],
      transaction: transaction,
    );
  }

  Future<void> parent(
    _i1.Session session,
    PostComment postComment,
    _i4.PostComment parent, {
    _i1.Transaction? transaction,
  }) async {
    if (postComment.id == null) {
      throw ArgumentError.notNull('postComment.id');
    }
    if (parent.id == null) {
      throw ArgumentError.notNull('parent.id');
    }

    var $postComment = postComment.copyWith(parentId: parent.id);
    await session.db.updateRow<PostComment>(
      $postComment,
      columns: [PostComment.t.parentId],
      transaction: transaction,
    );
  }
}

class PostCommentDetachRowRepository {
  const PostCommentDetachRowRepository._();

  Future<void> parent(
    _i1.Session session,
    PostComment postcomment, {
    _i1.Transaction? transaction,
  }) async {
    if (postcomment.id == null) {
      throw ArgumentError.notNull('postcomment.id');
    }

    var $postcomment = postcomment.copyWith(parentId: null);
    await session.db.updateRow<PostComment>(
      $postcomment,
      columns: [PostComment.t.parentId],
      transaction: transaction,
    );
  }
}
