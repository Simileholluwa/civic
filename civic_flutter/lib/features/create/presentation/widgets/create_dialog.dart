import 'dart:convert';
import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';

class CreateContentDialog extends ConsumerWidget {
  const CreateContentDialog({super.key});

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
    final isVisibleNotifier = ref.read(
      appBottomNavigationVisibilityProvider(
        null,
      ).notifier,
    );
    Future.delayed(
      Duration.zero,
      () => isVisibleNotifier.show(),
    );
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 15,
        children: [
          Icon(
            Iconsax.magicpen,
            size: 50,
            color: Theme.of(context).primaryColor,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: Text(
              'What would you like to create?',
              style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                    fontSize: 30,
                  ),
              textAlign: TextAlign.center,
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 25,
            ),
            margin: const EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              spacing: 15,
              children: [
                CreateContentItems(
                  itemName: 'Project',
                  icon: Iconsax.note,
                  textColor: isLeader ? null : Theme.of(context).disabledColor,
                  onTap: isLeader
                      ? () {
                          context.push(
                            '/create/project/0',
                          );
                        }
                      : null,
                  itemCaption:
                      'New, existing, completed or planned. Keep your constituents updated. This is only available to leaders.',
                ),
                const Divider(
                  indent: 40,
                  endIndent: 5,
                ),
                CreateContentItems(
                  itemName: 'Post',
                  icon: Iconsax.calendar,
                  onTap: () {
                    context.push(
                      '/create/post/0',
                      extra: null,
                    );
                  },
                  itemCaption:
                      'Share your thoughts, ideas, and opinions with everyone.',
                ),
                const Divider(
                  indent: 40,
                  endIndent: 5,
                ),
                CreateContentItems(
                  itemName: 'Poll',
                  icon: Iconsax.chart,
                  onTap: () {
                    context.push(
                      AppRoutes.createPoll,
                      extra: {
                        'id': 0,
                        'draft': null,
                      },
                    );
                  },
                  itemCaption:
                      'Engage your audience with quick questions and gather instant feedback.',
                ),
                const Divider(
                  indent: 40,
                  endIndent: 5,
                ),
                CreateContentItems(
                  itemName: 'Article',
                  icon: Iconsax.document,
                  onTap: () {
                    context.push(
                      AppRoutes.createArticle,
                      extra: {
                        'id': 0,
                        'draft': null,
                      },
                    );
                  },
                  itemCaption:
                      'Share in-depth insights, stories, or research with your audience.',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
