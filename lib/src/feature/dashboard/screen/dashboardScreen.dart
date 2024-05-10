// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:myprofile/src/constant/colors/myColors.dart';
import 'package:myprofile/src/feature/dashboard/controller/dashboardController.dart';

import '../../../constant/font/fonts.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
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
    return DefaultTabController(
      length: 3,
      animationDuration: Durations.extralong4,
      child: Scaffold(
        backgroundColor: MyColors().black,
        appBar: AppBar(
          backgroundColor: MyColors().black,
          title: tittletext('Profile'),
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: MenuBar(
                children: <Widget>[
                  SubmenuButton(
                    menuChildren: <Widget>[
                      MenuItemButton(
                        onPressed: () {},
                        child: const MenuAcceleratorLabel('&Save'),
                      ),
                      MenuItemButton(
                        onPressed: () {},
                        child: const MenuAcceleratorLabel('&Quit'),
                      ),
                      MenuItemButton(
                        onPressed: () {},
                        child: const MenuAcceleratorLabel('&About'),
                      ),
                    ],
                    child: const MenuAcceleratorLabel('&File'),
                  ),
                  SubmenuButton(
                    menuChildren: <Widget>[
                      MenuItemButton(
                        onPressed: () {},
                        child: const MenuAcceleratorLabel('&Magnify'),
                      ),
                      MenuItemButton(
                        onPressed: () {},
                        child: const MenuAcceleratorLabel('Mi&nify'),
                      ),
                    ],
                    child: const MenuAcceleratorLabel('&View'),
                  ),
                ],
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              titleBold(
                                title: "Fanes Setiawan",
                                fontSize: 100,
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width / 2,
                                child: readMore(
                                    title:
                                        "         I am a Mobile Developer, I have expertise in developing mobile applications using the latest technology, with a focus on using Flutter. I can build powerful and engaging mobile applications with responsive user interfaces. My expertise also includes integrating applications with backend APIs and building advanced features such as data management and notifications.\n\n  Additionally, I have experience working in a team and collaborating with UI/UX designers and backend developers. I am always open to learning new things and adapting to industry developments. My dedication is to provide creative solutions and optimal performance in every project I work on. I'm excited to join your team and bring your vision of successful mobile app development to life."),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: 20.0,
                        ),
                        Column(
                          children: [
                            Container(
                              height: MediaQuery.of(context).size.height / 2,
                              width: MediaQuery.of(context).size.height / 2,
                              decoration: BoxDecoration(
                                color: MyColors().white,
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(
                                    1000.0,
                                  ),
                                ),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(1000.0),
                                child: Image.network(
                                  "https://i.ibb.co/G7f2b9c/profile.png",
                                  loadingBuilder: (context, child, progress) {
                                    if (progress == null) {
                                      return child;
                                    }
                                    return Center(
                                      child: CircularProgressIndicator(
                                        value: progress.expectedTotalBytes !=
                                                null
                                            ? progress.cumulativeBytesLoaded /
                                                int.parse(progress
                                                    .expectedTotalBytes
                                                    .toString())
                                            : null,
                                      ),
                                    );
                                  },
                                  errorBuilder: (context, error, stackTrace) {
                                    return Icon(Icons.error);
                                  },
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 50.0,
                            ),
                            Container(
                              child: Row(
                                children: [
                                  IconButton(
                                    onPressed: () {},
                                    icon: const Icon(
                                      Icons.telegram,
                                      size: 45.0,
                                    ),
                                  ),
                                  IconButton(
                                    onPressed: () {},
                                    icon: const Icon(
                                      Icons.email,
                                      size: 45.0,
                                    ),
                                  ),
                                  IconButton(
                                    onPressed: () {},
                                    icon: const Icon(
                                      Icons.chat_bubble_outline,
                                      size: 45.0,
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                    boldtext('PORTOFOLIO'),
                    const SizedBox(
                      height: 50.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 200, right: 200),
                      child: GridView.builder(
                        padding: EdgeInsets.zero,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          childAspectRatio: 1.0,
                          crossAxisCount: 3,
                          mainAxisSpacing: 10,
                          crossAxisSpacing: 30,
                        ),
                        itemCount: _controller!.dataPorto.length,
                        shrinkWrap: true,
                        physics: const ScrollPhysics(),
                        itemBuilder: (BuildContext context, int index) {
                          var data = _controller!.dataPorto[index];
                          return Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              image: DecorationImage(
                                image: NetworkImage(data['urlImage']),
                                fit: BoxFit.cover,
                              ),
                            ),
                            margin: const EdgeInsets.only(left: 13),
                            child: Stack(
                              children: [
                                Positioned(
                                  bottom: 0,
                                  child: ClipRRect(
                                    borderRadius: const BorderRadius.only(
                                      bottomLeft: Radius.circular(10),
                                      bottomRight: Radius.circular(10),
                                    ),
                                    child: BackdropFilter(
                                      filter: ImageFilter.blur(
                                          sigmaX: 3, sigmaY: 3),
                                      child: Container(
                                        padding: const EdgeInsets.all(5),
                                        height: 75,
                                        width:
                                            MediaQuery.of(context).size.width /
                                                4,
                                        color: Colors.black
                                            .withOpacity(0.2), // Warna filter
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            normaltext(data['title']),
                                            showSnackBarText(data['detail']),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 100,
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(),
                child: Center(
                  child: InkWell(
                      onTap: () {},
                      child: datetext("https://github.com/fanes-setiawan")),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
