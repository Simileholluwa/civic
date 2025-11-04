import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/create/create.dart';
import 'package:civic_flutter/features/project/project.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';

Future<Project?> loadProjectDrafts(BuildContext context) async {
  return showModalBottomSheet(
    backgroundColor: Theme.of(context).scaffoldBackgroundColor,
    context: context,
    shape: const RoundedRectangleBorder(),
    useSafeArea: true,
    isScrollControlled: true,
    builder: (context) {
      return Consumer(
        builder: (context, ref, child) {
          final drafts = ref.watch(loaddraftProjectsProvider);
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(3, 5, 7, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            context.pop();
                          },
                          icon: const Icon(
                            Iconsax.arrow_left_2,
                          ),
                        ),
                        Text(
                          'Project Drafts',
                          style: Theme.of(context).textTheme.headlineLarge,
                        ),
                      ],
                    ),
                    IconButton(
                      onPressed: () async {
                        final shouldDel =
                            await deleteAllProjectDraftsDialog(context);
                        if (shouldDel != true) return;
                        await ref
                            .read(
                              deleteAllProjectDraftsProvider,
                            )
                            .call(NoParams());
                        ref.invalidate(hasProjectDraftProvider);
                        if (context.mounted) {
                          context.pop();
                        }
                      },
                      icon: const Icon(
                        Icons.delete,
                      ),
                      color: Colors.red,
                    ),
                  ],
                ),
              ),
              const Divider(),
              drafts.when(
                data: (drafts) {
                  if (drafts.isEmpty) {
                    return const Expanded(
                      child: AppEmptyList(
                        canCreate: false,
                        createText: '',
                      ),
                    );
                  }
                  return ListView.builder(
                    itemCount: drafts.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text('Draft ${index + 1}'),
                      );
                    },
                  );
                },
                error: (error, stackTrace) {
                  final err = (error as Failure).message;
                  return LoadingError(
                    retry: () {
                      ref.invalidate(getProjectDraftsProvider);
                    },
                    showRefresh: true,
                    errorMessage: err,
                  );
                },
                loading: () {
                  return const AppLoadingWidget();
                },
              ),
            ],
          );
        },
      );
    },
  );
}
