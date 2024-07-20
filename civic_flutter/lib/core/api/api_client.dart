import 'package:civic_client/civic_client.dart';
import 'package:serverpod_auth_email_flutter/serverpod_auth_email_flutter.dart';
import 'package:serverpod_auth_shared_flutter/serverpod_auth_shared_flutter.dart';
import 'package:serverpod_flutter/serverpod_flutter.dart';

abstract class ApiClient {
  late SessionManager sessionManager;
  late Client client;
  late EmailAuthController auth;

  Future<void> init();
}

class ApiClientImpl extends ApiClient {
  @override
  Future<void> init() async {
    client = Client(
      'http://192.168.58.235:8080/',
      authenticationKeyManager: FlutterAuthenticationKeyManager(),
    )..connectivityMonitor = FlutterConnectivityMonitor();

    sessionManager = SessionManager(
      caller: client.modules.auth,
    );

    auth = EmailAuthController(
      client.modules.auth,
    );

    await sessionManager.initialize();
  }
}
