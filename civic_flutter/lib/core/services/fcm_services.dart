import 'package:civic_flutter/core/core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

abstract class FcmServices {
  Future<void> init();
}

class FcmServiceImpl implements FcmServices {
  FcmServiceImpl({
    required Ref ref,
  }) : _ref = ref;
  final Ref _ref;

  final FirebaseMessaging _messaging = FirebaseMessaging.instance;

  @override
  Future<void> init() async {
    _messaging.onTokenRefresh.listen(_sendTokenToServer);
    FirebaseMessaging.onMessageOpenedApp.listen(_handleMessage);
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {});
  }

  Future<void> _requestPermission(BuildContext context) async {
    final didAccept = await postDialog(
      context: context,
      title: TTexts.stayInTheLoop,
      description: TTexts.stayInTheLoopSubtitle,
      onTapSkipButton: () {
        context.pop(false);
      },
      activeButtonText: TTexts.allow,
      activeButtonLoading: false,
      skipButtonLoading: false,
      skipText: TTexts.notNow,
      onTapActiveButton: () async {
        if (context.mounted) {
          context.pop(true);
        }
      },
    );

    // 2. If they said no, don't show the OS dialog.
    if (didAccept != true) {
      TToastMessages.infoToast(
        TTexts.enablePermissionsLater,
      );
      return;
    }

    // 3. If yes, show the official OS dialog.
    await directPermissionRequest();
  }

  Future<bool?> directPermissionRequest() async {
    final notificationSettings = await _messaging.getNotificationSettings();
    if (notificationSettings.authorizationStatus !=
        AuthorizationStatus.authorized) {
      final status = await _messaging.requestPermission();
      if (status.authorizationStatus == AuthorizationStatus.authorized) {
        await _getTokenAndSend();
        await _ref.read(localStorageProvider).setBool(
              'allowedNotification',
              true,
            );
        return true;
      } else {
        TToastMessages.infoToast(
          TTexts.permissionsDenied,
        );
        return false;
      }
    }
    return null;
  }

  Future<void> _getTokenAndSend() async {
    final token = await _messaging.getToken();
    if (token != null) {
      await _sendTokenToServer(token);
    }
  }

  Future<void> _sendTokenToServer(String token) async {
    const maxRetries = 3;
    for (var i = 0; i < maxRetries; i++) {
      try {
        await _ref.read(clientProvider).userRecord.registerDeviceToken(
              token,
            );
        return;
      } on Exception catch (_) {
        if (i < maxRetries - 1) {
          await Future<void>.delayed(
            const Duration(
              seconds: 2,
            ),
          );
        } else {
          TToastMessages.errorToast(
            'Failed to send FCM token after $maxRetries attempts.',
          );
        }
      }
    }
  }

  Future<void> _handleMessage(RemoteMessage message) async {
    final route = message.data['route'];
    if (route != null) {
      final context = _ref.read(rootNavigatorProvider).currentContext;
      if (context != null) {
        await context.push(route as String);
      }
    }
  }

  Future<void> promptForPermissions(BuildContext context) async {
    final hasAsked =
        _ref.read(localStorageProvider).getBool('hasAskedPermissions') ?? false;
    if (!hasAsked) {
      await _requestPermission(context);
      await _ref.read(localStorageProvider).setBool(
            'hasAskedPermissions',
            true,
          );
    }
  }
}
