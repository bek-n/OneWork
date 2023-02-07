import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../components/custom_textfromfiled.dart';
import '../../style/style.dart';


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
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            24.verticalSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.arrow_back_ios),
                ),
              ],
            ),
            Text(
              'OneWork',
              style: Style.textStyleRegular(
                  size: 32, textColor: Style.primaryColor),
            ),
            32.verticalSpace,
            Text('Forgot Password',
                style: Theme.of(context).textTheme.displayMedium),
            34.verticalSpace,
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 32),
              child: Text(
                'Enter your email or phone number, we will send you verification code',
                style: TextStyle(color: Color(0xff0D0D26)),
              ),
            ),
            30.verticalSpace,
            const Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 24,
              ),
              child: CustomTextFrom(
                hintext: '',
                label: 'E-mail',
              ),
            ),
            Spacer(),
            Container(
              height: 56.h,
              width: 327.w,
              decoration: BoxDecoration(
                  color: const Color(0xff0E9D57),
                  borderRadius: BorderRadius.circular(16)),
              child: const Center(
                  child: Text(
                'Send Code',
                style: TextStyle(color: Colors.white),
              )),
            ),
          ],
        ),
      ),
    );
  }
}
