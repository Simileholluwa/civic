import 'package:flutter/material.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:flutter_portal/flutter_portal.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:toastification/toastification.dart';

class Home extends ConsumerWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);
    return Portal(
      child: ToastificationWrapper(
        child: MaterialApp.router(
          title: TTexts.appName,
          theme: TAppTheme.lightTheme,
          darkTheme: TAppTheme.darkTheme,
          debugShowCheckedModeBanner: false,
          routeInformationParser: router.routeInformationParser,
          routeInformationProvider: router.routeInformationProvider,
          routerDelegate: router.routerDelegate,
          builder: (context, child) => MediaQuery(
            data: MediaQuery.of(context).copyWith(
              textScaler: TextScaler.noScaling,
            ),
            child: ResponsiveWrapper.builder(
              BouncingScrollWrapper.builder(context, child!),
              defaultScale: true,
              breakpoints: [
                const ResponsiveBreakpoint.autoScale(450, name: MOBILE),
                const ResponsiveBreakpoint.resize(600, name: TABLET),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
