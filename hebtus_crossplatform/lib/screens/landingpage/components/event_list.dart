// ignore_for_file: sized_box_for_whitespace, must_be_immutable, unused_import

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hebtus_crossplatform/models/attendee_event.dart';
import 'package:hebtus_crossplatform/services/attendee_service.dart';
import '../../../models/events.dart';
import 'package:hebtus_crossplatform/globals/globals.dart';
import 'package:hebtus_crossplatform/current_user.dart';

CurrentUser currentUser = CurrentUser();

/// This class returns cards of events
class EventCard extends StatelessWidget {
  final List<AttendeeEvent> events;
  final int num;
  const EventCard({super.key, required this.num, required this.events});
  

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
                  if(currentUser.isLoggedIn==true)
                  {
                     return context.go("/events/${events[num].eventID}");
                  }
                  else
                  {
                    return context.go("/");
                  }
                },
                child: Container(
                    height: double.infinity,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Flexible(
                            flex: 1,
                            child: Image(
                              image: NetworkImage(events[num].imgURL),
                              fit: BoxFit.contain,
                              width: mediaQuery.size.width,
                            ),
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
      return const Center(child: Text("No events available"));
    }
  }
}
