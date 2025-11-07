import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/project/project.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProjectProgressIndicator extends ConsumerWidget {
  const ProjectProgressIndicator({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentPage = ref.watch(projectCurrentPageProvider);
    final pageNotifier = ref.read(projectPageControllerProvider.notifier);

    final theme = Theme.of(context);
    final labelStyle = theme.textTheme.labelLarge!;
    final bodyColor = theme.textTheme.bodyLarge!.color;

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.fromLTRB(20, 6, 20, 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List<Widget>.generate(
          sectionNames.length,
          (index) {
            final isActive = index == currentPage;
            final isCompleted = index < currentPage;

            final circleColor = isActive
                ? TColors.secondary
                : isCompleted
                    ? TColors.primary
                    : theme.disabledColor;

            final numberColor =
                (isActive || isCompleted) ? Colors.white : theme.disabledColor;

            return Row(
              children: [
                GestureDetector(
                  onTap: () => pageNotifier.gotoPage(index),
                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: circleColor,
                          shape: BoxShape.circle,
                        ),
                        child: Text(
                          '${index + 1}',
                          style: labelStyle.copyWith(
                            color: numberColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(width: TSizes.sm),
                      Text(
                        sectionNames[index],
                        style: labelStyle.copyWith(
                          color: (isActive || isCompleted)
                              ? bodyColor
                              : theme.disabledColor,
                          fontWeight: isActive || isCompleted
                              ? FontWeight.bold
                              : FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                ),
                if (index < sectionNames.length - 1)
                  const Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: TSizes.sm,
                    ),
                    child: Icon(
                      Icons.chevron_right,
                      color: Colors.grey,
                    ),
                  ),
              ],
            );
          },
        ),
      ),
    );
  }
}
