import 'package:civic_client/civic_client.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:serverpod_auth_email_flutter/serverpod_auth_email_flutter.dart';
import 'package:serverpod_auth_shared_flutter/serverpod_auth_shared_flutter.dart';
import 'package:serverpod_flutter/serverpod_flutter.dart';

part 'api_client_provider.g.dart';

@riverpod
Client client(ClientRef ref) {
  return Client(
    'http://192.168.1.235:8080/',
    connectionTimeout: const Duration(
      seconds: 60,
    ),
    authenticationKeyManager: FlutterAuthenticationKeyManager(),
  )..connectivityMonitor = FlutterConnectivityMonitor();
}

@riverpod
Raw<SessionManager> session(SessionRef ref) {
  return SessionManager(
    caller: ref.read(clientProvider).modules.auth,
  );
}

@riverpod
EmailAuthController authEmail(AuthEmailRef ref) {
  return EmailAuthController(
    ref.read(clientProvider).modules.auth,
  );
}
