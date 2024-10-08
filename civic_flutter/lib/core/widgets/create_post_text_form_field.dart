import 'dart:async';
import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/constants/sizes.dart';
import 'package:civic_flutter/core/providers/media_provider.dart';
import 'package:civic_flutter/core/providers/mention_hashtag_link_provider.dart';
import 'package:civic_flutter/features/post/presentation/provider/post_text_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CreatePostTextFormField extends ConsumerStatefulWidget {
  const CreatePostTextFormField({
    super.key,
    required this.userName,
  });

  final String userName;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _CreatePostTextFormFieldState();
}

class _CreatePostTextFormFieldState
    extends ConsumerState<CreatePostTextFormField> {
  Timer? _debounce;
  final RegExp mentionRegExp = RegExp(r'@(\w+)', caseSensitive: false);

  @override
  Widget build(BuildContext context) {
    final selectMediaProvider = ref.watch(mediaProvider.notifier);
    return Column(
      children: [
        TextFormField(
          controller: ref.watch(postTextProvider),
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                fontSize: 17,
              ),
          textCapitalization: TextCapitalization.sentences,
          onChanged: _onTextChanged,
          decoration: InputDecoration(
            border: InputBorder.none,
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            errorBorder: InputBorder.none,
            hintMaxLines: 2,
            hintText: selectMediaProvider.hintText(widget.userName),
            counter: const SizedBox(),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: TSizes.md + 2,
              vertical: TSizes.md,
            ),
          ),
          keyboardType: TextInputType.multiline,
          textInputAction: TextInputAction.newline,
          maxLength: 2500,
          maxLines: null,
        ),
      ],
    );
  }

  void _handleMentions() {
    final selectedMentions = ref.watch(
      selectedMentionsProvider,
    );
    List<String> currentMentions = ref.watch(
      extractedMentionsProvider,
    );

    // Remove records of users whose mentions are no longer in the text
    selectedMentions.removeWhere((
      userRecord,
    ) {
      String userName =
          userRecord.userInfo!.fullName ?? userRecord.userInfo!.userName!;
      return !currentMentions.contains(
        userName,
      );
    });
  }

  void _onTextChanged(
    String text,
  ) {
    if (_debounce?.isActive ?? false) _debounce!.cancel();
    _debounce = Timer(const Duration(milliseconds: 1000), () {
      final lastWord = _getLastWord(text);
      if (lastWord.startsWith('@')) {
        _fetchMentionSuggestions(lastWord);
      } else if (lastWord.startsWith('#')) {
        _fetchHashtags(lastWord);
      } else {
        ref
            .read(mentionSuggestionsProvider.notifier)
            .setSuggestions(<UserRecord>[]);
      }
    });
    _handleMentions();
  }

  String _getLastWord(String text) {
    final cursorIndex = ref
        .watch(
          postTextProvider,
        )
        .selection
        .baseOffset;
    final textBeforeCursor = text.substring(
      0,
      cursorIndex,
    );
    final lastWordMatch = RegExp(
      r'[@#][\w]*$',
    ).firstMatch(
      textBeforeCursor,
    );
    return lastWordMatch?.group(
          0,
        ) ??
        '';
  }

  Future<void> _fetchMentionSuggestions(String query) async {
    final results = await ref.watch(
      fetchUsersToMentionProvider(
        query.substring(1),
      ).future,
    );

    if (results.isNotEmpty) {
      return ref
          .read(
            mentionSuggestionsProvider.notifier,
          )
          .setSuggestions(
            results,
          );
    } else {
      return ref
          .read(
        mentionSuggestionsProvider.notifier,
      )
          .setSuggestions(
        <UserRecord>[],
      );
    }
  }

  Future<void> _fetchHashtags(String query) async {
    final results = await ref.watch(
      fetchHashtagsProvider(
        query.substring(
          1,
        ),
      ).future,
    );

    if (results.isNotEmpty) {
      return ref
          .read(
            hashtagsSuggestionsProvider.notifier,
          )
          .setSuggestions(
            results,
          );
    } else {
      return ref
          .read(
        hashtagsSuggestionsProvider.notifier,
      )
          .setSuggestions(
        <String>[],
      );
    }
  }
}
