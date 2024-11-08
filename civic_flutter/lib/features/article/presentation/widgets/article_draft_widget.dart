import 'dart:convert';
import 'dart:io';
import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/constants/sizes.dart';
import 'package:civic_flutter/features/article/presentation/helper/article_helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:transparent_image/transparent_image.dart';

class ArticleDraftWidget extends StatelessWidget {
  const ArticleDraftWidget({
    super.key,
    required this.article,
  });

  final ArticleDraft article;

  @override
  Widget build(BuildContext context) {
    final defaultTextStyle = DefaultTextStyle.of(context);
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          TSizes.md,
        ),
        border: Border.all(
          color: Theme.of(context).dividerColor,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 200,
            width: double.maxFinite,
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(
                  TSizes.md,
                ),
                topRight: Radius.circular(
                  TSizes.md,
                ),
              ),
              child: FadeInImage(
                fit: BoxFit.cover,
                placeholder: MemoryImage(kTransparentImage),
                image: FileImage(
                  File(
                    article.banner,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: TSizes.md,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: TSizes.md,
            ),
            child: Text(
              article.title,
              style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                    fontSize: 25,
                    fontWeight: FontWeight.w700,
                  ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: TSizes.md,
              vertical: 12
            ),
            child: QuillEditor.basic(
              controller: QuillController(
                document: Document.fromJson(
                  jsonDecode(
                    article.content,
                  ),
                ),
                selection: const TextSelection.collapsed(
                  offset: 0,
                ),
                readOnly: true,
              ),
              configurations: QuillEditorConfigurations(
                elementOptions: const QuillEditorElementOptions(
                  codeBlock: QuillEditorCodeBlockElementOptions(
                    enableLineNumbers: true,
                  ),
                  orderedList: QuillEditorOrderedListElementOptions(),
                  unorderedList: QuillEditorUnOrderedListElementOptions(
                    useTextColorForDot: true,
                  ),
                ),
                customStyles: ArticleHelperFunctions.articleTextEditorStyles(
                  context,
                  defaultTextStyle,
                ),
                maxHeight: 400,
                scrollable: true,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
