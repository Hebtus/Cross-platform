// ignore_for_file: sized_box_for_whitespace, must_be_immutable

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../models/events.dart';

/// This class returns cards of events
class EventCard extends StatelessWidget {
  int num;
  EventCard({super.key, required this.num});

  List<Events> eventlist = [
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
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(left: 10, right: 30),
        height: double.infinity,
        child: Card(
          clipBehavior: Clip.hardEdge,
          color: const Color.fromARGB(255, 255, 249, 249),
          child: InkWell(
              splashColor: const Color.fromARGB(255, 250, 195, 188),
              onTap: () {
                return context.go("/events");
              },
              child: Container(
                  height: double.infinity,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image(
                          image: AssetImage(eventlist[num].eventimage),
                          fit: BoxFit.cover,
                        ),
                        SizedBox(
                          width: 250,
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: 10, left: 9, right: 8),
                            child: FittedBox(
                                fit: BoxFit.fitWidth,
                                child: Text(
                                  eventlist[num].eventname,
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
                                  eventlist[num].eventtime,
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
                                  eventlist[num].eventlocation,
                                  style: const TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                      color:
                                          Color.fromARGB(255, 138, 136, 136)),
                                )),
                          ),
                        ),
                        SizedBox(
                          width: 90,
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: 7, left: 9, right: 8),
                            child: FittedBox(
                                fit: BoxFit.scaleDown,
                                child: Text(
                                  eventlist[num].eventorg,
                                  style: const TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),
                                )),
                          ),
                        ),
                        SizedBox(
                          width: 90,
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: 7, left: 9, right: 8),
                            child: FittedBox(
                                fit: BoxFit.contain,
                                child: Text(
                                  eventlist[num].eventfollowers,
                                )),
                          ),
                        ),
                      ]))),
        ));
  }
}
