// ignore_for_file: use_build_context_synchronously

import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/constants/app_colors.dart';
import 'package:civic_flutter/core/helpers/helper_functions.dart';
import 'package:civic_flutter/core/widgets/app/app_android_bottom_nav.dart';
import 'package:civic_flutter/core/widgets/app/app_loading_widget.dart';
import 'package:civic_flutter/core/widgets/create_content/create_content_edit_article_dialog.dart';
import 'package:civic_flutter/features/article/article.dart';
import 'package:civic_flutter/core/widgets/create_content/create_content_appbar.dart';
import 'package:civic_flutter/core/widgets/create_content/create_content_privacy.dart';
import 'package:civic_flutter/core/widgets/create_content/create_content_save_article_draft_dialog.dart';
import 'package:civic_flutter/features/feed/presentation/routes/feed_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

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
    final articleWriter = ref.watch(
      articleWriterProvider(data.value),
    );
    final draftsData = id == 0 ? ref.watch(articleDraftsProvider) : [];
    final canSend = articleWriter.banner.isNotEmpty &&
        articleWriter.title.isNotEmpty &&
        !articleWriter.isEmptyContent;

    return PopScope(
      canPop: false,
      // ignore: deprecated_member_use
      onPopInvoked: (bool didPop) async {
        if (didPop) return;
        final bool? shouldPop = canSend
            ? id == 0
                ? await createContentSaveArticleDraftDialog(
                    ref,
                    context,
                    articleWriter.title,
                    articleWriter.content,
                    articleWriter.banner,
                  )
                : await createContentEditArticleDialog(
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
                  extra: () => THelperFunctions.sendArticle(
                    ref,
                    id != 0
                        ? Article(
                            id: data.value!.id,
                            ownerId: data.value!.ownerId,
                            title: articleWriter.title,
                            content: articleWriter.content,
                            banner: articleWriter.banner,
                          )
                        : Article(
                            id: null,
                            ownerId: 0,
                            title: articleWriter.title,
                            content: articleWriter.content,
                            banner: articleWriter.banner,
                          ),
                  ),
                );
              },
              onCanSendPost: () async {
                final shouldPop = id == 0
                    ? await createContentSaveArticleDraftDialog(
                        ref,
                        context,
                        articleWriter.title,
                        articleWriter.content,
                        articleWriter.banner,
                      )
                    : await createContentEditArticleDialog(
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
                  THelperFunctions.showArticleDraftsScreen(context),
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
                backgroundColor: THelperFunctions.isDarkMode(context)
                    ? TColors.dark
                    : TColors.light,
              );
            },
          ),
        ),
      ),
    );
  }
}
