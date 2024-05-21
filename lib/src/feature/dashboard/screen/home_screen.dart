import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myprofile/src/constant/colors/myColors.dart';
import 'package:myprofile/src/feature/dashboard/controller/dashboardController.dart';

import '../../../constant/font/fonts.dart';
import '../../widget/hoverable_card.dart';
import '../../widget/widget_card_project.dart';
import '../../widget/widget_experti_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  dashboardController? _controller;

  @override
  void initState() {
    _controller = dashboardController(setState: setState);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const colorizeColors = [
      Colors.white,
      Colors.blue,
      Colors.yellow,
      Colors.red,
    ];

    final colorizeTextStyle = TextStyle(
      decoration: TextDecoration.none,
      fontFamily: 'Roboto',
      fontSize: MediaQuery.of(context).size.width < 600 ? 25.sp : 18.sp,
      fontWeight: FontWeight.bold,
    );

    return Scaffold(
      backgroundColor: MyColors().black,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    "assets/images/background.png",
                  ),
                  fit: BoxFit.cover,
                ),
              ),
              child: Stack(
                children: [
                  Positioned(
                    right: 20.w,
                    top: 20.h,
                    child: Row(
                      children: [
                        TextButton.icon(
                          onPressed: () {},
                          icon: Icon(
                            Icons.home_rounded,
                            size: MediaQuery.of(context).size.width < 600
                                ? 8.sp
                                : 5.sp,
                          ),
                          label: Text("home",
                              style: TextStyle(
                                fontSize:
                                    MediaQuery.of(context).size.width < 600
                                        ? 8.sp
                                        : 5.sp,
                              )),
                        ),
                        TextButton.icon(
                          onPressed: () {},
                          icon: Icon(
                            Icons.polymer_outlined,
                            size: MediaQuery.of(context).size.width < 600
                                ? 8.sp
                                : 5.sp,
                          ),
                          label: Text("expertise",
                              style: TextStyle(
                                fontSize:
                                    MediaQuery.of(context).size.width < 600
                                        ? 8.sp
                                        : 5.sp,
                              )),
                        ),
                        TextButton.icon(
                          onPressed: () {},
                          icon: Icon(
                            Icons.contact_page,
                            size: MediaQuery.of(context).size.width < 600
                                ? 8.sp
                                : 5.sp,
                          ),
                          label: Text("contact",
                              style: TextStyle(
                                fontSize:
                                    MediaQuery.of(context).size.width < 600
                                        ? 8.sp
                                        : 5.sp,
                              )),
                        ),
                      ],
                    ),
                  ),
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 80.sp,
                          width: 80.sp,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage("assets/images/profile.png"),
                              fit: BoxFit.cover,
                            ),
                            borderRadius: BorderRadius.all(
                              Radius.circular(50.0),
                            ),
                          ),
                        ),
                        SizedBox(
                          child: AnimatedTextKit(
                            animatedTexts: [
                              ColorizeAnimatedText(
                                'FANES SETIAWAN',
                                textStyle: colorizeTextStyle,
                                colors: colorizeColors,
                              ),
                            ],
                            isRepeatingAnimation: true,
                            onTap: () {
                              print("Tap Event");
                            },
                          ),
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.phone_android_rounded,
                              size: MediaQuery.of(context).size.width < 600
                                  ? 15.sp
                                  : 11.sp,
                              color: MyColors().white,
                            ),
                            SizedBox(width: 5.w),
                            AnimatedTextKit(
                              pause: const Duration(milliseconds: 2000),
                              animatedTexts: [
                                TypewriterAnimatedText(
                                  'Mobile Developer',
                                  textStyle: TextStyle(
                                    decoration: TextDecoration.none,
                                    fontFamily: 'Roboto Mono',
                                    color: Colors.white.withOpacity(0.9),
                                    fontSize:
                                        MediaQuery.of(context).size.width < 600
                                            ? 15.sp
                                            : 11.sp,
                                    letterSpacing: 1.25,
                                  ),
                                ),
                              ],
                              onTap: () {
                                print("Tap Event");
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 20.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  boldtext(
                    title: "My Expertise",
                    fontSize: MediaQuery.of(context).size.width < 600
                        ? 24.sp
                        : 20.sp, // Menyesuaikan ukuran font berdasarkan lebar layar
                  ),
                  SizedBox(height: 20.h),
                  Wrap(
                    spacing: 20.w,
                    runSpacing: 20.h,
                    alignment: WrapAlignment.center,
                    children: [
                      buildExpertiseCard(
                        context,
                        title: "Skills",
                        iconPath: 'assets/icons/skil.svg',
                        content: '''
                          <
                          Dart Programming
                          Flutter Framework
                          RESTful API Integration
                          Git Version Control
                          Firebase Integration
                          />
                        ''',
                      ),
                      buildExpertiseCard(
                        context,
                        title: "Flutter Dev",
                        iconPath: 'assets/icons/flutter.svg',
                        content: '''
                          <
                          Skilled in developing
                          hybrid mobile apps and
                          cross-platform solutions
                          using the Flutter
                          framework.
                          />
                        ''',
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.all(20.w),
              child: StreamBuilder(
                stream:
                    _controller!.databaseReference.child('portfolio').onValue,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  }

                  if (!snapshot.hasData ||
                      snapshot.data!.snapshot.value == null) {
                    return const Center(child: Text('No data available.'));
                  }

                  Map<dynamic, dynamic> data =
                      snapshot.data!.snapshot.value as Map<dynamic, dynamic>;
                  List<Map<dynamic, dynamic>> items = [];

                  data.forEach((key, value) {
                    Map<dynamic, dynamic> item = value as Map<dynamic, dynamic>;
                    item['key'] = key;
                    items.add(item);
                  });

                  items = items.reversed.toList();

                  return GridView.builder(
                    padding: EdgeInsets.zero,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: 1.0,
                      crossAxisCount: MediaQuery.of(context).size.width < 600
                          ? 2
                          : 3, // Menyesuaikan jumlah kolom berdasarkan lebar layar
                      mainAxisSpacing: 10.h,
                      crossAxisSpacing: 10.w,
                    ),
                    itemCount: items.length,
                    shrinkWrap: true,
                    physics: const ScrollPhysics(),
                    itemBuilder: (BuildContext context, int index) {
                      return HoverableCard(
                        child: WidgetCardProject(
                          items: items,
                          index: index,
                        ),
                      );
                    },
                  );
                },
              ),
            ),
            Container(
              padding: EdgeInsets.all(
                  MediaQuery.of(context).size.width < 600 ? 20.w : 5.w),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.2),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () {
                          _controller!.openInstagram();
                        },
                        child: Row(
                          children: [
                            SvgPicture.asset(
                              'assets/icons/instagram.svg',
                              color: Colors.white,
                              height: 20.h,
                            ),
                            SizedBox(width: 10.w),
                            overviewtext('Instagram'),
                          ],
                        ),
                      ),
                      SizedBox(height: 10.h),
                      GestureDetector(
                        onTap: () {
                          _controller!.openLinkedIn();
                        },
                        child: Row(
                          children: [
                            SvgPicture.asset(
                              'assets/icons/linkedin.svg',
                              color: Colors.white,
                              height: 20.h,
                            ),
                            SizedBox(width: 10.w),
                            overviewtext('Linkedin'),
                          ],
                        ),
                      ),
                      SizedBox(height: 10.h),
                      GestureDetector(
                        onTap: () {
                          _controller!.openGitHub();
                        },
                        child: Row(
                          children: [
                            SvgPicture.asset(
                              'assets/icons/github.svg',
                              color: Colors.white,
                              height: 20.h,
                            ),
                            SizedBox(width: 10.w),
                            overviewtext('Github'),
                          ],
                        ),
                      ),
                      SizedBox(height: 10.h),
                      GestureDetector(
                        onTap: () {
                          _controller!.openWhatsApp();
                        },
                        child: Row(
                          children: [
                            SvgPicture.asset(
                              'assets/icons/whatsapp.svg',
                              color: Colors.white,
                              height: 20.h,
                            ),
                            SizedBox(width: 10.w),
                            overviewtext('Whatsapp'),
                          ],
                        ),
                      ),
                    ],
                  ),
                  overviewtext("fanessetiawan.1401@gmail.com"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
