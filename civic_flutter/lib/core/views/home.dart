import 'package:civic_flutter/core/constants/text_strings.dart';
import 'package:civic_flutter/core/local_storage/storage_utility.dart';
import 'package:civic_flutter/core/router/app_router.dart';
import 'package:civic_flutter/core/router/route_names.dart';
import 'package:civic_flutter/core/theme/theme.dart';
import 'package:civic_flutter/features/authentication/presentation/state/auth_state_entity.dart';
import 'package:civic_flutter/features/authentication/presentation/provider/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_portal/flutter_portal.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:toastification/toastification.dart';

class Home extends ConsumerStatefulWidget {
  const Home({super.key});

  @override
  ConsumerState<Home> createState() => _HomeState();
}

class _HomeState extends ConsumerState<Home> {
  @override
  void initState() {
    super.initState();
    ref.watch(authProvider.notifier).init();
  }

  @override
  Widget build(BuildContext context) {
    final router = ref.watch(routerProvider);
    final firstTimer = AppLocalStorage.to.getBool('first_timer') ?? true;
    ref.listen(
      authProvider,
      (_, next) {
        switch (next) {
          case AuthStateError() || AuthStateGuest():
            if (!firstTimer) {
              router.pushNamed(
                AppRoutes.authLandingScreen,
              );
            } else {
              router.pushNamed(
                AppRoutes.initial,
              );
            }
          case AuthStateSuccess():
            router.pushNamed(
              AppRoutes.civic,
            );
          default:
            return;
        }
      },
    );

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
