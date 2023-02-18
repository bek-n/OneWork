import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';

import '../style/style.dart';

class DatePicker extends StatefulWidget {
  final TextEditingController controller;
  const DatePicker({super.key, required this.controller});

  @override
  State<DatePicker> createState() => _DatePickerState();
}

class _DatePickerState extends State<DatePicker> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly: true,
      validator: (s) {
        if (s?.isEmpty ?? true) {
          return "Please enter the Date";
        }
        return null;
      },
      controller: widget.controller,
      keyboardType: TextInputType.phone,
      decoration: InputDecoration(
        suffixIcon: IconButton(
          onPressed: (() {
            showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(1970),
                    lastDate: DateTime.now())
                .then((value) {
              widget.controller.text =
                  DateFormat('dd/MM/y').format(value ?? DateTime.now());
              setState(() {});
            });
          }),
          icon: SvgPicture.asset(
            'assets/svg/calendar.svg',
            height: 24,
            width: 24,
            color: Colors.grey,
          ),
        ),
        hintText: 'Date of birth',
        hintStyle:
            Style.textStyleRegular2(textColor: Style.greyColor90, size: 15),
        contentPadding:
            const EdgeInsets.only(left: 24, right: 80, top: 12, bottom: 12),
        errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red, width: 0.0),
        ),
        border: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Color(0xffAFB0B6),
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(12),
          ),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Color(0xffAFB0B6),
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(12),
          ),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Style.primaryColor),
          borderRadius: BorderRadius.all(
            Radius.circular(12),
          ),
        ),
      ),
    );
  }
}
