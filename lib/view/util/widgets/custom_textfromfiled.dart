import 'package:flutter/material.dart';

class CustomTextFrom extends StatelessWidget {
  final String hintext;
  final Widget? suffixicon;
  final Icon? perfixicon;
  final Function? validator;
  final TextEditingController? controller;
  final TextInputType keyboardType;
  final String? label;
  final ValueChanged<String>? onChange;

  const CustomTextFrom(
      {Key? key,
      required this.hintext,
      this.keyboardType = TextInputType.text,
      this.suffixicon,
      this.label,
      this.onChange,
      this.perfixicon,
      this.validator,
      this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: (value) {
        return '';
      },
      keyboardType: keyboardType,
      decoration: InputDecoration(
        label: Text('$label'),
        labelStyle: const TextStyle(color: Color(0xffBDBEC2)),
        hintText: hintext,
        contentPadding:
            const EdgeInsets.only(left: 12, right: 80, top: 12, bottom: 12),
        errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white, width: 0.0),
        ),
        focusedErrorBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red, width: 0.0),
        ),
        border: const OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xffAFB0B6)),
            borderRadius: BorderRadius.all(Radius.circular(12))),
        enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xffAFB0B6)),
            borderRadius: BorderRadius.all(Radius.circular(12))),
        focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xffAFB0B6)),
            borderRadius: BorderRadius.all(Radius.circular(12))),
      ),
    );
  }
}
