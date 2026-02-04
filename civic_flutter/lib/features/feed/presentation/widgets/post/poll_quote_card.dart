import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/features/feed/feed.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class PollQuoteCard extends StatelessWidget {
  const PollQuoteCard({
    required this.post,
    super.key,
  });

  final Post post;

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        return ref
            .watch(
              postDetailProvider(
                post.parent!.id!,
                null,
                post.parent!.postType!,
              ),
            )
            .when(
              data: (value) {
                return PollCard(
                  postWithUserState: value,
                  showInteractions: false,
                  canVote: false,
                  showPadding: false,
                  showCreatorInfo: false,
                  canTap: true,
                  noMaxlines: false,
                  expandOnTextTap: false,
                  maxLines: 3,
                  onToggleTextTap: () {},
                );
              },
              error: (_, _) {
                return PollCard(
                  postWithUserState: PostWithUserState(
                    post: post.parent!,
                  ),
                  showInteractions: false,
                  canVote: false,
                  showPadding: false,
                  showCreatorInfo: false,
                  canTap: true,
                  noMaxlines: false,
                  maxLines: 3,
                  expandOnTextTap: false,
                  onToggleTextTap: () {},
                );
              },
              loading: () {
                return LoadingAnimationWidget.progressiveDots(
                  color: Theme.of(context).primaryColor,
                  size: 30,
                );
              },
            );
      },
    );
  }
}
