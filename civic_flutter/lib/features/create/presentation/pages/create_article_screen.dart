import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/create/create.dart';
import 'package:civic_flutter/features/feed/feed.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';

class CreateArticleScreen extends ConsumerWidget {
  const CreateArticleScreen({
    required this.id,
    required this.post,
    super.key,
  });

  final int id;
  final Post? post;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final scheduledDateTimeState = ref.watch(postScheduledDateTimeProvider);
    final data = ref.watch(
      postDetailProvider(
        id,
        post,
        PostType.article,
      ),
    );
    final postState = ref.watch(
      postCreationProvider(
        data.value?.post,
      ),
    );
    final hasDraft = ref.watch(
      hasPostDraftProvider(TTexts.articleDraft),
    );
    final postNotifier = ref.read(
      postCreationProvider(
        data.value?.post,
      ).notifier,
    );
    final canSend = postState.imageUrls.isNotEmpty &&
        postState.text.isNotEmpty &&
        postState.articleContent.isNotEmpty &&
        postState.articleContent.length >= 500;

    Future<void> saveDraftAndPop() async {
      await postNotifier.saveArticleAsDraft(
        data.value?.post.id,
        null,
      );
      if (context.mounted) context.pop();
    }

    Future<void> handlePopAttempt() async {
      if (canSend) {
        final save = await savePostDraftDialog(
          context,
          PostType.article,
        );
        if (save == null) return;
        if (save) {
          await saveDraftAndPop();
        } else {
          if (context.mounted) context.pop();
        }
      } else {
        if (context.mounted) context.pop();
      }
    }

    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (bool didPop, _) async {
        if (didPop) return;
        await handlePopAttempt();
      },
      child: AppAndroidBottomNav(
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(
              60,
            ),
            child: CreateContentAppbar(
              canSend: canSend,
              hasDraft: hasDraft.value ?? false,
              draftPressed: () async {
                final draft = await loadPostDrafts(
                  context,
                  TTexts.articleDraft,
                );
                if (draft is Post) {
                  postNotifier.loadFromDraft(draft);
                }
              },
              sendPressed: () async {
                context.pop();
                await postNotifier.sendAnArticle(
                  data.value?.post.id,
                );
              },
              title: const CreateContentPrivacy(),
              onCanSendPost: () async {
                await handlePopAttempt();
              },
            ),
          ),
          body: data.when(
            data: (value) {
              return CreateArticleWidget(
                post: value.post,
              );
            },
            error: (error, st) {
              final message = error is Map
                  ? (error['message']?.toString() ?? error.toString())
                  : error.toString();
              return Center(
                child: Text(message),
              );
            },
            loading: () {
              return const AppLoadingWidget();
            },
          ),
          bottomNavigationBar: data.when(
            data: (_) {
              if (scheduledDateTimeState != null) {
                return const CreateContentSchedule();
              } else {
                return null;
              }
            },
            error: (error, st) {
              final err = error as Map<String, dynamic>;
              if (err['action'] == 'retry') {
                return Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 5,
                  ),
                  child: ContentSingleButton(
                    onPressed: () {
                      ref.invalidate(postDetailProvider);
                    },
                    text: 'Retry',
                    buttonIcon: Iconsax.refresh,
                  ),
                );
              }
              return null;
            },
            loading: () {
              return null;
            },
          ),
        ),
      ),
    );
  }
}
