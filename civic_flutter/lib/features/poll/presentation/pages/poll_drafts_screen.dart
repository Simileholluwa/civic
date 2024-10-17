import 'package:civic_flutter/core/constants/app_colors.dart';
import 'package:civic_flutter/core/constants/sizes.dart';
import 'package:civic_flutter/core/helpers/helper_functions.dart';
import 'package:civic_flutter/core/providers/media_provider.dart';
import 'package:civic_flutter/core/widgets/selected_locations_widget.dart';
import 'package:civic_flutter/core/widgets/selected_tags_widget.dart';
import 'package:civic_flutter/features/poll/presentation/providers/poll_draft_provider.dart';
import 'package:civic_flutter/features/poll/presentation/widgets/draft_poll_options.dart';
import 'package:civic_flutter/features/post/presentation/widgets/draft_post_title.dart';
import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class PollDraftsScreen extends ConsumerWidget {
  const PollDraftsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(pollDraftsProvider);
    

    // final isDark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(
          50,
        ),
        child: Container(
          margin: const EdgeInsets.only(
            bottom: TSizes.sm - 2,
          ),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(color: Theme.of(context).dividerColor),
            ),
          ),
          child: AppBar(
            automaticallyImplyLeading: false,
            leading: IconButton(
              onPressed: () {
                context.pop();
                ref.watch(mediaVideoPlayerProvider.notifier).dispose();
              },
              icon: const Icon(
                Icons.clear,
              ),
            ),
            titleSpacing: 0,
            actions: [
              Padding(
                padding: const EdgeInsets.only(
                  right: TSizes.sm,
                ),
                child: TextButton(
                  onPressed: data.isEmpty
                      ? null
                      : () => THelperFunctions.deletePollDraftsDialog(
                            context,
                            ref,
                          ),
                  child: Text(
                    'DELETE ALL',
                    style: Theme.of(context).textTheme.labelMedium!.copyWith(
                          color: data.isEmpty ? null : TColors.primary,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: ListView.separated(
        shrinkWrap: true,
        padding: const EdgeInsets.only(
          top: TSizes.xs,
        ),
        itemBuilder: (context, index) {
          final poll = data[index];
          return Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  DraftPostTitle(
                    createdAt: poll.createdAt!,
                    index: index,
                  ),
                  DraftPollOptions(
                    poll: poll,
                    index: index,
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(
                  bottom: TSizes.sm,
                  left: TSizes.md,
                  right: TSizes.md,
                ),
                child: ExpandableText(
                  poll.question,
                  mentionStyle:
                      Theme.of(context).textTheme.labelLarge!.copyWith(
                            fontWeight: FontWeight.bold,
                            color: TColors.primary,
                          ),
                  hashtagStyle:
                      Theme.of(context).textTheme.labelLarge!.copyWith(
                            fontWeight: FontWeight.bold,
                            color: TColors.primary,
                          ),
                  urlStyle: Theme.of(context).textTheme.labelLarge!.copyWith(
                        fontWeight: FontWeight.bold,
                        color: TColors.primary,
                      ),
                  style: Theme.of(context).textTheme.labelLarge!.copyWith(
                        fontSize: 17,
                      ),
                  expandText: 'show more.',
                  collapseText: 'show less.',
                  maxLines: 7,
                  linkColor: TColors.primary,
                  linkStyle: Theme.of(context).textTheme.labelLarge,
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Theme.of(context).dividerColor,
                  ),
                  borderRadius: BorderRadius.circular(
                    TSizes.sm,
                  ),
                ),
                margin: const EdgeInsets.symmetric(
                  horizontal: TSizes.md,
                ),
                child: Column(
                  children: [
                    if (poll.locations.isNotEmpty)
                      Padding(
                        padding: const EdgeInsets.only(
                          right: TSizes.md,
                        ),
                        child: SelectedLocationsWidget(
                          locations: poll.locations,
                          showRemoveLocations: false,
                          height: 40,
                          showTopBorder: false,
                        ),
                      ),
                    if (poll.locations.isNotEmpty &&
                        poll.taggedUsers.isNotEmpty)
                      const Padding(
                        padding: EdgeInsets.only(bottom: 8),
                        child: Divider(
                          height: 0,
                        ),
                      ),
                    if (poll.taggedUsers.isNotEmpty)
                      Padding(
                        padding: EdgeInsets.only(
                          right: TSizes.md,
                          bottom: poll.locations.isNotEmpty ? TSizes.sm : 0,
                        ),
                        child: SelectedTagsWidget(
                          showRemoveTags: false,
                          tags: poll.taggedUsers,
                          height: poll.locations.isEmpty ? 40 : 20,
                          showTopBorder: false,
                        ),
                      ),
                  ],
                ),
              ),
              if (poll.taggedUsers.isNotEmpty || poll.locations.isNotEmpty)
                const SizedBox(
                  height: 8,
                ),
              ...poll.options!.option.asMap().entries.map(
                (entry) {
                  final index = entry.key;
                  final text = entry.value;
                  return Padding(
                    padding: const EdgeInsets.only(
                      left: TSizes.md,
                      right: TSizes.md,
                    ),
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: TSizes.md,
                            vertical: TSizes.sm,
                          ),
                          width: double.maxFinite,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                              TSizes.sm,
                            ),
                            border: Border.all(
                              color: Theme.of(context).dividerColor,
                            ),
                          ),
                          child: Text(
                            text,
                            style: Theme.of(context)
                                .textTheme
                                .labelMedium!
                                .copyWith(
                                  fontSize: 17,
                                ),
                          ),
                        ),
                        if (index != poll.options!.option.length - 1)
                          const SizedBox(
                            height: TSizes.sm,
                          ),
                      ],
                    ),
                  );
                },
              ),
            ],
          );
        },
        separatorBuilder: (context, index) {
          return const SizedBox(
            height: 8,
          );
        },
        itemCount: data.length,
      ),
    );
  }
}
