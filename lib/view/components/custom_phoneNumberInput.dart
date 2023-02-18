import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import '../style/style.dart';

class CustomPhoneInput extends StatefulWidget {
  final TextEditingController controller;
  const CustomPhoneInput({super.key, required this.controller});

  @override
  State<CustomPhoneInput> createState() => _CustomPhoneInputState();
}

class _CustomPhoneInputState extends State<CustomPhoneInput> {
  PhoneNumber number = PhoneNumber(isoCode: 'UZ');
  @override
  Widget build(BuildContext context) {
    return InternationalPhoneNumberInput(
      inputDecoration: InputDecoration(
        label: const Text('Phone Number'),
        labelStyle:
            Style.textStyleRegular2(textColor: Style.greyColor90, size: 15),
        errorBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(12),
          ),
          borderSide: BorderSide(color: Colors.red, width: 0.0),
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
      textStyle: Style.textStyleRegular2(textColor: Style.blackColor, size: 15),
      onInputChanged: (PhoneNumber number) {},
      selectorConfig: const SelectorConfig(
        selectorType: PhoneInputSelectorType.DIALOG,
      ),
      ignoreBlank: false,
      autoValidateMode: AutovalidateMode.disabled,
      selectorTextStyle: const TextStyle(color: Colors.black),
      initialValue: number,
      textFieldController: widget.controller,
      formatInput: true,
      keyboardType: TextInputType.phone,
      searchBoxDecoration: InputDecoration(
        label: const Text('Find your country'),
        labelStyle:
            Style.textStyleRegular2(textColor: Style.greyColor90, size: 15),
        prefixIcon: const Icon(Icons.search),
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
      inputBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: Style.primaryColor),
        borderRadius: BorderRadius.all(
          Radius.circular(12),
        ),
      ),
    );
  }
}
