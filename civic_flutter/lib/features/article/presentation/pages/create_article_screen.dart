// ignore_for_file: use_build_context_synchronously

import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/features/article/article.dart';
import 'package:civic_flutter/features/feed/presentation/routes/feed_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:civic_flutter/core/core.dart';

class CreateArticleScreen extends ConsumerWidget {
  const CreateArticleScreen({
    super.key,
    required this.id,
    required this.draft,
  });

  final int id;
  final ArticleDraft? draft;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(
      articleDetailProvider(
        draft,
        id,
      ),
    );
    final articleState = ref.watch(
      articleWriterProvider(data.value),
    );
    final draftsData = id == 0 ? ref.watch(articleDraftsProvider) : [];
    final canSend = articleState.banner.isNotEmpty &&
        articleState.title.isNotEmpty &&
        !articleState.isEmptyContent;

    return PopScope(
      canPop: false,
      // ignore: deprecated_member_use
      onPopInvoked: (bool didPop) async {
        if (didPop) return;
        final bool? shouldPop = canSend
            ? id == 0
                ? await saveArticleDraftDialog(
                    ref,
                    context,
                    articleState,
                  )
                : await editArticleDialog(
                    ref,
                    context,
                  )
            : true;
        if (shouldPop ?? false) {
          if (context.mounted) {
            context.pop();
          }
        }
      },
      child: AppAndroidBottomNav(
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(
              60,
            ),
            child: CreateContentAppbar(
              canSend: canSend,
              draftData: draftsData,
              sendPressed: () {
                context.go(
                  FeedRoutes.namespace,
                  extra: () => ArticleHelperFunctions.sendArticle(
                    ref,
                    articleState,
                    id,
                    data.value!.ownerId,
                  ),
                );
              },
              onCanSendPost: () async {
                final shouldPop = id == 0
                    ? await saveArticleDraftDialog(
                        ref,
                        context,
                        articleState,
                      )
                    : await editArticleDialog(
                        ref,
                        context,
                      );
                if (shouldPop ?? false) {
                  if (context.mounted) {
                    context.pop();
                  }
                }
              },
              draftPressed: () =>
                  ArticleHelperFunctions.showArticleDraftsScreen(context),
            ),
          ),
          bottomNavigationBar: const CreateContentPrivacy(),
          body: data.when(
            data: (article) {
              if (article == null) {
                return const Center(
                  child: Text(
                    'Article not found',
                  ),
                );
              }
              return CreateArticleWidget(article: article);
            },
            error: (error, st) {
              return Center(
                child: Text(
                  error.toString(),
                ),
              );
            },
            loading: () {
              return AppLoadingWidget(
               
              );
            },
          ),
        ),
      ),
    );
  }
}
