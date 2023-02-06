import 'package:flutter/material.dart';
import 'package:flutter_overboard/flutter_overboard.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({super.key});

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  final pages = [
    PageModel(
        color: const Color(0xFF536DFE),
        imageAssetPath: 'assets/images/1.png',
        title: 'Screen 1',
        body: 'Share your ideas with the team',
        doAnimateImage: true),
    PageModel(
        color: const Color(0xffFBBC05),
        imageAssetPath: 'assets/images/2.png',
        title: 'Screen 2',
        body: 'See the increase in productivity & output',
        doAnimateImage: true),
    PageModel(
        color: const Color(0xff0E9D57),
        imageAssetPath: 'assets/images/3.png',
        title: 'Screen 3',
        body: 'Connect with the people from different places',
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
