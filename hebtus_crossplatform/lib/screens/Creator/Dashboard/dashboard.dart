import 'dart:convert';
import 'dart:developer';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart' as http;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hebtus_crossplatform/screens/Creator/Components/creator_components.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io' show File, Platform;
import 'package:hebtus_crossplatform/models/creator_events.dart';
import 'package:hebtus_crossplatform/models/location.dart';

import '../../../models/creator_bookings.dart';
import '../../../models/creator_tickets.dart';
import '../../../models/sales.dart';
import '../Tickets/add_more_tickets.dart';

TextEditingController ticketIDController = TextEditingController();
TextEditingController eventIDController = TextEditingController();
TextEditingController firstNameController = TextEditingController();
TextEditingController lastNameController = TextEditingController();
TextEditingController phoneNumberController = TextEditingController();
TextEditingController genderController = TextEditingController();
TextEditingController guestEmailController = TextEditingController();
TextEditingController priceController = TextEditingController();
TextEditingController quantityController = TextEditingController();

List<CreatorTicket>? ticketsListHere;
List<String?> ticketsListIDs = [];
String? selectedItem;
bool addAttendee = false;

Sales? salesList;
List<CreatorBooking>? attendeeList;

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

  DataRow AttendeeListTable(List<CreatorBooking> attendeeList, int i) {
    return DataRow(cells: [
      DataCell(Text(attendeeList[i].bookingID)),
      DataCell(Text(attendeeList[i].name.firstName)),
      DataCell(Text(attendeeList[i].quantity.toString())),
      DataCell(Text(attendeeList[i].price.toString())),
      DataCell(Text(attendeeList[i].purchasedOn.toString())),
    ]);
  }

  DataRow SalesListTable(Sales salesList, int i) {
    return DataRow(cells: [
      DataCell(Text(salesList.salesByType[i].ticketType)),
      DataCell(Text(salesList.salesByType[i].price.toString())),
      DataCell(Text((salesList.salesByType[i].capacity.toString()))),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    bool isLoading = false;
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
              Text(
                "Dashboard",
                style: TextStyle(fontSize: 50),
              ),
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
                            borderRadius:
                                const BorderRadius.all(Radius.circular(5))),
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
                                SizedBox(
                                  width: 50,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      salesList == null
                                          ? "\$0"
                                          : salesList!.totalGrossSales.toString(),
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(fontSize: 20.0),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                     Text(
                                      salesList == null
                                          ? "\$0.00 gross sales"
                                          : salesList!.totalNetSales.toString(),

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
                    SizedBox(
                      width: 20,
                    ),
                    Material(
                      elevation: 5,
                      child: Container(
                        height: 200,
                        padding: const EdgeInsets.all(25.0),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(5))),
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
                                SizedBox(
                                  width: 50,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      salesList == null
                                          ? "0"
                                          : attendeeList!.length.toString(),
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
              SizedBox(
                height: 10,
              ),
              Text(
                "Sales by ticket type",
                style: TextStyle(fontSize: 20),
              ),
              DataTable(columns: const [
                DataColumn(
                    label: Text('Ticket type',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold))),
                DataColumn(
                    label: Text('Price',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold))),
                DataColumn(
                    label: Text('Sold',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold))),
              ], rows: [
                //           DataRow(cells: [
                //           DataCell(Text("hello")),
                //          DataCell(Text("hello")),
                //           DataCell(Text("hello")),
                //
                //
                // ])
                if (salesList != null) ...[
                  for (int i = 0; i < salesList!.salesByType.length; i++)
                    SalesListTable(salesList!, i)
                ]
              ]),
              Text(
                "Attendee List",
                style: TextStyle(fontSize: 20),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: DataTable(columns: const [
                  DataColumn(
                      label: Text('Order#',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold))),
                  DataColumn(
                      label: Text('Name',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold))),
                  DataColumn(
                      label: Text('Quantity',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold))),
                  DataColumn(
                      label: Text('Price',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold))),
                  DataColumn(
                      label: Text('Date',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold))),
                ], rows: [
                  // DataRow(cells: [
                  //   DataCell(Text("help")),
                  //   DataCell(Text("hell")),
                  //   DataCell(Text("hello")),
                  //   DataCell(Text("hell")),
                  //   DataCell(Text("hello")),
                  //
                  //
                  //
                  // ])
                  if (attendeeList != null) ...[
                    for (int i = 0; i < attendeeList!.length; i++)
                      AttendeeListTable(attendeeList!, i)
                  ],
                ]),
              ),
              ElevatedButton(
                  onPressed: () async {
                    setState(() {
                      isLoading = true;
                    });
                    try{
                    salesList = (await creatorData.getEventSales(
                        eventID: widget.eventdetails.eventID,
                        page: 1,
                        limit: 100,
                        netsales: "true"));
                    attendeeList = await creatorData.getCreatorBookings(
                        eventID: widget.eventdetails.eventID,
                        limit: 100,
                        page: 1);}
                        catch(e){
                          setState(() {
                            isLoading = false;
                          });

                        }finally{
                      setState(() {
                        isLoading = false;
                      });


                    }
                  },
                  child: Text("refresh")),
              Text(
                "Event mangment",
                style: TextStyle(fontSize: 50),
              ),
              ElevatedButton(
                onPressed: () async {
                  String response = await creatorData.deleteEvent(
                      true,
                      widget.eventdetails.goPublicDate,
                      widget.eventdetails.eventID) as String;

                  return context.go(
                      "/creatorhome"); // navigates to homescreen when hebtus is clicked
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white, // Background colo// r
                ),
                child: const Text(
                  'Delete event',
                  style: TextStyle(color: Colors.blueAccent),
                ),
              ),
              ElevatedButton(
                  onPressed: () async {
                    ticketsListHere = await creatorData.getCreatorEventTickets(
                        eventID: widget.eventdetails.eventID,
                        limit: 100,
                        page: 1) as List<CreatorTicket>?;

                    if (ticketsListHere != null && addAttendee == false) {

                      setState(() {
                        for (int i = 0; i < ticketsListHere!.length; i++) {
                          ticketsListIDs.add(ticketsListHere![i].ticketID ?? '');
                        }
                        addAttendee = true;
                      });

                    }
                  },
                  child: Text("add attendee")),
              if (addAttendee) ...[
                TextFormField(
                  controller: firstNameController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'First name',
                  ),
                ),
                TextFormField(
                  controller: lastNameController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Last name',
                  ),
                ),
                TextFormField(
                  controller: phoneNumberController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Phone number',
                  ),
                ),
                TextFormField(
                  controller: genderController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'gender',
                  ),
                ),
                TextFormField(
                  controller: guestEmailController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Email',
                  ),
                ),
                TextFormField(
                  controller: priceController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Price',
                  ),
                ),
                TextFormField(
                  controller: quantityController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Quantity',
                  ),
                ),
                DropdownButton<String>(
                  value: selectedItem, // set the selected item to the variable
                  hint: Text(
                      'Select a ticket'), // set the hint text for the dropdown
                  onChanged: (String? value) {
                    // define the function to be executed when an item is selected
                    setState(() {
                      selectedItem =
                          value ?? ''; // update the selected item variable
                    });
                  },
                  items: ticketsListIDs.map((String? item) {
                    // map the list of ticket IDs to dropdown menu items
                    return DropdownMenuItem<String>(
                      value: item ?? '',
                      child: Text(item ?? ''),
                    );
                  }).toList(),
                ),
                ElevatedButton(
                    onPressed: () async {
                      setState(() {
                        isLoading = true;
                      });
                      try {
                        String response = await creatorData.addAttendee(
                            ticketID: selectedItem ?? 'temp',
                            eventID: widget.eventdetails.eventID,
                            firstName: firstNameController.text,
                            lastName: lastNameController.text,
                            phoneNumber: phoneNumberController.text,
                            gender: genderController.text,
                            guestEmail: guestEmailController.text,
                            price: int.parse(priceController.text),
                            quantity: int.parse(quantityController.text));

                      }catch(e){
                        setState(() {
                          isLoading = false;
                        });
                      }finally{
                        setState(() {
                          isLoading = false;
                        });
                      }
                      setState(() {
                        addAttendee=false;
                        ticketsListIDs.clear();
                      });
                      ticketsListIDs.remove(selectedItem);
                    },
                    child: Text('add')),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
