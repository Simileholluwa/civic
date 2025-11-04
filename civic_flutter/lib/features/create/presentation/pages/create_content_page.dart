import 'dart:convert';
import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';

class CreateContentScreen extends ConsumerWidget {
  const CreateContentScreen({super.key});

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
      appBar: AppBar(
        toolbarHeight: 0,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 15,
        children: [
          Icon(
            Iconsax.magicpen5,
            size: 50,
            color: Theme.of(context).primaryColor,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: Text(
              TTexts.whatToCreate,
              style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                    fontSize: 25,
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
                if (isLeader)
                  CreateContentItems(
                    itemName: TTexts.project,
                    icon: Iconsax.note,
                    textColor:
                        isLeader ? null : Theme.of(context).disabledColor,
                    onTap: isLeader
                        ? () async {
                            await context.push(
                              '/create/project/0',
                            );
                          }
                        : null,
                    itemCaption: TTexts.projectSubtitle,
                  ),
                if (isLeader)
                  const Divider(
                    indent: 40,
                    endIndent: 5,
                  ),
                CreateContentItems(
                  itemName: TTexts.post,
                  icon: Iconsax.calendar,
                  onTap: () async {
                    await context.push(
                      '/create/post/0',
                    );
                  },
                  itemCaption: TTexts.postSubtitle,
                ),
                const Divider(
                  indent: 40,
                  endIndent: 5,
                ),
                CreateContentItems(
                  itemName: TTexts.poll,
                  icon: Iconsax.chart,
                  onTap: () async {
                    await context.push(
                      '/create/poll/0',
                    );
                  },
                  itemCaption: TTexts.pollSubtitle,
                ),
                const Divider(
                  indent: 40,
                  endIndent: 5,
                ),
                CreateContentItems(
                  itemName: TTexts.article,
                  icon: Iconsax.document,
                  onTap: () async {
                    await context.push(
                      '/create/article/0',
                    );
                  },
                  itemCaption: TTexts.articleSubtitle,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
