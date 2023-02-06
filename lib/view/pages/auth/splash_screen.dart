import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:one_work/view/pages/style/style.dart';

import 'onboarding_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool isLoading = true;

  @override
  void initState() {
    isLoading;
    setState(() {});
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (_) => OnBoarding()), (route) => false);
      isLoading = false;
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff0E9D57),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('OneWork',
                style: Style.textStyleRegular(
                    size: 48, textColor: Style.whiteColor)),
            34.verticalSpace,
            isLoading
                ? LoadingAnimationWidget.fallingDot(
                    color: Style.whiteColor, size: 50)
                : const SizedBox.shrink()
          ],
        ),
      ),
    );
  }
}
