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
        color: const Color(0xFF5386E4),
        imageAssetPath: 'assets/images/1.png',
        title: Text('Search your job',style: Style.textStyleRegular(size: 28),),
        body:
            Text('Figure out your top five priorities whether it is company culture, salary.',style: Style.textStyleRegular2(size: 15),),
        doAnimateImage: true),
    PageModel(
        color: const Color(0xffFBBC05),
        imageAssetPath: 'assets/images/2.png',
        title:Text('Browse jobs list',style: Style.textStyleRegular(size: 28),),
        body:
             Text('Our job list include several  industries, so you can find the best job for you.',style: Style.textStyleRegular2(size: 15),),
        doAnimateImage: true),
    PageModel(
        color: const Color(0xff0E9D57),
        imageAssetPath: 'assets/images/3.png',
        title:Text('Apply to best jobs',style: Style.textStyleRegular(size: 28),),
        body:
            Text('You can apply to your desirable jobs very quickly and easily with ease.',style: Style.textStyleRegular2(size: 15),),
        doAnimateImage: true),
      PageModel(
        color: const Color(0xff5F4BB6),
        imageAssetPath: 'assets/images/4.png',
        title:Text('Make your career',style: Style.textStyleRegular(size: 28),),
        body:
            Text('We help you find your dream job based on your skillset, location, demand.',style: Style.textStyleRegular2(size: 15),),
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
