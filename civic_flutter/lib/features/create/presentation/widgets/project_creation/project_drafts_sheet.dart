import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/create/create.dart';
import 'package:civic_flutter/features/project/project.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:timeago/timeago.dart' as timeago;

Future<Project?> loadProjectDrafts(BuildContext context) async {
  return showModalBottomSheet(
    backgroundColor: Theme.of(context).scaffoldBackgroundColor,
    context: context,
    shape: const RoundedRectangleBorder(),
    useSafeArea: true,
    isScrollControlled: true,
    builder: (context) {
      return SizedBox(
        child: Consumer(
          builder: (context, ref, child) {
            final draftsAsyncValue = ref.watch(loaddraftProjectsProvider);
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
                            onPressed: () => context.pop(),
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
                        onPressed: draftsAsyncValue.hasError ||
                                (draftsAsyncValue.value?.isEmpty ?? true)
                            ? null
                            : () async {
                                final shouldDel =
                                    await deleteAllProjectDraftsDialog(context);
                                if (shouldDel != true) return;
                                await ref
                                    .read(
                                      deleteAllProjectDraftsProvider,
                                    )
                                    .call(NoParams());
                                ref
                                  ..invalidate(hasProjectDraftProvider)
                                  ..invalidate(loaddraftProjectsProvider);
                                if (context.mounted) {
                                  context.pop();
                                }
                              },
                        icon: const Icon(
                          Icons.delete_forever,
                        ),
                        color: draftsAsyncValue.hasError ||
                                (draftsAsyncValue.value?.isEmpty ?? true)
                            ? null
                            : Colors.red,
                      ),
                    ],
                  ),
                ),
                const Divider(),
                Expanded(
                  child: draftsAsyncValue.when(
                    data: (drafts) {
                      if (drafts.isEmpty) {
                        return const AppEmptyList(
                          canCreate: false,
                          createText: '',
                        );
                      }
                      return ListView.builder(
                        itemCount: drafts.length,
                        itemBuilder: (context, index) {
                          final draft = drafts[index];
                          return ListTile(
                            leading: const Icon(Iconsax.folder),
                            contentPadding:
                                const EdgeInsets.fromLTRB(20, 0, 8, 5),
                            title: Text(
                              draft.title ?? 'Untitled Project',
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                            subtitle: Text(
                              'Created ${timeago.format(
                                draft.dateCreated!,
                              )}',
                              style: Theme.of(context).textTheme.labelMedium,
                            ),
                            trailing: IconButton(
                              icon: const Icon(
                                Icons.delete,
                                color: TColors.secondary,
                              ),
                              onPressed: () async {
                                await ref
                                    .read(deleteProjectDraftProvider)
                                    .call(draft.id!);
                                ref.invalidate(loaddraftProjectsProvider);
                              },
                            ),
                            onTap: () => context.pop(draft),
                          );
                        },
                      );
                    },
                    error: (error, stackTrace) {
                      final err = (error as Failure).message;
                      return LoadingError(
                        retry: () => ref.invalidate(loaddraftProjectsProvider),
                        showRefresh: true,
                        errorMessage: err,
                      );
                    },
                    loading: AppLoadingWidget.new,
                  ),
                ),
              ],
            );
          },
        ),
      );
    },
  );
}
