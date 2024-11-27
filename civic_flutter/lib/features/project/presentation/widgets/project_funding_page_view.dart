import 'package:civic_flutter/features/project/presentation/providers/project_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/validators/validation.dart';
import 'package:civic_flutter/core/widgets/app/app_text_field.dart';
import 'package:civic_flutter/features/project/presentation/helpers/project_data.dart';
import 'package:civic_flutter/features/project/presentation/helpers/project_helper_functions.dart';
import 'package:civic_flutter/features/project/presentation/widgets/project_category_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class ProjectFundingPageView extends ConsumerWidget {
  const ProjectFundingPageView({
    super.key,
    required this.project,
  });

  final Project project;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final projectState = ref.watch(projectProviderProvider(project));
    final projectNotifier =
        ref.watch(projectProviderProvider(project).notifier);
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Share details on how much this project will cost and how it will be funded.',
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  fontSize: 17,
                  color: Theme.of(context).textTheme.bodySmall!.color!,
                ),
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              ProjectCategoryDropdown(
                hintText: '₦',
                dropdownItems: currencies.values.toList(),
                value: projectState.currency,
                onChanged: (String? value) {
                  projectNotifier.setCurrency(value);
                },
                width: 100,
                leftPadding: 4,
                rightPadding: 8,
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: AppTextField(
                  textController: projectState.projectCostController,
                  prefixIcon: Iconsax.calendar5,
                  hintText: "Enter the project's cost",
                  hintStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: Theme.of(context).textTheme.bodySmall!.color!,
                      ),
                  validator: (value) => TValidator.validateEmptyText(
                    'Project cost',
                    value,
                  ),
                  textInputType: TextInputType.number,
                  onChanged: (value) {
                    projectNotifier.setProjectCost(value);
                  },
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          ProjectCategoryDropdown(
            hintText: 'Select funding category',
            dropdownItems: fundingSources.keys.toList(),
            value: projectState.fundingCategory,
            onChanged: (String? value) {
              projectNotifier.setFundingCategory(value);
            },
          ),
          const SizedBox(height: 20),
          ProjectCategoryDropdown(
            hintText: 'Select funding subcategory',
            dropdownItems: ProjectHelperFunctions.getFundingSubcategories(
                projectState.fundingCategory),
            value: projectState.fundingSubCategory,
            onChanged: (String? value) {
              projectNotifier.setFundingSubCategory(value);
            },
          ),
          const SizedBox(height: 20),
          AppTextField(
            textController: projectState.fundingNoteController,
            showPrefixIcon: false,
            hintText: 'Optional note on funding and or cost...',
            hintStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: Theme.of(context).textTheme.bodySmall!.color!,
                ),
            style: Theme.of(context).textTheme.bodyMedium,
            validator: (value) => null,
            textInputType: TextInputType.text,
            showUpperText: true,
            upperText: 'Funding note',
            onChanged: (value) {
              projectNotifier.setFundingNote(value);
            },
            maxLines: null,
          ),
        ],
      ),
    );
  }
}
