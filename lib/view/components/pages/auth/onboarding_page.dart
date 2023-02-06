import 'package:flutter/material.dart';
import 'package:flutter_onboarding_slider/flutter_onboarding_slider.dart';
import 'package:one_work/view/components/pages/style/style.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({super.key});

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OnBoardingSlider(
        finishButtonText: 'Register',
        skipTextButton: Text('Skip'),
        trailing: Text('Login'),
        background: [
          SizedBox.shrink(),
          SizedBox.shrink(),
          SizedBox.shrink(),
          SizedBox.shrink(),
        ],
        headerBackgroundColor: Theme.of(context).scaffoldBackgroundColor,
        pageBodies: [
          Column(
            children: [
               Image.asset('assets/images/5.png', width: 375, height: 460),
            ],
          ),
          Column(
            children: [Text('sdfdfdf'), Text('ssssssss')],
          ),
          Column(
            children: [Text('sdfdfdf'), Text('ssssssss')],
          ),
          Column(
            children: [Text('sdfdfdf'), Text('ssssssss')],
          )
        ],
        speed: 1.8,
        totalPage: 4,
      ),
    );
  }
}






  Image.asset('assets/images/5.png', width: 375, height: 460),
  //         Image.asset('assets/images/6.png', width: 375, height: 460),
  //         Image.asset('assets/images/7.png', width: 375, height: 460),
  //         Image.asset('assets/images/8.png', width: 375, height: 460),