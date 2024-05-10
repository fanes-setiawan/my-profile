import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:myprofile/src/constant/colors/myColors.dart';

import '../../../constant/font/fonts.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
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
                                        "          I am a Mobile Developer, I have expertise in developing mobile applications using the latest technology, with a focus on using Flutter. I can build powerful and engaging mobile applications with responsive user interfaces. My expertise also includes integrating applications with backend APIs and building advanced features such as data management and notifications.\n\n  Additionally, I have experience working in a team and collaborating with UI/UX designers and backend developers. I am always open to learning new things and adapting to industry developments. My dedication is to provide creative solutions and optimal performance in every project I work on. I'm excited to join your team and bring your vision of successful mobile app development to life."),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: 20.0,
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height / 2,
                          width: MediaQuery.of(context).size.height / 2,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(
                                'images/profile.png',
                              ),
                            ),
                            borderRadius: BorderRadius.all(
                              Radius.circular(
                                1000.0,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 100.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 200, right: 200),
                      child: GridView.builder(
                        padding: EdgeInsets.zero,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          childAspectRatio: 1.0,
                          crossAxisCount: 3,
                          mainAxisSpacing: 6,
                          crossAxisSpacing: 6,
                        ),
                        itemCount: 3,
                        shrinkWrap: true,
                        physics: ScrollPhysics(),
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            color: Colors.orange,
                            child: Column(
                              children: [],
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
