import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:civic_flutter/features/article/article.dart';
import 'package:civic_flutter/core/core.dart';

class DraftArticleScreen extends ConsumerWidget {
  const DraftArticleScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(articleDraftsProvider);
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(
          50,
        ),
        child: CreateContentDraftsAppbar(
          actionPressed: () => ArticleHelperFunctions.deleteArticleDraftsDialog(
            context,
            ref,
          ),
          data: data,
          leadingPressed: () {
            context.pop();
          },
        ),
      ),
      body: ListView.separated(
        shrinkWrap: true,
        padding: const EdgeInsets.only(
          top: TSizes.xs,
          left: TSizes.md,
          right: TSizes.md,
        ),
        itemBuilder: (context, index) {
          final article = data[index];
          return Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CreateContentDraftTitle(
                    createdAt: article.createdAt!,
                    index: index,
                  ),
                  DraftArticleOptions(
                    articleDraft: article,
                    index: index,
                  ),
                ],
              ),
              const SizedBox(
                height: TSizes.sm,
              ),
              ArticleDraftWidget(article: article,),
            ],
          );
        },
        separatorBuilder: (context, index) {
          return const SizedBox(
            height: 8,
          );
        },
        itemCount: data.length,
      ),
    );
  }
}
