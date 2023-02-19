import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:one_work/view/components/auth_button.dart';
import 'package:one_work/view/style/style.dart';

class DonePAge extends StatefulWidget {
  const DonePAge({super.key});

  @override
  State<DonePAge> createState() => _DonePAgeState();
}

class _DonePAgeState extends State<DonePAge> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              84.verticalSpace,
              Image.asset(
                'assets/images/done.png',
                height: 180,
                width: 180,
              ),
              35.verticalSpace,
              Text(
                'Successful',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              12.verticalSpace,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Text(
                  'You’ve successfully applied to Spotify UX Intern role.',
                  style: Style.textStyleRegular2(textColor: Style.greyColor90),
                ),
              ),
              120.verticalSpace,
              const AuthButton(text: 'Track'),
              20.verticalSpace,
              Container(
                height: 57.h,
                width: 327.w,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: Style.primaryColor)),
                child: Center(
                  child: Text(
                    'Browse Jobs',
                    style:
                        Style.textStyleRegular2(textColor: Style.primaryColor),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
