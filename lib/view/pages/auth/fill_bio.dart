// ignore_for_file: prefer_const_constructors

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:one_work/domen/model/edit_user_model.dart';
import 'package:one_work/view/pages/home/general_page.dart';
import 'package:one_work/view/style/style.dart';
import 'package:provider/provider.dart';
import '../../../controller/auth_controller.dart';
import '../../components/custom_textfromfiled.dart';
import '../../components/photo_editing.dart';
import '../../components/uploading_photo.dart';

class FillBioPage extends StatefulWidget {
  const FillBioPage({super.key});

  @override
  State<FillBioPage> createState() => _FillBioPageState();
}

class _FillBioPageState extends State<FillBioPage> {
  late TextEditingController firstName;
  late TextEditingController lastName;
  late TextEditingController phonenumber;
  late TextEditingController dateOfBirth;
  late TextEditingController bio;
  late TextEditingController speciality;
  late TextEditingController city;
  late TextEditingController country;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String datetext = '';

  @override
  void initState() {
    firstName = TextEditingController();
    lastName = TextEditingController();
    country = TextEditingController();
    dateOfBirth = TextEditingController();
    phonenumber = TextEditingController();
    city = TextEditingController();
    bio = TextEditingController();
    speciality = TextEditingController();

    super.initState();
  }

  @override
  void dispose() {
    firstName.dispose();
    lastName.dispose();
    country.dispose();
    dateOfBirth.dispose();
    phonenumber.dispose();
    city.dispose();
    bio.dispose();
    speciality.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = context.watch<AuthController>();
    final event = context.read<AuthController>();
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 24),
                      child: Text(
                        'Fill in your bio',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    )
                  ],
                ),
                24.verticalSpace,
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Text(
                    'This data will be displayed in your account profile',
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                ),
                state.image == null
                    ? const UploadingPhoto()
                    : const SizedBox.shrink(),
                state.image == null
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
                                    File('${state.image?.path}'),
                                  ),
                                  fit: BoxFit.cover),
                            ),
                          ),
                          const PhotoEditing()
                        ],
                      ),
                35.verticalSpace,
                Padding(
                  padding: const EdgeInsets.only(top: 8, left: 24, right: 24),
                  child: CustomTextFrom(
                    validator: (s) {
                      if (s?.isEmpty ?? true) {
                        return "Please enter First Name";
                      }
                      return null;
                    },
                    label: 'First Name',
                    controller: firstName,
                    keyboardType: TextInputType.emailAddress,
                    hintext: '',
                    isObscure: false,
                  ),
                ),
                35.verticalSpace,
                Padding(
                  padding: const EdgeInsets.only(top: 8, left: 24, right: 24),
                  child: CustomTextFrom(
                    validator: (s) {
                      if (s?.isEmpty ?? true) {
                        return "Please enter Last Name";
                      }
                      return null;
                    },
                    controller: lastName,
                    label: 'Last Name',
                    keyboardType: TextInputType.name,
                    hintext: '',
                    isObscure: false,
                  ),
                ),
                35.verticalSpace,
                Padding(
                  padding: const EdgeInsets.only(top: 8, left: 24, right: 24),
                  child: CustomTextFrom(
                    validator: (s) {
                      if (s?.isEmpty ?? true) {
                        return "Please enter Phone number";
                      }
                      return null;
                    },
                    controller: phonenumber,
                    label: 'Phone Number',
                    keyboardType: TextInputType.phone,
                    hintext: '',
                    isObscure: false,
                  ),
                ),
                35.verticalSpace,
                Padding(
                  padding: const EdgeInsets.only(top: 8, left: 24, right: 24),
                  child: TextFormField(
                    validator: (s) {
                      if (s?.isEmpty ?? true) {
                        return "Please enter the Date";
                      }
                      return null;
                    },
                    controller: dateOfBirth,
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
                            dateOfBirth.text = DateFormat('MMMM dd, yyyy')
                                .format(value ?? DateTime.now());
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
                      contentPadding: const EdgeInsets.only(
                          left: 24, right: 24, top: 12, bottom: 12),
                      hintText: 'Date of Birth',
                      hintStyle: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Color(0xffDADEE3)),
                      enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 221, 206, 206)),
                          borderRadius: BorderRadius.all(Radius.circular(100))),
                      focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 221, 206, 206)),
                          borderRadius: BorderRadius.all(Radius.circular(100))),
                    ),
                  ),
                ),
                35.verticalSpace,
                Padding(
                  padding: const EdgeInsets.only(top: 8, left: 24, right: 24),
                  child: CustomTextFrom(
                    validator: (s) {
                      if (s?.isEmpty ?? true) {
                        return "Please enter your Country";
                      }
                      return null;
                    },
                    label: 'Country',
                    isObscure: false,
                    controller: country,
                    keyboardType: TextInputType.emailAddress,
                    hintext: '',
                  ),
                ),
                35.verticalSpace,
                Padding(
                  padding: const EdgeInsets.only(top: 8, left: 24, right: 24),
                  child: CustomTextFrom(
                    validator: (s) {
                      if (s?.isEmpty ?? true) {
                        return "Please enter your City";
                      }
                      return null;
                    },
                    label: 'City',
                    isObscure: false,
                    controller: country,
                    keyboardType: TextInputType.emailAddress,
                    hintext: '',
                  ),
                ),
                35.verticalSpace,
                Padding(
                  padding: const EdgeInsets.only(top: 8, left: 24, right: 24),
                  child: CustomTextFrom(
                    validator: (s) {
                      if (s?.isEmpty ?? true) {
                        return "Please enter your Bio";
                      }
                      return null;
                    },
                    label: 'Bio',
                    isObscure: false,
                    controller: country,
                    keyboardType: TextInputType.emailAddress,
                    hintext: '',
                  ),
                ),
                35.verticalSpace,
                Padding(
                  padding: const EdgeInsets.only(top: 8, left: 24, right: 24),
                  child: CustomTextFrom(
                    validator: (s) {
                      if (s?.isEmpty ?? true) {
                        return "Please enter your Speciality";
                      }
                      return null;
                    },
                    label: 'Speciality',
                    isObscure: false,
                    controller: speciality,
                    keyboardType: TextInputType.emailAddress,
                    hintext: '',
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
                  child: InkWell(
                    onTap: () async {
                      if (firstName.text.isNotEmpty &&
                          lastName.text.isNotEmpty &&
                          phonenumber.text.isNotEmpty &&
                          bio.text.isEmpty &&
                          country.text.isNotEmpty &&
                          city.text.isNotEmpty &&
                          speciality.text.isNotEmpty &&
                          dateOfBirth.text.isNotEmpty) {
                        state.getUploading(context, state.image?.path ?? '');
                        event.createUser(
                            context,
                            EditUserModel(
                              city: city.text,
                              dateOfBirth: dateOfBirth.text,
                              invisibleAge: false,
                              speciality: speciality.text,
                              firstName: firstName.text,
                              lastName: lastName.text,
                              phoneNumber: phonenumber.text,
                              bio: bio.text,
                              country: country.text,
                              imageUrl: state.imageUrl,
                            ));
                        Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(builder: (_) => GeneralPage()),
                            (route) => false);
                      }
                    },
                    child: AnimatedContainer(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      duration: const Duration(milliseconds: 400),
                      decoration: BoxDecoration(
                        color: firstName.text.isEmpty ||
                                lastName.text.isEmpty ||
                                phonenumber.text.isEmpty ||
                                country.text.isEmpty ||
                                bio.text.isEmpty ||
                                speciality.text.isEmpty ||
                                city.text.isEmpty ||
                                dateOfBirth.text.isEmpty
                            ? Style.primaryDisabledColor
                            : Style.primaryColor,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(32)),
                      ),
                      child: Center(
                        child: state.isLoading
                            ? LoadingAnimationWidget.fallingDot(
                                color: Style.whiteColor, size: 35)
                            : Text(
                                'Next',
                                style: GoogleFonts.sourceSansPro(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white),
                              ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
