// ignore_for_file: prefer_const_constructors

import 'package:day_night_switcher/day_night_switcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:one_work/controller/auth_controller.dart';
import 'package:one_work/view/components/custom_textfromfiled.dart';
import 'package:one_work/view/style/style.dart';
import 'package:provider/provider.dart';
import '../../../main.dart';
import '../../components/drawer_column.dart';
import '../../components/home_page_featured_jobs.dart';
import '../../../domen/service/local_store.dart';
import '../../components/popular_jobs_home.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late TextEditingController homeController;
  bool isChangedTheme = true;

  @override
  void initState() {
    homeController = TextEditingController();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      context.read<AuthController>().getUser(context);
      var refreshToken = await LocalStore.getRefreshToken();
      getInfo();
      print("refreshToken : $refreshToken");
    });
    super.initState();
  }

  @override
  void dispose() {
    homeController.dispose();
    super.dispose();
  }

  getInfo() async {
    isChangedTheme = await LocalStore.getTheme();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final state = context.watch<AuthController>();
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
      drawer: Drawer(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        child: SafeArea(
            child: DrawerColumn(
          image: 'assets/images/2.png',
          name: '${state.profile?.id}',
          switcher: DayNightSwitcher(
            isDarkModeEnabled: !isChangedTheme,
            onStateChanged: (isDarkModeEnabled) {
              isChangedTheme = !isChangedTheme;
              MyApp.of(context)!.change();
              LocalStore.setTheme(isChangedTheme);
              setState(() {});
            },
          ),
        )),
      ),
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
                        fillColor: const Color(0xffF2F2F3),
                        filled: true,
                        controller: homeController,
                        suffixicon: const Icon(Icons.search),
                        label: 'Search',
                        hintext: '',
                        isObscure: false,
                      ),
                    ),
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.only(right: 24),
                      child: Container(
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
                      child: Padding(
                        padding: const EdgeInsets.only(right: 24),
                        child: Text(
                          'See all',
                          style: Style.textStyleRegular(
                            size: 14,
                            textColor: Style.greyColor90,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                20.verticalSpace,
                SizedBox(
                  height: 200.w,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return FeaturedJobs(
                        index: index,
                        imageLogoCompany:
                            'https://upload.wikimedia.org/wikipedia/commons/thumb/0/05/Facebook_Logo_%282019%29.png/1024px-Facebook_Logo_%282019%29.png',
                        companyName: 'Facebook',
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
                      child: Padding(
                        padding: const EdgeInsets.only(right: 24),
                        child: Text(
                          'See all',
                          style: Style.textStyleRegular(
                            size: 14,
                            textColor: Style.greyColor90,
                          ),
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
                      return Padding(
                        padding: const EdgeInsets.only(right: 24),
                        child: PopularJobs(
                          image:
                              'https://www.pngall.com/wp-content/uploads/12/Burger-King-PNG-Photo.png',
                          location: 'Los Angels, US',
                          price: '\$96,000/y',
                          text: 'Jr Executive',
                          title: 'Burger King',
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
