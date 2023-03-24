// ignore_for_file: sized_box_for_whitespace, duplicate_ignore

import 'package:flutter/material.dart';
import 'package:hebtus_crossplatform/components/app_bar.dart';
import 'package:hebtus_crossplatform/screens/LandingPage/components/location.dart';
import 'package:hebtus_crossplatform/screens/LandingPage/components/cover_image.dart';
import 'package:hebtus_crossplatform/screens/LandingPage/components/tab_bar.dart';
import 'package:hebtus_crossplatform/screens/LandingPage/components/categories.dart';
import 'package:hebtus_crossplatform/screens/LandingPage/components/event_list.dart';

class LandingPageScreen extends StatelessWidget {
  const LandingPageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Scaffold(
          appBar: mainappbar(),
          body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Coverimage(),
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
                  Tabbar(),
                  Padding(
                    padding: const EdgeInsets.only(left: 30, top: 30),
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
                    physics: NeverScrollableScrollPhysics(),
                    children: [
                      eventcard(num: 0),
                      eventcard(num: 1),
                      eventcard(num: 2),
                      eventcard(num: 3),
                      eventcard(num: 4),
                      eventcard(num: 5),
                    ],
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: ElevatedButton(
                          onPressed: () {},
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
