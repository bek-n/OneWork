import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../controller/auth_controller.dart';
import '../style/style.dart';

class UploadingPhoto extends StatelessWidget {
  const UploadingPhoto({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 150, vertical: 23),
          decoration: BoxDecoration(
              boxShadow: [
                const BoxShadow(
                    blurRadius: 1, offset: Offset(-0, 1), color: Colors.grey)
              ],
              borderRadius: const BorderRadius.all(Radius.circular(20)),
              color: Colors.white,
              border: Border.all(color: const Color(0xffEBEEF2))),
          child: Column(
            children: [
              InkWell(
                onTap: () {
                  context.read<AuthController>().getImageCamera();
                },
                child: Container(
                  height: 80.h,
                  width: 80.w,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Style.primaryDisabledColor),
                  child: const Icon(
                    Icons.photo_camera,
                    color: Style.blackColor,
                  ),
                ),
              ),
              10.verticalSpace,
              Text('Take photo', style: Style.textStyleRegular2()),
            ],
          ),
        ),
        24.verticalSpace,
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 150, vertical: 23),
          decoration: BoxDecoration(
              boxShadow: [
                const BoxShadow(
                    blurRadius: 1, offset: Offset(-0, 1), color: Colors.grey)
              ],
              borderRadius: const BorderRadius.all(Radius.circular(20)),
              color: Colors.white,
              border: Border.all(color: const Color(0xffEBEEF2))),
          child: Column(
            children: [
              InkWell(
                onTap: () {
                  context.read<AuthController>().getImageGallery();
                },
                child: Container(
                  height: 80.h,
                  width: 80.w,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Style.primaryDisabledColor),
                  child: const Icon(
                    Icons.photo,
                    color: Style.blackColor,
                  ),
                ),
              ),
              10.verticalSpace,
              Text('From gallery', style: Style.textStyleRegular2()),
            ],
          ),
        ),
      ],
    );
  }
}
