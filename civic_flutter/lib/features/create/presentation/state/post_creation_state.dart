import 'dart:convert';

import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';

class PostCreationState {
  PostCreationState({
    required this.controller,
    this.imageUrls = const <String>[],
    this.locations = const <AWSPlaces>[],
    this.mentions = const <UserRecord>[],
    this.taggedUsers = const <UserRecord>[],
    this.uploadedAssets = const <MediaAsset>[],
    this.tags = const <String>[],
    this.text = '',
    this.videoUrl = '',
    this.optionText = const <String>['', ''],
    this.controllers = const <TextEditingController>[],
    this.expiresAt,
    this.articleContent = '',
    this.articleTags = const <String>[],
    this.articleController,
    this.focusNode,
    this.scrollController,
    this.contentPlainText = '',
  });

  factory PostCreationState.empty() {
    return PostCreationState(
      controller: MentionHashtagLinkTextEditingController(),
    );
  }

  factory PostCreationState.populate(Post post) {
    final poll = post.poll;
    final article = post.article;
    Document? document;
    if (article != null) {
      if (article.content!.isNotEmpty) {
        document = Document.fromJson(
          jsonDecode(article.content!) as List,
        );
      } else {
        document = Document();
      }
    } else {
      document = Document();
    }
    final imagePaths = <String>[];
    var videoPath = '';
    final assets = post.mediaAssets ?? const <MediaAsset>[];
    for (final a in assets) {
      final url = a.publicUrl ?? '';
      if (url.isEmpty) continue;
      if (a.kind == MediaKind.image) {
        imagePaths.add(url);
      } else if (a.kind == MediaKind.video && videoPath.isEmpty) {
        videoPath = url;
      }
    }

    return PostCreationState(
      text: post.text ?? '',
      taggedUsers: post.taggedUsers ?? [],
      locations: post.locations ?? [],
      mentions: post.mentions ?? [],
      uploadedAssets: post.mediaAssets ?? [],
      tags: post.tags ?? [],
      controller: MentionHashtagLinkTextEditingController(text: post.text),
      imageUrls: imagePaths,
      videoUrl: videoPath,
      optionText: poll?.options?.map((e) => e.option!).toList(
                growable: false,
              ) ??
          ['', ''],
      controllers: List.generate(
        poll?.options?.length ?? 2,
        (index) => TextEditingController(
          text: poll?.options?[index].option,
        ),
      ),
      expiresAt: poll?.expiresAt ??
          DateTime.now().add(
            const Duration(days: 1),
          ),
      focusNode: article == null ? null : FocusNode(),
      scrollController: article == null ? null : ScrollController(),
      articleController: QuillController(
        config: const QuillControllerConfig(
          clipboardConfig: QuillClipboardConfig(
            enableExternalRichPaste: false,
          ),
        ),
        document: document,
        selection: const TextSelection.collapsed(offset: 0),
      ),
      articleContent: article?.content ?? '',
      articleTags: article?.tag ?? [],
    );
  }

  final MentionHashtagLinkTextEditingController controller;
  final List<String> imageUrls;
  final List<AWSPlaces> locations;
  final List<UserRecord> mentions;
  final List<UserRecord> taggedUsers;
  final List<MediaAsset> uploadedAssets;
  final List<String> tags;
  final String text;
  final String videoUrl;
  final List<TextEditingController> controllers;
  final DateTime? expiresAt;
  final List<String> optionText;
  final String articleContent;
  final List<String> articleTags;
  final QuillController? articleController;
  final FocusNode? focusNode;
  final ScrollController? scrollController;
  final String contentPlainText;

  PostCreationState copyWith({
    MentionHashtagLinkTextEditingController? controller,
    List<String>? imageUrls,
    List<AWSPlaces>? locations,
    List<UserRecord>? mentions,
    List<UserRecord>? taggedUsers,
    List<String>? tags,
    String? text,
    String? videoUrl,
    List<TextEditingController>? controllers,
    DateTime? expiresAt,
    List<String>? optionText,
    List<MediaAsset>? uploadedAssets,
    String? articleContent,
    List<String>? articleTags,
    QuillController? articleController,
    FocusNode? focusNode,
    ScrollController? scrollController,
    String? contentPlainText,
  }) {
    return PostCreationState(
      controller: controller ?? this.controller,
      imageUrls: imageUrls ?? this.imageUrls,
      locations: locations ?? this.locations,
      mentions: mentions ?? this.mentions,
      uploadedAssets: uploadedAssets ?? this.uploadedAssets,
      taggedUsers: taggedUsers ?? this.taggedUsers,
      tags: tags ?? this.tags,
      text: text ?? this.text,
      videoUrl: videoUrl ?? this.videoUrl,
      controllers: controllers ?? this.controllers,
      expiresAt: expiresAt ?? this.expiresAt,
      optionText: optionText ?? this.optionText,
      articleContent: articleContent ?? this.articleContent,
      articleTags: articleTags ?? this.articleTags,
      articleController: articleController ?? this.articleController,
      focusNode: focusNode ?? this.focusNode,
      scrollController: scrollController ?? this.scrollController,
      contentPlainText: contentPlainText ?? this.contentPlainText,
    );
  }
}
