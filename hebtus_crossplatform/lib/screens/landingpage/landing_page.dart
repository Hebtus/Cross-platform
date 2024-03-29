// ignore_for_file: sized_box_for_whitespace, duplicate_ignore, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:go_router/go_router.dart';
import 'package:hebtus_crossplatform/components/app_bar.dart';
import 'package:hebtus_crossplatform/models/attendee_event.dart';
import 'package:hebtus_crossplatform/models/notifications.dart';
import 'package:hebtus_crossplatform/screens/landingpage/components/cover_image.dart';
import 'package:hebtus_crossplatform/screens/landingpage/components/categories.dart';
import 'package:hebtus_crossplatform/globals/globals.dart';
import 'package:hebtus_crossplatform/services/attendee_service.dart';
import 'package:hebtus_crossplatform/screens/landingpage/components/location.dart';
import 'components/event_list.dart';
import 'components/tab_bar.dart';
import 'dart:async';
import 'package:hebtus_crossplatform/services/auth_service.dart';
import 'package:geocoding/geocoding.dart';

/// This class returns landingpage which is the homepage of the app
class LandingPageScreen extends StatefulWidget {
  const LandingPageScreen({super.key});

  @override
  State<LandingPageScreen> createState() => _LandingPageScreenState();
}

class _LandingPageScreenState extends State<LandingPageScreen> {
  Future<List<AttendeeEvent>>? events;
  String? _currentAddress = '';
  String? Categ;
  String? isOnline;
  String? isFree;
  String? start;
  String? end;

  @override
  void initState() {
    super.initState();
    getNotifications();
    _init();
  }

  _init() async {
    AttendeeService attendeeService = AttendeeService();
    try {
      Position? position = await _getcurrentlocation();
      if (position != null) {
        rebuildLandingPage(lat: position.latitude, long: position.longitude);
      }
    } catch (e) {
      // handle error
    }
  }

  Future<Position?> _getcurrentlocation() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error("Location services are disabled");
    }
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error("Location permissions are disabled");
      }
    }
    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          "Location permissions are permanently denied , we can`t request permission");
    }
    // Start listening for position updates

    if (!await Geolocator.isLocationServiceEnabled()) {
      return null;
    }
    Position position = await Geolocator.getCurrentPosition();
    latitude_v = position.latitude;
    longitude_v = position.longitude;
    _getAddressFromLatLng();
    return position;
  }

  _getAddressFromLatLng() async {
    try {
      List<Placemark> placemarks =
          await placemarkFromCoordinates(latitude_v!, longitude_v!);

      Placemark place = placemarks[0];

      setState(() {
        if (place.locality == '') {
          _currentAddress = "${place.administrativeArea}, ${place.country}";
        } else {
          _currentAddress =
              "${place.administrativeArea},${place.locality}, ${place.country}";
        }
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  //callback function to rebuild landing page from child widgets
  void rebuildLandingPage(
      {String? category,
      DateTime? todaystartdate,
      double? long,
      double? lat,
      DateTime? todayenddate,
      bool? online,
      bool? free,
      String? address}) async {
    AttendeeService attendeeService = AttendeeService();
    /*setState(() {
     Categ=category;
     isOnline=online.toString();
     isFree=free.toString();
     start=todaystartdate.toString();
     end= todayenddate.toString();
    });*/
    if (category != null) {
      if (category != "null") {
        Categ = category;
        isOnline = null;
        isFree = null;
        start = null;
        end = null;
        events = attendeeService.getEvents(
            category: category, latitude: latitude_v, longitude: longitude_v);
      } else {
        Categ = null;
        isOnline = null;
        isFree = null;
        start = null;
        end = null;
        events = attendeeService.getEvents(
            latitude: latitude_v, longitude: longitude_v);
      }
    } else if (online != null) {
      Categ = null;
      isOnline = online.toString();
      isFree = null;
      start = null;
      end = null;
      events = attendeeService.getEvents(
          online: true, latitude: latitude_v, longitude: longitude_v);
    } else if (free != null) {
      Categ = null;
      isOnline = null;
      isFree = free.toString();
      start = null;
      end = null;
      events = attendeeService.getEvents(
          free: true, latitude: latitude_v, longitude: longitude_v);
    } else if (todaystartdate != null && todayenddate != null) {
      Categ = null;
      isOnline = null;
      isFree = null;
      start = todaystartdate.toString();
      end = todayenddate.toString();
      events = attendeeService.getEvents(
          startDate: todaystartdate,
          endDate: todayenddate,
          latitude: latitude_v,
          longitude: longitude_v);
    } else if (long != null && lat != null) {
      Categ = null;
      isOnline = null;
      isFree = null;
      start = null;
      end = null;
      events = attendeeService.getEvents(
          latitude: latitude_v, longitude: longitude_v);
      _getAddressFromLatLng();
    }
    print(latitude_v);
    print(longitude_v);
    getNotifications();
    setState(() {});
  }

  void getNotifications() async {
    //getting notifications
    AuthService authService = AuthService();
    try {
      Notifications? notif = await authService.getNotifications();
      if (notif != null) {
        //display popup
        // ignore: use_build_context_synchronously
        showDialog(
            barrierDismissible: true,
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Text("Event Invitation!"),
                content: Text(
                    "You have been invited to attend the event '${notif.eventName}' by ${notif.creatorFirstName} ${notif.creatorLastName}"),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text('OK'),
                  ),
                ],
              );
            });
      }
    } catch (e) {
      //catch any error from notifications
    }
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
                            Row(
                              children: [
                                Container(
                                  padding: EdgeInsets.only(left: 10),
                                  child: PopupMenuButton(
                                    itemBuilder: (context) => [
                                      PopupMenuItem(
                                        child: const Text(
                                          "use current Location",
                                          style: TextStyle(fontSize: 12),
                                        ),
                                        onTap: () {
                                          // Get the current location

                                          _getcurrentlocation();
                                          print(latitude_v);
                                          print(longitude_v);
                                          rebuildLandingPage(
                                              lat: latitude_v,
                                              long: longitude_v);
                                        },
                                      ),
                                    ],
                                    child: const Icon(
                                      Icons.arrow_drop_down,
                                      color: Colors.blue,
                                      size: 30,
                                    ),
                                  ),
                                ),
                                LocationSearch(
                                  rebuildLandingPage: rebuildLandingPage,
                                ),
                              ],
                            ),
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
                            Categories(rebuildLandingPage: rebuildLandingPage),
                            Padding(
                              padding: EdgeInsets.all(20),
                              child: Text(
                                "Events in ${_currentAddress}",
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
                                padding: const EdgeInsets.only(top: 10.0),
                                child: ElevatedButton(
                                    onPressed: () {
                                      print("date");
                                      print(isFree);
                                      return context.go(
                                          "/seemore/${Categ}/${isOnline}/${isFree}/${start}/${end}");
                                    },
                                    child: const Text("See more")),
                              ),
                            ),
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
