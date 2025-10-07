import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/project/presentation/helpers/number_formatter.dart';
import 'package:civic_flutter/features/project/project.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconsax/iconsax.dart';

class ProjectFundingPageView extends ConsumerWidget {
  const ProjectFundingPageView({
    required this.project, super.key,
  });

  final Project project;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final projectCreationSate = ref.watch(projectProviderProvider(project));
    final projectNotifier =
        ref.watch(projectProviderProvider(project).notifier);
    return SingleChildScrollView(
      padding: EdgeInsets.fromLTRB(20, 20, 20, MediaQuery.of(context).viewInsets.bottom + 20),
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
                value: projectCreationSate.currency,
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
                  textController: projectCreationSate.projectCostController,
                  prefixIcon: Iconsax.moneys5,
                  inputFormatters: [NumberInputFormatter(),],
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
            value: projectCreationSate.fundingCategory,
            onChanged: projectNotifier.setFundingCategory,
          ),
          const SizedBox(height: 20),
          ProjectCategoryDropdown(
            hintText: 'Select funding subcategory',
            dropdownItems: ProjectHelperFunctions.getFundingSubcategories(
                projectCreationSate.fundingCategory,),
            value: projectCreationSate.fundingSubCategory,
            onChanged: projectNotifier.setFundingSubCategory,
          ),
          const SizedBox(height: 20),
          AppTextField(
            textController: projectCreationSate.fundingNoteController,
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
