
import 'package:civic_flutter/features/civic/presentation/controller/civic_controller.dart';
import 'package:civic_flutter/core/widgets/civic_app_bar.dart';
import 'package:civic_flutter/features/projects/presentation/widgets/projects_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProjectsScreen extends GetView<CivicController> {
  const ProjectsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // final isDark = THelperFunctions.isDarkMode(context);

    return Obx(
      () => Scaffold(
        appBar: ScrollToHideAppBar(
          controller: controller.state.animationController,
          visible: controller.state.showAppbar.value,
          title: const ProjectsSearchBar(),
        ),
        body: const Center(child: Text('Projects screen'),),
      ),
    );
  }
}
