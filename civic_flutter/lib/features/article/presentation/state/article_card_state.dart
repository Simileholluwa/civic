// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:flutter_quill/flutter_quill.dart';

class ArticleCardState {
  final String bannerUrl;
  final String title;
  final String description;
  final UserRecord author;
  final String timeAgo;
  final String numberOfViews;
  final String numberOfLikes;
  final String numberOfComments;
  ArticleCardState({
    required this.bannerUrl,
    required this.title,
    required this.description,
    required this.author,
    required this.timeAgo,
    required this.numberOfViews,
    required this.numberOfLikes,
    required this.numberOfComments,
  });
  
  factory ArticleCardState.populate(Article article) {
    return ArticleCardState(
      bannerUrl: article.banner!,
      title: article.title!,
      description: Document.fromJson(
        jsonDecode(
          article.content!,
        ),
      ).toPlainText(),
      author: article.owner!,
      timeAgo: THelperFunctions.humanizeDateTime(article.dateCreated ?? DateTime.now()),
      numberOfViews: article.numberOfViews.toString(),
      numberOfLikes: article.numberOfLikes.toString(),
      numberOfComments: article.numberOfComments.toString(),
    );
  }
}
