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
import '../post/posts_hashtags.dart' as _i2;

abstract class Hashtag implements _i1.TableRow, _i1.ProtocolSerialization {
  Hashtag._({
    this.id,
    required this.tag,
    required this.usageCount,
    this.hashtags,
  });

  factory Hashtag({
    int? id,
    required String tag,
    required int usageCount,
    List<_i2.PostsHashtags>? hashtags,
  }) = _HashtagImpl;

  factory Hashtag.fromJson(Map<String, dynamic> jsonSerialization) {
    return Hashtag(
      id: jsonSerialization['id'] as int?,
      tag: jsonSerialization['tag'] as String,
      usageCount: jsonSerialization['usageCount'] as int,
      hashtags: (jsonSerialization['hashtags'] as List?)
          ?.map((e) => _i2.PostsHashtags.fromJson((e as Map<String, dynamic>)))
          .toList(),
    );
  }

  static final t = HashtagTable();

  static const db = HashtagRepository._();

  @override
  int? id;

  String tag;

  int usageCount;

  List<_i2.PostsHashtags>? hashtags;

  @override
  _i1.Table get table => t;

  Hashtag copyWith({
    int? id,
    String? tag,
    int? usageCount,
    List<_i2.PostsHashtags>? hashtags,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'tag': tag,
      'usageCount': usageCount,
      if (hashtags != null)
        'hashtags': hashtags?.toJson(valueToJson: (v) => v.toJson()),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'tag': tag,
      'usageCount': usageCount,
      if (hashtags != null)
        'hashtags': hashtags?.toJson(valueToJson: (v) => v.toJsonForProtocol()),
    };
  }

  static HashtagInclude include({_i2.PostsHashtagsIncludeList? hashtags}) {
    return HashtagInclude._(hashtags: hashtags);
  }

  static HashtagIncludeList includeList({
    _i1.WhereExpressionBuilder<HashtagTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<HashtagTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<HashtagTable>? orderByList,
    HashtagInclude? include,
  }) {
    return HashtagIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Hashtag.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(Hashtag.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _HashtagImpl extends Hashtag {
  _HashtagImpl({
    int? id,
    required String tag,
    required int usageCount,
    List<_i2.PostsHashtags>? hashtags,
  }) : super._(
          id: id,
          tag: tag,
          usageCount: usageCount,
          hashtags: hashtags,
        );

  @override
  Hashtag copyWith({
    Object? id = _Undefined,
    String? tag,
    int? usageCount,
    Object? hashtags = _Undefined,
  }) {
    return Hashtag(
      id: id is int? ? id : this.id,
      tag: tag ?? this.tag,
      usageCount: usageCount ?? this.usageCount,
      hashtags: hashtags is List<_i2.PostsHashtags>?
          ? hashtags
          : this.hashtags?.map((e0) => e0.copyWith()).toList(),
    );
  }
}

class HashtagTable extends _i1.Table {
  HashtagTable({super.tableRelation}) : super(tableName: 'hashtag') {
    tag = _i1.ColumnString(
      'tag',
      this,
    );
    usageCount = _i1.ColumnInt(
      'usageCount',
      this,
    );
  }

  late final _i1.ColumnString tag;

  late final _i1.ColumnInt usageCount;

  _i2.PostsHashtagsTable? ___hashtags;

  _i1.ManyRelation<_i2.PostsHashtagsTable>? _hashtags;

  _i2.PostsHashtagsTable get __hashtags {
    if (___hashtags != null) return ___hashtags!;
    ___hashtags = _i1.createRelationTable(
      relationFieldName: '__hashtags',
      field: Hashtag.t.id,
      foreignField: _i2.PostsHashtags.t.hashtagId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.PostsHashtagsTable(tableRelation: foreignTableRelation),
    );
    return ___hashtags!;
  }

  _i1.ManyRelation<_i2.PostsHashtagsTable> get hashtags {
    if (_hashtags != null) return _hashtags!;
    var relationTable = _i1.createRelationTable(
      relationFieldName: 'hashtags',
      field: Hashtag.t.id,
      foreignField: _i2.PostsHashtags.t.hashtagId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.PostsHashtagsTable(tableRelation: foreignTableRelation),
    );
    _hashtags = _i1.ManyRelation<_i2.PostsHashtagsTable>(
      tableWithRelations: relationTable,
      table: _i2.PostsHashtagsTable(
          tableRelation: relationTable.tableRelation!.lastRelation),
    );
    return _hashtags!;
  }

  @override
  List<_i1.Column> get columns => [
        id,
        tag,
        usageCount,
      ];

  @override
  _i1.Table? getRelationTable(String relationField) {
    if (relationField == 'hashtags') {
      return __hashtags;
    }
    return null;
  }
}

class HashtagInclude extends _i1.IncludeObject {
  HashtagInclude._({_i2.PostsHashtagsIncludeList? hashtags}) {
    _hashtags = hashtags;
  }

  _i2.PostsHashtagsIncludeList? _hashtags;

  @override
  Map<String, _i1.Include?> get includes => {'hashtags': _hashtags};

  @override
  _i1.Table get table => Hashtag.t;
}

class HashtagIncludeList extends _i1.IncludeList {
  HashtagIncludeList._({
    _i1.WhereExpressionBuilder<HashtagTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(Hashtag.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table get table => Hashtag.t;
}

class HashtagRepository {
  const HashtagRepository._();

  final attach = const HashtagAttachRepository._();

  final attachRow = const HashtagAttachRowRepository._();

  final detach = const HashtagDetachRepository._();

  final detachRow = const HashtagDetachRowRepository._();

  Future<List<Hashtag>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<HashtagTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<HashtagTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<HashtagTable>? orderByList,
    _i1.Transaction? transaction,
    HashtagInclude? include,
  }) async {
    return session.db.find<Hashtag>(
      where: where?.call(Hashtag.t),
      orderBy: orderBy?.call(Hashtag.t),
      orderByList: orderByList?.call(Hashtag.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  Future<Hashtag?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<HashtagTable>? where,
    int? offset,
    _i1.OrderByBuilder<HashtagTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<HashtagTable>? orderByList,
    _i1.Transaction? transaction,
    HashtagInclude? include,
  }) async {
    return session.db.findFirstRow<Hashtag>(
      where: where?.call(Hashtag.t),
      orderBy: orderBy?.call(Hashtag.t),
      orderByList: orderByList?.call(Hashtag.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  Future<Hashtag?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
    HashtagInclude? include,
  }) async {
    return session.db.findById<Hashtag>(
      id,
      transaction: transaction,
      include: include,
    );
  }

  Future<List<Hashtag>> insert(
    _i1.Session session,
    List<Hashtag> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<Hashtag>(
      rows,
      transaction: transaction,
    );
  }

  Future<Hashtag> insertRow(
    _i1.Session session,
    Hashtag row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<Hashtag>(
      row,
      transaction: transaction,
    );
  }

  Future<List<Hashtag>> update(
    _i1.Session session,
    List<Hashtag> rows, {
    _i1.ColumnSelections<HashtagTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<Hashtag>(
      rows,
      columns: columns?.call(Hashtag.t),
      transaction: transaction,
    );
  }

  Future<Hashtag> updateRow(
    _i1.Session session,
    Hashtag row, {
    _i1.ColumnSelections<HashtagTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<Hashtag>(
      row,
      columns: columns?.call(Hashtag.t),
      transaction: transaction,
    );
  }

  Future<List<Hashtag>> delete(
    _i1.Session session,
    List<Hashtag> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<Hashtag>(
      rows,
      transaction: transaction,
    );
  }

  Future<Hashtag> deleteRow(
    _i1.Session session,
    Hashtag row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<Hashtag>(
      row,
      transaction: transaction,
    );
  }

  Future<List<Hashtag>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<HashtagTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<Hashtag>(
      where: where(Hashtag.t),
      transaction: transaction,
    );
  }

  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<HashtagTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<Hashtag>(
      where: where?.call(Hashtag.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

class HashtagAttachRepository {
  const HashtagAttachRepository._();

  Future<void> hashtags(
    _i1.Session session,
    Hashtag hashtag,
    List<_i2.PostsHashtags> postsHashtags, {
    _i1.Transaction? transaction,
  }) async {
    if (postsHashtags.any((e) => e.id == null)) {
      throw ArgumentError.notNull('postsHashtags.id');
    }
    if (hashtag.id == null) {
      throw ArgumentError.notNull('hashtag.id');
    }

    var $postsHashtags =
        postsHashtags.map((e) => e.copyWith(hashtagId: hashtag.id)).toList();
    await session.db.update<_i2.PostsHashtags>(
      $postsHashtags,
      columns: [_i2.PostsHashtags.t.hashtagId],
      transaction: transaction,
    );
  }
}

class HashtagAttachRowRepository {
  const HashtagAttachRowRepository._();

  Future<void> hashtags(
    _i1.Session session,
    Hashtag hashtag,
    _i2.PostsHashtags postsHashtags, {
    _i1.Transaction? transaction,
  }) async {
    if (postsHashtags.id == null) {
      throw ArgumentError.notNull('postsHashtags.id');
    }
    if (hashtag.id == null) {
      throw ArgumentError.notNull('hashtag.id');
    }

    var $postsHashtags = postsHashtags.copyWith(hashtagId: hashtag.id);
    await session.db.updateRow<_i2.PostsHashtags>(
      $postsHashtags,
      columns: [_i2.PostsHashtags.t.hashtagId],
      transaction: transaction,
    );
  }
}

class HashtagDetachRepository {
  const HashtagDetachRepository._();

  Future<void> hashtags(
    _i1.Session session,
    List<_i2.PostsHashtags> postsHashtags, {
    _i1.Transaction? transaction,
  }) async {
    if (postsHashtags.any((e) => e.id == null)) {
      throw ArgumentError.notNull('postsHashtags.id');
    }

    var $postsHashtags =
        postsHashtags.map((e) => e.copyWith(hashtagId: null)).toList();
    await session.db.update<_i2.PostsHashtags>(
      $postsHashtags,
      columns: [_i2.PostsHashtags.t.hashtagId],
      transaction: transaction,
    );
  }
}

class HashtagDetachRowRepository {
  const HashtagDetachRowRepository._();

  Future<void> hashtags(
    _i1.Session session,
    _i2.PostsHashtags postsHashtags, {
    _i1.Transaction? transaction,
  }) async {
    if (postsHashtags.id == null) {
      throw ArgumentError.notNull('postsHashtags.id');
    }

    var $postsHashtags = postsHashtags.copyWith(hashtagId: null);
    await session.db.updateRow<_i2.PostsHashtags>(
      $postsHashtags,
      columns: [_i2.PostsHashtags.t.hashtagId],
      transaction: transaction,
    );
  }
}
