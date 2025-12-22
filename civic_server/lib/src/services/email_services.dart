class EmailServices {
  EmailServices._();
  static String buildVerificationEmailTemplate(String verificationCode) {
    final year = DateTime.now().year;

    return '''
    <!DOCTYPE html>
    <html lang="en">
      <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <meta http-equiv="X-UA-Compatible" content="ie=edge" />
        <title>Email Verification</title>
        <style>
          body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
          }
          .container {
            max-width: 600px;
            margin: 0 auto;
            background-color: #ffffff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
          }
          h1 {
            color: #333333;
            font-size: 24px;
            margin-bottom: 10px;
          }
          p {
            font-size: 14px;
            color: #666666;
            line-height: 1.5;
          }
          .code-box {
            font-size: 20px;
            font-weight: bold;
            text-align: center;
            background-color: #018f45;
            padding: 15px;
            margin: 20px 0;
            border-radius: 8px;
            color: #fff;
          }
          .footer {
            font-size: 12px;
            color: #999999;
            text-align: center;
            margin-top: 20px;
          }
        </style>
      </head>
      <body>
        <div class="container">
          <h1>Email Verification</h1>
          <p>
            Hi there,
          </p>
          <p>
            Thank you for registering with us. To verify your email address, please use
            the following verification code to complete your registration
          </p>
          <div class="code-box">
            $verificationCode
          </div>
          <p>
            If you didn’t sign up for an account, you can safely ignore this email.
          </p>
          <p>Best regards,<br />CIVIC.</p>

          <div class="footer">
            &copy; $year CIVIC. All rights reserved.
          </div>
        </div>
      </body>
    </html>
  ''';
  }

  static String buildPasswordVerificationEmailTemplate(
    String verificationCode,
    String username,
  ) {
    final year = DateTime.now().year;

    return '''
    <!DOCTYPE html>
    <html lang="en">
      <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <meta http-equiv="X-UA-Compatible" content="ie=edge" />
        <title>Email Verification</title>
        <style>
          body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
          }
          .container {
            max-width: 600px;
            margin: 0 auto;
            background-color: #ffffff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
          }
          h1 {
            color: #333333;
            font-size: 24px;
            margin-bottom: 10px;
          }
          p {
            font-size: 14px;
            color: #666666;
            line-height: 1.5;
          }
          .code-box {
            font-size: 20px;
            font-weight: bold;
            text-align: center;
            background-color: #018f45;
            padding: 15px;
            margin: 20px 0;
            border-radius: 8px;
            color: #fff;
          }
          .footer {
            font-size: 12px;
            color: #999999;
            text-align: center;
            margin-top: 20px;
          }
        </style>
      </head>
      <body>
        <div class="container">
          <h1>Password Change Verification</h1>
          <p>
            Hi $username,
          </p>
          <p>
            We received a request to change your password, please use
            the following verification code to complete your request
          </p>
          <div class="code-box">
            $verificationCode
          </div>
          <p>
            If you didn’t request a password change, you can safely ignore this email.
          </p>
          <p>Best regards,<br />CIVIC.</p>

          <div class="footer">
            &copy; $year CIVIC. All rights reserved.
          </div>
        </div>
      </body>
    </html>
  ''';
  }
}
