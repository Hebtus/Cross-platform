// ignore_for_file: must_be_immutable, sized_box_for_whitespace, unused_import

import 'package:flutter/material.dart';
import 'package:hebtus_crossplatform/globals/globals.dart';
import 'package:hebtus_crossplatform/services/attendee_service.dart';
import '../../../models/attendee_event.dart';
import 'package:hebtus_crossplatform/screens/landingpage/components/location.dart';

///This class returns the navigation bar for choosing events according to different categories

class NavBar extends StatelessWidget {
  final void Function(
      {String? category,
      String? date,
      bool? online,
      bool? free}) rebuildLandingPage;
  const NavBar({super.key, required this.rebuildLandingPage});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 8,
      child: Container(
          width: MediaQuery.of(context).size.width * 0.9,
          margin: const EdgeInsets.only(top: 20, left: 10),
          child: TabBar(
            tabs: [
              Container(
                  width: 60,
                  child: Tab(
                    child: FittedBox(
                      child: TextButton(
                        onPressed: () {
                          rebuildLandingPage(category: "All");
                        },
                        child: const Text(
                          "All",
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ),
                  )),
              Container(
                  width: 60,
                  child: Tab(
                    child: FittedBox(
                      child: TextButton(
                        onPressed: () {
                          rebuildLandingPage(category: "Music");
                        },
                        child: const Text(
                          "Music",
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ),
                  )),
              Container(
                  width: 100,
                  child: Tab(
                    child: FittedBox(
                      child: TextButton(
                        onPressed: () {
                          rebuildLandingPage(category: "Food & Drink");
                        },
                        child: const Text(
                          "Food & Drink",
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ),
                  )),
              Container(
                  width: 120,
                  child: Tab(
                    child: FittedBox(
                      child: TextButton(
                        onPressed: () {
                          rebuildLandingPage(category: "Charity & Causes");
                        },
                        child: const Text(
                          "Charity & Causes",
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ),
                  )),
              Container(
                  width: 120,
                  child: Tab(
                    child: FittedBox(
                      child: TextButton(
                        onPressed: () {
                          rebuildLandingPage(date: "Today");
                        },
                        child: const Text(
                          "Today",
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ),
                  )),
              Container(
                  width: 120,
                  child: Tab(
                    child: FittedBox(
                      child: TextButton(
                        onPressed: () {
                          rebuildLandingPage(date: "This Weekend");
                        },
                        child: const Text(
                          "This Weekend",
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ),
                  )),
              Container(
                  width: 120,
                  child: Tab(
                    child: FittedBox(
                      child: TextButton(
                        onPressed: () {
                          rebuildLandingPage(free: true);
                        },
                        child: const Text(
                          "Free",
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ),
                  )),
              Container(
                  width: 120,
                  child: Tab(
                    child: FittedBox(
                      child: TextButton(
                        onPressed: () {
                          rebuildLandingPage(online: true);
                        },
                        child: const Text(
                          "Online",
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ),
                  )),
            ],
            isScrollable: true,
            padding: const EdgeInsets.only(right: 10),
          )),
    );
  }
}
