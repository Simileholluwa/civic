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
import '../user/user_record.dart' as _i2;

abstract class Article implements _i1.TableRow<int>, _i1.ProtocolSerialization {
  Article._({
    this.id,
    required this.ownerId,
    this.owner,
    this.title,
    this.content,
    this.banner,
    this.dateCreated,
    this.updatedAt,
    this.numberOfComments,
    this.numberOfLikes,
    this.numberOfViews,
  });

  factory Article({
    int? id,
    required int ownerId,
    _i2.UserRecord? owner,
    String? title,
    String? content,
    String? banner,
    DateTime? dateCreated,
    DateTime? updatedAt,
    int? numberOfComments,
    int? numberOfLikes,
    int? numberOfViews,
  }) = _ArticleImpl;

  factory Article.fromJson(Map<String, dynamic> jsonSerialization) {
    return Article(
      id: jsonSerialization['id'] as int?,
      ownerId: jsonSerialization['ownerId'] as int,
      owner: jsonSerialization['owner'] == null
          ? null
          : _i2.UserRecord.fromJson(
              (jsonSerialization['owner'] as Map<String, dynamic>)),
      title: jsonSerialization['title'] as String?,
      content: jsonSerialization['content'] as String?,
      banner: jsonSerialization['banner'] as String?,
      dateCreated: jsonSerialization['dateCreated'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(
              jsonSerialization['dateCreated']),
      updatedAt: jsonSerialization['updatedAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['updatedAt']),
      numberOfComments: jsonSerialization['numberOfComments'] as int?,
      numberOfLikes: jsonSerialization['numberOfLikes'] as int?,
      numberOfViews: jsonSerialization['numberOfViews'] as int?,
    );
  }

  static final t = ArticleTable();

  static const db = ArticleRepository._();

  @override
  int? id;

  int ownerId;

  _i2.UserRecord? owner;

  String? title;

  String? content;

  String? banner;

  DateTime? dateCreated;

  DateTime? updatedAt;

  int? numberOfComments;

  int? numberOfLikes;

  int? numberOfViews;

  @override
  _i1.Table<int> get table => t;

  /// Returns a shallow copy of this [Article]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  Article copyWith({
    int? id,
    int? ownerId,
    _i2.UserRecord? owner,
    String? title,
    String? content,
    String? banner,
    DateTime? dateCreated,
    DateTime? updatedAt,
    int? numberOfComments,
    int? numberOfLikes,
    int? numberOfViews,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'ownerId': ownerId,
      if (owner != null) 'owner': owner?.toJson(),
      if (title != null) 'title': title,
      if (content != null) 'content': content,
      if (banner != null) 'banner': banner,
      if (dateCreated != null) 'dateCreated': dateCreated?.toJson(),
      if (updatedAt != null) 'updatedAt': updatedAt?.toJson(),
      if (numberOfComments != null) 'numberOfComments': numberOfComments,
      if (numberOfLikes != null) 'numberOfLikes': numberOfLikes,
      if (numberOfViews != null) 'numberOfViews': numberOfViews,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'ownerId': ownerId,
      if (owner != null) 'owner': owner?.toJsonForProtocol(),
      if (title != null) 'title': title,
      if (content != null) 'content': content,
      if (banner != null) 'banner': banner,
      if (dateCreated != null) 'dateCreated': dateCreated?.toJson(),
      if (updatedAt != null) 'updatedAt': updatedAt?.toJson(),
      if (numberOfComments != null) 'numberOfComments': numberOfComments,
      if (numberOfLikes != null) 'numberOfLikes': numberOfLikes,
      if (numberOfViews != null) 'numberOfViews': numberOfViews,
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
    String? title,
    String? content,
    String? banner,
    DateTime? dateCreated,
    DateTime? updatedAt,
    int? numberOfComments,
    int? numberOfLikes,
    int? numberOfViews,
  }) : super._(
          id: id,
          ownerId: ownerId,
          owner: owner,
          title: title,
          content: content,
          banner: banner,
          dateCreated: dateCreated,
          updatedAt: updatedAt,
          numberOfComments: numberOfComments,
          numberOfLikes: numberOfLikes,
          numberOfViews: numberOfViews,
        );

  /// Returns a shallow copy of this [Article]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  Article copyWith({
    Object? id = _Undefined,
    int? ownerId,
    Object? owner = _Undefined,
    Object? title = _Undefined,
    Object? content = _Undefined,
    Object? banner = _Undefined,
    Object? dateCreated = _Undefined,
    Object? updatedAt = _Undefined,
    Object? numberOfComments = _Undefined,
    Object? numberOfLikes = _Undefined,
    Object? numberOfViews = _Undefined,
  }) {
    return Article(
      id: id is int? ? id : this.id,
      ownerId: ownerId ?? this.ownerId,
      owner: owner is _i2.UserRecord? ? owner : this.owner?.copyWith(),
      title: title is String? ? title : this.title,
      content: content is String? ? content : this.content,
      banner: banner is String? ? banner : this.banner,
      dateCreated: dateCreated is DateTime? ? dateCreated : this.dateCreated,
      updatedAt: updatedAt is DateTime? ? updatedAt : this.updatedAt,
      numberOfComments:
          numberOfComments is int? ? numberOfComments : this.numberOfComments,
      numberOfLikes: numberOfLikes is int? ? numberOfLikes : this.numberOfLikes,
      numberOfViews: numberOfViews is int? ? numberOfViews : this.numberOfViews,
    );
  }
}

class ArticleTable extends _i1.Table<int> {
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
    dateCreated = _i1.ColumnDateTime(
      'dateCreated',
      this,
    );
    updatedAt = _i1.ColumnDateTime(
      'updatedAt',
      this,
    );
    numberOfComments = _i1.ColumnInt(
      'numberOfComments',
      this,
    );
    numberOfLikes = _i1.ColumnInt(
      'numberOfLikes',
      this,
    );
    numberOfViews = _i1.ColumnInt(
      'numberOfViews',
      this,
    );
  }

  late final _i1.ColumnInt ownerId;

  _i2.UserRecordTable? _owner;

  late final _i1.ColumnString title;

  late final _i1.ColumnString content;

  late final _i1.ColumnString banner;

  late final _i1.ColumnDateTime dateCreated;

  late final _i1.ColumnDateTime updatedAt;

  late final _i1.ColumnInt numberOfComments;

  late final _i1.ColumnInt numberOfLikes;

  late final _i1.ColumnInt numberOfViews;

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
        dateCreated,
        updatedAt,
        numberOfComments,
        numberOfLikes,
        numberOfViews,
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
  _i1.Table<int> get table => Article.t;
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
  _i1.Table<int> get table => Article.t;
}

class ArticleRepository {
  const ArticleRepository._();

  final attachRow = const ArticleAttachRowRepository._();

  /// Returns a list of [Article]s matching the given query parameters.
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
      transaction: transaction,
      include: include,
    );
  }

  /// Returns the first matching [Article] matching the given query parameters.
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
      transaction: transaction,
      include: include,
    );
  }

  /// Finds a single [Article] by its [id] or null if no such row exists.
  Future<Article?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
    ArticleInclude? include,
  }) async {
    return session.db.findById<Article>(
      id,
      transaction: transaction,
      include: include,
    );
  }

  /// Inserts all [Article]s in the list and returns the inserted rows.
  ///
  /// The returned [Article]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<Article>> insert(
    _i1.Session session,
    List<Article> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<Article>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [Article] and returns the inserted row.
  ///
  /// The returned [Article] will have its `id` field set.
  Future<Article> insertRow(
    _i1.Session session,
    Article row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<Article>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [Article]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<Article>> update(
    _i1.Session session,
    List<Article> rows, {
    _i1.ColumnSelections<ArticleTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<Article>(
      rows,
      columns: columns?.call(Article.t),
      transaction: transaction,
    );
  }

  /// Updates a single [Article]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<Article> updateRow(
    _i1.Session session,
    Article row, {
    _i1.ColumnSelections<ArticleTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<Article>(
      row,
      columns: columns?.call(Article.t),
      transaction: transaction,
    );
  }

  /// Deletes all [Article]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<Article>> delete(
    _i1.Session session,
    List<Article> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<Article>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [Article].
  Future<Article> deleteRow(
    _i1.Session session,
    Article row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<Article>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<Article>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<ArticleTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<Article>(
      where: where(Article.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<ArticleTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<Article>(
      where: where?.call(Article.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

class ArticleAttachRowRepository {
  const ArticleAttachRowRepository._();

  /// Creates a relation between the given [Article] and [UserRecord]
  /// by setting the [Article]'s foreign key `ownerId` to refer to the [UserRecord].
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
      transaction: transaction,
    );
  }
}
