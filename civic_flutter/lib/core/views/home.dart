import 'package:civic_flutter/core/constants/text_strings.dart';
import 'package:civic_flutter/core/router/route_pages.dart';
import 'package:civic_flutter/core/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:toastification/toastification.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return ToastificationWrapper(
      child: GetMaterialApp(
        title: TTexts.appName,
        theme: TAppTheme.lightTheme,
        darkTheme: TAppTheme.darkTheme,
        debugShowCheckedModeBanner: false,
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
        getPages: AppPages.routes,
        initialRoute: AppPages.initial,
      ),
    );
  }
}
