// ignore_for_file: use_build_context_synchronously

import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/features/feed/feed.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:iconsax/iconsax.dart';

class CreateArticleScreen extends ConsumerWidget {
  const CreateArticleScreen({
    super.key,
    required this.id,
    required this.post,
  });

  final int id;
  final Post? post;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final scheduledDateTimeState = ref.watch(postScheduledDateTimeProvider);
    final data = post == null
        ? ref.watch(
            postDetailProvider(id, 'articleDraft'),
          )
        : AsyncValue.data(
            post,
          );
    final postState = ref.watch(
      feedProvider(
        data.value,
      ),
    );
    final postNotifier = ref.watch(
      feedProvider(
        data.value,
      ).notifier,
    );
    final canSend = postState.imageUrls.isNotEmpty &&
        postState.text.isNotEmpty &&
        postState.articleContent.isNotEmpty;

    return PopScope(
      canPop: false,
      // ignore: deprecated_member_use
      onPopInvoked: (bool didPop) async {
        if (didPop) return;
        final bool? shouldPop = canSend
            ? await savePostDraftDialog(
                ref,
                context,
                data.value!,
                PostType.article,
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
              sendPressed: () async {
                context.pop();
                await postNotifier.sendAnArticle(
                  data.value?.id,
                );
              },
              title: CreateContentPrivacy(),
              onCanSendPost: () async {
                final bool? shouldPop = canSend
                    ? await savePostDraftDialog(
                        ref,
                        context,
                        data.value!,
                        PostType.article,
                      )
                    : true;
                if (shouldPop ?? false) {
                  if (context.mounted) context.pop();
                }
              },
            ),
          ),
          body: data.when(
            data: (value) {
              if (value == null) {
                return const Center(
                  child: Text(
                    'Article not found',
                  ),
                );
              }
              return CreateArticleWidget(post: value);
            },
            error: (error, st) {
              return Center(
                child: Text(
                  error.toString(),
                ),
              );
            },
            loading: () {
              return AppLoadingWidget();
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
