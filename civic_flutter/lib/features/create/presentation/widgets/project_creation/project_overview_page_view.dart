import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/create/create.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProjectOverviewPageView extends ConsumerWidget {
  const ProjectOverviewPageView({
    required this.project,
    super.key,
  });

  final Project project;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final quillController = ref.read(
      createProjectNotifProvider(project).select(
        (s) => s.quillController,
      ),
    );
    final titleController = ref.read(
      createProjectNotifProvider(project).select(
        (s) => s.titleController,
      ),
    );
    final descriptionFocusNode = ref.read(
      createProjectNotifProvider(project).select(
        (s) => s.descriptionFocusNode,
      ),
    );
    final scrollController = ref.read(
      createProjectNotifProvider(project).select(
        (s) => s.scrollController,
      ),
    );
    return Column(
      children: [
        ReusableQuillToolbar(
          quillController: quillController!,
        ),
        Expanded(
          child: SingleChildScrollView(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom + 20,
            ),
            child: Column(
              children: [
                TextFormField(
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
                    hintText: 'Give your project a title...',
                    counter: SizedBox(),
                    contentPadding: EdgeInsets.fromLTRB(20, 20, 20, 8),
                  ),
                  maxLines: null,
                  controller: titleController,
                  textInputAction: TextInputAction.done,
                  maxLength: 100,
                ),
                ReusableQuillEditor(
                  controller: quillController,
                  scrollController: scrollController!,
                  focusNode: descriptionFocusNode!,
                  placeholder:
                      'Describe in detail what this project is all about.'
                      ' Think of its purpose, benefits, impact, and any relevant milestones.'
                      ' Use the toolbar to style your texts.',
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
