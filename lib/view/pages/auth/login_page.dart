import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:one_work/view/domen/service/local_store.dart';
import 'package:one_work/view/pages/auth/register_1.dart';
import 'package:one_work/view/pages/home/home_page.dart';
import '../../domen/components/custom_textfromfiled.dart';
import '../../domen/components/google_facebook.dart';
import '../../style/style.dart';
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
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.arrow_back_ios),
                ),
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
            child: GestureDetector(
              onTap: () {
                if (LocalStore.getAccessToken != null) {
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(builder: (_) => HomePage()),
                      (route) => false);
                }
              },
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
          ),
          30.verticalSpace,
          InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => const ForgetPassword()));
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
          24.verticalSpace,
          const GoogleFacebook(),
          48.verticalSpace,
          SizedBox(
            width: 350,
            height: 20,
            child: InkWell(
              onTap: () {
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (_) => RegisterPage()),
                    (route) => false);
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
                            text: 'Register',
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
    );
  }
}
