import 'package:flutter/material.dart';
import 'package:flutter_overboard/flutter_overboard.dart';
import 'package:one_work/view/components/pages/style/style.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({super.key});

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  final pages = [
    PageModel(
      titleColor: Style.whiteColor,
      bodyColor: Style.whiteColor,
        color: const Color(0xFF5386E4),
        imageAssetPath: 'assets/images/1.png',
        title: 'Search your job',
        body:
            'Figure out your top five priorities whether it is company culture, salary.',
        doAnimateImage: true),
    PageModel(
      titleColor: Style.whiteColor,
      bodyColor: Style.whiteColor,
        color: const Color(0xffFBBC05),
        imageAssetPath: 'assets/images/2.png',
        title: 'Browse jobs list',
        body:
            'Our job list include several  industries, so you can find the best job for you.',
        doAnimateImage: true),
    PageModel(
      titleColor: Style.whiteColor,
      bodyColor: Style.whiteColor,
        color: const Color(0xff0E9D57),
        imageAssetPath: 'assets/images/3.png',
        title: 'Apply to best jobs',
        body:
            'You can apply to your desirable jobs very quickly and easily with ease.',
        doAnimateImage: true),
    PageModel(
      titleColor: Style.whiteColor,
      bodyColor: Style.whiteColor,
        color: const Color(0xff5F4BB6),
        imageAssetPath: 'assets/images/4.png',
        title: 'Make your career',
        body:
            'We help you find your dream job based on your skillset, location, demand.',
        doAnimateImage: true),
  ];
  @override
  Widget build(BuildContext context) {
    return OverBoard(
      pages: pages,
      showBullets: true,
      skipCallback: () {
        // WRITE SKIP BUTTON ACTION HERE
      },
      finishCallback: () {
        // WRITE THE FINISH BUTTON ACTION HERE
      },
    );
  }
}
