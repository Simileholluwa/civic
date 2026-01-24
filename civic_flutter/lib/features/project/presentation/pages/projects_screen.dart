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
    final savedRecordString = ref
        .read(
          localStorageProvider,
        )
        .getString(
          'userRecord',
        );
    final decoded = jsonDecode(
      savedRecordString.toString(),
    ) as Map<String, dynamic>;
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
              title: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'PROJECTS',
                    style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                          fontSize: 25,
                        ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 21, left: 1),
                    child: AppDecorationDot(),
                  ),
                ],
              ),
              bottom: const PreferredSize(
                preferredSize: Size.fromHeight(5),
                child: Divider(
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
