import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/features/project/presentation/providers/project_page_provider.dart';
import 'package:civic_flutter/features/project/presentation/widgets/project_progress_indicator.dart';
import 'package:civic_flutter/features/project/presentation/widgets/project_text_editor.dart';
import 'package:civic_flutter/features/project/presentation/widgets/project_text_toolbar.dart';
import 'package:civic_flutter/features/project/presentation/widgets/project_title_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CreateProjectWidget extends ConsumerStatefulWidget {
  const CreateProjectWidget({
    super.key,
    required this.project,
  });

  final Project project;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _CreateProjectWidgetState();
}

class _CreateProjectWidgetState extends ConsumerState<CreateProjectWidget> {
  late Project _project;

  @override
  void initState() {
    setState(() {
      _project = widget.project;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final currentPageNotifier = ref.watch(projectCurrentPageProvider.notifier);
    final pageController = ref.watch(projectPageControllerProvider);
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const ProjectProgressIndicator(
          totalSections: 5,
        ),
        const Divider(height: 0,),
        Expanded(
          child: PageView(
            controller: pageController,
            onPageChanged: (index) {
              currentPageNotifier.setCurrentPage(index);
            },
            children: [
              Column(
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
                      controller: QuillController(
                        document: Document(),
                        selection: const TextSelection.collapsed(offset: 0),
                      ),
                      focusNode: FocusNode(),
                    ),
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          const ProjectTitleField(),
                          ProjectTextEditor(
                            controller: QuillController(
                              document: Document(),
                              selection: const TextSelection.collapsed(offset: 0),
                            ),
                            scrollController: ScrollController(),
                            focusNode: FocusNode(),
                            configurations: const QuillEditorConfigurations(),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Center(
                child: Text('Second page'),
              ),
              Center(
                child: Text('Third page'),
              ),
              Center(
                child: Text('Fourth page'),
              ),
              Center(
                child: Text('Fifth page'),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
