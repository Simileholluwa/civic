import 'dart:convert';
import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/project/project.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';

class ProjectsScreen extends ConsumerWidget {
  const ProjectsScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pagingState = ref.watch(
      paginatedProjectListProvider(''),
    );
    final savedRecordString = ref
        .read(
          localStorageProvider,
        )
        .getString(
          'userRecord',
        );
    final decoded =
        jsonDecode(
              savedRecordString.toString(),
            )
            as Map<String, dynamic>;
    final userRecord = UserRecord.fromJson(decoded);
    final isLeader = userRecord.politicalStatus!.index != 3;
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverAppBar(
              floating: true,
              snap: true,
              actions: [
                IconButton(
                  onPressed: () async {
                    await context.push(
                      '/project/bookmarks',
                    );
                  },
                  icon: const Icon(
                    Iconsax.note_1,
                    size: 26,
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
              ],
              title: Text(
                'PROJECTS',
                style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                  fontSize: 25,
                ),
              ),
              bottom: const PreferredSize(
                preferredSize: Size.fromHeight(1),
                child: Divider(
                  height: 0,
                ),
              ),
            ),
          ];
        },
        body: AppInfiniteList<ProjectWithUserState>(
          pagingController: pagingState,
          scrollPhysics: const NeverScrollableScrollPhysics(),
          canCreate: isLeader,
          onCreate: () async {
            await context.push(
              '/create/project/0',
            );
          },
          showDivider: false,
          itemBuilder: (_, projectWithUserState, _) {
            return ProjectCardFrontPage(
              projectWithUserState: projectWithUserState,
            );
          },
          onRefresh: pagingState.refresh,
        ),
      ),
    );
  }
}
