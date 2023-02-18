import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../../controller/auth_controller.dart';
import '../pages/auth/register_page.dart';
import '../style/style.dart';

class DrawerColumn extends StatefulWidget {
  final String name, image,jobPosition;
  final Widget switcher;
  const DrawerColumn(
      {super.key,
      required this.name,
      required this.image,
      required this.switcher, required this.jobPosition});

  @override
  State<DrawerColumn> createState() => _DrawerColumnState();
}

class _DrawerColumnState extends State<DrawerColumn> {
  bool isChangedTheme = true;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(
          widget.image,
          height: 104,
          width: 104,
        ),
        12.verticalSpace,
        Text(
          widget.name,
          style: Theme.of(context).textTheme.displaySmall,
        ),
        Text(
          widget.jobPosition,
          style: Style.textStyleRegular2(size: 13, textColor: Colors.grey),
        ),
        Text(
          'View Profile',
          style:
              Style.textStyleRegular2(size: 14, textColor: Style.primaryColor),
        ),
        50.verticalSpace,
        Padding(
          padding: const EdgeInsets.only(left: 40),
          child: Row(
            children: [
              const Icon(Icons.info_outlined, color: Style.primaryColor),
              16.horizontalSpace,
              Text(
                'Personal Info',
                style: Theme.of(context).textTheme.displaySmall,
              )
            ],
          ),
        ),
        28.verticalSpace,
        Padding(
          padding: const EdgeInsets.only(left: 40),
          child: Row(
            children: [
              const Icon(Icons.list_alt, color: Style.primaryColor),
              16.horizontalSpace,
              Text(
                'Applications',
                style: Theme.of(context).textTheme.displaySmall,
              )
            ],
          ),
        ),
        50.verticalSpace,
        Padding(
          padding: const EdgeInsets.only(left: 40),
          child: Row(
            children: [
              const Icon(Icons.insert_drive_file_outlined,
                  color: Style.primaryColor),
              16.horizontalSpace,
              Text(
                'Resumes',
                style: Theme.of(context).textTheme.displaySmall,
              )
            ],
          ),
        ),
        28.verticalSpace,
        Padding(
          padding: const EdgeInsets.only(left: 40),
          child: Row(
            children: [
              const Icon(Icons.work_outline, color: Style.primaryColor),
              16.horizontalSpace,
              Text(
                'Portfolio',
                style: Theme.of(context).textTheme.displaySmall,
              )
            ],
          ),
        ),
        50.verticalSpace,
        Padding(
          padding: const EdgeInsets.only(left: 40),
          child: Row(
            children: [
              const Icon(Icons.settings, color: Style.primaryColor),
              16.horizontalSpace,
              Text(
                'Settings',
                style: Theme.of(context).textTheme.displaySmall,
              )
            ],
          ),
        ),
        28.verticalSpace,
        Padding(
          padding: const EdgeInsets.only(left: 40),
          child: Row(
            children: [
              const Icon(
                Icons.logout,
                color: Colors.red,
              ),
              16.horizontalSpace,
              GestureDetector(
                onTap: () {
                  context.read<AuthController>().logOut();
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(builder: (_) => const RegisterPage()),
                      (route) => false);
                },
                child: Text('Logout',
                    style: Style.textStyleRegular2(
                        size: 17, textColor: Colors.red)),
              )
            ],
          ),
        ),
        20.verticalSpace,
        widget.switcher
      ],
    );
  }
}
