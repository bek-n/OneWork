import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:one_work/view/util/widgets/custom_textform.dart';
import 'package:one_work/view/util/style/style.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController homeController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Welcome to One Work!',
                          style: Style.textStyleRegular(size: 14),
                        ),
                        Text(
                          'Discover Jobs 🔥',
                          style: Style.textStyleRegular(size: 24),
                        ),
                      ],
                    ),
                    const Spacer(),
                    SizedBox(
                      height: 60.h,
                      width: 60.w,
                      child: Image.asset(
                        'assets/images/1.png',
                      ),
                    )
                  ],
                ),
                34.verticalSpace,
                Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(right: 16),
                      width: 280.w,
                      height: 48.h,
                      child: CustomTextFrom(
                        controller: homeController,
                        label: 'Search a job or position',
                        hintext: '',
                        colorFill: Style.greyColor65,
                        radius: 16,
                      ),
                    ),
                    const Spacer(),
                    Container(
                      height: 48.h,
                      width: 48.w,
                      decoration: const BoxDecoration(
                        color: Style.greyColor65,
                        borderRadius: BorderRadius.all(
                          Radius.circular(16),
                        ),
                      ),
                      child: const Icon(
                        Icons.sort,
                        color: Style.primaryColor,
                      ),
                    )
                  ],
                ),
                34.verticalSpace,
                Row(
                  children: [
                    Text('Featured Jobs',
                        style: Style.textStyleRegular(
                            size: 20, textColor: Style.blackColor)),
                    const Spacer(),
                    GestureDetector(
                      child: Text(
                        'See all',
                        style: Style.textStyleRegular(
                          size: 16,
                          textColor: Style.greyColor90,
                        ),
                      ),
                    ),
                  ],
                ),
                20.verticalSpace,
                SizedBox(
                  height: 180.w,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 2,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: const EdgeInsets.only(right: 24),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(24),
                            color: Style.greyColor90),
                        width: 280,
                        child: Center(
                            child: SizedBox(
                          height: 100,
                          width: 100,
                          child: Image.asset('assets/images/2.png'),
                        )),
                      );
                    },
                  ),
                ),
                34.verticalSpace,
                Row(
                  children: [
                    Text('Popular Jobs',
                        style: Style.textStyleRegular(
                            size: 20, textColor: Style.blackColor)),
                    const Spacer(),
                    GestureDetector(
                      child: Text(
                        'See all',
                        style: Style.textStyleRegular(
                          size: 16,
                          textColor: Style.greyColor90,
                        ),
                      ),
                    ),
                  ],
                ),
                20.verticalSpace,
                SizedBox(
                  height: 550.h,
                  child: ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 6,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: const EdgeInsets.only(bottom: 16),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(24),
                            color: Style.greyColor90),
                        width: 280,
                        height: 74.h,
                        child: const Center(
                          child: Text('Birnimalar'),
                        ),
                      );
                    },
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
