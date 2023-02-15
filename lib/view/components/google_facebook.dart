import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:one_work/view/style/style.dart';

class GoogleFacebook extends StatelessWidget {
  const GoogleFacebook({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(child: Logo(Logos.google)),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(child: Logo(Logos.facebook_logo)),
        ),
      ],
    );
  }
}
