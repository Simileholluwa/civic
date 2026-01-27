import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/project/project.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProjectDetailsWidget extends ConsumerWidget {
  const ProjectDetailsWidget({
    required this.project,
    super.key,
  });

  final Project project;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final projectCardState = ref.watch(
      projectCardWidgetProvider(
        project,
      ),
    );
    final defaultTextStyle = DefaultTextStyle.of(context);
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 10),
      child: Column(
        spacing: 10,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (projectCardState.imagesUrl!.length == 1)
            ContentSingleCachedImage(
              imageUrl: projectCardState.imagesUrl!.first,
              useMargin: false,
              aspectRatio: 300,
            )
          else
            ContentMultipleCachedImage(
              imageUrls: projectCardState.imagesUrl!,
              useMargin: false,
            ),
          Padding(
            padding: const EdgeInsets.only(
              top: 5,
            ),
            child: Text(
              projectCardState.title!,
              style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                    fontSize: 23,
                  ),
            ),
          ),
          QuillEditor(
            controller: QuillController(
              document: projectCardState.rawDescription!,
              selection: const TextSelection.collapsed(offset: 0),
              readOnly: true,
            ),
            focusNode: FocusNode(canRequestFocus: false),
            scrollController: ScrollController(),
            config: QuillEditorConfig(
              scrollable: false,
              customStyles: THelperFunctions.articleTextEditorStyles(
                context,
                defaultTextStyle,
              ),
              embedBuilders: [
                RoundedImageEmbedBuilder(
                  borderRadius: BorderRadius.circular(
                    16,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
