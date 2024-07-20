import 'package:civic_flutter/core/bindings/general_bindings.dart';
import 'package:civic_flutter/core/views/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

Future<void> main() async {
  final widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await GeneralBindings().dependencies();
  runApp(const Home());
}
