import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:one_work/view/pages/home/home_page.dart';
import 'package:provider/provider.dart';
import 'package:sms_autofill/sms_autofill.dart';
import '../../../controller/auth_controller.dart';
import '../../style/style.dart';

class VerifyPage extends StatefulWidget {
  final String? email;
  const VerifyPage({Key? key, this.email}) : super(key: key);

  @override
  State<VerifyPage> createState() => _VerifyPageState();
}

class _VerifyPageState extends State<VerifyPage> {
  late TextEditingController controller;

  @override
  void initState() {
    controller = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 24),
              child: Row(
                children: [
                  GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: IconButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        icon: const Icon(
                          Icons.arrow_back_ios,
                        ),
                      )),
                ],
              ),
            ),
            56.verticalSpace,
            Text(
              'OneWork',
              style: Style.textStyleRegular(
                  size: 20, textColor: Style.primaryColor),
            ),
            27.verticalSpace,
            Text(
              'Verify Code',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            17.verticalSpace,
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 32),
              child: Text(
                  'Enter your verification code from your email that we’ve sent'),
            ),
            Padding(
              padding: const EdgeInsets.all(32.0),
              child: PinFieldAutoFill(
                autoFocus: true,
                controller: controller,
                cursor: Cursor(
                    color: Colors.black,
                    enabled: true,
                    width: 3,
                    radius: const Radius.circular(24)),
                decoration: const BoxLooseDecoration(
                  gapSpace: 10,
                  bgColorBuilder: FixedColorBuilder(
                    Colors.white,
                  ),
                  strokeColorBuilder: FixedColorBuilder(
                    Colors.black,
                  ),
                ),
                onCodeSubmitted: (s) {},
                onCodeChanged: (s) {},
                currentCode: "",
              ),
            ),
            ElevatedButton(
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Style.primaryDisabledColor)),
                clipBehavior: Clip.antiAliasWithSaveLayer,
                onPressed: () {
                  context.read<AuthController>().verifyEmail(
                      code: controller.text,
                      email: widget.email ?? '',
                      onSuccess: () {
                        Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(builder: (_) => const HomePage()),
                            (route) => false);
                      });
                },
                child: context.watch<AuthController>().isLoading
                    ? Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: LoadingAnimationWidget.fallingDot(
                            color: Style.whiteColor, size: 50),
                      )
                    : const Text("Check"))
          ],
        ),
      ),
    );
  }
}
