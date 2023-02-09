import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:one_work/view/domen/components/custom_textfromfiled.dart';
import 'package:one_work/view/style/style.dart';

import '../../domen/components/home_page_featured_jobs.dart';

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
      extendBodyBehindAppBar: true,
      appBar: AppBar(
          centerTitle: true,
          actions: [
            SizedBox(
              height: 60.h,
              width: 60.w,
              child: Image.asset(
                'assets/images/1.png',
              ),
            ),
          ],
          title: Column(
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
          elevation: 0,
          backgroundColor: Colors.transparent),
      drawer: Drawer(),
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
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
                      return FeaturedJobs(
                        index: index,
                        imageLogoCompany:
                            'https://upload.wikimedia.org/wikipedia/commons/thumb/0/05/Facebook_Logo_%282019%29.png/1024px-Facebook_Logo_%282019%29.png',
                        CompanyName: 'Facebook',
                        salary: '\$180,00/year',
                        textPosition: 'Software Engineer',
                        textlocation: 'California, USA',
                        wrap1: 'IT',
                        wrap2: 'Full-Time',
                        wrap3: 'Junior',
                      );
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
                          textColor: Style.primaryColor,
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
                          width: 280.w,
                          height: 74.h,
                          margin: const EdgeInsets.only(bottom: 16),
                          decoration: BoxDecoration(
                            color: Theme.of(context).primaryColor,
                            borderRadius: BorderRadius.circular(24),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(top: 16),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                25.horizontalSpace,
                                Image.network(
                                  'https://www.pngall.com/wp-content/uploads/12/Burger-King-PNG-Photo.png',
                                  height: 45,
                                  width: 45,
                                ),
                                16.horizontalSpace,
                                Text(
                                  'Jr Executive',
                                  style: Theme.of(context).textTheme.titleSmall,
                                ),
                              ],
                            ),
                          ));
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
