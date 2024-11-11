import 'package:civic_flutter/core/constants/app_colors.dart';
import 'package:civic_flutter/core/helpers/helper_functions.dart';
import 'package:civic_flutter/core/widgets/app/app_filled_icon_button.dart';
import 'package:civic_flutter/features/project/presentation/widgets/projects_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class ProjectsScreen extends StatelessWidget {
  const ProjectsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = THelperFunctions.isDarkMode(context);

    return Scaffold(
      appBar: AppBar(
        title: CivicSearchBar(
          leftWidget: AppFilledIconButton(
            color: Theme.of(context).iconTheme.color!,
            backgroundColor: isDark ? TColors.dark : TColors.light,
            icon: Iconsax.filter,
            onPressed: () {},
          ),
          rightWidget: AppFilledIconButton(
            color: Theme.of(context).iconTheme.color!,
            backgroundColor: isDark ? TColors.dark : TColors.light,
            icon: Iconsax.setting_2,
            onPressed: () {},
          ),
          searchText: 'Search projects',
          placeBeforeSearch: false,
          placeAfterSearch: false,
        ),
        toolbarHeight: 70,
      ),
    );
  }
}
