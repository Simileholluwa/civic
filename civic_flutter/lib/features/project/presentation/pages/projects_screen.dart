import 'dart:convert';
import 'package:civic_client/civic_client.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/project/project.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';

class ProjectsScreen extends ConsumerWidget {
  const ProjectsScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final savedRecordString = ref
        .read(
          localStorageProvider,
        )
        .getString(
          'userRecord',
        );
    final decoded = jsonDecode(savedRecordString.toString());
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
                  onPressed: () {
                    context.push(
                      '/project/bookmarks',
                    );
                  },
                  icon: const Icon(
                    Iconsax.note_1,
                    size: 26,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Iconsax.search_normal,
                    size: 26,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Iconsax.setting_3,
                    size: 26,
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
              ],
              title: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'PROJECTS',
                    style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                          fontSize: 25,
                        ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 21, left: 1),
                    child: AppDecorationDot(),
                  ),
                ],
              ),
              bottom: PreferredSize(
                preferredSize: Size.fromHeight(5),
                child: const Divider(
                  height: 0,
                ),
              ),
            ),
          ];
        },
        body: ProjectsInfiniteList(
          sortBy: '',
          isLeader: isLeader,
        ),
      ),
    );
  }
}
