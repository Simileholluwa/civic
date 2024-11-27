import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/project/project.dart';

class ProjectsScreen extends StatelessWidget {
  const ProjectsScreen({super.key, required this.sendProject,});

  final VoidCallback? sendProject;

  @override
  Widget build(BuildContext context) {
    if (sendProject != null) {
      Future.delayed(Duration.zero, () {
        sendProject!();
      });
    }
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(
          80,
        ),
        child: Center(
          child: Container(
            margin: const EdgeInsets.only(
              bottom: TSizes.sm - 2,
              top: TSizes.sm - 2,
            ),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(color: Theme.of(context).dividerColor),
              ),
            ),
            child: AppBar(
              automaticallyImplyLeading: false,
              centerTitle: true,
              title: ProjectSearchBar(
                onChanged: (text) {},
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: GestureDetector(
        onTap: () {
          context.push(
            AppRoutes.createProject,
            extra: {
              'id': 0,
            },
          );
        },
        child: Container(
          height: 70,
          width: 70,
          decoration: const BoxDecoration(
            color: TColors.primary,
            shape: BoxShape.circle,
          ),
          child: const Icon(
            Icons.add,
            color: Colors.white,
            size: 40,
          ),
        ),
      ),
    );
  }
}
