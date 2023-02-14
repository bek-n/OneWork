// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:one_work/controller/auth_controller.dart';
import 'package:one_work/view/pages/home/home_page.dart';
import 'package:one_work/view/util/style/style.dart';
import 'package:provider/provider.dart';

import '../../util/widgets/custom_textfromfiled.dart';
import '../../util/widgets/google_facebook.dart';
import 'login_page.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController password = TextEditingController();
  final TextEditingController passwordRepeat = TextEditingController();
  late TextEditingController email = TextEditingController();

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

                CustomTextFrom(
                  controller: email,
                  hintext: '',
                  label: 'E-mail',
                  validator: (s) {
                    bool emailValid = RegExp(
                            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                        .hasMatch(s ?? "");

                    if (s?.isEmpty ?? true) {
                      return "Email kirting";
                    } else if (!emailValid) {
                      return "Email togri kiriting";
                    }
                    return null;
                  },
                ),
                16.verticalSpace,
                CustomTextFrom(
                  controller: password,
                  validator: (s) {
                    if (s?.isEmpty ?? true) {
                      return "Password toliqmas";
                    }
                    return null;
                  },
                  hintext: '',
                  label: 'Password',
                ),
                16.verticalSpace,
                CustomTextFrom(
                  controller: passwordRepeat,
                  validator: (s) {
                    if (password != passwordRepeat) {
                      return "Password toliqmas";
                    }
                    return null;
                  },
                  hintext: '',
                  label: 'Confirm Password',
                ),
                32.verticalSpace,
                Center(
                  child: GestureDetector(
                    onTap: () {
                      context.read<AuthController>().login(
                          email: email.text,
                          password: password.text,
                          onSuccess: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (_) => const HomePage(),
                              ),
                            );
                          });
                    },
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 24),
                      child: Container(
                        height: 56.h,
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
                  ),
                ),
                32.verticalSpace,
                SizedBox(
                  child: Row(
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
                ),
                32.verticalSpace,
                const GoogleFacebook(),
                32.verticalSpace,
                Center(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (_) => const LoginPage()));
                    },
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
                                style: TextStyle(
                                  color: Color(0xff0E9D57),
                                ),
                              ),
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
