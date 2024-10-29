/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters

// ignore_for_file: invalid_use_of_visible_for_testing_member

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;
import '../protocol.dart' as _i2;

abstract class Article implements _i1.TableRow, _i1.ProtocolSerialization {
  Article._({
    this.id,
    required this.ownerId,
    this.owner,
    required this.title,
    required this.content,
    required this.banner,
  });

  factory Article({
    int? id,
    required int ownerId,
    _i2.UserRecord? owner,
    required String title,
    required String content,
    required String banner,
  }) = _ArticleImpl;

  factory Article.fromJson(Map<String, dynamic> jsonSerialization) {
    return Article(
      id: jsonSerialization['id'] as int?,
      ownerId: jsonSerialization['ownerId'] as int,
      owner: jsonSerialization['owner'] == null
          ? null
          : _i2.UserRecord.fromJson(
              (jsonSerialization['owner'] as Map<String, dynamic>)),
      title: jsonSerialization['title'] as String,
      content: jsonSerialization['content'] as String,
      banner: jsonSerialization['banner'] as String,
    );
  }

  static final t = ArticleTable();

  static const db = ArticleRepository._();

  @override
  int? id;

  int ownerId;

  _i2.UserRecord? owner;

  String title;

  String content;

  String banner;

  @override
  _i1.Table get table => t;

  Article copyWith({
    int? id,
    int? ownerId,
    _i2.UserRecord? owner,
    String? title,
    String? content,
    String? banner,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'ownerId': ownerId,
      if (owner != null) 'owner': owner?.toJson(),
      'title': title,
      'content': content,
      'banner': banner,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'ownerId': ownerId,
      if (owner != null) 'owner': owner?.toJsonForProtocol(),
      'title': title,
      'content': content,
      'banner': banner,
    };
  }

  static ArticleInclude include({_i2.UserRecordInclude? owner}) {
    return ArticleInclude._(owner: owner);
  }

  static ArticleIncludeList includeList({
    _i1.WhereExpressionBuilder<ArticleTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<ArticleTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<ArticleTable>? orderByList,
    ArticleInclude? include,
  }) {
    return ArticleIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Article.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(Article.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _ArticleImpl extends Article {
  _ArticleImpl({
    int? id,
    required int ownerId,
    _i2.UserRecord? owner,
    required String title,
    required String content,
    required String banner,
  }) : super._(
          id: id,
          ownerId: ownerId,
          owner: owner,
          title: title,
          content: content,
          banner: banner,
        );

  @override
  Article copyWith({
    Object? id = _Undefined,
    int? ownerId,
    Object? owner = _Undefined,
    String? title,
    String? content,
    String? banner,
  }) {
    return Article(
      id: id is int? ? id : this.id,
      ownerId: ownerId ?? this.ownerId,
      owner: owner is _i2.UserRecord? ? owner : this.owner?.copyWith(),
      title: title ?? this.title,
      content: content ?? this.content,
      banner: banner ?? this.banner,
    );
  }
}

class ArticleTable extends _i1.Table {
  ArticleTable({super.tableRelation}) : super(tableName: 'article') {
    ownerId = _i1.ColumnInt(
      'ownerId',
      this,
    );
    title = _i1.ColumnString(
      'title',
      this,
    );
    content = _i1.ColumnString(
      'content',
      this,
    );
    banner = _i1.ColumnString(
      'banner',
      this,
    );
  }

  late final _i1.ColumnInt ownerId;

  _i2.UserRecordTable? _owner;

  late final _i1.ColumnString title;

  late final _i1.ColumnString content;

  late final _i1.ColumnString banner;

  _i2.UserRecordTable get owner {
    if (_owner != null) return _owner!;
    _owner = _i1.createRelationTable(
      relationFieldName: 'owner',
      field: Article.t.ownerId,
      foreignField: _i2.UserRecord.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.UserRecordTable(tableRelation: foreignTableRelation),
    );
    return _owner!;
  }

  @override
  List<_i1.Column> get columns => [
        id,
        ownerId,
        title,
        content,
        banner,
      ];

  @override
  _i1.Table? getRelationTable(String relationField) {
    if (relationField == 'owner') {
      return owner;
    }
    return null;
  }
}

class ArticleInclude extends _i1.IncludeObject {
  ArticleInclude._({_i2.UserRecordInclude? owner}) {
    _owner = owner;
  }

  _i2.UserRecordInclude? _owner;

  @override
  Map<String, _i1.Include?> get includes => {'owner': _owner};

  @override
  _i1.Table get table => Article.t;
}

class ArticleIncludeList extends _i1.IncludeList {
  ArticleIncludeList._({
    _i1.WhereExpressionBuilder<ArticleTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(Article.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table get table => Article.t;
}

class ArticleRepository {
  const ArticleRepository._();

  final attachRow = const ArticleAttachRowRepository._();

  Future<List<Article>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<ArticleTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<ArticleTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<ArticleTable>? orderByList,
    _i1.Transaction? transaction,
    ArticleInclude? include,
  }) async {
    return session.db.find<Article>(
      where: where?.call(Article.t),
      orderBy: orderBy?.call(Article.t),
      orderByList: orderByList?.call(Article.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction ?? session.transaction,
      include: include,
    );
  }

  Future<Article?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<ArticleTable>? where,
    int? offset,
    _i1.OrderByBuilder<ArticleTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<ArticleTable>? orderByList,
    _i1.Transaction? transaction,
    ArticleInclude? include,
  }) async {
    return session.db.findFirstRow<Article>(
      where: where?.call(Article.t),
      orderBy: orderBy?.call(Article.t),
      orderByList: orderByList?.call(Article.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction ?? session.transaction,
      include: include,
    );
  }

  Future<Article?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
    ArticleInclude? include,
  }) async {
    return session.db.findById<Article>(
      id,
      transaction: transaction ?? session.transaction,
      include: include,
    );
  }

  Future<List<Article>> insert(
    _i1.Session session,
    List<Article> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<Article>(
      rows,
      transaction: transaction ?? session.transaction,
    );
  }

  Future<Article> insertRow(
    _i1.Session session,
    Article row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<Article>(
      row,
      transaction: transaction ?? session.transaction,
    );
  }

  Future<List<Article>> update(
    _i1.Session session,
    List<Article> rows, {
    _i1.ColumnSelections<ArticleTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<Article>(
      rows,
      columns: columns?.call(Article.t),
      transaction: transaction ?? session.transaction,
    );
  }

  Future<Article> updateRow(
    _i1.Session session,
    Article row, {
    _i1.ColumnSelections<ArticleTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<Article>(
      row,
      columns: columns?.call(Article.t),
      transaction: transaction ?? session.transaction,
    );
  }

  Future<List<Article>> delete(
    _i1.Session session,
    List<Article> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<Article>(
      rows,
      transaction: transaction ?? session.transaction,
    );
  }

  Future<Article> deleteRow(
    _i1.Session session,
    Article row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<Article>(
      row,
      transaction: transaction ?? session.transaction,
    );
  }

  Future<List<Article>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<ArticleTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<Article>(
      where: where(Article.t),
      transaction: transaction ?? session.transaction,
    );
  }

  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<ArticleTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<Article>(
      where: where?.call(Article.t),
      limit: limit,
      transaction: transaction ?? session.transaction,
    );
  }
}

class ArticleAttachRowRepository {
  const ArticleAttachRowRepository._();

  Future<void> owner(
    _i1.Session session,
    Article article,
    _i2.UserRecord owner, {
    _i1.Transaction? transaction,
  }) async {
    if (article.id == null) {
      throw ArgumentError.notNull('article.id');
    }
    if (owner.id == null) {
      throw ArgumentError.notNull('owner.id');
    }

    var $article = article.copyWith(ownerId: owner.id);
    await session.db.updateRow<Article>(
      $article,
      columns: [Article.t.ownerId],
      transaction: transaction ?? session.transaction,
    );
  }
}
