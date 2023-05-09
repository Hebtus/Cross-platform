import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hebtus_crossplatform/models/attendee_bookings.dart';
import 'package:hebtus_crossplatform/route/router.dart';

import '../../../services/attendee_service.dart';

///this is a class where the booking request is called and its result is returned
class BookingResult extends StatefulWidget {
  final String eventid;
  final String promocode;
  final Name name;
  final String email;
  final String phone;
  final String gender;
  final List<Booking> bookings;
  final List<List<String>> myList;
  const BookingResult(
      {required this.eventid,
      required this.promocode,
      required this.name,
      required this.email,
      required this.phone,
      required this.gender,
      required this.bookings,
      required this.myList,
      super.key});
  @override
  State<BookingResult> createState() => _BookingResultState();
}

class _BookingResultState extends State<BookingResult> {
  late Future<String> bookingresult;
  bool res = false;
  String errorMessage = '';
  @override
  void initState() {
    super.initState();
    AttendeeService attendeeService = AttendeeService();
    print(widget.myList);
    if (widget.promocode == '') {
      res = true;
    }
    bookingresult = _createBooking(attendeeService);
    print("hhh");
    print(widget.bookings);
  }

  Future<String> _createBooking(AttendeeService attendeeService) async {
    late Booking b;
    List<Booking> book = [];
    for (int i = 0; i < widget.myList.length; i++) {
      if (widget.myList[i][4] != '' &&
          widget.myList[i][3] != '' &&
          widget.myList[i][2] != '') {
        b = Booking(
            widget.myList[i][4],
            (double.parse(widget.myList[i][3])).toInt(),
            int.parse(widget.myList[i][2]));
        book.add(b);
      } else {
        continue;
      }
    }
    AttendeeBooking attendeebook = AttendeeBooking(
        eventID: widget.eventid,
        promoCode: res == false ? widget.promocode : null,
        name: widget.name,
        guestEmail: widget.email,
        phoneNumber: widget.phone,
        gender: widget.gender,
        bookings: book);
    try {
      return await attendeeService.createBooking(attendeebook);
    } catch (e) {
      setState(() {
        errorMessage = 'Booking failed: ${e.toString()}';
      });
      return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async => true,
        child: Center(
            child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: errorMessage.isNotEmpty
                    ? AlertDialog(
                        content: Column(
                          children: [
                            Text(errorMessage),
                            SizedBox(height: 10),
                            ElevatedButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text("back"),
                            ),
                          ],
                        ),
                      )
                    : FutureBuilder(
                        future: bookingresult,
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.done) {
                            if (snapshot.data == null ||
                                snapshot.data!.isEmpty) {
                              setState(() {
                                errorMessage = 'Booking failed';
                              });
                              return const SizedBox.shrink();
                            } else {
                              return AlertDialog(
                                content: Column(
                                  children: [
                                    Text("Booking is successful"),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    ElevatedButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: const Text("back"))
                                  ],
                                ),
                              );
                            }
                          } else {
                            return Container(
                              decoration:
                                  const BoxDecoration(color: Colors.white),
                              child: const Center(
                                  child: CircularProgressIndicator()),
                            );
                          }
                        }))));
  }
}
