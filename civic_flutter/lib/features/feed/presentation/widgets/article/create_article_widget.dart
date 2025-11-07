import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/feed/feed.dart';
import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

class CreateArticleWidget extends ConsumerWidget {
  const CreateArticleWidget({
    required this.post,
    super.key,
  });

  final Post post;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final postState = ref.watch(feedProvider(post));
    return Column(
      children: [
        ReusableQuillToolbar(
          quillController: postState.articleController!,
        ),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                ArticleBanner(
                  post: post,
                ),
                ArticleTitleField(post: post),
                ReusableQuillEditor(
                  controller: postState.articleController!,
                  scrollController: postState.scrollController!,
                  focusNode: postState.focusNode!,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
