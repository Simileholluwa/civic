class Failure implements Exception {
  Failure({
    required this.message,
    this.action,
    this.type,
  });
  final String message;
  final String? action;
  final String? type;
}
