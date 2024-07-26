
import 'package:civic_flutter/features/projects/presentation/widgets/projects_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProjectsScreen extends StatelessWidget {
  const ProjectsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // final isDark = THelperFunctions.isDarkMode(context);

    return Obx(
      () => Scaffold(
        appBar: AppBar(
          title: const ProjectsSearchBar(),
        ),
        body: const Center(
          child: Text('Projects screen'),
        ),
      ),
    );
  }
}
