import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:one_work/view/components/pages/auth/splash_screen.dart';
import 'package:one_work/view/components/pages/style/style.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(428, 926),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'OneWork',
            theme: ThemeData(
              useMaterial3: true,
              scaffoldBackgroundColor: Style.lightBgcolorOfApp,
              textTheme: TextTheme(
                headlineLarge: Style.textStyleRegular(
                  size: 48,
                  textColor: Style.blackColor,
                ),
                displayMedium: Style.textStyleRegular(
                  size: 28,
                  textColor: Style.blackColor,
                ),
                displayLarge: Style.textStyleRegular(
                  size: 34,
                  textColor: Style.blackColor,
                ),
                displaySmall: Style.textStyleRegular(
                  size: 17,
                  textColor: Style.blackColor,
                ),
                headlineSmall: Style.textStyleRegular2(
                  textColor: Style.blackColor,
                ),
              ),
            ),
            darkTheme: ThemeData(
              bottomNavigationBarTheme: const BottomNavigationBarThemeData(
                  backgroundColor: Style.navBgcolorOfApp),
              textTheme: TextTheme(
                headlineLarge: Style.textStyleRegular(
                  size: 48,
                  textColor: Style.blackColor,
                ),
                displayMedium: Style.textStyleRegular(
                  size: 28,
                  textColor: Style.blackColor,
                ),
                displayLarge: Style.textStyleRegular(
                  size: 34,
                  textColor: Style.blackColor,
                ),
                displaySmall: Style.textStyleRegular(
                  size: 17,
                  textColor: Style.blackColor,
                ),
                headlineSmall: Style.textStyleRegular2(
                  textColor: Style.blackColor,
                ),
              ),
              scaffoldBackgroundColor: Style.darkBgcolorOfApp,
            ),
            home: const SplashScreen(),
          );
        });
  }
}
