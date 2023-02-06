import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:icons_plus/icons_plus.dart';

import '../../components/custom_textfromfiled.dart';



class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          24.verticalSpace,

          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios),
          ),

          const Padding(
            padding: EdgeInsets.only(left: 23),
            child: Text(
              'Jobseek',
              style: TextStyle(color: Color(0xff0E9D57), fontSize: 32),
            ),
          ),
          34.verticalSpace,
          const Padding(
            padding: EdgeInsets.only(left: 23),
            child: Text(
              'Forgot Password',
              style: TextStyle(color: Color(0xff0D0D26), fontSize: 24),
            ),
          ),
          34.verticalSpace,
          const Padding(
            padding: EdgeInsets.only(left: 23,right: 23),
            child: Text(
              'Enter your email or phone number, we will send you verification code',
              style: TextStyle(color: Color(0xff0D0D26)),
            ),
          ),
          // ignore: prefer_const_constructors
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            child: const CustomTextFrom(
              hintext: '',
              label: 'E-mail',
            ),
          ),
         34.verticalSpace,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            child: Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                  color: const Color(0xff0E9D57),
                  borderRadius: BorderRadius.circular(16)),
              child: const Center(
                  child: Text(
                'Log in',
                style: TextStyle(color: Colors.white),
              )),
            ),
          ),
        ],
      ),
    );
  }
}
