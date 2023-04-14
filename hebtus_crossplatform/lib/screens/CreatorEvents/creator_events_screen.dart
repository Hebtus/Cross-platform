import 'package:flutter/material.dart';
import 'package:hebtus_crossplatform/screens/all_screens.dart';

import '../../models/creator_events.dart';
import '../../models/location.dart';
import 'components/creator_event_card.dart';
import 'components/filter_events_bttn.dart';

class CreatorEventsScreen extends StatefulWidget {
  const CreatorEventsScreen({super.key});

  @override
  State<CreatorEventsScreen> createState() => _CreatorEventsScreenState();
}

class _CreatorEventsScreenState extends State<CreatorEventsScreen> {
  final List<CreatorEvent> events = [
    CreatorEvent(
        eventID: "1",
        eventName: "test",
        imgURL: "assets/images/foodtruck.jpg",
        startTime: DateTime(2023, 5, 5),
        endTime: DateTime(2023, 6, 6),
        location: Location(latitude: 23.23, longitude: 23.23),
        locationName: "Cairo",
        category: "Music",
        isDraft: false),
    CreatorEvent(
        eventID: "1",
        eventName: "test",
        imgURL: "assets/images/foodtruck.jpg",
        startTime: DateTime(2023, 5, 5, 16, 0),
        endTime: DateTime(2023, 6, 6),
        location: Location(latitude: 23.23, longitude: 23.23),
        locationName: "Cairo",
        category: "Music",
        isDraft: false),
    CreatorEvent(
        eventID: "1",
        eventName: "test",
        imgURL: "assets/images/foodtruck.jpg",
        startTime: DateTime(2023, 5, 5),
        endTime: DateTime(2023, 6, 6),
        location: Location(latitude: 23.23, longitude: 23.23),
        locationName: "Cairo",
        category: "Music",
        isDraft: false,
        isPrivate: true),
    CreatorEvent(
        eventID: "1",
        eventName: "test",
        imgURL: "assets/images/foodtruck.jpg",
        startTime: DateTime(2023, 5, 5),
        endTime: DateTime(2023, 6, 6),
        location: Location(latitude: 23.23, longitude: 23.23),
        locationName: "Cairo",
        category: "Music",
        isDraft: false),
    CreatorEvent(
        eventID: "1",
        eventName: "test",
        imgURL: "assets/images/foodtruck.jpg",
        startTime: DateTime(2023, 5, 5),
        endTime: DateTime(2023, 6, 6),
        location: Location(latitude: 23.23, longitude: 23.23),
        locationName: "Cairo",
        category: "Music",
        isDraft: false),
  ];
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return Scaffold(
      appBar: appBarModule(context),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Center(
          child: SizedBox(
            width: mediaQuery.size.width * 0.95,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: FittedBox(
                    child: Text("Hey There,",
                        style: TextStyle(
                            fontSize: 40, fontWeight: FontWeight.bold)),
                  ), //TODO: add user name
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: FilterEventsBttn(),
                ),
                Container(
                  constraints: BoxConstraints(maxHeight: 500),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListView.separated(
                        padding: EdgeInsets.zero,
                        itemBuilder: ((context, index) =>
                            CreatorEventCard(event: events[index])),
                        separatorBuilder: (context, index) =>
                            const SizedBox(height: 5),
                        itemCount: events.length),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
