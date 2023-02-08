import 'package:flutter/material.dart';

class CustomTextFrom extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final TextInputType keyboardType;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final bool isObscure;
  final double radius;
  final FocusNode? node;
  final Color? colorBorder;
  final Color? colorFill;

  final ValueChanged<String>? onChange;

  const CustomTextFrom({
    Key? key,
    required this.controller,
    required this.label,
    this.keyboardType = TextInputType.text,
    this.isObscure = false,
    this.onChange,
    this.suffixIcon,
    this.node,
    required String hintext,
    onchange,
    IconButton? suffixicon,
    String? obscuringCharacter,
    this.radius = 0,
    this.colorBorder = const Color(0x0ff00000),
    this.colorFill = const Color(0xffFFFFFF),
    this.prefixIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        focusNode: node,
        onChanged: onChange,
        decoration: InputDecoration(
          prefixIcon: prefixIcon,
          filled: true,
          fillColor: colorFill,
          labelText: label,
          border: OutlineInputBorder(
            borderSide:
                BorderSide(color: colorBorder ?? const Color(0x00000000)),
            borderRadius: BorderRadius.all(
              Radius.circular(radius),
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: colorBorder ?? const Color(0x00000000)),
            borderRadius: BorderRadius.all(
              Radius.circular(radius),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: colorBorder ?? const Color(0x00000000)),
            borderRadius: BorderRadius.all(
              Radius.circular(radius),
            ),
          ),
        ));
  }
}
