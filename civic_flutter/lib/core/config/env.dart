import 'package:flutter_dotenv/flutter_dotenv.dart';

enum Environment {
  develop,
  production,
}

Environment _env = Environment.develop;

class Env {
  static Future<void> init() async {
    late final String envPath;
    const envOverride = String.fromEnvironment('ENV');
    if (envOverride.isNotEmpty) {
      switch (envOverride.toLowerCase()) {
        case 'develop':
          _env = Environment.develop;
        case 'production':
          _env = Environment.production;
      }
    }
    switch (_env) {
      case Environment.develop:
        envPath = 'assets/env/dev_env';
      case Environment.production:
        envPath = 'assets/env/prod_env';
    }

    await dotenv.load(fileName: envPath);
  }

  static String get apiBaseUrl {
    return dotenv.env['API_BASE_URL']!;
  }
}
