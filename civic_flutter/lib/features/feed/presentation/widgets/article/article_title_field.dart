import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/features/feed/feed.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ArticleTitleField extends ConsumerWidget {
  const ArticleTitleField({
    required this.post, super.key,
  });

  final Post post;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final postState = ref.watch(feedProvider(post));
    final postNotifier = ref.watch(feedProvider(post).notifier);

    return TextFormField(
      style: Theme.of(context).textTheme.headlineLarge!.copyWith(
            fontSize: 25,
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
      onChanged: postNotifier.setText,
      maxLines: null,
      controller: postState.controller,
      textInputAction: TextInputAction.done,
      maxLength: 100,
    );
  }
}
