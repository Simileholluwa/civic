import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/create/create.dart';
import 'package:civic_flutter/features/feed/feed.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:transparent_image/transparent_image.dart';

Future<Post?> loadPostDrafts(
  BuildContext context,
  String draftType,
) async {
  return showModalBottomSheet(
    backgroundColor: Theme.of(context).scaffoldBackgroundColor,
    context: context,
    useSafeArea: true,
    isScrollControlled: true,
    constraints: BoxConstraints(
      maxHeight: MediaQuery.sizeOf(context).height * .7,
    ),
    builder: (context) {
      final type = draftType == TTexts.pollDraft
          ? 'Poll'
          : draftType == TTexts.postDraft
              ? 'Post'
              : 'Article';
      return SizedBox(
        child: Consumer(
          builder: (context, ref, child) {
            final draftsAsyncValue = ref.watch(
              loaddraftPostProvider(
                draftType,
              ),
            );
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
                            '$type Drafts',
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
                                    await deleteAllPostDraftsDialog(context);
                                if (shouldDel != true) return;
                                await ref
                                    .read(
                                      clearPostDraftsProvider,
                                    )
                                    .call(draftType);
                                ref
                                  ..invalidate(hasPostDraftProvider)
                                  ..invalidate(loaddraftPostProvider);
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
                          final imageUrlRegx = RegExp(
                            r'(https?:\/\/.*\.(?:png|jpg|jpeg|gif|svg|webp))',
                            caseSensitive: false,
                          );
                          return ListTile(
                            leading: draft.imageUrls?.isNotEmpty ?? false
                                ? ClipRRect(
                                    borderRadius:
                                        BorderRadiusGeometry.circular(10),
                                    child: FadeInImage(
                                      placeholder:
                                          MemoryImage(kTransparentImage),
                                      image: imageUrlRegx.hasMatch(
                                        draft.imageUrls!.first,
                                      )
                                          ? CachedNetworkImageProvider(
                                              draft.imageUrls!.first,
                                            )
                                          : FileImage(
                                              File(
                                                draft.imageUrls!.first,
                                              ),
                                            ) as ImageProvider,
                                      height: 50,
                                      width: 50,
                                      fit: BoxFit.cover,
                                    ),
                                  )
                                : const Icon(Iconsax.folder),
                            contentPadding:
                                const EdgeInsets.fromLTRB(20, 0, 8, 5),
                            title: Text(
                              draft.text!.isEmpty
                                  ? 'Draft ${index + 1}'
                                  : draft.text!,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
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
                                await ref.read(deletePostDraftProvider).call(
                                      DeletePostDraftByIdParams(
                                        draftType: draftType,
                                        draftId: draft.id!,
                                      ),
                                    );
                                ref.invalidate(loaddraftPostProvider);
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
