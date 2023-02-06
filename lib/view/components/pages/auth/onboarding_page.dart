import 'package:flutter/material.dart';
import 'package:intro_screen_onboarding_flutter/introduction.dart';
import 'package:intro_screen_onboarding_flutter/introscreenonboarding.dart';
import 'package:one_work/view/components/pages/style/style.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({super.key});

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  final List<Introduction> list = [
    Introduction(
      title: 'Search your job',
      subTitle:
          'Figure out your top five priorities whether it is company culture, salary.',
      imageUrl: 'assets/images/1.png',
    ),
    Introduction(
      title: 'Browse jobs list',
      subTitle:
          'Our job list include several  industries, so you can find the best job for you.',
      imageUrl: 'assets/images/2.png',
    ),
    Introduction(
      title: 'Apply to best jobs',
      subTitle:
          'You can apply to your desirable jobs very quickly and easily with ease.',
      imageUrl: 'assets/images/3.png',
    ),
    Introduction(
      title: 'Make your career',
      subTitle:
          'We help you find your dream job based on your skillset, location, demand.',
      imageUrl: 'assets/images/4.png',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: IntroScreenOnboarding(
      backgroudColor: Theme.of(context).scaffoldBackgroundColor,
      introductionList: list,
      onTapSkipButton: () {},
    ));
  }
}






  // Image.asset('assets/images/5.png', width: 375, height: 460),
  //         Image.asset('assets/images/6.png', width: 375, height: 460),
  //         Image.asset('assets/images/7.png', width: 375, height: 460),
  //         Image.asset('assets/images/8.png', width: 375, height: 460),