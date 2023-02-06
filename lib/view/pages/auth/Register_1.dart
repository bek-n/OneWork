import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:one_work/view/style/style.dart';

import '../../components/custom_textfromfiled.dart';
import '../../components/google_facebook.dart';
import 'login_page.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'OneWork',
                  style: Style.textStyleRegular(
                      size: 32, textColor: Style.primaryColor),
                ),
                7.27.verticalSpace,
                Text('Registration 👍',
                    style: Theme.of(context).textTheme.titleMedium),
                7.verticalSpace,
                const Text(
                  'Let’s Register. Apply to jobs!',
                  style: TextStyle(color: Color(0xff0D0D26)),
                ),
                31.verticalSpace,
                // ignore: prefer_const_constructors
                const CustomTextFrom(
                  hintext: '',
                  label: 'Full Name',
                ),
                16.verticalSpace,
                const CustomTextFrom(
                  hintext: '',
                  label: 'E-mail',
                ),
                16.verticalSpace,
                const CustomTextFrom(
                  hintext: '',
                  label: 'Password',
                ),
                16.verticalSpace,
                const CustomTextFrom(
                  hintext: '',
                  label: 'Confirm Password',
                ),
                32.verticalSpace,
                Center(
                  child: Container(
                    height: 56.h,
                    width: 327.w,
                    decoration: BoxDecoration(
                        color: const Color(0xff0E9D57),
                        borderRadius: BorderRadius.circular(16)),
                    child: const Center(
                        child: Text(
                      'Register',
                      style: TextStyle(color: Colors.white),
                    )),
                  ),
                ),
                32.verticalSpace,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                        width: 98,
                        child: Divider(
                          thickness: 2,
                          height: 50,
                        )),
                    16.horizontalSpace,
                    const Text(
                      'Or continue with',
                      style: TextStyle(color: Color(0xffBDBEC2)),
                    ),
                    16.horizontalSpace,
                    const SizedBox(
                        width: 98,
                        child: Divider(
                          thickness: 2,
                          height: 50,
                        )),
                  ],
                ),
                32.verticalSpace,
                const GoogleFacebook(),
                32.verticalSpace,
                InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (_) => const LoginPage()));
                  },
                  child: Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        RichText(
                          text: const TextSpan(
                            text: 'Have an account? ',
                            style: TextStyle(color: Color(0xffBDBEC2)),
                            children: <TextSpan>[
                              TextSpan(
                                  text: 'Log in',
                                  style: TextStyle(color: Color(0xff0E9D57))),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
