import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/feed/feed.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';

class RepliesScreen extends ConsumerWidget {
  const RepliesScreen({
    required this.replyId,
    super.key,
  });

  final int replyId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncReply = ref.watch(getCommentProvider(replyId, false));
    final userId = ref.read(localStorageProvider).getInt('userId');
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: Container(
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: Theme.of(context).dividerColor,
              ),
            ),
          ),
          child: AppBar(
            leading: IconButton(
              icon: const Icon(
                Iconsax.arrow_left_2,
              ),
              onPressed: () {
                context.pop();
              },
            ),
            actions: asyncReply.when(
              data: (value) {
                final reply = value.post;
                final isOwner = reply.owner?.id == userId;
                final isSubscribed = ref.watch(
                  feedButtonsProvider(PostWithUserStateKey(value))
                      .select((s) => s.isSubscribed),
                );
                final postCardNotifier = ref.read(
                  feedButtonsProvider(PostWithUserStateKey(value)).notifier,
                );
                return [
                  IconButton(
                    onPressed: isOwner
                        ? null
                        : () async {
                            await postCardNotifier.subscribeToNotifications(
                              reply.id!,
                            );
                          },
                    icon: Icon(
                      isSubscribed
                          ? Iconsax.notification_bing5
                          : Iconsax.notification_bing,
                      color: isOwner
                          ? Theme.of(context).disabledColor
                          : isSubscribed
                              ? TColors.primary
                              : Theme.of(context).iconTheme.color,
                      size: 26,
                    ),
                  ),
                  const SizedBox(width: 5),
                ];
              },
              error: (_, __) => null,
              loading: () => null,
            ),
            title: Text(
              'Replies',
              style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                    fontSize: 23,
                  ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: asyncReply.when(
        data: (value) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Divider(height: 0),
              Padding(
                padding: const EdgeInsets.fromLTRB(15, 10, 15, 5),
                child: ShareOpinion(
                  onTap: () async {
                    await context.push(
                      '/create/post/0',
                      extra: {
                        'rootPost': value.post,
                      },
                    );
                  },
                ),
              ),
            ],
          );
        },
        error: (error, __) {
          final err = error as Map<String, dynamic>;
          if (err['action'] == 'retry') {
            return Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 5,
              ),
              child: ContentSingleButton(
                onPressed: () {
                  ref.invalidate(getCommentProvider);
                },
                text: 'Retry',
                buttonIcon: Iconsax.refresh,
              ),
            );
          }
          return null;
        },
        loading: () => null,
      ),
      body: asyncReply.when(
        data: (_) {
          return Padding(
            padding: const EdgeInsets.only(top: 10),
            child: PostCommentReplyCard(
              postId: replyId,
            ),
          );
        },
        error: (error, stackTrace) {
          final err = error as Map<String, String>;
          return Center(
            child: LoadingError(
              retry: null,
              errorMessage: err['message'],
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
              ),
              mainAxisAlignment: MainAxisAlignment.center,
            ),
          );
        },
        loading: () {
          return const Center(
            child: AppLoadingWidget(),
          );
        },
      ),
    );
  }
}
