import 'package:civic_flutter/core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Future<void> main() async {
  final widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  await Env.init();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  runApp(
    const ProviderScope(
      child: Home(),
    ),
  );
}
