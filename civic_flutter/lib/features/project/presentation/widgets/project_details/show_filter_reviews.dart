import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/project/project.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';

class ShowFilterReviews extends ConsumerWidget {
  const ShowFilterReviews({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final projectReviewState = ref.watch(projectReviewListQueryProvider);
    final projectReviewStateNotifier =
        ref.watch(projectReviewListQueryProvider.notifier);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Filter reviews',
                style: Theme.of(context).textTheme.headlineLarge,
                textAlign: TextAlign.left,
              ),
              GestureDetector(
                onTap: context.pop,
                child: const Icon(
                  Icons.clear,
                  color: TColors.secondary,
                ),
              ),
            ],
          ),
        ),
        const Divider(
          height: 0,
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.fromLTRB(
            16,
            16,
            16,
            0,
          ),
          child: Row(
            spacing: 15,
            children: [
              ...['All', 5, 4, 3, 2, 1].asMap().entries.map(
                (filter) {
                  final text = filter.value;
                  final index = filter.key;
                  return FilterChip(
                    label: Row(
                      spacing: 5,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                            bottom: 4,
                          ),
                          child: Text(
                            text.toString(),
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                        ),
                        if (index > 0)
                          const Icon(
                            Iconsax.magic_star5,
                            size: 16,
                          ),
                      ],
                    ),
                    selected: projectReviewState.rating != null
                        ? projectReviewState.rating == text
                        : index == 0,
                    onSelected: (value) {
                      if (index == 0) {
                        projectReviewStateNotifier.setRatingQuery(
                          null,
                        );
                        return;
                      }
                      projectReviewStateNotifier.setRatingQuery(
                        (text as int).toDouble(),
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ),
        if (projectReviewState.rating != null)
          SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(
              16,
              16,
              16,
              0,
            ),
            scrollDirection: Axis.horizontal,
            child: Row(
              spacing: 15,
              children: [
                ...[
                  'All',
                  'Location',
                  'Description',
                  'Attachments',
                  'Category',
                  'Funding',
                  'Dates',
                ].asMap().entries.map(
                  (filter) {
                    final text = filter.value;
                    final index = filter.key;
                    return FilterChip(
                      label: Text(
                        text,
                      ),
                      selected: projectReviewState.cardinal != null
                          ? projectReviewState.cardinal == text
                          : index == 0,
                      onSelected: (value) {
                        if (index == 0) {
                          projectReviewStateNotifier.setCardinalQuery(
                            null,
                          );
                          return;
                        }
                        projectReviewStateNotifier.setCardinalQuery(
                          text,
                        );
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        Padding(
          padding: const EdgeInsets.fromLTRB(
            16,
            0,
            16,
            0,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                title: Text(
                  'Most recent',
                  style: Theme.of(context)
                      .textTheme
                      .labelMedium!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
                contentPadding: const EdgeInsets.fromLTRB(3, 0, 0, 0),
                trailing: SizedBox(
                  width: 20,
                  height: 24,
                  child: RadioGroup(
                    groupValue: 0,
                    onChanged: (value) {},
                    child: const Radio(
                      value: 0,
                    ),
                  ),
                ),
              ),
              const Divider(
                height: 0,
                indent: 3,
                endIndent: 3,
              ),
              ListTile(
                title: Text(
                  'Most liked',
                  style: Theme.of(context)
                      .textTheme
                      .labelMedium!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
                contentPadding: const EdgeInsets.fromLTRB(3, 0, 0, 0),
                trailing: SizedBox(
                  width: 20,
                  height: 24,
                  child: RadioGroup(
                    groupValue: 0,
                    onChanged: (value) {},
                    child: const Radio(
                      value: 1,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: AppDualButton(
            onTapSkipButton: context.pop,
            activeButtonText: 'Apply filter',
            onTapActiveButton: () {
              if (projectReviewState.cardinal == null) {
                TToastMessages.errorToast(
                  'Please select a cardinal to apply filter.',
                );
                return;
              }
              context.pop();
            },
            activeButtonLoading: false,
            skipButtonLoading: false,
            skipText: 'Cancel',
          ),
        ),
      ],
    );
  }
}
