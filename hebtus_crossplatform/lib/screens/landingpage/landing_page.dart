// ignore_for_file: sized_box_for_whitespace, duplicate_ignore, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hebtus_crossplatform/components/app_bar.dart';
import 'package:hebtus_crossplatform/screens/LandingPage/components/location.dart';
import 'package:hebtus_crossplatform/screens/landingpage/components/cover_image.dart';
import 'package:hebtus_crossplatform/screens/landingpage/components/tab_bar.dart';
import 'package:hebtus_crossplatform/screens/LandingPage/components/categories.dart';
import 'package:hebtus_crossplatform/screens/landingpage/components/event_list.dart';

class LandingPageScreen extends StatelessWidget {
  const LandingPageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Scaffold(
          appBar: MainAppBar(context),
          body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CoverImage(),
                  const Padding(
                    padding: EdgeInsets.only(top: 15, left: 15),
                    child: Text(
                      "Popular in",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  const Location(),
                  NavBar(),
                  const Padding(
                    padding: EdgeInsets.only(left: 30, top: 30),
                    child: Text(
                      "Check out trending categories",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const Categories(),
                  const Padding(
                    padding: EdgeInsets.all(20),
                    child: Text(
                      "Events in Cairo",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  GridView.count(
                    childAspectRatio: 0.85,
                    crossAxisCount: (MediaQuery.of(context).orientation ==
                            Orientation.landscape)
                        ? 4
                        : 2,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 1,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      for (var i = 0; i < 6; i++) EventCard(num: i),
                    ],
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: ElevatedButton(
                          onPressed: () {
                            return context.go("/seemore");
                          },
                          child: const Text(
                            "See more",
                            style: TextStyle(color: Colors.white),
                          )),
                    ),
                  )
                ],
              ),
            ),
          )),
    );
  }
}
