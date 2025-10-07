import 'package:civic_flutter/core/constants/sizes.dart';
import 'package:civic_flutter/core/helpers/helper_functions.dart';
import 'package:civic_flutter/core/providers/mention_hashtag_link_provider.dart';
import 'package:civic_flutter/core/widgets/app/app_user_info_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MentionsSuggestionsWidget extends ConsumerWidget {
  const MentionsSuggestionsWidget({
    required this.onSuggestionSelected,
    super.key,
  });

  final void Function(String) onSuggestionSelected;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final suggestions = ref.watch(mentionSuggestionsProvider);
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
        itemCount: suggestions.length,
        separatorBuilder: (context, index) {
          return const Divider(
            indent: 83,
          );
        },
        itemBuilder: (context, index) {
          return AppUserInfoWidget(
            onTap: () {
              onSuggestionSelected(
                '@${suggestions[index].userInfo!.userName!}',
              );
              ref
                  .watch(
                    selectedMentionsProvider.notifier,
                  )
                  .addMention(
                    suggestions[index],
                  );
            },
            userRecord: suggestions[index],
          );
        },
      ),
    );
  }
}
