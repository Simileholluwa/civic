import 'dart:developer';

import 'package:civic_flutter/core/constants/app_colors.dart';
import 'package:civic_flutter/core/helpers/helper_functions.dart';
import 'package:civic_flutter/core/toasts_messages/toast_messages.dart';
import 'package:civic_flutter/core/widgets/app/app_android_bottom_nav.dart';
import 'package:civic_flutter/core/widgets/app/app_loading_widget.dart';
import 'package:civic_flutter/features/article/article.dart';
import 'package:civic_flutter/core/widgets/create_content/create_content_appbar.dart';
import 'package:civic_flutter/core/widgets/create_content/create_content_privacy.dart';
import 'package:civic_flutter/core/widgets/create_content/create_content_save_article_draft_dialog.dart';
import 'package:civic_flutter/features/feed/presentation/routes/feed_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class CreateArticleScreen extends ConsumerStatefulWidget {
  const CreateArticleScreen({
    super.key,
    required this.id,
  });

  final int id;

  @override
  ConsumerState<CreateArticleScreen> createState() =>
      _CreateArticleScreenState();
}

class _CreateArticleScreenState extends ConsumerState<CreateArticleScreen> {
  @override
  Widget build(BuildContext context) {
    final data = ref.watch(
      articleDetailProvider(widget.id),
    );
    final articleWriter = ref.watch(
      articleWriterProvider,
    );
    final draftsData = ref.watch(articleDraftsProvider);
    final canSend = articleWriter.canSend;
    log(canSend.toString());
    return PopScope(
      canPop: false,
      // ignore: deprecated_member_use
      onPopInvoked: (bool didPop) async {
        if (didPop) return;
        final bool? shouldPop = true
            ? await createContentSaveArticleDraftDialog(ref, context)
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
              canSend: true,
              draftData: draftsData,
              sendPressed: () {
                final contentPlainText =
                    articleWriter.contentPlainText;

                log(contentPlainText);
                contentPlainText.isNotEmpty
                    ? context.go(
                        FeedRoutes.namespace,
                        extra: () => THelperFunctions.sendArticle(
                          ref,
                        ),
                      )
                    : TToastMessages.infoToast(
                        'Article content cannot be empty.',
                      );
              },
              onCanSendPost: () async {
                final shouldPop =
                    await createContentSaveArticleDraftDialog(ref, context);
                if (shouldPop ?? false) {
                  if (context.mounted) context.pop();
                }
              },
              draftPressed: () =>
                  THelperFunctions.showPostDraftsScreen(context),
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
