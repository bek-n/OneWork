import 'package:flutter/material.dart';
import 'package:one_work/view/components/pages/style/style.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff0E9D57),
      body: Center(
          child: Text('OneWork',
              style: Style.textStyleRegular(
                  size: 48, textColor: Style.whiteColor))),
    );
  }
}
