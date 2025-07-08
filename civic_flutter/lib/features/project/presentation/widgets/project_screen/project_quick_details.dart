import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/project/project.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconsax/iconsax.dart';

class ProjectQuickDetails extends ConsumerWidget {
  const ProjectQuickDetails({
    super.key,
    required this.project,
  });

  final Project project;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final projectCardState = ref.watch(
      projectCardWidgetProvider(
        project,
      ),
    );
    final textStyle = Theme.of(context).textTheme.titleLarge!.copyWith(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        );
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      scrollDirection: Axis.horizontal,
      child: Row(
        spacing: 10,
        children: [
          ProjectQuickDetailWidget(
            icon: Iconsax.buy_crypto5,
            title: '${projectCardState.currency} ${projectCardState.amount}',
            color: TColors.primary,
            textStyle: textStyle,
          ),
          ProjectQuickDetailWidget(
            icon: Iconsax.percentage_circle5,
            title: projectCardState.completionRate!,
            color: TColors.warning,
            textStyle: textStyle,
          ),
          ProjectQuickDetailWidget(
            icon: Iconsax.calendar_25,
            title: projectCardState.duration!,
            color: Colors.blue,
            textStyle: textStyle,
          ),
        ],
      ),
    );
  }
}
