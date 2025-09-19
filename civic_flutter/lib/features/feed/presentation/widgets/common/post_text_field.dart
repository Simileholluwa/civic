import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/feed/feed.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PostTextField extends ConsumerWidget {
  const PostTextField({
    super.key,
    required this.userName,
    required this.controller,
    required this.post,
    required this.isCommentOrReply,
  });

  final String userName;
  final MentionHashtagLinkTextEditingController controller;
  final Post post;
  final bool isCommentOrReply;

  @override
  Widget build(
    BuildContext context,
    WidgetRef ref,
  ) {
    final postNotifier = ref.watch(
      feedProvider(post).notifier,
    );
    return Column(
      children: [
        TextFormField(
          controller: controller,
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                fontSize: 18,
              ),
          textCapitalization: TextCapitalization.sentences,
          onChanged: (text) => THelperFunctions.onTextChanged(
            ref,
            text,
            controller,
          ),
          decoration: InputDecoration(
            border: InputBorder.none,
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            errorBorder: InputBorder.none,
            hintMaxLines: 2,
            hintText: postNotifier.hintText(userName, isCommentOrReply),
            counter: const SizedBox(),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: TSizes.md + 2,
              vertical: TSizes.md,
            ),
          ),
          keyboardType: TextInputType.multiline,
          textInputAction: TextInputAction.newline,
          maxLength: 2500,
          maxLines: null,
        ),
      ],
    );
  }
}
