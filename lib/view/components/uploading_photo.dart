import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
    final event = context.read<AuthController>();
    return Column(
      children: [
        15.verticalSpace,
        Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: const [
                    BoxShadow(
                        blurRadius: 1,
                        offset: Offset(-0, 1),
                        color: Style.primaryColor)
                  ],
                  color: Colors.white,
                  border: Border.all(color: const Color(0xffEBEEF2))),
              child: Column(
                children: [
                  InkWell(
                    onTap: () async {
                      event.getImageFromCamera();
                    },
                    child: Container(
                      height: 200.h,
                      width: 200.w,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/images/profile.png'),
                            fit: BoxFit.cover),
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: GestureDetector(
                onTap: () {
                  showCupertinoDialog(
                      context: context,
                      builder: ((context) => CupertinoAlertDialog(
                            title: const Text('Choose'),
                            actions: [
                              CupertinoButton(
                                  onPressed: (() async {
                                    event.getImageFromCamera();

                                    // ignore: use_build_context_synchronously
                                    Navigator.pop(context);
                                  }),
                                  child: const Text("Take photo")),
                              CupertinoButton(
                                  onPressed: (() async {
                                    event.getImageFromGallery();

                                    // ignore: use_build_context_synchronously
                                    Navigator.pop(context);
                                  }),
                                  child: const Text("From Gallery")),
                              CupertinoButton(
                                  onPressed: (() async {
                                    Navigator.pop(context);
                                  }),
                                  child: const Text('Cancel'))
                            ],
                          )));
                },
                child: Container(
                  height: 55.h,
                  width: 55.w,
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 232, 226, 226),
                    shape: BoxShape.circle,
                  ),
                  padding: EdgeInsets.all(8.r),
                  child: const Icon(
                    Icons.add_photo_alternate_outlined,
                    color: Style.primaryColor,
                  ),
                ),
              ),
            )
          ],
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