import 'dart:math';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hebtus_crossplatform/models/attendee_tickets.dart';
import 'package:hebtus_crossplatform/route/router.dart';
import 'dart:async';
import 'package:hebtus_crossplatform/screens/EventsPage/components/timer.dart';
import 'package:hebtus_crossplatform/screens/EventsPage/components/order_summary.dart';
import 'package:hebtus_crossplatform/models/attendee_event.dart';

import '../../../models/promocodes.dart';
import '../../../services/creator_service.dart';
import 'events_booking.dart';

class TicketsChoice extends StatefulWidget {
  final List<AttendeeTicket> ticketevent;
  final String eventID;
  TicketsChoice({required this.ticketevent, required this.eventID, super.key});

  @override
  State<TicketsChoice> createState() => _TicketsChoiceState();
}

class _TicketsChoiceState extends State<TicketsChoice> {
  int _close = 0;
  bool _isVisible = true;

  bool isfree = false;
  bool ispaid = false;
  String place = "";
  int _ticketEventLength = 0;
  
  List<int> counters = [];
  List<List<String>> myList = [];
  late int count;
  void updateMyList(int index, String name, String type, String value,
      String price, String ticketid) {
    setState(() {
      myList[index][0] = name;
      myList[index][1] = type;
      myList[index][2] = value;
      myList[index][3] = price;
      myList[index][4] = ticketid;
    });
  }

  @override
  void initState() {
    super.initState();
    _ticketEventLength = widget.ticketevent.length;
    counters = List.filled(_ticketEventLength, 0);
    count=0;
    myList = List.generate(
      _ticketEventLength,
      (index) => List.filled(5, ''),
    );
    
  }

  void _increment(int index) {
    setState(() {
      counters[index]++;
    });
  }

  void _decrement(int index) {
    setState(() {
      counters[index]--;
    });
  }

  @override
  Widget build(BuildContext context) {
    for (int i = 0; i < widget.ticketevent.length; i++) {
      if (widget.ticketevent[i].price == 0.0) {
        isfree = true;
      } else {
        ispaid = true;
      }
    }

    return WillPopScope(
      onWillPop: () async => false,
      child: SingleChildScrollView(
        physics:BouncingScrollPhysics(),
        child: AlertDialog(
              content: _close == 0
                  ? SizedBox(
                      width: 900,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              IconButton(
                                  onPressed: () {
                                    setState(() {
                                      _close = 1;
                                    });
                                  },
                                  icon: Icon(Icons.arrow_back)),
                              const Padding(
                                padding: EdgeInsets.only(left: 30),
                                child: Text("Choose tickets"),
                              ),
                            ],
                          ),
                      
                          Padding(
                            padding: const EdgeInsets.only(top: 4.0),
                            child: const Divider(thickness: 1.4),
                          ),
                      
                          ///////////////////////////////////////// free tickets ///////////////////////////////////////
                      
                          Visibility(
                            visible: isfree,
                            child: Container(
                              width: 900,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const FittedBox(
                                    child: Text(
                                      "Free tickets",
                                      style: TextStyle(fontSize: 19),
                                    ),
                                  ),
                                  ListView.builder(
                                    shrinkWrap: true,
                                    itemCount: counters.length,
                                    itemBuilder: (context, index) {
                                      return CounterWidget(
                                        key: ValueKey(index),
                                        index: index,
                                        value: counters[index],
                                        onIncrement: _increment,
                                        onDecrement: _decrement,
                                        ticketevent: widget.ticketevent,
                                        place: "free",
                                        myList: myList,
                                        onMyListUpdated: updateMyList,
                                      );
                                    },
                                  ),
                                  const Divider(thickness: 1.4),
                                ],
                              ),
                            ),
                          ),
                      
                      /////////////////////////////////////////////for paid tickets//////////////////////////////////////////
                      
                          Visibility(
                            visible: ispaid,
                            child: Container(
                              width: 900,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const FittedBox(
                                    child: Text(
                                      "paid tickets",
                                      style: TextStyle(fontSize: 19),
                                    ),
                                  ),
                                  ListView.builder(
                                    shrinkWrap: true,
                                    itemCount: counters.length,
                                    itemBuilder: (context, index) {
                                      return CounterWidget(
                                        key: ValueKey(index),
                                        index: index,
                                        value: counters[index],
                                        onIncrement: _increment,
                                        onDecrement: _decrement,
                                        ticketevent: widget.ticketevent,
                                        place: "paid",
                                        myList: myList,
                                        onMyListUpdated: updateMyList,
                                      );
                                    },
                                  ),
                                  const Divider(thickness: 1.4),
                                ],
                              ),
                            ),
                          ),
                          Center(
                            child: ElevatedButton(
                              onPressed: () {
                                bool noTicketsChosen = true;
                                for(int i=0 ;i<myList.length;i++)
                                {
                                  if(myList[i][2]=='' || myList[i][2]=='0')
                                  {
                                    setState(() {
                                      count++;
                                    });
                                    
                                  }
                                  

                                }
                                print(count);
                                
                                for (int i = 0; i < myList.length; i++) {
                                  if (count!=myList.length) {
                                    
                                    noTicketsChosen = false;
                                    break;
                                  }
                                }
                                if (noTicketsChosen) {
                                  showDialog(
                                    context: context,
                                    barrierDismissible: false,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        title: Center(child: Text('Alert')),
                                        content: Padding(
                                          padding: const EdgeInsets.only(left: 25),
                                          child: Text('Please choose a ticket'),
                                        ),
                                        actions: [
                                          TextButton(
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                            child: Text('Close'),
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                } else {
                                  count=0;
                                  showDialog(
                                    context: context,
                                    barrierDismissible: false,
                                    builder: (BuildContext context) {
                                      return GestureDetector(
                                        onTap: () {},
                                        child: BookingTickets(
                                          seconds: 1800,
                                          myList: myList,
                                          eventID: widget.eventID,
                                         
                                        ),
                                      );
                                    },
                                  );
                                }
                              },
                              child: const Text("Book tickets"),
                            ),
                          ),
                        ],
                      ),
                    )
                  : SizedBox(
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
                                "Do you want to leave ?",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              )),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(left: 40, bottom: 15),
                              child: Center(
                                  child: Text(
                                      "Are you sure you want to leave ticket choice? The items you`ve selected may not be available later.",
                                      style: TextStyle(fontSize: 14))),
                            ),
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 30),
                                  child: ElevatedButton(
                                    onPressed: () {
                                      setState(() {
                                        _close = 0;
                                      });
                                    },
                                    child: const Text("Stay",
                                        style: TextStyle(color: Colors.white)),
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
                                        style: TextStyle(color: Colors.white)),
                                    style: ElevatedButton.styleFrom(
                                        maximumSize: Size(100, 30),
                                        minimumSize: Size(100, 30)),
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ))),
          
         
           

            
              
              
              
           
           
          
          
        
      ),
    );
  }
}

class CounterWidget extends StatefulWidget {
  final int index;
  final int value;
  final Function(int) onIncrement;
  final Function(int) onDecrement;
  final List<AttendeeTicket> ticketevent;
  List<List<String>> myList;
  final String place;
  final Function(int, String, String, String, String, String) onMyListUpdated;
  CounterWidget({
    required Key key,
    required this.index,
    required this.value,
    required this.onIncrement,
    required this.onDecrement,
    required this.ticketevent,
    required this.place,
    required this.myList,
    required this.onMyListUpdated,
  }) : super(key: key);

  @override
  _CounterWidgetState createState() => _CounterWidgetState();
}

class _CounterWidgetState extends State<CounterWidget> {
  void _increment() {
    if (widget.value + 1 <= widget.ticketevent[widget.index].capacity) {
      widget.onIncrement(widget.index);
      widget.onMyListUpdated(
          widget.index,
          widget.ticketevent[widget.index].name,
          widget.ticketevent[widget.index].type,
          (widget.value + 1).toString(),
          (widget.ticketevent[widget.index].price *  (widget.value + 1)).toString(),
          widget.ticketevent[widget.index].ticketID);
    }
  }

  void _decrement() {
    if (widget.value - 1 >= 0) {
      widget.onDecrement(widget.index);
      widget.onMyListUpdated(
          widget.index,
          widget.ticketevent[widget.index].name,
          widget.ticketevent[widget.index].type,
          (widget.value - 1).toString(),
          widget.ticketevent[widget.index].price.toString(),
          widget.ticketevent[widget.index].ticketID);
    }
  }

  @override
  Widget build(BuildContext context) {
    print(widget.myList);
    if (widget.place == "free") {
      if (widget.ticketevent[widget.index].price == 0.0) {
        return ListTile(
          title: FittedBox(
            fit: BoxFit.contain,
            child: Text('${widget.ticketevent[widget.index].name}' +
                ' ' +
                '${widget.ticketevent[widget.index].type}'),
          ),
          trailing: FittedBox(
            child: Container(
              width: 70,
              height: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.grey[200],
              ),
              child: FittedBox(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    IconButton(
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        icon: Icon(Icons.add),
                        onPressed: () {
                          _increment();
                        }),
                    Text(
                      '${widget.value}',
                      style: TextStyle(fontSize: 19.0),
                    ),
                    IconButton(
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        icon: Icon(Icons.remove),
                        onPressed: () {
                          _decrement();
                        }),
                  ],
                ),
              ),
            ),
          ),
        );
      } else {
        return Container();
      }
    } else {
      if (widget.ticketevent[widget.index].price != 0.0) {
        return ListTile(
          title: FittedBox(
            child: Text('${widget.ticketevent[widget.index].name}' +
                ' ' +
                '${widget.ticketevent[widget.index].type}'),
          ),
          trailing: FittedBox(
            child: Container(
              width: 70,
              height: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.grey[200],
              ),
              child: FittedBox(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    IconButton(
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        icon: Icon(Icons.add),
                        onPressed: () {
                          _increment();
                        }),
                    Text(
                      '${widget.value}',
                      style: TextStyle(fontSize: 19.0),
                    ),
                    IconButton(
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        icon: Icon(Icons.remove),
                        onPressed: () {
                          _decrement();
                        }),
                  ],
                ),
              ),
            ),
          ),
        );
      } else {
        return Container();
      }
    }
  }
}
