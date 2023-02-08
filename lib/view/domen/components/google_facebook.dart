import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:icons_plus/icons_plus.dart';

class GoogleFacebook extends StatelessWidget {
  const GoogleFacebook({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: 56.w,
            height: 56.h,
            decoration: BoxDecoration(
                color: const Color(0xff000000).withOpacity(0.1),
                borderRadius: BorderRadius.circular(100)),
            child: Center(child: Logo(Logos.apple)),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: 56.w,
            height: 56.h,
            decoration: BoxDecoration(
                color: const Color(0xff000000).withOpacity(0.1),
                borderRadius: BorderRadius.circular(100)),
            child: Center(child: Logo(Logos.google)),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: 56.w,
            height: 56.h,
            decoration: BoxDecoration(
                color: const Color(0xff000000).withOpacity(0.1),
                borderRadius: BorderRadius.circular(100)),
            child: Center(child: Logo(Logos.facebook_logo)),
          ),
        ),
      ],
    );
  }
}
