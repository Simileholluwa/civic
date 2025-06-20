import 'package:civic_client/civic_client.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/project/project.dart';
import 'package:iconsax/iconsax.dart';

class ProjectsScreen extends ConsumerWidget {
  const ProjectsScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pagingControllerNotifier =
        ref.watch(paginatedProjectListProvider.notifier);
    final isVisible = ref.watch(
      appScrollVisibilityProvider(
        true,
      ),
    );
    return Scaffold(
      appBar: ContentAppBar(
        isVisible: isVisible,
        showBorder: false,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(
            Icons.apps,
            size: 30,
          ),
          onPressed: () {},
        ),
        titleSpacing: 0,
        height: 60,
        title: ConstrainedBox(
          constraints: const BoxConstraints(
            maxWidth: 300,
            maxHeight: 40,
          ),
          child: SearchAnchor.bar(
            barLeading: const SizedBox.shrink(),
            barElevation: WidgetStateProperty.all(0),
            barOverlayColor: WidgetStateProperty.all(
              Colors.transparent,
            ),
            barBackgroundColor: WidgetStateProperty.all(
              Theme.of(context).scaffoldBackgroundColor,
            ),
            barSide: WidgetStateProperty.all(
              BorderSide(
                color: Theme.of(context).cardColor,
                width: 2,
              ),
            ),
            barHintStyle: WidgetStateProperty.all(
              TextStyle(
                color: Theme.of(context).hintColor,
              ),
            ),
            barHintText: 'Search projects',
            suggestionsBuilder: (context, controller) {
              return [const SizedBox.shrink()];
            },
            viewConstraints: BoxConstraints(
              maxHeight: 300,
            ),
            viewBackgroundColor: Theme.of(context).scaffoldBackgroundColor,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(
              Iconsax.filter5,
              size: 26,
              color: Theme.of(context).colorScheme.onSurface,
            ),
            onPressed: () {},
          ),
          const SizedBox(width: 5),
        ],
      ),
      body: AppInfiniteList<Project>(
        pagingController: pagingControllerNotifier.pagingController,
        scrollController: ref.read(projectScrollControllerProvider),
        itemBuilder: (__, project, _) {
          return ProjectCard(
            project: project,
          );
        },
        onRefresh: pagingControllerNotifier.refresh,
      ),
    );
  }
}
