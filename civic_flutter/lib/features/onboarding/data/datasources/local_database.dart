import 'package:civic_flutter/core/errors/exceptions.dart';
import 'package:civic_flutter/core/services/local_storage.dart';
import 'package:meta/meta.dart';

abstract interface class OnboardingLocalDatabase {
  Future<void> cacheFirstTimer();
}

@reopen
class OnboardingLocalDatabaseImpl extends OnboardingLocalDatabase {
  OnboardingLocalDatabaseImpl({
    required LocalStorage localStorage,
  }) : _localStorage = localStorage;

  final LocalStorage _localStorage;
  @override
  Future<void> cacheFirstTimer() async {
    try {
      await _localStorage.setBool('first_timer', false);
    } catch (e) {
      throw CacheException(
        message: e.toString(),
      );
    }
  }
}
