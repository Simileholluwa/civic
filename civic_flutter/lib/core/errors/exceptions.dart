

class ServerException implements Exception{
  const ServerException({required this.message,});
  final String message;

}

class CacheExceptions implements Exception{
  const CacheExceptions({required this.message, this.statusCode = 500,});
  final String message;
  final int statusCode;

}

