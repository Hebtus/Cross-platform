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
       DateTime? todaystartdate, DateTime? todayenddate,double ?long,double ?lat,
      bool? online,
      bool? free,
      String? address}) rebuildLandingPage;
  const NavBar({super.key, required this.rebuildLandingPage});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 8,
      child: Container(
          width: MediaQuery.of(context).size.width * 0.9,
          margin: const EdgeInsets.only(top: 20, left: 10),
          child: TabBar(
          unselectedLabelColor: Colors.white.withOpacity(0.3),
          indicatorColor:Colors.transparent,
            tabs: [
              Container(
                  width: 60,
                  child: Tab(
                    child: FittedBox(
                      child: TextButton(
                        onPressed: () {
                          rebuildLandingPage(category: "null");
                        
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
                          DateTime now = DateTime.now();
       DateTime startOfDay = DateTime(now.year, now.month, now.day);
       DateTime endOfDay = startOfDay.add(const Duration(days: 1)).subtract(const Duration(milliseconds: 1));
                          rebuildLandingPage(
                            todaystartdate: startOfDay,todayenddate: endOfDay
                          );
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
                          DateTime now = DateTime.now();
  DateTime startOfWeekend = now.subtract(Duration(days: now.weekday - 6));
  DateTime endOfWeekend = startOfWeekend.add(Duration(days: 1)).subtract(Duration(milliseconds: 1));

                          rebuildLandingPage(todaystartdate: startOfWeekend,todayenddate: endOfWeekend);
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
                          rebuildLandingPage(online:true);
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
