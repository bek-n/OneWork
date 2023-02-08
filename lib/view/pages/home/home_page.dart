import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:one_work/view/domen/components/custom_textfromfiled.dart';
import 'package:one_work/view/style/style.dart';

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
                          'Welcome to OneWork!',
                          style: Theme.of(context).textTheme.displaySmall,
                        ),
                        Text(
                          'Discover Jobs 🔥',
                          style: Theme.of(context).textTheme.titleMedium,
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
                        fillColor: Color(0xffF2F2F3),
                        filled: true,
                        controller: homeController,
                        suffixicon: Icon(Icons.search),
                        label: 'Search a job or position',
                        hintext: '',
                        isObscure: false,
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
                    Text(
                      'Featured Jobs',
                      style: Theme.of(context).textTheme.displaySmall,
                    ),
                    const Spacer(),
                    GestureDetector(
                      child: Text(
                        'See all',
                        style: Style.textStyleRegular(
                          size: 14,
                          textColor: Style.greyColor90,
                        ),
                      ),
                    ),
                  ],
                ),
                20.verticalSpace,
                SizedBox(
                  height: 190.w,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return Container(
                          width: 280.w,
                          height: 186.h,
                          margin: const EdgeInsets.only(right: 24),
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('assets/images/Group.png'),
                                fit: BoxFit.cover),
                            borderRadius: BorderRadius.circular(24),
                            color: Colors
                                .primaries[index % Colors.primaries.length],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(top: 24),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    24.horizontalSpace,
                                    Container(
                                      height: 46.h,
                                      width: 46.w,
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                            image: NetworkImage(
                                                'https://upload.wikimedia.org/wikipedia/commons/thumb/0/05/Facebook_Logo_%282019%29.png/1024px-Facebook_Logo_%282019%29.png'),
                                          ),
                                          color: Style.whiteColor,
                                          borderRadius:
                                              BorderRadius.circular(12)),
                                    ),
                                    16.horizontalSpace,
                                    Expanded(
                                      child: Container(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Software Engineer',
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 1,
                                              style: Style.textStyleRegular2(
                                                  textColor: Style.whiteColor),
                                            ),
                                            Text(
                                              'Facebook',
                                              style: Style.textStyleRegular2(
                                                  size: 14,
                                                  textColor: Style.whiteColor),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 12, top: 24, right: 12),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Wrap(
                                        children: [
                                          Container(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 16, vertical: 4),
                                            decoration: BoxDecoration(
                                                color: Style.whiteColor
                                                    .withOpacity(0.15),
                                                borderRadius:
                                                    BorderRadius.circular(65)),
                                            child: Text(
                                              'IT',
                                              style: Style.textStyleRegular2(
                                                  size: 12,
                                                  textColor: Style.whiteColor),
                                            ),
                                          )
                                        ],
                                      ),
                                      Wrap(
                                        children: [
                                          Container(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 16, vertical: 4),
                                            decoration: BoxDecoration(
                                                color: Style.whiteColor
                                                    .withOpacity(0.15),
                                                borderRadius:
                                                    BorderRadius.circular(65)),
                                            child: Text(
                                              'Full-Time',
                                              style: Style.textStyleRegular2(
                                                  size: 12,
                                                  textColor: Style.whiteColor),
                                            ),
                                          )
                                        ],
                                      ),
                                      Wrap(
                                        children: [
                                          Container(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 16, vertical: 4),
                                            decoration: BoxDecoration(
                                                color: Style.whiteColor
                                                    .withOpacity(0.15),
                                                borderRadius:
                                                    BorderRadius.circular(65)),
                                            child: Text(
                                              'Junior',
                                              style: Style.textStyleRegular2(
                                                  size: 12,
                                                  textColor: Style.whiteColor),
                                            ),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                24.verticalSpace,
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 24),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        '\$180,00/year',
                                        style: Style.textStyleRegular2(
                                            size: 13,
                                            textColor: Style.whiteColor),
                                      ),
                                      Text(
                                        'California, USA',
                                        style: Style.textStyleRegular2(
                                            size: 13,
                                            textColor: Style.whiteColor),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ));
                    },
                  ),
                ),
                34.verticalSpace,
                Row(
                  children: [
                    Text(
                      'Popular Jobs',
                      style: Theme.of(context).textTheme.displaySmall,
                    ),
                    const Spacer(),
                    GestureDetector(
                      child: Text(
                        'See all',
                        style: Style.textStyleRegular(
                          size: 14,
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
