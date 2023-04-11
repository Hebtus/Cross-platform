// ignore_for_file: avoid_unnecessary_containers, sort_child_properties_last, unused_import
import 'package:flutter/material.dart';
import 'package:hebtus_crossplatform/components/app_bar.dart';
import 'package:hebtus_crossplatform/screens/EventsPage/components/events_description.dart';
import 'package:hebtus_crossplatform/screens/EventsPage/components/events_image.dart';
import 'package:hebtus_crossplatform/screens/EventsPage/components/events_info.dart';
import 'package:hebtus_crossplatform/screens/EventsPage/components/events_time_place.dart';
import 'package:hebtus_crossplatform/screens/EventsPage/components/events_get_ticket.dart';
class EventsScreen extends StatelessWidget {
  const EventsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: MainAppBar(context),
        bottomSheet: TicketBottomSheet(),
        body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Container(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 300,
                      decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.5),
                        borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(30),
                            bottomRight: Radius.circular(30)),
                        image: EventImage(context),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(5),
                      child: FittedBox(
                          fit: BoxFit.contain,
                          child: Row(
                            children: const [
                              
                              Padding(
                                padding: EdgeInsets.all(5),
                                child: Text(
                                  "Ticket sales end soon",
                                  style: TextStyle(fontSize: 25),
                                ),
                              )
                            ],
                          )),
                      margin: const EdgeInsets.only(top: 40, left: 20),
                      width: 150,
                      height: 30,
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 200, 235, 176),
                          borderRadius: BorderRadius.circular(20)),
                    ),
                    Container(
                      child: const FittedBox(
                        fit: BoxFit.none,
                        child: Text(
                          "Just Added",
                          style: TextStyle(fontSize: 12),
                        ),
                      ),
                      margin: const EdgeInsets.only(top: 20, left: 20),
                      width: 150,
                      height: 30,
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 226, 176, 235),
                          borderRadius: BorderRadius.circular(20)),
                    ),
                    const EventInfo(),
                   const EventTimePlace(),
                   const EventDescription(),
                   SizedBox(
                    height: 150,
                   )
                   
                  ]),
            )),
      ),
    );
  }
}
