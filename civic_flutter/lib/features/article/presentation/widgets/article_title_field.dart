import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/features/article/presentation/providers/article_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

class ArticleTitleField extends ConsumerWidget {
  const ArticleTitleField({
    super.key,
    required this.article,
  });

  final Article article;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final articleWriter = ref.watch(
      articleWriterProvider,
    );
    final articleWriterNotifier = ref.watch(
      articleWriterProvider.notifier,
    );
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
        hintText:
            'Give your article a title...',
        counter: SizedBox(),
        contentPadding: EdgeInsets.fromLTRB(
          16, 20, 16, 8,
        ),
      ),
      onChanged: (value) {
        articleWriterNotifier.setTitle(value);
      },
      maxLines: null,
      controller: articleWriter.titleController,
      textInputAction: TextInputAction.done,
      maxLength: 100,
    );
  }
}
