import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:one_work/controller/auth_controller.dart';
import 'package:one_work/view/domen/components/custom_textfromfiled.dart';
import 'package:one_work/view/pages/auth/register_page.dart';
import 'package:one_work/view/style/style.dart';
import 'package:provider/provider.dart';
import '../../domen/components/home_page_featured_jobs.dart';
import '../../domen/service/local_store.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late TextEditingController homeController;

  @override
  void initState() {
     homeController = TextEditingController();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      context.read<AuthController>().getUser(context);
        var refreshToken = await LocalStore.getRefreshToken();
      print("refreshToken : $refreshToken");
     
    });
    super.initState();
  }

  @override
  void dispose() {
    homeController.dispose();
    super.dispose();
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
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/2.png',
                height: 104,
                width: 104,
              ),
              12.verticalSpace,
              // Text(context.watch<AuthController>().email),
              Text(
                'someone email',
                style: Theme.of(context).textTheme.displaySmall,
              ),
              Text(
                'Job Position',
                style:
                    Style.textStyleRegular2(size: 13, textColor: Colors.grey),
              ),
              Text(
                'View Profile',
                style: Style.textStyleRegular2(
                    size: 14, textColor: Style.primaryColor),
              ),
              40.verticalSpace,
              Padding(
                padding: const EdgeInsets.only(left: 40),
                child: Row(
                  children: [
                    const Icon(Icons.info_outlined),
                    16.horizontalSpace,
                    Text(
                      'Personal Info',
                      style: Theme.of(context).textTheme.displaySmall,
                    )
                  ],
                ),
              ),
              28.verticalSpace,
              Padding(
                padding: const EdgeInsets.only(left: 40),
                child: Row(
                  children: [
                    const Icon(Icons.list_alt),
                    16.horizontalSpace,
                    Text(
                      'Applications',
                      style: Theme.of(context).textTheme.displaySmall,
                    )
                  ],
                ),
              ),
              79.verticalSpace,
              Padding(
                padding: const EdgeInsets.only(left: 40),
                child: Row(
                  children: [
                    const Icon(Icons.insert_drive_file_outlined),
                    16.horizontalSpace,
                    Text(
                      'Resumes',
                      style: Theme.of(context).textTheme.displaySmall,
                    )
                  ],
                ),
              ),
              28.verticalSpace,
              Padding(
                padding: const EdgeInsets.only(left: 40),
                child: Row(
                  children: [
                    const Icon(Icons.work_outline),
                    16.horizontalSpace,
                    Text(
                      'Portfolio',
                      style: Theme.of(context).textTheme.displaySmall,
                    )
                  ],
                ),
              ),
              79.verticalSpace,
              Padding(
                padding: const EdgeInsets.only(left: 40),
                child: Row(
                  children: [
                    const Icon(Icons.settings),
                    16.horizontalSpace,
                    Text(
                      'Settings',
                      style: Theme.of(context).textTheme.displaySmall,
                    )
                  ],
                ),
              ),
              28.verticalSpace,
              Padding(
                padding: const EdgeInsets.only(left: 40),
                child: Row(
                  children: [
                    const Icon(
                      Icons.logout,
                      color: Colors.red,
                    ),
                    16.horizontalSpace,
                    GestureDetector(
                      onTap: () {
                        context.read<AuthController>().logOut();
                        Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(
                                builder: (_) => const RegisterPage()),
                            (route) => false);
                      },
                      child: Text('Logout',
                          style: Style.textStyleRegular2(
                              size: 17, textColor: Colors.red)),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
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
                        label: 'Search a job or position',
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
                  height: 190.w,
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
                        child: Container(
                            margin: const EdgeInsets.only(bottom: 17),
                            width: 280.w,
                            height: 74.h,
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
                                    style:
                                        Theme.of(context).textTheme.titleSmall,
                                  ),
                                ],
                              ),
                            )),
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
