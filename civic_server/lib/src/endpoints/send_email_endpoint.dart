// import 'package:civic_server/src/services/email_services.dart';
// import 'package:dotenv/dotenv.dart';
import 'package:mailer/mailer.dart';
// import 'package:mailer/smtp_server.dart';
import 'package:serverpod/serverpod.dart';

class SendEmailEndpoint extends Endpoint {
  Future<bool> sendEmail(
    Session session,
    String email,
    String code,
    String text,
    String? username,
    bool isEmailVerification,
  ) async {
    // var env = DotEnv(includePlatformEnvironment: true)..load();
    // final smtpServer = SmtpServer(
    //   env['EMAIL_HOST']!,
    //   port: int.parse(env['EMAIL_PORT']!),
    //   username: env['EMAIL_USERNAME'],
    //   password: env['EMAIL_PASSWORD'],
    //   ignoreBadCertificate: false,
    // );

    // final message = Message()
    //   ..from = Address('info@civic.com.ng', 'CIVIC')
    //   ..recipients.add(email)
    //   ..subject = isEmailVerification
    //       ? 'Email Verification Code'
    //       : 'Password Change Verification'
    //   ..html = isEmailVerification
    //       ? EmailServices.buildVerificationEmailTemplate(code)
    //       : EmailServices.buildPasswordVerificationEmailTemplate(
    //           code,
    //           username!,
    //         )
    //   ..text = text;

    try {
      // await send(message, smtpServer);
      return true;
    } on MailerException catch (e) {
      print('Message not sent. ${e.toString()}');
      return false;
    }
  }
}
