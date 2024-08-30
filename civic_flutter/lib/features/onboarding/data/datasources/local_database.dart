// ignore_for_file: one_member_abstracts

import 'package:civic_flutter/core/errors/exceptions.dart';
import 'package:civic_flutter/core/local_storage/storage_utility.dart';

abstract interface class OnboardingLocalDatabase {
  Future<void> cacheFirstTimer();
}

class OnboardingLocalDatabaseImpl implements OnboardingLocalDatabase {
  @override
  Future<void> cacheFirstTimer() async {
    try {
      await AppLocalStorage.to.setBool('first_timer', false);
    } catch (e) {
      throw CacheException(
        message: e.toString(),
      );
    }
  }
}
