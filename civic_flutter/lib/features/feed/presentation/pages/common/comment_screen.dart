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
    final data = ref.watch(
      getCommentProvider(
        id,
        true,
      ),
    );
    final postCardState = ref.watch(
      feedButtonsProvider(
        data.value,
      ),
    );
    final postCardNotifier = ref.watch(
      feedButtonsProvider(
        data.value,
      ).notifier,
    );
    final pagingController = ref
        .watch(
          paginatedCommentListProvider(id).notifier,
        )
        .pagingController;
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
            actions: data.when(
              data: (value) {
                return [
                  IconButton(
                    icon: const Icon(Iconsax.refresh),
                    onPressed: pagingController.refresh,
                  ),
                  IconButton(
                    icon: Icon(
                      Iconsax.filter,
                      color: value.commentCount! <= 2
                          ? Theme.of(context).disabledColor
                          : Theme.of(context).iconTheme.color,
                    ),
                    onPressed: value.commentCount! <= 2 ? null : () {},
                  ),
                  IconButton(
                    onPressed: postCardState.isOwner
                        ? null
                        : () async {
                            await postCardNotifier.subscribeToNotifications(
                              data.value!.id!,
                            );
                          },
                    icon: Icon(
                      postCardState.isSubscribed
                          ? Iconsax.notification_bing5
                          : Iconsax.notification_bing,
                      color: postCardState.isOwner
                          ? Theme.of(context).disabledColor
                          : postCardState.isSubscribed
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
              'Comments',
              style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                    fontSize: 23,
                  ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: data.when(
        data: (data) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            child: ContentSingleButton(
              onPressed: () async {
                await context.push(
                  '/create/post/0',
                  extra: {
                    'parent': data,
                  },
                );
              },
              text: 'Share your opinion',
              buttonIcon: Iconsax.magicpen5,
            ),
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
      body: data.when(
        data: (_) {
          return SingleChildScrollView(
            padding: const EdgeInsets.only(
              top: 10,
            ),
            child: PostCommentCard(
              id: id,
              firstPageProgressIndicator: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 50,
                ),
                child: LoadingAnimationWidget.progressiveDots(
                  color: TColors.primary,
                  size: 50,
                ),
              ),
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
          return const AppLoadingWidget();
        },
      ),
    );
  }
}
