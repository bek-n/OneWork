import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:one_work/view/pages/auth/confirm_page.dart';
import 'package:one_work/view/pages/auth/register_1.dart';
import 'package:one_work/view/pages/auth/splash_screen.dart';
import 'package:one_work/view/style/style.dart';
import 'package:provider/provider.dart';

import 'controller/auth_controller.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(428, 926),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MultiProvider(
            providers: [
              ChangeNotifierProvider(create: (_) => AuthController()),
            ],
            child: MaterialApp(
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
                  titleMedium: Style.textStyleRegular(
                      size: 24, textColor: const Color(0xff0D0D26)),
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
                    textColor: Style.whiteColor,
                  ),
                  titleMedium: Style.textStyleRegular(
                      size: 24, textColor: const Color(0xff0D0D26)),
                  displayMedium: Style.textStyleRegular(
                    size: 28,
                    textColor: Style.whiteColor,
                  ),
                  displayLarge: Style.textStyleRegular(
                    size: 34,
                    textColor: Style.whiteColor,
                  ),
                  displaySmall: Style.textStyleRegular(
                    size: 17,
                    textColor: Style.whiteColor,
                  ),
                  headlineSmall: Style.textStyleRegular2(
                    textColor: Style.whiteColor,
                  ),
                ),
                scaffoldBackgroundColor: Style.darkBgcolorOfApp,
              ),
              home: RegisterPage(),
            ),
          );
        });
  }
}
