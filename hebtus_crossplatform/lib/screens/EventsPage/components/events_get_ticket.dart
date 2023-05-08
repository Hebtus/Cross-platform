// ignore_for_file: unnecessary_import, implementation_imports, unused_import

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:go_router/go_router.dart';
import 'package:hebtus_crossplatform/globals/globals.dart';
import '../../../models/attendee_event.dart';
import 'package:hebtus_crossplatform/route/router.dart';
import 'package:hebtus_crossplatform/screens/EventsPage/components/events_booking.dart';
import 'package:hebtus_crossplatform/screens/EventsPage/events_page.dart';
import '../../../models/attendee_tickets.dart';
import '../../../services/attendee_service.dart';
import 'events_tickets_choice.dart';

class TicketBottomSheet extends StatefulWidget {
  final String eventID;
  TicketBottomSheet({required this.eventID, super.key});

  @override
  State<TicketBottomSheet> createState() => _TicketBottomSheetState();
}

class _TicketBottomSheetState extends State<TicketBottomSheet> {
  late Future<List<AttendeeTicket>> ticketevent;

  @override
  void initState() {
    super.initState();
    AttendeeService attendeeService = AttendeeService();
    ticketevent = attendeeService.getAttendeeEventTickets(
        eventID: widget.eventID, limit: 10, page: 1);
       
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return GestureDetector(
        onTap: () {},
        child: FutureBuilder(
            future: ticketevent,
            builder: (context, snapshot) {
              
              if (snapshot.connectionState == ConnectionState.done ) {
                  print(snapshot.data);
              if (snapshot.data == null || snapshot.data!.isEmpty) {
              
                return Container(
                  color:const Color.fromARGB(255, 247, 245, 245),
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.15,
                  child: const Center(
                      child: Text(
                    "No tickets available",
                    style: TextStyle(color: Colors.red, fontSize: 20),
                  )),
                );
              }
              else
              {
                 return Container(
                      color: Color.fromARGB(255, 247, 245, 245),
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height * 0.15,
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.only(top: 20),
                            width: mediaQuery.size.width * 0.5,
                            child: ElevatedButton(
                              onPressed: () {
                                showDialog(
                                  context: context,
                                  barrierDismissible: false,
                                  builder: (BuildContext context) {
                                    return GestureDetector(
                                      onTap: () {},
                                      child: TicketsChoice(
                                        ticketevent: snapshot.data!,eventID: widget.eventID,
                                      ),
                                    );
                                  },
                                );
                              },
                              child: const Text("Get tickets"),
                            ),
                          )
                        ],
                      ));
              }
                
              
                  
                 
            }
            else {
                  return Container(
                    decoration: const BoxDecoration(color: Colors.white),
                    child: const Center(child: CircularProgressIndicator()),
                  );
                 }
              
            }));
  }
}
