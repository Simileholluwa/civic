import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/features/feed/feed.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

class CreateArticleWidget extends ConsumerWidget {
  const CreateArticleWidget({
    required this.post, super.key,
  });

  final Post post;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final postState = ref.watch(feedProvider(post)); 
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: Theme.of(context).scaffoldBackgroundColor,
            border: Border(
              bottom: BorderSide(
                color: Theme.of(context).dividerColor,
              ),
            ),
          ),
          padding: const EdgeInsets.symmetric(
            vertical: 4,
          ),
          child: ArticleTextToolbar(
            controller: postState.articleController!,
            focusNode: postState.focusNode!,
          ),
        ),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                ArticleBanner(post: post,),
                ArticleTitleField(post: post),
                ArticleTextEditor(
                  controller: postState.articleController!,
                  scrollController: postState.scrollController!,
                  focusNode: postState.focusNode!,
                  configurations: const QuillEditorConfig(),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
