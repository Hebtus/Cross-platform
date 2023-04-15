// ignore_for_file: sized_box_for_whitespace, duplicate_ignore, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hebtus_crossplatform/components/app_bar.dart';
import 'package:hebtus_crossplatform/models/attendee_event.dart';
import 'package:hebtus_crossplatform/screens/LandingPage/components/location.dart';
import 'package:hebtus_crossplatform/screens/landingpage/components/cover_image.dart';
import 'package:hebtus_crossplatform/screens/LandingPage/components/categories.dart';
import 'package:hebtus_crossplatform/globals/globals.dart';
import 'package:hebtus_crossplatform/services/attendee_service.dart';

import 'components/event_list.dart';
import 'components/tab_bar.dart';

/// This class returns landingpage which is the homepage of the app
class LandingPageScreen extends StatefulWidget {
  const LandingPageScreen({super.key});

  @override
  State<LandingPageScreen> createState() => _LandingPageScreenState();
}

class _LandingPageScreenState extends State<LandingPageScreen> {
  Future<List<AttendeeEvent>>? events;
  @override
  void initState() {
    super.initState();
    AttendeeService attendeeService = AttendeeService();
    events = attendeeService.getEvents();
  }

  //callback function to rebuild landing page from child widgets
  void rebuildLandingPage(
      {String? category, String? date, bool? online, bool? free}) async {
    AttendeeService attendeeService = AttendeeService();
    if (category != null) {
      if (category != "All") {
        events = attendeeService.getEvents(category: category);
      } else {
        events = attendeeService.getEvents();
      }
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: const Color.fromARGB(255, 141, 58, 58),
        child: FutureBuilder(
            future: events,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return Scaffold(
                    appBar: MainAppBar(context),
                    body: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const CoverImage(),
                            const Padding(
                              padding: EdgeInsets.only(top: 15, left: 15),
                              child: Text(
                                "Popular in",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            const Location(), // class that returns textfield for entering location
                            NavBar(
                              rebuildLandingPage: rebuildLandingPage,
                            ),
                            const Padding(
                              padding: EdgeInsets.only(left: 30, top: 30),
                              child: Text(
                                "Check out trending categories",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                            ),
                            const Categories(),
                            const Padding(
                              padding: EdgeInsets.all(20),
                              child: Text(
                                "Events in Cairo",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                            ),
                            snapshot.data!.isNotEmpty
                                ? GridView.count(
                                    childAspectRatio: 0.85,
                                    crossAxisCount:
                                        (MediaQuery.of(context).orientation ==
                                                Orientation.landscape)
                                            ? 4
                                            : 2,
                                    mainAxisSpacing: 10,
                                    crossAxisSpacing: 1,
                                    shrinkWrap: true,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    children: [
                                      for (var i = 0;
                                          i < snapshot.data!.length;
                                          i++)
                                        EventCard(
                                            num: i, events: snapshot.data!),
                                    ],
                                  )
                                : EventCard(num: 0, events: snapshot.data!),

                            Center(
                              child: Padding(
                                padding: const EdgeInsets.all(15),
                                child: ElevatedButton(
                                    onPressed: () {
                                      return context.go("/seemore");
                                    },
                                    child: const Text(
                                      "See more",
                                      style: TextStyle(color: Colors.white),
                                    )),
                              ),
                            )
                          ],
                        ),
                      ),
                    ));
              } else {
                return Container(
                  decoration: const BoxDecoration(color: Colors.white),
                  child: const Center(child: CircularProgressIndicator()),
                );
              }
            }));
  }
}
