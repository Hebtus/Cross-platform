import 'package:flutter/material.dart';
import 'package:hebtus_crossplatform/screens/all_screens.dart';

import 'package:hebtus_crossplatform/services/creator_service.dart';
import '../../models/creator_events.dart';
import 'components/creator_event_card.dart';
import 'components/filter_events_bttn.dart';

class CreatorEventsScreen extends StatefulWidget {
  const CreatorEventsScreen({super.key});

  @override
  State<CreatorEventsScreen> createState() => _CreatorEventsScreenState();
}

class _CreatorEventsScreenState extends State<CreatorEventsScreen> {
  // @override
  // void initState() {
  //   super.initState();
  //   fetchData();
  // }

  // Future<String> fetchData() async {
  //   CreatorService creatorService = CreatorService();
  //   // List<CreatorEvent> events =
  //   //     await creatorService.getMultipleEvents(csv: false);
  //   // return events;
  //   CreatorTicket ticket = CreatorTicket(
  //       name: "vip",
  //       type: "vip",
  //       price: 5000,
  //       capacity: 10,
  //       sellingStartTime: DateTime(2023, 12, 1),
  //       sellingEndTime: DateTime(2024, 1, 1));
  //   String habal =
  //       await creatorService.createTicket(ticket, "642fda172c9619b9850f7102");
  //   return habal;
  // }

  Future<List<CreatorEvent>>? events;
  @override
  void initState() {
    super.initState();
    CreatorService creatorService = CreatorService();
    events = creatorService.getMultipleEvents(csv: false);
  }

  // final List<CreatorEvent> events = [
  //   CreatorEvent(
  //       eventID: "1",
  //       eventName: "Hebtus Test Event",
  //       imgURL: "assets/images/foodtruck.jpg",
  //       startTime: DateTime(2023, 5, 5),
  //       endTime: DateTime(2023, 6, 6),
  //       location: Location(latitude: 23.23, longitude: 23.23),
  //       locationName: "Cairo",
  //       category: "Music",
  //       isDraft: false),
  //   CreatorEvent(
  //       eventID: "1",
  //       eventName: "Hebtus Launch Party",
  //       imgURL: "assets/images/foodtruck.jpg",
  //       startTime: DateTime(2023, 5, 5, 16, 0),
  //       endTime: DateTime(2023, 6, 6),
  //       location: Location(latitude: 23.23, longitude: 23.23),
  //       locationName: "Cairo",
  //       category: "Music",
  //       isDraft: false),
  //   CreatorEvent(
  //       eventID: "1",
  //       eventName: "Hebtus Hebtus Hebtus",
  //       imgURL: "assets/images/foodtruck.jpg",
  //       startTime: DateTime(2023, 5, 5),
  //       endTime: DateTime(2023, 6, 6),
  //       location: Location(latitude: 23.23, longitude: 23.23),
  //       locationName: "Cairo",
  //       category: "Music",
  //       isDraft: false,
  //       isPrivate: true),
  //   CreatorEvent(
  //       eventID: "1",
  //       eventName: "More Hebtus Events",
  //       imgURL: "assets/images/foodtruck.jpg",
  //       startTime: DateTime(2023, 5, 5),
  //       endTime: DateTime(2023, 6, 6),
  //       location: Location(latitude: 23.23, longitude: 23.23),
  //       locationName: "Cairo",
  //       category: "Music",
  //       isDraft: false),
  //   CreatorEvent(
  //       eventID: "1",
  //       eventName: "Hebtus? Hebtus.",
  //       imgURL: "assets/images/foodtruck.jpg",
  //       startTime: DateTime(2023, 5, 5),
  //       endTime: DateTime(2023, 6, 6),
  //       location: Location(latitude: 23.23, longitude: 23.23),
  //       locationName: "Cairo",
  //       category: "Music",
  //       isDraft: false),
  // ];
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
                FutureBuilder(
                  future: events,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      return Container(
                        constraints: BoxConstraints(
                            maxHeight: mediaQuery.size.height * 0.7),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ListView.separated(
                              padding: EdgeInsets.zero,
                              itemBuilder: ((context, index) =>
                                  CreatorEventCard(
                                      event: snapshot.data![index])),
                              separatorBuilder: (context, index) =>
                                  const SizedBox(height: 1),
                              itemCount: snapshot.data!.length),
                        ),
                      );
                    } else {
                      return Container(
                        decoration: const BoxDecoration(color: Colors.white),
                        child: const Center(child: CircularProgressIndicator()),
                      );
                    }
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
