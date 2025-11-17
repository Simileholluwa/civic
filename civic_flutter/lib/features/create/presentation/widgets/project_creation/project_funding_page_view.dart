import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/create/create.dart';
import 'package:civic_flutter/features/project/presentation/helpers/number_formatter.dart';
import 'package:civic_flutter/features/project/project.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconsax/iconsax.dart';

class ProjectFundingPageView extends ConsumerWidget {
  const ProjectFundingPageView({
    required this.project,
    super.key,
  });

  final Project project;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currency = ref.watch(
      createProjectNotifProvider(project).select(
        (s) => s.currency,
      ),
    );
    final fundingCategory = ref.watch(
      createProjectNotifProvider(project).select(
        (s) => s.fundingCategory,
      ),
    );
    final fundingSubCategory = ref.watch(
      createProjectNotifProvider(project).select(
        (s) => s.fundingSubCategory,
      ),
    );
    final projectCostController = ref.read(
      createProjectNotifProvider(project).select(
        (s) => s.projectCostController,
      ),
    );
    final fundingNoteController = ref.read(
      createProjectNotifProvider(project).select(
        (s) => s.fundingNoteController,
      ),
    );
    final projectNotifier = ref.read(
      createProjectNotifProvider(project).notifier,
    );
    return SingleChildScrollView(
      padding: EdgeInsets.fromLTRB(
        20,
        20,
        20,
        MediaQuery.of(context).viewInsets.bottom + 20,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Share details on how much this project will cost and how it will be funded.',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              ProjectCategoryDropdown(
                hintText: 'NGN',
                dropdownItems: currencies.keys.toList(),
                value: currency,
                onChanged: projectNotifier.setCurrency,
                width: 100,
                leftPadding: 4,
                rightPadding: 8,
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: AppTextField(
                  textController: projectCostController!,
                  prefixIcon: Iconsax.moneys5,
                  inputFormatters: [
                    NumberInputFormatter(),
                  ],
                  hintText: "Enter the project's cost",
                  validator: (value) => TValidator.validateEmptyText(
                    'Project cost',
                    value,
                  ),
                  textInputType: TextInputType.number,
                  onChanged: projectNotifier.setProjectCost,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          ProjectCategoryDropdown(
            hintText: 'Select funding category',
            dropdownItems: fundingSources.keys.toList(),
            value: fundingCategory,
            onChanged: projectNotifier.setFundingCategory,
          ),
          const SizedBox(height: 20),
          ProjectCategoryDropdown(
            hintText: 'Select funding subcategory',
            dropdownItems: ProjectHelperFunctions.getFundingSubcategories(
              fundingCategory,
            ),
            value: fundingSubCategory,
            onChanged: projectNotifier.setFundingSubCategory,
          ),
          const SizedBox(height: 20),
          AppTextField(
            textController: fundingNoteController!,
            showPrefixIcon: false,
            hintText: 'Optional note on funding and or cost...',
            validator: (value) => null,
            showUpperText: true,
            upperText: 'Funding note',
            onChanged: projectNotifier.setFundingNote,
          ),
        ],
      ),
    );
  }
}
