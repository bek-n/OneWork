import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import '../../controller/auth_controller.dart';
import '../style/style.dart';

class UploadingPhoto extends StatefulWidget {
  const UploadingPhoto({super.key});

  @override
  State<UploadingPhoto> createState() => _UploadingPhotoState();
}

class _UploadingPhotoState extends State<UploadingPhoto> {
  
 
  @override
  
  Widget build(BuildContext context) {
    final state = context.watch<AuthController>();
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
                onTap: () async {
               state.image  = await state.picker.pickImage(source: ImageSource.camera);
                print("xfile: ${state.image ?.path}");
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
                onTap: () async {
                 state.image  = await state.picker.pickImage(source: ImageSource.gallery);
                print("xfile: ${state.image ?.path}");
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


//? Multi images

// ElevatedButton(
//               onPressed: () async {
//                 final List<XFile>? images = await _picker.pickMultiImage();
//                 images?.forEach((e) {
//                   print(e.path);
//                 });
//               },
//               child: Text("Multi Image Photo")),




//! File upload


// ElevatedButton(
//               onPressed: () async {
//                 FilePickerResult? result =
//                     await FilePicker.platform.pickFiles();

//                 if (result != null) {
//                   PlatformFile file = result.files.first;

//                   print(file.name);
//                   print(file.bytes);
//                   print(file.size);
//                   print(file.extension);
//                   print(file.path);
//                 } else {
//                   // User canceled the picker
//                 }
//               },
//               child: Text("File")),