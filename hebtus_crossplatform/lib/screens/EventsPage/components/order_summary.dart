import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hebtus_crossplatform/route/router.dart';

import '../../../models/promocodes.dart';

class OrderSummary extends StatefulWidget {
  final List<List<String>> myList;
  final String eventID;
  final String promocode;
 
  OrderSummary({required this.eventID, required this.myList,required this.promocode ,super.key});

  @override
  State<OrderSummary> createState() => _OrderSummaryState();
}

class _OrderSummaryState extends State<OrderSummary> {
  int _showCheckout = 0;
  @override
  Widget build(BuildContext context) {
    print(widget.myList);
    double totalprice = 0.0;
    for (int i = 0; i < widget.myList.length; i++) {
      if (widget.myList[i][0] == '' || widget.myList[i][2] == "0") {
        continue;
      }
      double price = double.parse(widget.myList[i][3]);
      totalprice += price;
    }
    return WillPopScope(
        onWillPop: () async => false,
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: AlertDialog(
            content: _showCheckout == 0
                ? SizedBox(
                    width: 900,
                    height: MediaQuery.of(context).size.height * 0.55,
                    child: SingleChildScrollView(
                      physics: BouncingScrollPhysics(),
                      child: Column(
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
                                padding: EdgeInsets.only(left: 30),
                                child: Text("Order Summary"),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          for (int i = 0; i < widget.myList.length; i++)
                            widget.myList[i][0] == '' ||
                                    widget.myList[i][2] == "0"
                                ? Container()
                                : FittedBox(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            FittedBox(
                                                child: Text(
                                                    '${widget.myList[i][2]}' +
                                                        ' x' +
                                                        '${widget.myList[i][0]}' +
                                                        ' ' +
                                                        '${widget.myList[i][1]}')),
                                            FittedBox(child: Text(' ')),
                                            FittedBox(
                                                child: Text(
                                                    '${widget.myList[i][3]} LE')),
                                          ],
                                        ),
                                        const Divider(
                                          thickness: 3,
                                          color: Colors.blue,
                                        ),
                                      ],
                                    ),
                                  ),
                          const SizedBox(
                            height: 20,
                          ),
                          const Divider(thickness: 1.4),
                          Text("Total"),
                          totalprice==0.0?
                          Text('${totalprice}' + ' LE') 
                          :
                           Text('${totalprice.toStringAsFixed(4)}' + ' LE') 
                        ],
                      ),
                    ))
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
                                        Navigator.of(context).pop();
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
        ));
  }
}
