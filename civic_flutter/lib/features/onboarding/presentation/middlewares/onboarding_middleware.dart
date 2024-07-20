import 'package:civic_flutter/core/api/api_client.dart';
import 'package:civic_flutter/core/local_storage/storage_utility.dart';
import 'package:civic_flutter/core/router/route_names.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnboardingMiddleware extends GetMiddleware {
  OnboardingMiddleware({
    required ApiClient client,
  }) : _client = client;
  final ApiClient _client;

  @override
  RouteSettings? redirect(String? route) {
    if (_client.sessionManager.signedInUser != null) {
      return const RouteSettings(name: AppRoutes.civic);
    } else {
      if (AppLocalStorage.to.getBool('first_timer') ?? true) {
        return null;
      } else {
        return const RouteSettings(name: AppRoutes.authLandingScreen);
      }
    }
  }
}
