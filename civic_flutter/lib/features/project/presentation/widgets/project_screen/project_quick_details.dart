import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/project/project.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconsax/iconsax.dart';

class ProjectQuickDetails extends ConsumerWidget {
  const ProjectQuickDetails({
    required this.project,
    this.showPadding = true,
    super.key,
  });

  final Project project;
  final bool showPadding;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final amount = ProjectHelperFunctions.humanizeProjectCost(
      project.projectCost!,
    );
    final textStyle = Theme.of(context).textTheme.bodyMedium!.copyWith(
      fontSize: 16,
      fontWeight: FontWeight.bold,
    );
    final completionRate = ProjectHelperFunctions.percentageElapsed(
      project.startDate!,
      project.endDate!,
    );
    final duration = ProjectHelperFunctions.humanizeProjectDuration(
      project.startDate!,
      project.endDate!,
    );
    return SingleChildScrollView(
      padding: showPadding
          ? const EdgeInsets.symmetric(horizontal: 15)
          : EdgeInsets.zero,
      scrollDirection: Axis.horizontal,
      child: Row(
        spacing: 10,
        children: [
          ProjectQuickDetailWidget(
            icon: Iconsax.buy_crypto5,
            title: '${project.currency} $amount',
            color: TColors.primary,
            textStyle: textStyle,
          ),
          ProjectQuickDetailWidget(
            icon: Iconsax.percentage_circle5,
            title: completionRate,
            color: TColors.warning,
            textStyle: textStyle,
          ),
          ProjectQuickDetailWidget(
            icon: Iconsax.calendar_25,
            title: duration,
            color: Colors.blue,
            textStyle: textStyle,
          ),
        ],
      ),
    );
  }
}
