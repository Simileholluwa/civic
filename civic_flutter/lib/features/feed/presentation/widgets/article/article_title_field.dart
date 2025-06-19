import 'package:civic_client/civic_client.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:civic_flutter/features/feed/feed.dart';

import 'package:flutter/material.dart';

class ArticleTitleField extends ConsumerWidget {
  const ArticleTitleField({
    super.key,
    required this.post,
  });

  final Post post;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final postState = ref.watch(feedProvider(post));
    final postNotifier = ref.watch(feedProvider(post).notifier);

    return TextFormField(
      style: Theme.of(context).textTheme.headlineLarge!.copyWith(
            fontSize: 25,
            fontWeight: FontWeight.w700,
          ),
      textCapitalization: TextCapitalization.sentences,
      decoration: const InputDecoration(
        border: InputBorder.none,
        focusedBorder: InputBorder.none,
        enabledBorder: InputBorder.none,
        errorBorder: InputBorder.none,
        hintText: 'Give your article a title...',
        counter: SizedBox(),
        contentPadding: EdgeInsets.fromLTRB(16, 20, 16, 0),
      ),
      onChanged: (value) {
        postNotifier.setText(value);
      },
      maxLines: null,
      controller: postState.controller,
      textInputAction: TextInputAction.done,
      maxLength: 100,
    );
  }
}
