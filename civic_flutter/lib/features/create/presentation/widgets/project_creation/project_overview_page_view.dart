import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/features/create/create.dart';
import 'package:civic_flutter/features/project/project.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProjectOverviewPageView extends ConsumerWidget {
  const ProjectOverviewPageView({
    required this.project,
    super.key,
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
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom + 20,
            ),
            child: Column(
              children: [
                ProjectTitleField(
                  project: project,
                ),
                ProjectTextEditor(
                  controller: projectCreationSate.quillController,
                  scrollController: projectCreationSate.scrollController,
                  focusNode: projectCreationSate.focusNode,
                  configurations: const QuillEditorConfig(),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
