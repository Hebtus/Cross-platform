import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:hebtus_crossplatform/globals/globals.dart';
import 'package:hebtus_crossplatform/models/attendee_event.dart';

///this is a class which displays the information of the event
class EventInfo extends StatelessWidget {
  final AttendeeEvent event;
  EventInfo({super.key, required this.event});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    if (event != null) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(26),
            child: Text(event.startTime.toString()),
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Text(
              event.eventName,
              style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      );
    } else {
      return Container();
    }
  }
}
