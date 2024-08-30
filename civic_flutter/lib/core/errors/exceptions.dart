class ServerException implements Exception {
  const ServerException({
    required this.message,
  });
  final String message;
}

class CacheException implements Exception {
  const CacheException({
    required this.message,
  });
  final String message;
}
