import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AuthButton extends StatelessWidget {
  final String text;
  const AuthButton({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56.h,
      width: 327.w,
      decoration: BoxDecoration(
          color: const Color(0xff0E9D57),
          borderRadius: BorderRadius.circular(16)),
      child:  Center(
          child: Text(
       text,
        style: const TextStyle(color: Colors.white),
      )),
    );
  }
}
