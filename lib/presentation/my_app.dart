import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quran_test/core/constants/app_sizes.dart';
import 'package:quran_test/core/constants/app_strings.dart';
import 'package:quran_test/core/responsive/context_extension.dart';
import 'package:quran_test/core/routing/app_router_imports.dart';
import 'package:quran_test/core/theming/app_theme.dart';

final navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: AppSizes.screenSize,
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, __) {
        return MaterialApp(
          navigatorKey: navigatorKey,
          title: AppStrings.appName,
          debugShowCheckedModeBanner: false,
          locale: const Locale('ar'),
          supportedLocales: const [Locale('ar', 'SA')],
          localizationsDelegates: const [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          theme: appTheme,
          onGenerateRoute: onGenerateRoute,
          builder:
              (context, child) => MediaQuery(
                data: context.mediaQuery.copyWith(
                  textScaler: TextScaler.noScaling,
                ),
                child: child!,
              ),
        );
      },
    );
  }
}
