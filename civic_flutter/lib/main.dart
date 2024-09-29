import 'package:civic_flutter/core/dependencies/initial_dependencies.dart';
import 'package:civic_flutter/core/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Future<void> main() async {
  final widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await initialDependencies();
  runApp(
    const ProviderScope(
      child: Home(),
    ),
  );
}
