import 'package:flutter/material.dart';
import 'package:one_work/view/components/pages/style/style.dart';

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
    Future.delayed(Duration(seconds: 4), () {
      Navigator.of(context).push(MaterialPageRoute(builder: (_)=> OnBoarding()));
      isLoading = false;
      setState(() {
        
      });
    });
    super.initState();
  }

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
