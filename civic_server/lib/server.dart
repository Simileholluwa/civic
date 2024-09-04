import 'package:civic_server/src/future_calls/post_future_call.dart';
import 'package:serverpod/serverpod.dart';

import 'package:civic_server/src/web/routes/root.dart';
import 'package:serverpod_auth_server/serverpod_auth_server.dart' as auth;
import 'package:serverpod_cloud_storage_s3/serverpod_cloud_storage_s3.dart'
    as s3;

import 'src/generated/protocol.dart';
import 'src/generated/endpoints.dart';

// This is the starting point of your Serverpod server. In most cases, you will
// only need to make additions to this file if you add future calls,  are
// configuring Relic (Serverpod's web-server), or need custom setup work.

void run(List<String> args) async {
  // Initialize Serverpod and connect it with your generated code.
  final pod = Serverpod(
    args,
    Protocol(),
    Endpoints(),
    authenticationHandler: auth.authenticationHandler,
  );

  // Future calls
  pod.registerFutureCall(SendPostFutureCall(), 'sendPostFutureCall');

  // Auth
  auth.AuthConfig.set(
    auth.AuthConfig(
      validationCodeLength: 6,
      sendValidationEmail: (session, email, validationCode) async {
        print(validationCode);
        return true;
      },
      sendPasswordResetEmail: (session, userInfo, validationCode) async {
        print(validationCode);
        return true;
      },
    ),
  );

  // Storage
  pod.addCloudStorage(
    s3.S3CloudStorage(
      serverpod: pod,
      storageId: 'public',
      public: true,
      region: 'eu-north-1',
      bucket: 'civic-development',
    ),
  );

  // Setup a default page at the web root.
  pod.webServer.addRoute(RouteRoot(), '/');
  pod.webServer.addRoute(RouteRoot(), '/index.html');
  // Serve all files in the /static directory.
  pod.webServer.addRoute(
    RouteStaticDirectory(serverDirectory: 'static', basePath: '/'),
    '/*',
  );

  // Start the server.
  await pod.start();
}
