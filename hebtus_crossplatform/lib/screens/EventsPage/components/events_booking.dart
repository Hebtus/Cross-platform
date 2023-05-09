import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hebtus_crossplatform/route/router.dart';
import 'dart:async';
import 'package:hebtus_crossplatform/screens/EventsPage/components/timer.dart';
import 'package:hebtus_crossplatform/screens/EventsPage/components/order_summary.dart';
import 'package:hebtus_crossplatform/screens/EventsPage/components/events_booking_result.dart';
import '../../../models/attendee_bookings.dart';
import '../../../models/promocodes.dart';
import '../../../services/creator_service.dart';

class BookingTickets extends StatefulWidget {
  final int seconds;
  final List<List<String>> myList;
  final String eventID;
  BookingTickets(
      {super.key,
      required this.seconds,
      required this.myList,
      required this.eventID});

  @override
  State<BookingTickets> createState() => _BookingTicketsState();
}

class _BookingTicketsState extends State<BookingTickets> {
  final TextEditingController _textFieldController1 = TextEditingController();
  final TextEditingController _textFieldController2 = TextEditingController();
  final TextEditingController _textFieldController3 = TextEditingController();
  final TextEditingController _textFieldController4 = TextEditingController();
  final TextEditingController _textFieldController5 = TextEditingController();
  bool _isButtonDisabled = true;
  late Timer _timer;
  bool showdialog = false;
  int _secondsRemaining = 0;
  bool _isChecked1 = false;
  bool _isChecked2 = false;
  bool _isChecked3 = false;
  
  int _showCheckout = 0;
  String promovalue = '';
  String firstnamevalue = '';
  String secondnamevalue = '';
  String emailvalue = '';
  String phonevalue = '';
  String gendervalue = '';
  late Name n;
  late Booking b;
  List<Booking> book = [];

  void initState() {
    super.initState();
    _secondsRemaining = widget.seconds;
    startTimer();
    _textFieldController1.addListener(_handleTextFieldChanged);
    _textFieldController2.addListener(_handleTextFieldChanged);
    _textFieldController3.addListener(_handleTextFieldChanged);
    _textFieldController4.addListener(_handleTextFieldChanged);
     _textFieldController5.addListener(_handleTextFieldChanged);
     print("booking tickets");
     print(widget.myList);
  }

  void _handleTextFieldChanged() {
    setState(() {
      _isButtonDisabled = _textFieldController1.text.isEmpty ||
          _textFieldController2.text.isEmpty ||
          _textFieldController3.text.isEmpty ||
          _textFieldController4.text.isEmpty || 
           _textFieldController5.text.isEmpty;
          
    });
  }

  void _handleButtonPressed() {
    if (_isButtonDisabled) {
      Text("field is empty");
      return;
    }
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return GestureDetector(
          onTap: () {},
          child: BookingResult(
            eventid: widget.eventID,
            promocode: promovalue,
            name: n,
            email: emailvalue,
            phone: phonevalue,
            gender: gendervalue,
            bookings: book,
            myList: widget.myList,
          ),
        );
      },
    );
  }

  void startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (_secondsRemaining > 0) {
          _secondsRemaining--;
        } else {
          _timer.cancel();
          _showCheckout = 2;
        }
      });
    });
  }

  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print(widget.myList);
    bool ispaid = false;
    bool haspromo = false;
    final mediaQuery = MediaQuery.of(context);
    String minutes = (_secondsRemaining ~/ 60).toString().padLeft(2, '0');
    String seconds = (_secondsRemaining % 60).toString().padLeft(2, '0');
    

    for (int i = 0; i < widget.myList.length; i++) {
      if (widget.myList[i][3] != '0.0' && widget.myList[i][3] != '' && int.parse(widget.myList[i][2])!=0) {
        ispaid = true;
        break;
      }
    }
  n = Name(firstnamevalue, secondnamevalue);
    return WillPopScope(
      onWillPop: () async => false,
      child: Center(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: AlertDialog(
            content: _showCheckout == 0
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          IconButton(
                              onPressed: () {
                                setState(() {
                                  _showCheckout = 1;
                                });
                              },
                              icon: Icon(Icons.arrow_back)),
                          const Padding(
                            padding: EdgeInsets.only(left: 50),
                            child: Text("Checkout"),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 4.0),
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 78),
                            child: Row(
                              children: [
                                Text("Time left  "),
                                CountdownTimer(
                                  seconds: _secondsRemaining,
                                  onTimerFinished: () {
                                    print('Timer finished!');
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const Divider(thickness: 1.4),
                      const Padding(
                        padding: EdgeInsets.only(top: 10.0, left: 10),
                        child: Text(
                          "Contact information",
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.w700),
                        ),
                      ),
                      FittedBox(
                        child: Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(top: 20.0),
                              child: SizedBox(
                                width: 200,
                                child: TextField(
                                  controller: _textFieldController1,
                                  onChanged: (value) {
                                    setState(() {
                                      firstnamevalue = value;
                                    });
                                  },
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    labelText: 'First Name ',
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 20.0, left: 8),
                              child: SizedBox(
                                width: 200,
                                height: 60,
                                child: TextField(
                                  controller: _textFieldController2,
                                  onChanged: (value) {
                                    setState(() {
                                      secondnamevalue = value;
                                    });
                                  },
                                  decoration: InputDecoration(
                                    labelText: 'Last Name ',
                                    border: OutlineInputBorder(),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      FittedBox(
                        child: Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(top: 30.0),
                              child: SizedBox(
                                width: 200,
                                height: 90,
                                child: TextField(
                                  keyboardType: TextInputType.emailAddress,
                                  controller: _textFieldController3,
                                  onChanged: (value) {
                                    setState(() {
                                      emailvalue = value;
                                    });
                                  },
                                  decoration: InputDecoration(
                                    labelText: 'Email address ',
                                    border: OutlineInputBorder(),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 30.0, left: 8),
                              child: SizedBox(
                                width: 200,
                                height: 90,
                                child: TextField(
                                  controller: _textFieldController4,
                                  onChanged: (value) {
                                    setState(() {
                                      phonevalue = value;
                                    });
                                  },
                                  decoration: InputDecoration(
                                    labelText: 'phone number ',
                                    border: OutlineInputBorder(),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      FittedBox(
                        child: Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(top: 10.0),
                            
                              child: SizedBox(
                                width: ispaid? 200 :MediaQuery.of(context).size.width *0.32,
                                height: 90,
                                child: TextField(
                                  controller: _textFieldController5,
                                  onChanged: (value) {
                                    setState(() {
                                      gendervalue = value;
                                    });
                                  },
                                  decoration: InputDecoration(
                                    labelText: 'Gender ',
                                    border: OutlineInputBorder(),
                                  ),
                                ),
                              ),
                            ),
                            Visibility(
                              visible: ispaid,
                              child: Padding(
                                padding: EdgeInsets.only(top: 20.0, left: 8),
                                child: SizedBox(
                                  width: 200,
                                  height: 90,
                                  child: TextField(
                                    onChanged: (value) {
                                      setState(() {
                                        promovalue = value;
                                      });
                                    },
                                    decoration: InputDecoration(
                                      labelText: 'Promocode ',
                                      border: OutlineInputBorder(),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Divider(thickness: 1.4),
                      SingleChildScrollView(
                        physics: BouncingScrollPhysics(),
                        child: FittedBox(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 90),
                                child: ElevatedButton(
                                  onPressed:  _isButtonDisabled ? null : _handleButtonPressed,
                                  child: const Text("Done"),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 10.0),
                                child: ElevatedButton(
                                    onPressed: () {
                                      showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return OrderSummary(
                                            myList: widget.myList,
                                            eventID: widget.eventID,
                                            promocode: promovalue,
                                          );
                                        },
                                      );
                                    },
                                    child: const Text("Order summary"),
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor:
                                          Color.fromARGB(255, 235, 233, 233),
                                      elevation: 0,
                                      splashFactory: NoSplash.splashFactory,
                                    )),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  )
                : _showCheckout == 1
                    ? SizedBox(
                        width: 900,
                        height: MediaQuery.of(context).size.height * 0.55,
                        child: SingleChildScrollView(
                          physics: BouncingScrollPhysics(),
                          child: Column(
                            children: [
                              const Padding(
                                padding: EdgeInsets.only(top: 120, bottom: 10),
                                child: Center(
                                    child: Text(
                                  "Leave checkout ?",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                )),
                              ),
                              const Padding(
                                padding: EdgeInsets.only(left: 40, bottom: 15),
                                child: Center(
                                    child: Text(
                                        "Are you sure you want to leave checkout? The items you`ve selected may not be available later.",
                                        style: TextStyle(fontSize: 14))),
                              ),
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 30),
                                    child: ElevatedButton(
                                      onPressed: () {
                                        _showCheckout = 0;
                                      },
                                      child: const Text("Stay",
                                          style:
                                              TextStyle(color: Colors.white)),
                                      style: ElevatedButton.styleFrom(
                                          maximumSize: Size(100, 30),
                                          minimumSize: Size(100, 30)),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 30),
                                    child: ElevatedButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: const Text("Leave",
                                          style:
                                              TextStyle(color: Colors.white)),
                                      style: ElevatedButton.styleFrom(
                                          maximumSize: Size(100, 30),
                                          minimumSize: Size(100, 30)),
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        ))
                    : _showCheckout == 2
                        ? SizedBox(
                            width: 900,
                            height: MediaQuery.of(context).size.height * 0.55,
                            child: SingleChildScrollView(
                                physics: BouncingScrollPhysics(),
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(
                                            top: 120, bottom: 10),
                                        child: Center(
                                            child: Text(
                                          "Time Limit reached ",
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold),
                                        )),
                                      ),
                                      const Padding(
                                        padding: EdgeInsets.only(
                                            left: 40, bottom: 15),
                                        child: Center(
                                            child: Text(
                                                "Your reservation has been released.please re-start your purchase",
                                                style:
                                                    TextStyle(fontSize: 14))),
                                      ),
                                      Center(
                                        child: TextButton(
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                            child: Center(
                                                child: Text(
                                              "Back to tickets",
                                              style: TextStyle(
                                                  color: Colors.blue,
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold),
                                            ))),
                                      ),
                                    ])))
                        : Container(),
          ),
        ),
      ),
    );
  }
}
