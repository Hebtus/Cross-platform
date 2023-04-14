import 'package:flutter/material.dart';
import 'package:hebtus_crossplatform/constants.dart';
import 'package:hebtus_crossplatform/models/creator_events.dart';
import 'package:intl/intl.dart';

class CreatorEventCard extends StatelessWidget {
  final CreatorEvent event;
  const CreatorEventCard({super.key, required this.event});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);

    return SizedBox(
      height: 130,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(children: [
            mediaQuery.size.width > phoneWidth
                ? Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Padding(
                          padding:
                              const EdgeInsets.only(top: 8, left: 8, right: 8),
                          child: Text(
                            DateFormat('MMM').format(event.startTime),
                            style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 8),
                          child: Text(DateFormat('d').format(event.startTime),
                              style: const TextStyle(color: Colors.black)),
                        ),
                      ],
                    ),
                  )
                : Container(),
            mediaQuery.size.width > minPhoneWidth
                ? Container(
                    padding: const EdgeInsets.all(5),
                    width: 100,
                    height: 100,
                    child: Image.asset(
                      event.imgURL,
                      fit: BoxFit.scaleDown,
                    ),
                  )
                : Container(),
            Expanded(
                child: Container(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              event.eventName,
                              style: const TextStyle(fontSize: 15),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 3),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              event.isOnline != null && event.isOnline!
                                  ? const Text("Online Event")
                                  : Text(event.locationName),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 3),
                          child: Row(
                            children: [
                              Text(DateFormat('EEE, MMM d, y \'at\' h:mm a')
                                  .format(event.startTime)),
                            ],
                          ),
                        ),
                        event.isPrivate != null && event.isPrivate!
                            ? Padding(
                                padding: const EdgeInsets.only(top: 3),
                                child: Row(
                                  children: const [
                                    Icon(Icons.lock),
                                    Text("Private")
                                  ],
                                ),
                              )
                            : Container(),
                      ],
                    ))),
          ]),
          Divider(),
        ],
      ),
    );
  }
}
