import 'package:civic_client/civic_client.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:serverpod_auth_email_flutter/serverpod_auth_email_flutter.dart';
import 'package:serverpod_auth_shared_flutter/serverpod_auth_shared_flutter.dart';
import 'package:serverpod_flutter/serverpod_flutter.dart';

final clientProvider = Provider<Client>((ref) {
  return Client(
    'http://192.168.50.235:8080/',
    authenticationKeyManager: FlutterAuthenticationKeyManager(),
  )..connectivityMonitor = FlutterConnectivityMonitor();
});

final sessionProvider = Provider<SessionManager>((ref) {
  return SessionManager(
    caller: ref.read(clientProvider).modules.auth,
  );
});

final authEmailProvider = Provider<EmailAuthController>((ref) {
  return EmailAuthController(
    ref.read(clientProvider).modules.auth,
  );
});
