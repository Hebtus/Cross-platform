// ignore_for_file: must_be_immutable, sized_box_for_whitespace, unused_import

import 'package:flutter/material.dart';
import 'package:hebtus_crossplatform/globals/globals.dart';
import 'package:hebtus_crossplatform/services/attendee_service.dart';
import '../../../models/attendee_event.dart';
import 'package:hebtus_crossplatform/screens/landingpage/components/location.dart';

///This class returns the navigation bar for choosing events according to different categories

class NavBar extends StatelessWidget {
  List<Widget> tablist = [
    Container(
        width: 60,
        child: Tab(
          child: FittedBox(
            child: TextButton(
              onPressed: () async {
                AttendeeService attendeeService = AttendeeService();
                eventlist = await attendeeService.getEvents();
                print(eventlist);
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
                eventlist = attendeedata?.getEvents(
                    category: "Music",
                    latitude: latitude_v,
                    longitude: longitude_v) as List<AttendeeEvent>?;
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
                print(latitude_v);
                eventlist = attendeedata?.getEvents(
                    category: "Food & Drink",
                    latitude: latitude_v,
                    longitude: longitude_v) as List<AttendeeEvent>?;
                print(eventlist);
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
                eventlist = attendeedata?.getEvents(
                    category: "Charity & Causes",
                    latitude: latitude_v,
                    longitude: longitude_v) as List<AttendeeEvent>?;
              },
              child: const Text(
                "Charity & Causes",
                style: TextStyle(color: Colors.black),
              ),
            ),
          ),
        )),
  ];

  NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tablist.length,
      child: Container(
          width: MediaQuery.of(context).size.width * 0.9,
          margin: const EdgeInsets.only(top: 20, left: 10),
          child: TabBar(
            tabs: tablist,
            isScrollable: true,
            padding: const EdgeInsets.only(right: 10),
          )),
    );
  }
}
