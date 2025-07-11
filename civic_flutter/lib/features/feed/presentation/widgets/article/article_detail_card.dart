import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/feed/feed.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

class ArticleDetailCard extends ConsumerWidget {
  const ArticleDetailCard({
    required this.newPost,
    super.key,
  });

  final Post newPost;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final postCardState = ref.watch(feedButtonsProvider(newPost));
    final defaultTextStyle = DefaultTextStyle.of(context);

    return Padding(
      padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 10,
        children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(
                TSizes.md,
              ),
              child: AspectRatio(
                aspectRatio: 16 / 9,
                child: ContentCachedImage(
                  url: postCardState.articleBanner,
                  height: 200,
                ),
              ),
            ),
            Text(
              postCardState.text,
              style:
                  Theme.of(context).textTheme.headlineLarge!.copyWith(
                        fontSize: 23,
                        fontWeight: FontWeight.bold,
                      ),
              textAlign: TextAlign.left,
            ),
            QuillEditor.basic(
              controller: QuillController(
                document: postCardState.rawContent!,
                selection: const TextSelection.collapsed(
                  offset: 0,
                ),
                readOnly: true,
              ),
              config: QuillEditorConfig(
                customStyles:
                    THelperFunctions.articleTextEditorStyles(
                  context,
                  defaultTextStyle,
                ),
                scrollPhysics: const NeverScrollableScrollPhysics(),
              ),
            ),

        ],
      ),
    );
  }
}
