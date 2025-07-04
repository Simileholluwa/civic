import 'dart:developer';

import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/feed/feed.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';

class RepliesScreen extends ConsumerWidget {
  const RepliesScreen({
    super.key,
    required this.replyId,
  });

  final int replyId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(
      getCommentProvider(
        replyId,
        false,
      ),
    );
    final commentController = ref.watch(
      paginatedRepliesListProvider(replyId).notifier,
    );
    log(replyId.toString());
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
              data: (_) {
                return [
                  IconButton(
                    icon: const Icon(Iconsax.refresh),
                    onPressed: () {
                      commentController.refresh();
                    },
                  ),
                  IconButton(
                    icon: const Icon(Iconsax.filter),
                    onPressed: () {},
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
      bottomNavigationBar: data.when(
        data: (data) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            child: ContentSingleButton(
              onPressed: () {
                context.push('/create/post/0', extra: {
                  'parent': data,
                });
              },
              text: 'Add a reply',
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
            child: PostCommentReplyCard(
              postId: replyId,
            ),
          );
        },
        error: (error, stackTrace) {
          final err = error as Map<String, dynamic>;
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
