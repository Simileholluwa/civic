import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/feed/feed.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';

class MarkNotInterested extends ConsumerWidget {
  const MarkNotInterested({
    required this.postWithUserState,
    required this.originalPostId,
    super.key,
  });

  final PostWithUserState postWithUserState;
  final int originalPostId;

  static const _baseReasons = [
    "I'm not interested in the author",
    "I've seen this {type} before",
    'This {type} is old',
    "I've seen too many {type} on this topic",
    "It's something else",
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final post = postWithUserState.post;
    final type = post.postType == PostType.comment
        ? 'comment'
        : post.postType == PostType.commentReply
            ? 'reply'
            : 'post';
    final isComment = post.postType == PostType.comment;
    final isReply = post.postType == PostType.commentReply;
    final feedProv =
        feedButtonsProvider(PostWithUserStateKey(postWithUserState));
    final postCardNotifier = ref.read(feedProv.notifier);
    final reasonNotInterested = ref.watch(
      feedProv.select((s) => s.reasonNotInterested),
    );
    final isSendingNotInterested = ref.watch(
      feedProv.select((s) => s.isSendingNotInterested),
    );

    final reasons = _baseReasons
        .map((r) => r.replaceAll('{type}', type))
        .toList(growable: false);
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
            title: Text(
              'Tell us why',
              style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                    fontSize: 23,
                  ),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
        ),
        child: Column(
          children: [
            RepaintBoundary(
              child: ListView.separated(
                shrinkWrap: true,
                itemBuilder: (ctx, index) {
                  final text = reasons[index];
                  final selected = reasonNotInterested == text;
                  return InkWell(
                    onTap: () => postCardNotifier.setReasonNotInterested(text),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(0, 15, 0, 17),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              text,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                    fontSize: 16,
                                  ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          SizedBox(
                            width: 20,
                            height: 20,
                            child: Checkbox(
                              value: selected,
                              onChanged: (_) =>
                                  postCardNotifier.setReasonNotInterested(text),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
                separatorBuilder: (ctx, index) => const SizedBox(height: 5),
                itemCount: reasons.length,
              ),
            ),
            const Divider(),
            const SizedBox(
              height: 10,
            ),
            Text.rich(
              TextSpan(
                text: 'If you think this $type violates our ',
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      fontStyle: FontStyle.italic,
                    ),
                children: [
                  TextSpan(
                    text: 'Political Community Guidelines',
                    style: Theme.of(context).textTheme.labelMedium!.copyWith(
                          color: TColors.primary,
                          fontWeight: FontWeight.bold,
                        ),
                    recognizer: TapGestureRecognizer()..onTap = () {},
                  ),
                  const TextSpan(
                    text: ', please let us know by ',
                  ),
                  TextSpan(
                    text: 'reporting this $type',
                    style: Theme.of(context).textTheme.labelMedium!.copyWith(
                          color: TColors.primary,
                          fontWeight: FontWeight.bold,
                        ),
                    recognizer: TapGestureRecognizer()..onTap = () {},
                  ),
                  const TextSpan(
                    text: ' instead.',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(
              color: Theme.of(context).dividerColor,
            ),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(18, 10, 18, 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            spacing: 10,
            children: [
              Text(
                'This $type will no longer be visible to you when you submit.',
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      color: Theme.of(context).hintColor,
                      fontSize: 14,
                    ),
              ),
              SizedBox(
                width: double.infinity,
                child: FilledButton(
                  onPressed:
                      reasonNotInterested.isEmpty || isSendingNotInterested
                          ? null
                          : () async {
                              final result =
                                  await postCardNotifier.markPostNotInterested(
                                post.id!,
                                reasonNotInterested,
                                originalPostId,
                                isReply,
                                isComment,
                              );
                              if (result) {
                                if (context.mounted) {
                                  context.pop();
                                }
                              }
                            },
                  child: Text(
                    'Submit',
                    style: const TextStyle().copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ).withLoading(
                  loading: isSendingNotInterested,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
