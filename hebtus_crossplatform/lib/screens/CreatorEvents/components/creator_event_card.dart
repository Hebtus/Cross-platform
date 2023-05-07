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
      key: const Key("CreatorEventCard"),
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
            mediaQuery.size.width > minPhoneWidth && event.imgURL != ""
                ? Container(
                    padding: const EdgeInsets.all(5),
                    width: 100,
                    height: 100,
                    child: Image(
                      image: NetworkImage(event.imgURL),
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
                            Flexible(
                              child: Text(
                                event.eventName,
                                style: const TextStyle(
                                    fontSize: 17, fontWeight: FontWeight.bold),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                                softWrap: true,
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 3),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              event.isOnline != null && event.isOnline!
                                  ? const Flexible(
                                      child: Text(
                                        "Online Event",
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 2,
                                        softWrap: true,
                                      ),
                                    )
                                  : Flexible(
                                      flex: 1,
                                      child: Text(
                                        event.locationName,
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 2,
                                        softWrap: true,
                                      ),
                                    ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 3),
                          child: Row(
                            children: [
                              Flexible(
                                child: Text(
                                  DateFormat('EEE, MMM d, y \'at\' h:mm a')
                                      .format(event.startTime),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                        ),
                        event.isPrivate != null && event.isPrivate!
                            ? Padding(
                                padding: const EdgeInsets.only(top: 3),
                                child: Row(
                                  children: const [
                                    Icon(Icons.lock),
                                    Flexible(
                                      child: Text(
                                        "Private",
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 2,
                                        softWrap: true,
                                      ),
                                    )
                                  ],
                                ),
                              )
                            : Container(),
                      ],
                    ))),
            mediaQuery.size.width > widthConst
                ? event.ticketsAvailable != null &&
                        event.ticketsAvailable == '1' &&
                        event.isDraft == false &&
                        event.endTime.isAfter(DateTime.now())
                    ? Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                const Text(
                                  'On Sale',
                                  style: TextStyle(
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(width: 10.0),
                                Container(
                                  width: 16.0,
                                  height: 16.0,
                                  decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.green),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10.0),
                            Text("Tickets Sold: ${event.ticketsSold}"),
                          ],
                        ),
                      )
                    : Expanded(
                        child: Text("Tickets Sold: ${event.ticketsSold}"))
                : Container(),
            SizedBox(
              width: 10,
              child: Container(),
            )
          ]),
          const Divider(),
        ],
      ),
    );
  }
}
