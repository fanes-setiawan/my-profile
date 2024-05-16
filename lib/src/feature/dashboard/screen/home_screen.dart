// ignore_for_file: deprecated_member_use

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:myprofile/src/constant/colors/myColors.dart';
import 'package:myprofile/src/feature/dashboard/controller/dashboardController.dart';

import '../../../constant/font/fonts.dart';

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

    const colorizeTextStyle = TextStyle(
      decoration: TextDecoration.none,
      fontFamily: 'Roboto',
      fontSize: 65,
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
                    right: 20,
                    top: 20,
                    child: Row(
                      children: [
                        TextButton.icon(
                          onPressed: () {},
                          icon: const Icon(Icons.home_rounded),
                          label: const Text("home"),
                        ),
                        TextButton.icon(
                          onPressed: () {},
                          icon: const Icon(Icons.polymer_outlined),
                          label: const Text("expertise"),
                        ),
                        TextButton.icon(
                          onPressed: () {},
                          icon: const Icon(Icons.contact_page),
                          label: const Text("contact"),
                        ),
                      ],
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 220.0,
                        width: 220.0,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(
                              "assets/images/profile.png",
                            ),
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.all(
                            Radius.circular(
                              100.0,
                            ),
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
                            size: 24.0,
                            color: MyColors().white,
                          ),
                          AnimatedTextKit(
                            pause: const Duration(milliseconds: 2000),
                            animatedTexts: [
                              TypewriterAnimatedText(
                                'Mobile Developer',
                                textStyle: TextStyle(
                                    decoration: TextDecoration.none,
                                    fontFamily: 'Roboto Mono',
                                    color: Colors.white.withOpacity(0.9),
                                    fontSize: 20,
                                    letterSpacing: 1.25),
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
                ],
              ),
            ),
            boldtext(
              title: "My Expertise",
              fontSize: 55,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.all(15.0),
                  width: MediaQuery.of(context).size.width / 4,
                  height: 320.0,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: MyColors().white,
                      width: 2.0,
                    ),
                  ),
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            'assets/icons/skil.svg',
                            color: MyColors().white,
                          ),
                          const SizedBox(
                            width: 10.0,
                          ),
                          tittletext(
                            title: "Skills",
                            fontSize: 50,
                          ),
                        ],
                      ),
                      datetext('''
        <
        Dart Programming
        Flutter Framework
        RESTful API Integration
        Git Version Control
        Firebase Integration
        />
        '''),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(15.0),
                  width: MediaQuery.of(context).size.width / 4,
                  height: 320.0,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: MyColors().white,
                      width: 2.0,
                    ),
                  ),
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            'assets/icons/flutter.svg',
                            color: MyColors().white,
                          ),
                          const SizedBox(
                            width: 10.0,
                          ),
                          tittletext(
                            title: "Flutter Dev",
                            fontSize: 50,
                          ),
                        ],
                      ),
                      datetext('''
        <
        Skilled in developing
        hybrid mobile apps and
        cross-platform solutions
        using the Flutter
        framework.
        />
        '''),
                    ],
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 4,
                  height: 320.0,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: MyColors().white,
                      width: 2.0,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 50.0,
            ),
            Container(
              height: 200,
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.all(20.0),
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
                            ),
                            const SizedBox(
                              width: 10.0,
                            ),
                            overviewtext('Instagram'),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      GestureDetector(
                        onTap: () {
                          _controller!.openLinkedIn();
                        },
                        child: Row(
                          children: [
                            SvgPicture.asset(
                              'assets/icons/linkedin.svg',
                              color: Colors.white,
                            ),
                            const SizedBox(
                              width: 10.0,
                            ),
                            overviewtext('Linkedin'),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      GestureDetector(
                        onTap: () {
                          _controller!.openGitHub();
                        },
                        child: Row(
                          children: [
                            SvgPicture.asset(
                              'assets/icons/github.svg',
                              color: Colors.white,
                            ),
                            const SizedBox(
                              width: 10.0,
                            ),
                            overviewtext('Github'),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      GestureDetector(
                        onTap: () {
                          _controller!.openWhatsApp();
                        },
                        child: Row(
                          children: [
                            SvgPicture.asset(
                              'assets/icons/whatsapp.svg',
                              color: Colors.white,
                            ),
                            const SizedBox(
                              width: 10.0,
                            ),
                            overviewtext('Whatsapp'),
                          ],
                        ),
                      ),
                    ],
                  ),
                  datetext("fanessetiawan.1401@gmail.com"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
