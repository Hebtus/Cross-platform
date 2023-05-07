import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:hebtus_crossplatform/models/promocodes.dart';
import 'package:hebtus_crossplatform/screens/Creator/Components/creator_components.dart';
import 'package:hebtus_crossplatform/screens/Creator/Tickets/add_more_tickets.dart';
import 'package:hebtus_crossplatform/screens/Creator/Tickets/add_promo_code.dart';
import 'package:hebtus_crossplatform/screens/Creator/Tickets/edit_ticket.dart';
import 'package:hebtus_crossplatform/services/creator_service.dart';
import 'package:file_picker/file_picker.dart';

import '../../../models/creator_events.dart';
import '../../../models/creator_tickets.dart';
//notes for the testing team :
//pressing the refresh button will make the get tickets request from the backend and the ticket cards will be viewed
//press add ticket to navigate to the adding ticket page and make the create ticket request

String pageTitle = 'Tickets';
bool buttonAdmission = true;
bool buttonAddons = false;
bool buttonPromoCode = false;
bool buttonHold = false;
bool buttonSettings = false;

bool checkBoxDisplaySettings = false;

enum SingingCharacter { ticketEvent, regEvent }

enum SampleItem { itemOne, itemTwo, itemThree }

List _items = [];
List _itemsPromo = [];

SampleItem? selectedMenu;
SingingCharacter? _character = SingingCharacter.ticketEvent;

CreatorService creatorData = CreatorService();
List<CreatorTicket>? ticketsList;
List<PromoCodes>? promoList;

///name:readJson
///Description:read a json file for tickets list from assets and added to a global variable
///return type:non
///--------------------------------------
///name:read promo
///Description:read a json file for promo code list from assets and added to a global variable
///return type:non
///---------------------------------------
///tabMenu
///Description:this method returns the row of button tabs to navigate the tickets page
/// return type:Column
/// ----------------------------------------
/// name:tabsettings
///Description:this contains the settings page field
/// return type:Column
/// --------------------------------------------------
/// name ticketCard
///Description:this methode tickets list and draws the container with the contained data
/// return type:Column
/// -----------------------------------------------
/// promoCodeTable
///Description:this methode promo code list and draws the container with the contained data
/// return type:Column
class Tickets extends StatefulWidget {
  Tickets({Key? key, required this.eventdetails}) : super(key: key);
  final CreatorEvent eventdetails;

  @override
  State<Tickets> createState() => _TicketsState();
}

class _TicketsState extends State<Tickets> {
  final GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();

  ///Description:read a json file for tickets list from assets and added to a global variable
  ///return type:non
  Future<void> readJson() async {
    final String response =
        await rootBundle.loadString('assets/json/tickets_test.json');
    final data = await json.decode(response);
    setState(() {
      _items = data["items"];
    });
  }

  ///Description:read a json file for promo code list from assets and added to a global variable
  ///return type:non
  Future<void> readJsonPromo() async {
    final String response =
        await rootBundle.loadString('assets/json/promo_code.json');
    final data = await json.decode(response);
    setState(() {
      _itemsPromo = data["items"];
    });
  }

  Future<void> pickAndSendCsv() async {
    // Show file picker dialog
    final pickedFile = await FilePicker.platform.pickFiles();

    if (pickedFile != null) {
      // Create File object from picked file path
      File csvFile = File(pickedFile.files.single.path!);

      // Call sendCsvAndJson function to upload file
      await creatorData.sendCsv(csvFile,widget.eventdetails.eventID);
    }
  }

  ///Description:this method returns the row of button tabs to navigate the tickets page
  /// return type:Column
  Column tabMenu() {
    return Column(
      children: [
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              ElevatedButton(
                  onPressed: () {
                    setState(() {
                      buttonAdmission = true;
                      buttonAddons = buttonAddons ? false : false;
                      buttonPromoCode = buttonPromoCode ? false : false;
                      buttonHold = buttonHold ? false : false;
                      buttonSettings = buttonSettings ? false : false;
                      pageTitle = 'Tickets';
                      readJson();
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                  ),
                  child: const Text('Admission')),
              ElevatedButton(
                  onPressed: () {
                    setState(() {
                      buttonAdmission = buttonAdmission ? false : false;
                      buttonAddons = buttonAddons ? false : false;
                      buttonPromoCode = true;
                      buttonHold = buttonHold ? false : false;
                      buttonSettings = buttonSettings ? false : false;
                      pageTitle = 'Promo code';
                     // readJsonPromo();
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                  ),
                  child: const Text('Promo code')),
            ],
          ),
        ),
      ],
    );
  }

  ///Description:this contains the settings page field
  /// return type:Column
  Column tabSettings() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Display settings',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        CheckboxListTile(
          title: const Text("Display number of tickets remaining."),
          value: checkBoxDisplaySettings,
          onChanged: (newValue) {
            setState(() {
              checkBoxDisplaySettings = newValue!;
            });
          },
          controlAffinity:
              ListTileControlAffinity.leading, //  <-- leading Checkbox
        ),
        const SizedBox(
          height: 20,
        ),
        const Text(
          'Event type',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        ListTile(
          title: const Text('Ticket Event'),
          leading: Radio<SingingCharacter>(
            value: SingingCharacter.ticketEvent,
            groupValue: _character,
            onChanged: (SingingCharacter? value) {
              setState(() {
                _character = value;
              });
            },
          ),
        ),
        ListTile(
          title: const Text('Registration Event'),
          leading: Radio<SingingCharacter>(
            value: SingingCharacter.regEvent,
            groupValue: _character,
            onChanged: (SingingCharacter? value) {
              setState(() {
                _character = value;
              });
            },
          ),
        ),
        const Text(
          'Display a message after ticket sales end',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        const Text(
          'Tell event-goers when your event starts and ends so they can make plans to attend.',
          style: TextStyle(
            fontSize: 13,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        TextFormField(
          onChanged: (String value) {
            setState(() {});
          },
          decoration: const InputDecoration(
            //hint addressa dispappers while the lable remains
            border: OutlineInputBorder(),
          ),
        ),
      ],
    );
  }

  ///Description:this methode tickets list and draws the container with the contained data
  /// return type:Column
  Column ticketCard(List ticketsList, int i) {
    return Column(
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
                  children: [
                    Row(
                      children: [
                        Text(
                          ticketsList[i]["name"],
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(fontSize: 20.0),
                        ),
                        const Spacer(),
                        PopupMenuButton<SampleItem>(
                          initialValue: selectedMenu,
                          // Callback that sets the selected popup menu item.
                          onSelected: (SampleItem item) {
                            setState(() {
                              selectedMenu = item;
                            });
                          },
                          itemBuilder: (BuildContext context) =>
                              <PopupMenuEntry<SampleItem>>[
                            const PopupMenuItem<SampleItem>(
                              value: SampleItem.itemOne,
                              child: Text('edit'),
                            ),
                            const PopupMenuItem<SampleItem>(
                              value: SampleItem.itemTwo,
                              child: Text('copy'),
                            ),
                            const PopupMenuItem<SampleItem>(
                              value: SampleItem.itemThree,
                              child: Text('delete'),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const CircleAvatar(
                          backgroundColor: Colors.green,
                          radius: 4,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        const Text(
                          "On Sale",
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(fontSize: 20.0, color: Colors.grey),
                        ),
                        const Spacer(),
                        Text(
                          ticketsList[i]["cost"],
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(fontSize: 20.0),
                        ),
                      ],
                    ),
                    const Divider(
                      thickness: 1,
                    ),
                    Row(
                      children: [
                        const Text(
                          "Quantity ",
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(fontSize: 20.0, color: Colors.grey),
                        ),
                        Text(
                          ticketsList[i]["quantity"],
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                              fontSize: 20.0, color: Colors.black),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        )
      ],
    );
  }

  Column ticketCardFromWeb(List<CreatorTicket> ticketsList, int i) {
    return Column(
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
                  children: [
                    Row(
                      children: [
                        Text(
                          ticketsList[i].name,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(fontSize: 20.0),
                        ),
                        const Spacer(),
                        PopupMenuButton<SampleItem>(
                          initialValue: selectedMenu,
                          // Callback that sets the selected popup menu item.
                          onSelected: (SampleItem item) {
                            setState(() {
                              selectedMenu = item;
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => EditTicket(
                                      eventIDhere:widget.eventdetails.eventID,ticketIDHere: ticketsList[i].ticketID ,)),
                              );
                            });
                          },
                          itemBuilder: (BuildContext context) =>
                              <PopupMenuEntry<SampleItem>>[
                            const PopupMenuItem<SampleItem>(
                              value: SampleItem.itemOne,
                              child: Text('edit'),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const CircleAvatar(
                          backgroundColor: Colors.green,
                          radius: 4,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        const Text(
                          "On Sale",
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(fontSize: 20.0, color: Colors.grey),
                        ),
                        const Spacer(),
                        Text(
                          ticketsList[i].capacity.toString() + '\$',
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(fontSize: 20.0),
                        ),
                      ],
                    ),
                    const Divider(
                      thickness: 1,
                    ),
                    Row(
                      children: [
                        const Text(
                          "Quantity ",
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(fontSize: 20.0, color: Colors.grey),
                        ),
                        Text(
                          ticketsList[i].price.toString(),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                              fontSize: 20.0, color: Colors.black),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        )
      ],
    );
  }

  ///Description:this methode promo code list and draws the container with the contained data
  /// return type:Column
  DataRow promoCodetable(List promoList, int i) {
    return DataRow(cells: [
      DataCell(Text(promoList[i]["name"])),
      DataCell(Text(promoList[i]["codeType"])),
      DataCell(Text(promoList[i]["discount"])),
      DataCell(Text(promoList[i]["uses"])),
      DataCell(Text(promoList[i]["status"])),
      DataCell(
        PopupMenuButton<SampleItem>(
          initialValue: selectedMenu,
          // Callback that sets the selected popup menu item.
          onSelected: (SampleItem item) {
            setState(() {
              selectedMenu = item;
            });
          },
          itemBuilder: (BuildContext context) => <PopupMenuEntry<SampleItem>>[
            const PopupMenuItem<SampleItem>(
              value: SampleItem.itemOne,
              child: Text('edit'),
            ),
            const PopupMenuItem<SampleItem>(
              value: SampleItem.itemThree,
              child: Text('delete'),
            ),
          ],
        ),
      ),
    ]);
  }

  DataRow promoCodetableWeb(List<PromoCodes> promoListWeb, int i) {
    return DataRow(cells: [
      DataCell(Text(promoListWeb[i].codeName)),
      DataCell(Text(
          promoListWeb[i].discountOrPercentage == 1 ? "percantage" : "price")),
      DataCell(Text(promoListWeb[i].discountOrPercentage == 1
          ? promoListWeb[i].percentageAmount.toString()
          : promoListWeb[i].discountAmount.toString())),
      DataCell(Text(promoListWeb[i].limit.toString())),
      DataCell(Text("active")),
      DataCell(
        PopupMenuButton<SampleItem>(
          initialValue: selectedMenu,
          // Callback that sets the selected popup menu item.
          onSelected: (SampleItem item) {
            setState(() {
              selectedMenu = item;
            });
          },
          itemBuilder: (BuildContext context) => <PopupMenuEntry<SampleItem>>[
            const PopupMenuItem<SampleItem>(
              value: SampleItem.itemOne,
              child: Text('edit'),
            ),
            const PopupMenuItem<SampleItem>(
              value: SampleItem.itemThree,
              child: Text('delete'),
            ),
          ],
        ),
      ),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    bool isLoading = false;
    return Scaffold(
        bottomSheet: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: ElevatedButton(
            onPressed: () {},
            child: const Text('Next'),
          ),
        ),
        key: _globalKey,
        appBar: appBarModule(context),
        drawer: appDrawer(context, "Tickets", widget.eventdetails),
        body: SingleChildScrollView(
            child: SingleChildScrollView(
          child: isLoading
              ? const Center(
                  child: CircularProgressIndicator(
                  backgroundColor: Colors.transparent,
                ))
              : Column(
                  children: [
                    sideMenuModule(_globalKey, pageTitle),
                    //for ( var i = 0; i < 10; i++ )  tabMenu(),
                    const SizedBox(
                      height: 10,
                    ),
                    tabMenu(),

                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 10,
                            ),
                            if (buttonAdmission) ...[
                              // for (int i = 0; i < _items.length; i++)
                              //   ticketCard(_items, i),
                              if (ticketsList != null) ...[
                                for (int i = 0; i < ticketsList!.length; i++)
                                  ticketCardFromWeb(ticketsList!, i),
                              ],
                              const SizedBox(
                                height: 50,
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width,
                                child: ElevatedButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => AddMoreTickets(
                                              eventID:
                                                  widget.eventdetails.eventID)),
                                    );
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                        Colors.white, // Background colo// r
                                  ),
                                  child: const Text(
                                    '+ Add more tickets',
                                    style: TextStyle(color: Colors.blueAccent),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width,
                                child: ElevatedButton(
                                  onPressed: () async {
                                    setState(() {
                                      isLoading = true;
                                    });
                                    //readJson();
                                    try {
                                      ticketsList = await creatorData
                                          .getCreatorEventTickets(
                                              eventID:
                                                  widget.eventdetails.eventID,
                                              limit: 100,
                                              page: 1) as List<CreatorTicket>?;
                                      context.goNamed("tickets",
                                          extra: widget.eventdetails);
                                    } catch (e) {
                                      setState(() {
                                        isLoading = false;
                                      });
                                    } finally {
                                      setState(() {
                                        isLoading = false;
                                      });
                                    }
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                        Colors.white, // Background colo// r
                                  ),
                                  child: const Text(
                                    'Refresh',
                                    style: TextStyle(color: Colors.blueAccent),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 50,
                              ),
                            ],
                            if (buttonAddons) ...[],
                            if (buttonPromoCode) ...[
                              ElevatedButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => AddPromoCode(
                                              eventID:
                                                  widget.eventdetails.eventID)),
                                    );
                                  },
                                  child: const Text('Add a code')),
                              ElevatedButton(
                                  onPressed: () {
                                    pickAndSendCsv();
                                  },
                                  child: const Text('upload CSV')),
                              SizedBox(
                                width: MediaQuery.of(context).size.width,
                                child: ElevatedButton(
                                  onPressed: () async {
                                    setState(() {
                                      isLoading = true;
                                    });
                                    //readJson();
                                    try {
                                      promoList =
                                          await creatorData.getCreatorPromoCode(
                                              eventID:
                                                  widget.eventdetails.eventID,
                                              limit: 100,
                                              page: 1);
                                      print(promoList);
                                      context.goNamed("tickets",
                                          extra: widget.eventdetails);
                                    } catch (e) {
                                      setState(() {
                                        isLoading = false;
                                      });
                                    } finally {
                                      setState(() {
                                        isLoading = false;
                                      });
                                    }
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                        Colors.white, // Background colo// r
                                  ),
                                  child: const Text(
                                    'Refresh',
                                    style: TextStyle(color: Colors.blueAccent),
                                  ),
                                ),
                              ),
                              SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: DataTable(columns: const [
                                  DataColumn(
                                      label: Text('Name',
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold))),
                                  DataColumn(
                                      label: Text('Code type',
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold))),
                                  DataColumn(
                                      label: Text('Discount',
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold))),
                                  DataColumn(
                                      label: Text('Uses',
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold))),
                                  DataColumn(
                                      label: Text('Status',
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold))),
                                  DataColumn(
                                      label: Text('Options',
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold))),
                                ], rows: [

                                  if (promoList != null) ...[
                                    for (int i = 0; i < promoList!.length; i++)
                                      promoCodetableWeb(promoList!, i),
                                  ],
                                ]),
                              )
                            ],
                            if (buttonHold) ...[],
                            if (buttonSettings) ...[
                              tabSettings(),
                            ],
                          ]),
                    ),
                  ],
                ),
        )));
  }
}
