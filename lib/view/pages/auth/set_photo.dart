import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../../../controller/auth_controller.dart';
import '../../components/photo_editing.dart';
import '../../components/uploading_photo.dart';
import '../../style/style.dart';


class UploadPhotoPage extends StatefulWidget {
  const UploadPhotoPage({Key? key}) : super(key: key);

  @override
  State<UploadPhotoPage> createState() => _UploadPhotoPageState();
}

class _UploadPhotoPageState extends State<UploadPhotoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        children: [
          Row(
            children: [
              24.horizontalSpace,
              Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: 8.18, vertical: 8.18),
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(9.82)),
                    color: Color.fromARGB(255, 234, 175, 194)),
                child: const Icon(
                  Icons.arrow_back_ios,
                  color: Color(0xffF43F5E),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 24),
                child: Text('Upload your photo',
                    style: Style.textStyleRegular(size: 26)),
              )
            ],
          ),
          24.verticalSpace,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Text(
                'This data will be displayed in your account profile for security',
                style: Style.textStyleRegular2()),
          ),
          24.verticalSpace,
          context.watch<AuthController>().imagePath.isEmpty
              ? const UploadingPhoto()
              : const SizedBox.shrink(),
          context.watch<AuthController>().imagePath.isEmpty
              ? const SizedBox.shrink()
              : Stack(
                  children: [
                    Container(
                      width: 250.w,
                      height: 250.h,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: FileImage(
                              File(context.watch<AuthController>().imagePath),
                            ),
                            fit: BoxFit.cover),
                      ),
                    ),
                    const PhotoEditing()
                  ],
                ),
          const Spacer(),
          GestureDetector(
            onTap: () {
              context.read<AuthController>().createUser(() {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (_) => const CongratsPage()),
                    (route) => false);
              });
            },
            child: NextButton(
              image: context.watch<AuthController>().imagePath,
            ),
          )
        ],
      ),
    ));
  }
}
