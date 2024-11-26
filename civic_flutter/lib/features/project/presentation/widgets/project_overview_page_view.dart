import 'package:civic_flutter/features/project/presentation/providers/project_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/features/project/presentation/widgets/project_text_editor.dart';
import 'package:civic_flutter/features/project/presentation/widgets/project_text_toolbar.dart';
import 'package:civic_flutter/features/project/presentation/widgets/project_title_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';

class ProjectOverviewPageView extends ConsumerWidget {
  const ProjectOverviewPageView({
    super.key,
    required this.project,
  });

  final Project project;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final projectState = ref.watch(projectProviderProvider(project));
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
          padding: const EdgeInsets.only(
            bottom: 4,
            top: 4,
          ),
          child: ProjectTextToolbar(
            controller: projectState.quillController,
            focusNode: projectState.focusNode,
          ),
        ),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                ProjectTitleField(
                  project: project,
                ),
                ProjectTextEditor(
                  controller: projectState.quillController,
                  scrollController: projectState.scrollController,
                  focusNode: projectState.focusNode,
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
