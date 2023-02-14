import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:one_work/view/pages/auth/Register_1.dart';

import '../../util/widgets/custom_textfromfiled.dart';
import '../../util/widgets/google_facebook.dart';
import '../../util/style/style.dart';
import 'forget_password.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 23),
                  child: Text(
                    'OneWork',
                    style: Style.textStyleRegular(
                        size: 32, textColor: Style.primaryColor),
                  ),
                ),
                7.27.verticalSpace,
                Padding(
                  padding: const EdgeInsets.only(left: 23),
                  child: Text('Welcome Back 👋',
                      style: Theme.of(context).textTheme.titleMedium),
                ),
              ]),
          7.verticalSpace,
          const Padding(
            padding: EdgeInsets.only(left: 23),
            child: Text(
              'Let’s Register. Apply to jobs!',
              style: TextStyle(color: Color(0xff0D0D26)),
            ),
          ),
          47.verticalSpace,
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            child: CustomTextFrom(
              hintext: '',
              label: 'E-mail',
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            child: CustomTextFrom(
              hintext: '',
              label: 'Password',
            ),
          ),
          32.verticalSpace,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Container(
              height: 56.h,
              width: 327.w,
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
          30.verticalSpace,
          InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const ForgetPassword(),
                  ),
                );
              },
              child: const Center(
                child: Text(
                  'Forget password?',
                  style: TextStyle(
                    color: Color(0xff0E9D57),
                  ),
                ),
              )),
          30.verticalSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                  width: 98.w,
                  child: Divider(
                    thickness: 2,
                    height: 50.h,
                  )),
              16.horizontalSpace,
              const Text(
                'Or continue with',
                style: TextStyle(color: Color(0xffBDBEC2)),
              ),
              16.horizontalSpace,
              SizedBox(
                  width: 98.w,
                  child: Divider(
                    thickness: 2,
                    height: 50.h,
                  )),
            ],
          ),
          24.verticalSpace,
          const GoogleFacebook(),
          48.verticalSpace,
          SizedBox(
            width: 350,
            height: 20,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => const RegisterPage(),
                      ),
                    );
                  },
                  child: RichText(
                    text: const TextSpan(
                      text: 'Have an account? ',
                      style: TextStyle(color: Color(0xffBDBEC2)),
                      children: <TextSpan>[
                        TextSpan(
                            text: 'Register',
                            style: TextStyle(color: Color(0xff0E9D57))),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
