import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'mention_hashtag_link_provider.g.dart';

@riverpod
MentionHashTagLinkServices mentionServices(Ref ref) {
  return MentionHashTagLinkServices(
    client: ref.read(clientProvider),
  );
}

@riverpod
List<UserRecord> recentMentionSuggestions(Ref ref) {
  final selected = ref.watch(selectedMentionsProvider);
  if (selected.length <= 8) return selected;
  return selected.sublist(selected.length - 8).reversed.toList(growable: false);
}

@riverpod
Future<List<UserRecord>> fetchUsersToMention(
  Ref ref,
  String query,
) async {
  final trimmed = query.trim();
  if (trimmed.isEmpty) return [];

  final result = await ref.read(mentionServicesProvider).mentionUsers(trimmed);

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
  set setSuggestions(List<UserRecord> suggestions) {
    state = suggestions;
  }

  @override
  List<UserRecord> build() => [];
}

@Riverpod(keepAlive: true)
class SelectedMentions extends _$SelectedMentions {
  void addMention(UserRecord user) {
    final newId = user.userInfo!.id;
    final exists = state.any((u) => u.userInfo!.id == newId);
    if (!exists) state = [...state, user];
  }

  @override
  List<UserRecord> build() => [];

  set setMentions(List<UserRecord> mentions) {
    state = mentions;
  }
}

@riverpod
class ExtractedMentions extends _$ExtractedMentions {
  @override
  List<String> build(String text) {
    final mentionRegExp = RegExp(r'@([A-Za-z0-9_\.]+)', caseSensitive: false);
    final Iterable<Match> matches = mentionRegExp.allMatches(text);
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
    return extractedMentions.any(selectedMentions.contains);
  }
}

@Riverpod(keepAlive: true)
class Hashtags extends _$Hashtags {
  void addTags(String tag) {
    final lower = tag.toLowerCase();
    final exists = state.any((t) => t.toLowerCase() == lower);
    if (!exists) state = [...state, tag];
  }

  @override
  List<String> build(String text) {
    final mentionRegExp = RegExp('#([A-Za-z0-9_]+)', caseSensitive: false);
    final Iterable<Match> matches = mentionRegExp.allMatches(text);
    return matches.map((match) => match.group(1)!).toList();
  }

  set setTags(List<String> tags) {
    state = tags;
  }
}

@riverpod
Future<List<String>> fetchHashtags(
  Ref ref,
  String query,
) async {
  final trimmed = query.trim();
  if (trimmed.isEmpty) return [];
  final result = await ref.read(mentionServicesProvider).fetchHashtags(trimmed);

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
  set setSuggestions(List<String> suggestions) {
    state = suggestions;
  }

  @override
  List<String> build() => [];
}

@Riverpod(keepAlive: true)
class RecentHashtags extends _$RecentHashtags {
  static const int maxSize = 8;

  @override
  List<String> build() => const [];

  void add(String tag) {
    final lower = tag.toLowerCase();
    final filtered = state.where((t) => t.toLowerCase() != lower).toList()
      ..add(tag);
    final start = filtered.length > maxSize ? filtered.length - maxSize : 0;
    state = filtered.sublist(start);
  }
}

@riverpod
Future<LinkMetadata?> fetchLinkMetadata(
  Ref ref,
  String text,
) async {
  final url = ref.watch(extractLinkProvider(text));
  if (url.isEmpty) return null;
  final result = await ref.read(mentionServicesProvider).fetchLinkMetadata(url);
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
      return matches.first.group(0) ?? '';
    }
    return '';
  }
}
