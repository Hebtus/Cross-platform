import 'package:flutter/material.dart';
import 'package:hebtus_crossplatform/models/creator_events.dart';
import 'package:intl/intl.dart';

class CreatorEventCard extends StatelessWidget {
  final CreatorEvent event;
  const CreatorEventCard({super.key, required this.event});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      decoration: BoxDecoration(
          color: Colors.grey.shade200, borderRadius: BorderRadius.circular(20)),
      child: Row(children: [
        Container(
          padding: EdgeInsets.all(5),
          width: 120,
          height: 120,
          child: Image.asset(
            event.imgURL,
            fit: BoxFit.cover,
          ),
        ),
        Expanded(
            child: Container(
                padding: EdgeInsets.all(2),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(event.eventName),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        event.isOnline != null && event.isOnline!
                            ? Text("Online Event")
                            : Text(event.locationName),
                      ],
                    ),
                    Row(
                      children: [
                        Text(DateFormat('EEE, MMM d, y \'at\' h:mm a')
                            .format(event.startTime)),
                      ],
                    ),
                    event.isPrivate != null && event.isPrivate!
                        ? Row(
                            children: const [Icon(Icons.lock), Text("Private")],
                          )
                        : Container()
                  ],
                )))
      ]),
    );
  }
}
