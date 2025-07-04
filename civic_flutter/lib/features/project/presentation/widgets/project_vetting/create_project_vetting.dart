import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/project/project.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CreateProjectVetting extends ConsumerWidget {
  const CreateProjectVetting({super.key, required this.projectVetting});

  final ProjectVetting? projectVetting;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final vettedProjectState = ref.watch(
      projectVetProvider(
        projectVetting,
      ),
    );
    final vettedProjectNotifier = ref.watch(
      projectVetProvider(
        projectVetting,
      ).notifier,
    );
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(
        horizontal: 18,
        vertical: 15,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 15,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 5,
            children: [
              Text(
                'Project status',
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              Text(
                'This project has been marked completed based on the dates provided. Confirm the current status from the dropdown.',
                style: Theme.of(context).textTheme.labelMedium,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5.0),
                child: ProjectCategoryDropdown(
                  dropdownItems: ['Completed', 'Ongoing', 'Not started'],
                  value: vettedProjectState.status,
                  onChanged: (value) {
                    vettedProjectNotifier.setStatus(
                      value!,
                    );
                  },
                  hintText: 'What is the status of this project?',
                ),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 5,
            children: [
              Text(
                'Image evidence',
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              Text(
                'Add up to five images of the current state of the project as proof.',
                style: Theme.of(context).textTheme.labelMedium,
              ),
              vettedProjectState.images.isEmpty
                  ? AddVettingImage(
                      projectVetting: projectVetting,
                    )
                  : AddedVettingImage(
                      projectVetting: projectVetting,
                    ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 5,
            children: [
              Text(
                'Write a comment',
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              Text(
                'How do you feel about the execution of this project?',
                style: Theme.of(context).textTheme.labelMedium,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 5,
                ),
                child: AppTextField(
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return 'Please write a comment';
                    }
                    return null;
                  },
                  textController: vettedProjectState.commentController,
                  showPrefixIcon: false,
                  onChanged: (value) {
                    vettedProjectNotifier.setComment(value ?? '');
                  },
                  hintText: 'Write your comment here',
                  maxLength: 400,
                  maxLines: 4,
                  minLines: 1,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
