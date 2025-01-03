import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/project/project.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class ProjectDetailsScreen extends ConsumerWidget {
  const ProjectDetailsScreen({
    super.key,
    required this.id,
  });

  final int id;

  static String route([int? id]) => '${ProjectRoutes.namespace}/${id ?? ':id'}';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(projectDetailProvider(id));
    final isDark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      body: data.when(
        data: (project) {
          if (project == null) {
            return const Center(
              child: Text(
                'Project not found',
              ),
            );
          }
          return CustomScrollView(
            slivers: [
              SliverAppBar(
                expandedHeight: 400,
                floating: true,
                snap: true,
                automaticallyImplyLeading: false,
                flexibleSpace: FlexibleSpaceBar(
                  background: DecoratedBox(
                    position: DecorationPosition.foreground,
                    decoration: const BoxDecoration(

                      gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.center,
                        colors: [
                          Colors.black,
                          Colors.transparent,
                        ],
                      ),
                      
                    ),
                    child: Image.network(
                      project.projectImageAttachments![2],
                      fit: BoxFit.cover,
                    ),
                  ),
                  title: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Text(
                      project.title!,
                      style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                            color: TColors.textWhite,
                            fontSize: 20,
                          ),
                    ),
                  ),
                ),
              ),
            ],
          );
                            
        },
        error: (error, st) {
          return Center(
            child: Text(
              error.toString(),
            ),
          );
        },
        loading: () {
          return AppLoadingWidget(
            backgroundColor: THelperFunctions.isDarkMode(context)
                ? TColors.dark
                : TColors.light,
          );
        },
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.fromLTRB(15, 10, 15, 5),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            AppFilledIconButton(
              color: TColors.textWhite,
              icon: Iconsax.gallery5,
              onPressed: () {},
              backgroundColor: TColors.primary,
            ),
            const SizedBox(width: 10),
            Expanded(
              child: TextField(
                controller: TextEditingController(),
                maxLines: null,
                decoration: InputDecoration(
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  hintText: 'Add a comment',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(100),
                    borderSide: BorderSide.none,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(100),
                    borderSide: BorderSide.none,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(100),
                    borderSide: BorderSide.none,
                  ),
                  fillColor: isDark ? TColors.dark : TColors.light,
                  filled: true,
                ),
              ),
            ),
            const SizedBox(width: 10),
            AppFilledIconButton(
              color: TColors.textWhite,
              icon: Iconsax.send1,
              onPressed: () {},
              backgroundColor: TColors.primary,
            ),
          ],
        ),
      ),
    );
  }
}
