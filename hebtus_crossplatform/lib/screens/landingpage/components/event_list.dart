// ignore_for_file: sized_box_for_whitespace, must_be_immutable, unused_import

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hebtus_crossplatform/models/attendee_event.dart';
import 'package:hebtus_crossplatform/services/attendee_service.dart';
import '../../../models/events.dart';
import 'package:hebtus_crossplatform/globals/globals.dart';

/// This class returns cards of events
class EventCard extends StatelessWidget {
  final List<AttendeeEvent> events;
  final int num;
  const EventCard({super.key, required this.num, required this.events});
  /*List<Events> eventlist = [
    Events(
        "assets/images/foodtruck.jpg",
        "Celebrating Century:Presidency University",
        "Today at 7:00 PM",
        "The Great Pyramid of Giza",
        "EZZ event riders",
        "20k followers"),
    Events(
        "assets/images/opendoors.jpg",
        "Open doors:come and win free course-GOMYCODE Egypt",
        "Tue,Mar28,2:00 PM",
        "GOMYCODE DOkki",
        "GoMyCode",
        "26k followers"),
    Events(
        "assets/images/chatbot.jpg",
        "Free workshop: build your own chatbot in 21h",
        "sun,Mar26,2:00 PM",
        "GOMYCODE DOkki",
        "GoMyCode",
        "26k followers"),
    Events(
        "assets/images/canada.jpg",
        "Canada Immigration : Live Q&A",
        "thus,Mar30,1:00 PM",
        "Gizza governorate",
        "free organizers",
        "26k followers"),
    Events(
        "assets/images/fayoum.jpg",
        "AfricArena 2023 VC Unconference Weekend",
        "sat,apr 29,3:00 PM",
        "Lazib Inn resort and spa",
        "AfricArena",
        "16k followers"),
    Events(
        "assets/images/egypt.jpg",
        "Egypt stargate pilgrimage golden universe temples",
        "sat,nov 3,4:00 PM",
        "Egypt,Giza",
        "Jennifer Ashira Ra",
        "606 followers"),
  ];*/

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    if (events.isNotEmpty) {
      return Container(
          margin: const EdgeInsets.only(left: 10, right: 30),
          height: double.infinity,
          child: Card(
            clipBehavior: Clip.hardEdge,
            color: const Color.fromARGB(255, 255, 249, 249),
            child: InkWell(
                splashColor: const Color.fromARGB(255, 250, 195, 188),
                onTap: () {
                  print(events[num].eventID);
                  ad?.eventID = "1";
                  return context.go("/events");
                },
                child: Container(
                    height: double.infinity,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image(
                            image: NetworkImage(events[num].imgURL),
                            fit: BoxFit.contain,
                            width: mediaQuery.size.width,
                          ),
                          SizedBox(
                            width: 250,
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  top: 10, left: 9, right: 8),
                              child: FittedBox(
                                  fit: BoxFit.fitWidth,
                                  child: Text(
                                    events[num].eventName,
                                    style: const TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold),
                                  )),
                            ),
                          ),
                          SizedBox(
                            width: 90,
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  top: 7, left: 9, right: 8),
                              child: FittedBox(
                                  fit: BoxFit.fitWidth,
                                  child: Text(
                                    events[num].startTime.toString(),
                                    style: const TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                        color: Color.fromARGB(255, 238, 97, 2)),
                                  )),
                            ),
                          ),
                          SizedBox(
                            width: 100,
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  top: 7, left: 9, right: 8),
                              child: FittedBox(
                                  fit: BoxFit.fitWidth,
                                  child: Text(
                                    events[num].locationName,
                                    style: const TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                        color:
                                            Color.fromARGB(255, 138, 136, 136)),
                                  )),
                            ),
                          ),
                        ]))),
          ));
    } else {
      return Container(
        child: const Center(child: Text("No events available")),
      );
    }
  }
}
