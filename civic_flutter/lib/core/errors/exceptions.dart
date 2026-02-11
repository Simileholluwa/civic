class ServerException implements Exception {
  const ServerException({
    required this.message,
    this.action,
    this.type,
  });
  final String message;
  final String? action;
  final String? type;
}

class CacheException implements Exception {
  const CacheException({
    required this.message,
  });
  final String message;
}
