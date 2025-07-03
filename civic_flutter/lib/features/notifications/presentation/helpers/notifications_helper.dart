class NotificationsHelper {
  static String formatGroupedUserNames(List<String> usernames) {
    if (usernames.isEmpty) return '';
    final count = usernames.length;
    if (count == 1) return usernames.first;
    if (count == 2) return '${usernames[0]} and ${usernames[1]}';
    final others = count - 2;
    return '${usernames[0]}, ${usernames[1]} and $others other${others > 1 ? 's' : ''}';
  }
}
