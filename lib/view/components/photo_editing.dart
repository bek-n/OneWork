import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:one_work/view/style/style.dart';
import 'package:provider/provider.dart';

import '../../controller/auth_controller.dart';

class PhotoEditing extends StatefulWidget {
  const PhotoEditing({super.key});

  @override
  State<PhotoEditing> createState() => _PhotoEditingState();
}

class _PhotoEditingState extends State<PhotoEditing> {
  @override
  Widget build(BuildContext context) {
    final state = context.watch<AuthController>();
    return Positioned(
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
                              state.image = await state.picker
                                  .pickImage(source: ImageSource.camera);
                            }),
                            child: const Text("Take photo")),
                        CupertinoButton(
                            onPressed: (() async {
                              state.image = await state.picker
                                  .pickImage(source: ImageSource.gallery);
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
              color: Style.primaryColor,
              shape: BoxShape.circle,
            ),
            padding: EdgeInsets.all(8.r),
            child: const Icon(
              Icons.edit,
              color: Colors.white,
            ),
          ),
        ));
  }
}
