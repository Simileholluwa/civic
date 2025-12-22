import 'package:civic_flutter/core/constants/sizes.dart';
import 'package:civic_flutter/core/helpers/helper_functions.dart';
import 'package:civic_flutter/core/providers/mention_hashtag_link_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HashtagSuggestionsWidget extends ConsumerWidget {
  const HashtagSuggestionsWidget({
    required this.onSuggestionSelected,
    super.key,
  });
  final void Function(String) onSuggestionSelected;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final hashtagsSuggestions = ref.watch(hashtagsSuggestionsProvider);
    return Container(
      constraints: BoxConstraints(
        maxHeight: THelperFunctions.getHeight(context) * 0.3,
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
      ),
      child: ListView.separated(
        shrinkWrap: true,
        padding: const EdgeInsets.symmetric(
          vertical: TSizes.sm,
        ),
        itemCount: hashtagsSuggestions.length,
        separatorBuilder: (context, index) {
          return const Divider();
        },
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () => onSuggestionSelected(
              hashtagsSuggestions[index],
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: TSizes.md + 4,
                vertical: TSizes.sm,
              ),
              child: Text(
                hashtagsSuggestions[index],
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),
          );
        },
      ),
    );
  }
}
