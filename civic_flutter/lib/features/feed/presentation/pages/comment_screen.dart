import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/feed/feed.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class CommentScreen extends ConsumerWidget {
  const CommentScreen({required this.id, super.key});

  final int id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncPost = ref.watch(getCommentProvider(id, true));
    final userId = ref.read(localStorageProvider).getInt('userId');

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: Container(
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(color: Theme.of(context).dividerColor),
            ),
          ),
          child: AppBar(
            leading: IconButton(
              icon: const Icon(Iconsax.arrow_left_2),
              onPressed: () => context.pop(),
            ),
            title: Text(
              'Comments',
              style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                    fontSize: 23,
                  ),
            ),
            actions: asyncPost.when(
              data: (post) {
                final isOwner = post.post.owner?.id == userId;
                final isSubscribed = ref.watch(
                  feedButtonsProvider(PostWithUserStateKey(post))
                      .select((s) => s.isSubscribed),
                );
                final postButtonsNotifier = ref.read(
                  feedButtonsProvider(PostWithUserStateKey(post)).notifier,
                );
                return [
                  IconButton(
                    onPressed: isOwner
                        ? null
                        : () async {
                            await postButtonsNotifier.subscribeToNotifications(
                              post.post.id!,
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
              error: (_, _) => null,
              loading: () => null,
            ),
          ),
        ),
      ),
      bottomNavigationBar: asyncPost.when(
        data: (value) => Column(
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
        ),
        error: (error, _) {
          final err = error as Map<String, dynamic>?;
          if (err != null && err['action'] == 'retry') {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              child: ContentSingleButton(
                onPressed: () => ref.invalidate(getCommentProvider),
                text: 'Retry',
                buttonIcon: Iconsax.refresh,
              ),
            );
          }
          return null;
        },
        loading: () => null,
      ),
      body: asyncPost.when(
        data: (_) => Padding(
          padding: const EdgeInsets.only(top: 10),
          child: PostCommentCard(
            id: id,
            firstPageProgressIndicator: Padding(
              padding: const EdgeInsets.symmetric(vertical: 50),
              child: LoadingAnimationWidget.progressiveDots(
                color: TColors.primary,
                size: 50,
              ),
            ),
          ),
        ),
        error: (error, stackTrace) {
          final err = error as Map<String, String>?;
          return Center(
            child: LoadingError(
              retry: null,
              errorMessage: err != null ? err['message'] : 'Error',
              padding: const EdgeInsets.symmetric(horizontal: 20),
              mainAxisAlignment: MainAxisAlignment.center,
            ),
          );
        },
        loading: () => const AppLoadingWidget(),
      ),
    );
  }
}
