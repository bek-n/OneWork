import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:one_work/view/domen/components/auth_button.dart';
import 'package:provider/provider.dart';
import '../../../controller/auth_controller.dart';
import '../../domen/components/custom_textfromfiled.dart';
import '../../domen/components/google_facebook.dart';
import '../../style/style.dart';
import 'confirm_page.dart';
import 'login_page.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  late TextEditingController email;
  late TextEditingController password;
  late TextEditingController confirmPassword;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState() {
    email = TextEditingController();
    password = TextEditingController();
    confirmPassword = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    password.dispose();
    confirmPassword.dispose();
    email.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Form(
               key: formKey,
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
                  CustomTextFrom(
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
                  16.verticalSpace,
                  CustomTextFrom(
                    validator: (s) {
                      if (s?.isEmpty ?? true) {
                        return "Please enter password";
                      }
                      return null;
                    },
                    controller: password,
                    hintext: '',
                    label: 'Password',
                    isObscure: true,
                  ),
                  16.verticalSpace,
                  CustomTextFrom(
                    validator: (s) {
                      if (s?.isEmpty ?? true) {
                        return "Please enter password confirmation";
                      } else if (password.text != s) {
                        return "Password confirmation does not match ";
                      }
                      return null;
                    },
                    controller: confirmPassword,
                    hintext: '',
                    label: 'Confirm Password',
                    isObscure: true,
                  ),
                  context.watch<AuthController>().wrongPassword != null
                      ? Text(context.watch<AuthController>().wrongPassword ?? "")
                      : SizedBox.shrink(),
                  32.verticalSpace,
                  Center(
                    child: GestureDetector(
                        onTap: () {
                          if (formKey.currentState?.validate() ?? false) {
                            context.read<AuthController>().signUp(
                                email: email.text,
                                password: password.text,
                                confirmPassword: confirmPassword.text,
                                onSuccess: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (_) => VerifyPage(
                                            email: email.text,
                                          )));
                                });
                          }
                        },
                        child: const AuthButton(text: 'Register')),
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
                      Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(builder: (_) => const LoginPage()),
                          (route) => false);
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
      ),
    );
  }
}
