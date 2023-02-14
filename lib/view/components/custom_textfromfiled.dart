import 'package:flutter/material.dart';
import 'package:one_work/controller/auth_controller.dart';
import 'package:one_work/view/style/style.dart';
import 'package:provider/provider.dart';

class CustomTextFrom extends StatelessWidget {
  final String hintext;
  final Widget? suffixicon;
  final Icon? perfixicon;
  final TextEditingController? controller;
  final TextInputType keyboardType;
  final String? label;
  final ValueChanged<String>? onChange;
  final String? obscuringCharacter;
  final bool isObscure;
  final Color? fillColor;
  final bool? filled;
  final FormFieldValidator? validator;

  const CustomTextFrom(
      {Key? key,
      required this.hintext,
      this.keyboardType = TextInputType.text,
      this.suffixicon,
      this.label,
      this.onChange,
      this.perfixicon,
      this.controller,
      this.obscuringCharacter,
      required this.isObscure,
      this.fillColor,
      this.filled,
      this.validator})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      keyboardType: keyboardType,
      obscureText:
          isObscure ? (context.watch<AuthController>().isVisibility) : false,
      controller: controller,
      decoration: InputDecoration(
        fillColor: fillColor,
        filled: filled,
        suffixIcon: suffixicon ??
            (isObscure
                ? IconButton(
                    onPressed: () {
                      context.read<AuthController>().onChange();
                    },
                    icon: context.watch<AuthController>().isVisibility
                        ? const Icon(Icons.visibility)
                        : const Icon(Icons.visibility_off),
                  )
                : const SizedBox.shrink()),
        prefix: perfixicon,
        // suffix: suffixicon,
        label: Text('$label'),
        labelStyle:
            Style.textStyleRegular2(textColor: Style.greyColor90, size: 15),
        hintText: hintext,
        contentPadding:
            const EdgeInsets.only(left: 24, right: 80, top: 12, bottom: 12),
        errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red, width: 0.0),
        ),
        border: const OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xffAFB0B6)),
            borderRadius: BorderRadius.all(Radius.circular(12))),
        enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xffAFB0B6)),
            borderRadius: BorderRadius.all(Radius.circular(12))),
        focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Style.primaryColor),
            borderRadius: BorderRadius.all(Radius.circular(12))),
      ),
    );
  }
}
