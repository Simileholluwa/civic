import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/features/article/presentation/providers/article_provider.dart';
import 'package:civic_flutter/features/article/presentation/widgets/article_banner.dart';
import 'package:civic_flutter/features/article/presentation/widgets/article_text_editor.dart';
import 'package:civic_flutter/features/article/presentation/widgets/article_text_toolbar.dart';
import 'package:civic_flutter/features/article/presentation/widgets/article_title_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CreateArticleWidget extends ConsumerStatefulWidget {
  const CreateArticleWidget({
    super.key,
    required this.article,
  });

  final Article article;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _CreateArticleWidgetState();
}

class _CreateArticleWidgetState extends ConsumerState<CreateArticleWidget> {
  late Article _article;

  @override
  void initState() {
    super.initState();
    setState(() {
      _article = widget.article;
    });
  
  }

  @override
  Widget build(BuildContext context) {
    final articleWriter = ref.watch(articleWriterProvider(_article)); 
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: Theme.of(context).scaffoldBackgroundColor,
            border: Border(
              bottom: BorderSide(
                color: Theme.of(context).dividerColor,
              ),
            ),
          ),
          padding: const EdgeInsets.symmetric(
            vertical: 4,
          ),
          child: ArticleTextToolbar(
            controller: articleWriter.controller,
            focusNode: articleWriter.focusNode,
          ),
        ),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                ArticleBanner(article: _article,),
                ArticleTitleField(article: _article),
                ArticleTextEditor(
                  controller: articleWriter.controller,
                  scrollController: articleWriter.scrollController,
                  focusNode: articleWriter.focusNode,
                  configurations: const QuillEditorConfigurations(),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
