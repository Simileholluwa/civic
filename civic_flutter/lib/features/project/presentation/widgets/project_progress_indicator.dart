import 'package:civic_flutter/core/constants/app_colors.dart';
import 'package:civic_flutter/core/constants/sizes.dart';
import 'package:civic_flutter/features/project/presentation/helpers/project_data.dart';
import 'package:civic_flutter/features/project/presentation/providers/project_page_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProjectProgressIndicator extends ConsumerWidget {
  const ProjectProgressIndicator({super.key,});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentPage = ref.watch(projectCurrentPageProvider);
    final pageNotifier = ref.watch(projectPageControllerProvider.notifier);
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.fromLTRB(
        20, 6, 20, 8
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(sectionNames.length, (index) {
          final isActive = index == currentPage;
          final isCompleted = index < currentPage;
          return Row(
            children: [
              GestureDetector(
                onTap: () => pageNotifier.gotoPage(index),
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: isActive
                            ? TColors.secondary
                            : isCompleted
                                ? TColors.primary
                                : Theme.of(context).disabledColor,
                        shape: BoxShape.circle,
                      ),
                      child: Text(
                        '${index + 1}',
                        style: Theme.of(context).textTheme.labelLarge!.copyWith(
                          color: isActive || isCompleted ? Colors.white : Theme.of(context).disabledColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(width: TSizes.sm,),
                    Text(sectionNames[index],
                      style: Theme.of(context).textTheme.labelLarge!.copyWith(
                        color: isActive || isCompleted ? Theme.of(context).textTheme.bodyLarge!.color : Theme.of(context).disabledColor,
                        fontWeight: isActive || isCompleted ? FontWeight.bold : FontWeight.normal,
                      ),
                    ),
                  ],
                ),
              ),
              if (index < sectionNames.length - 1)
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: TSizes.sm,),
                  child: Icon(
                    Icons.chevron_right,
                    color: Colors.grey,
                  ),
                ),
            ],
          );
        }),
      ),
    );
  }
}
