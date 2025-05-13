class ServerException implements Exception {
  const ServerException({
    required this.message,
    this.action,
  });
  final String message;
  final String? action;
}

class CacheException implements Exception {
  const CacheException({
    required this.message,
  });
  final String message;
}
