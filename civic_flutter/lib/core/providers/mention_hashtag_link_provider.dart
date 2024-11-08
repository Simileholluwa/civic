import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/providers/api_client_provider.dart';
import 'package:civic_flutter/core/services/mention__hashtag_link_services.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'mention_hashtag_link_provider.g.dart';

@riverpod
MentionHashTagLinkServices mentionServices(MentionServicesRef ref) {
  return MentionHashTagLinkServices(
    client: ref.read(clientProvider),
  );
}

@riverpod
Future<List<UserRecord>> fetchUsersToMention(
    FetchUsersToMentionRef ref, String query) async {
  final result = await ref.watch(mentionServicesProvider).mentionUsers(query);

  return result.fold(
    (error) {
      return [];
    },
    (users) {
      return users;
    },
  );
}

@riverpod
class MentionSuggestions extends _$MentionSuggestions {
  void setSuggestions(List<UserRecord> suggestions) {
    state = suggestions;
  }

  @override
  List<UserRecord> build() => [];
}

@Riverpod(keepAlive: true)
class SelectedMentions extends _$SelectedMentions {
  void addMention(UserRecord user) {
    if (!state.contains(user)) {
      state = [...state, user];
    }
  }

  @override
  List<UserRecord> build() => [];

  void setMentions(List<UserRecord> mentions) {
    state = mentions;
  }
}

@riverpod
class ExtractedMentions extends _$ExtractedMentions {
  @override
  List<String> build(String text) {
    final RegExp mentionRegExp = RegExp(r'@(\w+)', caseSensitive: false);
    Iterable<Match> matches =
        mentionRegExp.allMatches(text);
    return matches.map((match) => match.group(1)!).toList();
  }
}

@riverpod
class ValidMentions extends _$ValidMentions {
  @override
  bool build(String username, String text) {
    final selectedMentions = ref
        .watch(selectedMentionsProvider)
        .map((u) => u.userInfo!.fullName ?? u.userInfo!.userName!)
        .toList();
    final extractedMentions = ref.watch(extractedMentionsProvider(text));
    return extractedMentions
        .any((element) => selectedMentions.contains(element));
  }
}

@Riverpod(keepAlive: true)
class Hashtags extends _$Hashtags {
  void addTags(String tag) {
    if (!state.contains(tag)) {
      state = [...state, tag];
    }
  }

  @override
  List<String> build(String text) {
    final RegExp mentionRegExp = RegExp(r'#(\w+)', caseSensitive: false);
    Iterable<Match> matches =
        mentionRegExp.allMatches(text);
    return matches.map((match) => match.group(1)!).toList();
  }

  void setTags(List<String> tags) {
    state = tags;
  }
}

@riverpod
Future<List<String>> fetchHashtags(
  FetchHashtagsRef ref,
  String query,
) async {
  final result = await ref.watch(mentionServicesProvider).fetchHashtags(query);

  return result.fold(
    (error) {
      return [];
    },
    (hashtags) {
      return hashtags;
    },
  );
}

@riverpod
class HashtagsSuggestions extends _$HashtagsSuggestions {
  void setSuggestions(List<String> suggestions) {
    state = suggestions;
  }

  @override
  List<String> build() => [];
}

@riverpod
Future<LinkMetadata?> fetchLinkMetadata(
  FetchLinkMetadataRef ref,
  String text,
) async {
  final url = ref.watch(extractLinkProvider(text));
  final result =
      await ref.watch(mentionServicesProvider).fetchLinkMetadata(url);
  return result.fold(
    (error) {
      return null;
    },
    (metadata) {
      return metadata;
    },
  );
}

@riverpod
class ExtractLink extends _$ExtractLink {
  @override
  String build(String text) {
    const urlPattern = r'(?:(?:https?|ftp)://)?[\w/\-?=%.]+\.[\w/\-?=%.]+';
    final regExp = RegExp(urlPattern, caseSensitive: false);
    final matches = regExp.allMatches(text);

    if (matches.isNotEmpty) {
      return matches.first.group(0) ?? "";
    }
    return "";
  }
}
