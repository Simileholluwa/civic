import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/features/project/project.dart';
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
    final projectCreationSate = ref.watch(projectProviderProvider(project));
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
          ),
          child: ProjectTextToolbar(
            controller: projectCreationSate.quillController,
            focusNode: projectCreationSate.focusNode,
          ),
        ),
        Expanded(
          child: SingleChildScrollView(
            padding: const EdgeInsets.only(bottom: 60),
            child: Column(
              children: [
                ProjectTitleField(
                  project: project,
                ),
                ProjectTextEditor(
                  controller: projectCreationSate.quillController,
                  scrollController: projectCreationSate.scrollController,
                  focusNode: projectCreationSate.focusNode,
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
