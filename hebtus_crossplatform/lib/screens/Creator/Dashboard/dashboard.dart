import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hebtus_crossplatform/screens/Creator/Components/creator_components.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io' show File, Platform;
import 'package:hebtus_crossplatform/models/creator_events.dart';
import 'package:hebtus_crossplatform/models/location.dart';

class Dashboard extends StatefulWidget {
  Dashboard({Key? key, required this.eventdetails}) : super(key: key);
  final CreatorEvent eventdetails;


  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();
  final TextEditingController _searchController = TextEditingController();
  String _responseText = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _globalKey,
      appBar: appBarModule(context),
      drawer: appDrawer(context, "Dashboard", widget.eventdetails),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            sideMenuModule(_globalKey, 'Dashboard'),
            Text("Dashboard",style: TextStyle(fontSize: 50),),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [

                  Material(
                    elevation: 5,
                    child: Container(
                      height: 200,
                      padding: const EdgeInsets.all(25.0),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: const BorderRadius.all(Radius.circular(5))),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    "Net Sales                  ",
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(fontSize: 20.0),
                                  ),
                                ],
                              ),
                              SizedBox(width: 50,),
                              Row(
                                children: [
                                  Text(
                                   "\$1000",
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(fontSize: 20.0),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  const Text(
                                    "\$0.00 gross sales",
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(fontSize: 10.0),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 20,),

                  Material(
                    elevation: 5,
                    child: Container(
                      height: 200,
                      padding: const EdgeInsets.all(25.0),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: const BorderRadius.all(Radius.circular(5))),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,

                            children: [
                              Row(
                                children: [

                                  Text(
                                    "Ticket Sold               ",
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(fontSize: 20.0),
                                  ),
                                ],
                              ),
                              SizedBox(width: 50,),
                              Row(
                                children: [
                                  Text(
                                    "0/40",
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(fontSize: 20.0),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  const Text(
                                    "0 paid.0 free",
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(fontSize: 10.0),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10,),
            Text("Sales by ticket type",style: TextStyle(fontSize: 20),),
            DataTable(columns: const [
              DataColumn(
                  label: Text('Ticket type',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold))),
              DataColumn(
                  label: Text('Price',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold))),
              DataColumn(
                  label: Text('Sold',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold))),
            ], rows: [
            DataRow(cells: [
            DataCell(Text("hello")),
           DataCell(Text("hello")),
            DataCell(Text("hello")),


  ])

            ]),
            Text("Sales by ticket type",style: TextStyle(fontSize: 20),),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(columns: const  [
                DataColumn(
                    label: Text('Order#',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold))),
                DataColumn(
                    label: Text('Name',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold))),
                DataColumn(
                    label: Text('Quantity',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold))),
                DataColumn(
                    label: Text('Price',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold))),
                DataColumn(
                    label: Text('Date',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold))),
              ], rows: [
                DataRow(cells: [
                  DataCell(Text("help")),
                  DataCell(Text("hell")),
                  DataCell(Text("hello")),
                  DataCell(Text("hell")),
                  DataCell(Text("hello")),



                ])

              ]),
            ),

          ],
          ),
        ),

      ),




    );
  }
}
