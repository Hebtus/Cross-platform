import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/widgets.dart';
import 'package:hebtus_crossplatform/globals/globals.dart';

import '../../../models/attendee_event.dart';

class EventDescription extends StatelessWidget {
  final AttendeeEvent event;
  EventDescription({super.key, required this.event});
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    if (event != null) {
      return Container(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(14),
            child: Text(
              "About this event ",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  width: 70,
                  height: 40,
                  decoration: BoxDecoration(
                      color: Color.fromARGB(255, 234, 247, 255),
                      borderRadius: BorderRadius.circular(10)),
                  child: const Icon(
                    Icons.punch_clock,
                    color: Colors.blue,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                    (event.endTime.hour - event.startTime.hour).toString()),
              ),
            ],
          ),
          FittedBox(
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    width: 70,
                    height: 40,
                    decoration: BoxDecoration(
                        color: Color.fromARGB(255, 234, 247, 255),
                        borderRadius: BorderRadius.circular(10)),
                    child: const Icon(
                      Icons.airplane_ticket,
                      color: Colors.blue,
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text("Mobile eTicket"),
                ),
              ],
            ),
          ),
          Container(
              width: MediaQuery.of(context).size.width * 0.8,
              margin: EdgeInsets.all(10),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      event.description.toString(),
                    ),
                  ),
                ],
              )),
          Padding(
            padding: const EdgeInsets.only(top: 10, left: 12),
            child: Image(
              image: NetworkImage(event.imgURL),
              width: MediaQuery.of(context).size.width * 0.85,
            ),
          )
        ],
      ));
    } else {
      return Container();
    }
  }
}
