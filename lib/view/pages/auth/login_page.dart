import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:one_work/view/pages/auth/register_page.dart';
import 'package:one_work/view/pages/home/home_page.dart';
import 'package:provider/provider.dart';
import '../../../controller/auth_controller.dart';
import '../../components/auth_button.dart';
import '../../components/custom_textfromfiled.dart';
import '../../components/google_facebook.dart';
import '../../style/style.dart';
import 'forget_password.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late TextEditingController password;
  late TextEditingController email;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState() {
    password = TextEditingController();
    email = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    password.dispose();
    email.dispose();
    super.dispose();
  }

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
          Form(
            key: formKey,
            child: Column(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                  child: CustomTextFrom(
                    validator: (s) {
                      final bool emailValid = RegExp(
                              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                          .hasMatch(s ?? "");

                      if (s?.isEmpty ?? true) {
                        return "Please enter  email";
                      } else if (!emailValid) {
                        return "Email format not correct";
                      }
                      return null;
                    },
                    controller: email,
                    hintext: '',
                    label: 'E-mail',
                    isObscure: false,
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                  child: CustomTextFrom(
                    controller: password,
                    hintext: '',
                    label: 'Password',
                    isObscure: true,
                    validator: (s) {
                      if (s?.isEmpty ?? true) {
                        return "Please enter password";
                      }
                      return null;
                    },
                  ),
                ),
              ],
            ),
          ),
          32.verticalSpace,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: GestureDetector(
                onTap: () {
                  if (formKey.currentState?.validate() ?? false) {
                    context.read<AuthController>().login(
                        email: email.text,
                        password: password.text,
                        onSuccess: () {
                          Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(
                                  builder: (_) => const HomePage()),
                              (route) => false);
                        });
                  }
                },
                child: const AuthButton(text: 'Log in')),
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
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (_) => const RegisterPage()),
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
