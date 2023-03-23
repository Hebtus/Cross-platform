// ignore_for_file: sized_box_for_whitespace, duplicate_ignore

import 'package:flutter/material.dart';
import 'package:hebtus_crossplatform/components/app_bar.dart';
import 'package:hebtus_crossplatform/screens/landingpage/components/location.dart';
import 'package:hebtus_crossplatform/screens/landingpage/components/cover_image.dart';
import 'package:hebtus_crossplatform/screens/landingpage/components/tab_bar.dart';
import 'package:hebtus_crossplatform/screens/landingpage/components/categories.dart';
import 'package:hebtus_crossplatform/screens/landingpage/components/event_list.dart';

class Landingpagescreen extends StatelessWidget {
  const Landingpagescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: mainappbar(),
        // ignore: sized_box_for_whitespace
        body: Container(
          height: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Coverimage(),
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
                const Padding(
                  padding: EdgeInsets.all(20),
                  child: Text(
                    "Check out trending categories",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                const Categories(),
                const Padding(
                  padding: EdgeInsets.all(20),
                  child: Text(
                    "Events in Cairo",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                Column(
                  children: [
                    Row(
                      children:  [eventcard(num: 0,), eventcard(num:1)],
                    ),
                    Row(
                      children: [eventcard(num:2), eventcard(num:3)],
                    ),
                    Row(
                      children:[eventcard(num:4), eventcard(num:5)],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15),
                      child: ElevatedButton(
                          onPressed: () {},
                          child: const Text(
                            "See more",
                            style: TextStyle(color: Colors.white),
                          )),
                    )
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
