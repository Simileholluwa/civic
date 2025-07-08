import 'package:civic_server/env_settings.dart';
import 'package:civic_server/src/endpoints/send_email_endpoint.dart';
import 'package:civic_server/src/future_calls/post_future_call.dart';
import 'package:civic_server/src/future_calls/project_future_call.dart';
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
  final envSettings = EnvironmentSettings();
  // Initialize Serverpod and connect it with your generated code.
  final pod = Serverpod(
    args,
    Protocol(),
    Endpoints(),
    authenticationHandler: auth.authenticationHandler,
    config: ServerpodConfig(
      apiServer: ServerConfig(
        port: 8080,
        publicHost: 'https://civic-4ifu.onrender.com',
        publicPort: 8080,
        publicScheme: 'https',
      ),
      webServer: ServerConfig(
        port: 8082,
        publicScheme: 'https',
        publicHost: 'web.examplepod.com',
        publicPort: 8082,
      ),
      insightsServer: ServerConfig(
        port: 8081,
        publicScheme: 'https',
        publicHost: 'insights.examplepod.com',
        publicPort: 8081,
      ),
      database: envSettings.databaseConfig,
      serviceSecret: envSettings.serviceSecret,
    ),
  );

  // Future calls
  pod.registerFutureCall(SchedulePostFutureCall(), 'schedulePostFutureCall');
  pod.registerFutureCall(
      ScheduleProjectFutureCall(), 'scheduleProjectFutureCall');

  // Auth
  auth.AuthConfig.set(
    auth.AuthConfig(
      validationCodeLength: 6,
      sendValidationEmail: (session, email, validationCode) async {
        print(validationCode);
        return await SendEmailEndpoint().sendEmail(
          session,
          email,
          validationCode,
          'Your email verification code is $validationCode',
          null,
          true,
        );
      },
      onUserCreated: (session, userInfo) async {
        final userRecord = await UserRecord.db.findById(
          session,
          userInfo.id!,
        );
        if (userRecord == null) return;
        await UserRecord.db.updateRow(
          session,
          userRecord.copyWith(
            profileImage: userInfo.imageUrl,
          ),
        );
      },
      sendPasswordResetEmail: (session, userInfo, validationCode) async {
        if (userInfo.email == null) {
          throw Exception('No email address for user');
        }
        return await SendEmailEndpoint().sendEmail(
          session,
          userInfo.email!,
          validationCode,
          'Your password reset verification code is $validationCode',
          userInfo.userName,
          false,
        );
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
