import 'package:civic_flutter/core/constants/app_colors.dart';
import 'package:civic_flutter/core/constants/sizes.dart';
import 'package:civic_flutter/core/entity/post_options.dart';
import 'package:civic_flutter/core/providers/mention_hashtag_link_provider.dart';
import 'package:civic_flutter/core/providers/scheduled_datetime_provider.dart';
import 'package:civic_flutter/core/providers/tag_selections_provider.dart';
import 'package:civic_flutter/core/router/route_names.dart';
import 'package:civic_flutter/features/poll/presentation/providers/poll_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class CreateContentButton extends ConsumerStatefulWidget {
  const CreateContentButton({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CreateContentButtonState();
}

class _CreateContentButtonState extends ConsumerState<CreateContentButton> {
  bool isFabExpanded = false;

  void toggleFab() {
    setState(() {
      isFabExpanded = !isFabExpanded;
    });
  }

  void invalidateProviders() {
    ref.invalidate(postScheduledDateTimeProvider);
    ref.invalidate(tagSelectionsProvider);
    ref.invalidate(selectedMentionsProvider);
    ref.invalidate(hashtagsProvider);
  
  }

  void navigate(int index) {
    switch (index) {
      case 0:
        invalidateProviders();
        toggleFab();
        context.push(
          AppRoutes.createPost,
          extra: {
            'id': 0,
            'draft': null,
          },
        );
        break;
      case 1:
        invalidateProviders();
        toggleFab();
        context.push(
          AppRoutes.createArticle,
          extra: {
            'id': 0,
            'draft': null,
          },
        );
        break;
      case 2:
        invalidateProviders();
        ref.invalidate(pollsOptionsProvider);
        toggleFab();
        context.push(
          AppRoutes.createPoll,
          extra: {
            'id': 0,
            'draft': null,
          },
        );
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
          alignment: Alignment.bottomCenter,
          children: [
            isFabExpanded
                ? AnimatedContainer(
                    duration: const Duration(milliseconds: 500),
                    height: isFabExpanded
                        ? MediaQuery.of(context).size.height * 0.49
                        : 0.0,
                    curve: Curves.easeInOut,
                    width: 70,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        100,
                      ),
                    ),
                    child: Material(
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                          100,
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        // mainAxisSize: MainAxisSize.min,
                        children: [
                          CircleAvatar(
                            radius: 35,
                            backgroundColor: TColors.primary,
                            child: Text(
                              'CREATE',
                              style: Theme.of(context)
                                  .textTheme
                                  .labelMedium!
                                  .copyWith(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                    color: TColors.textWhite,
                                  ),
                            ),
                          ),
                          Expanded(
                            child: ListView(
                              shrinkWrap: true,
                              physics: const BouncingScrollPhysics(),
                              children: [
                                const SizedBox(
                                  height: TSizes.md,
                                ),
                                ListView.separated(
                                  shrinkWrap: true,
                                  itemCount: moreOptions.length,
                                  physics: const NeverScrollableScrollPhysics(),
                                  separatorBuilder: (context, index) {
                                    return const Divider(
                                      thickness: TSizes.xs - 3,
                                      color: TColors.primary,
                                      height: TSizes.md + 6,
                                    );
                                  },
                                  itemBuilder: (context, index) {
                                    final options = moreOptions[index];
                                    return GestureDetector(
                                      onTap: () => navigate(index),
                                      child: Column(
                                        children: [
                                          Icon(
                                            options.icon,
                                          ),
                                          Text(
                                            options.text,
                                            style: Theme.of(context)
                                                .textTheme
                                                .labelLarge!
                                                .copyWith(
                                                  fontSize: 12,
                                                ),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                ),
                                const SizedBox(
                                  height: TSizes.sm,
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: 70,
                            width: 70,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: TColors.primary,
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                : const SizedBox.shrink(),
            InkWell(
              onTap: toggleFab,
              child: Container(
                height: 70,
                width: 70,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: TColors.primary,
                ),
                child: Icon(
                  isFabExpanded ? Icons.close : Icons.apps,
                  color: Colors.white,
                  size: 35,
                ),
              ),
            ),
          ],
        );
  }
}