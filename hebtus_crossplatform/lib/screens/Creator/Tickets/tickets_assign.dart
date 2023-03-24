import 'package:flutter/material.dart';
import 'package:hebtus_crossplatform/screens/Creator/Components/creator_components.dart';
import 'package:hebtus_crossplatform/screens/Creator/Tickets/add_more_tickets.dart';
import 'package:hebtus_crossplatform/screens/Creator/Tickets/add_promo_code.dart';

String pageTitle = 'Tickets';
bool buttonAdmission = true;
bool buttonAddons = false;
bool buttonPromoCode = false;
bool buttonHold = false;
bool buttonSettings = false;

bool checkBoxDisplaySettings = false;

enum SingingCharacter { ticketEvent, RegEvent }

enum SampleItem { itemOne, itemTwo, itemThree }

SampleItem? selectedMenu;
SingingCharacter? _character = SingingCharacter.ticketEvent;

class Tickets extends StatefulWidget {
  const Tickets({Key? key}) : super(key: key);

  @override
  State<Tickets> createState() => _TicketsState();
}

class _TicketsState extends State<Tickets> {
  final GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();
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
                    });
                  },
                  child: Text('Admission'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                  )),
              ElevatedButton(
                  onPressed: () {
                    setState(() {
                      buttonAdmission = buttonAdmission ? false : false;
                      buttonAddons = true;
                      buttonPromoCode = buttonPromoCode ? false : false;
                      buttonHold = buttonHold ? false : false;
                      buttonSettings = buttonSettings ? false : false;
                      pageTitle = 'Add-ons';
                    });
                  },
                  child: Text('Add-ons'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                  )),
              ElevatedButton(
                  onPressed: () {
                    setState(() {
                      buttonAdmission = buttonAdmission ? false : false;
                      buttonAddons = buttonAddons ? false : false;
                      buttonPromoCode = true;
                      buttonHold = buttonHold ? false : false;
                      buttonSettings = buttonSettings ? false : false;
                      pageTitle = 'Promo code';
                    });
                  },
                  child: Text('Promo code'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                  )),
              ElevatedButton(
                  onPressed: () {
                    setState(() {
                      buttonAdmission = buttonAdmission ? false : false;
                      buttonAddons = buttonAddons ? false : false;
                      buttonPromoCode = buttonPromoCode ? false : false;
                      buttonHold = true;
                      buttonSettings = buttonSettings ? false : false;
                      pageTitle = 'Holds';
                    });
                  },
                  child: Text('Holds'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                  )),
              ElevatedButton(
                  onPressed: () {
                    setState(() {
                      buttonAdmission = buttonAdmission ? false : false;
                      buttonAddons = buttonAddons ? false : false;
                      buttonPromoCode = buttonPromoCode ? false : false;
                      buttonHold = buttonHold ? false : false;
                      buttonSettings = true;
                      pageTitle = 'Settings';
                    });
                  },
                  child: Text('Settings'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                  )),
            ],
          ),
        ),
      ],
    );
  }

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
        SizedBox(
          height: 10,
        ),
        CheckboxListTile(
          title: Text("Display number of tickets remaining."),
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
        SizedBox(
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
            value: SingingCharacter.RegEvent,
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
        SizedBox(
          height: 10,
        ),
        const Text(
          'Tell event-goers when your event starts and ends so they can make plans to attend.',
          style: TextStyle(
            fontSize: 13,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        TextFormField(
          onChanged: (String value) {
            setState(() {});
          },
          decoration: InputDecoration(
            //hint addressa dispappers while the lable remains
            border: const OutlineInputBorder(),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomSheet: Container(
          width: MediaQuery.of(context).size.width,
          child: ElevatedButton(
            onPressed: () {},
            child: Text('Next'),
          ),
        ),
        key: _globalKey,
        appBar: appBarModule(),
        drawer: appDrawer(context),
        body: SingleChildScrollView(
            child: Column(
          children: [
            sideMenuModule(_globalKey, pageTitle),
            //for ( var i = 0; i < 10; i++ )  tabMenu(),
            SizedBox(
              height: 10,
            ),
            tabMenu(),

            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    if (buttonAdmission) ...[
                      Material(
                        elevation: 5,
                        child: Container(
                          height: 200,
                          padding: const EdgeInsets.all(25.0),
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5))),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  const Text(
                                    "General admission",
                                    style: TextStyle(fontSize: 20.0),
                                  ),
                                  Spacer(),
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
                                  CircleAvatar(
                                    backgroundColor: Colors.green,
                                    radius: 4,
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  const Text(
                                    "On Sale",
                                    style: TextStyle(
                                        fontSize: 20.0, color: Colors.grey),
                                  ),
                                  Spacer(),
                                  const Text(
                                    "Free",
                                    style: TextStyle(fontSize: 20.0),
                                  ),
                                ],
                              ),
                              const Divider(
                                thickness: 1,
                              ),
                              Row(
                                children: [
                                  const Text(
                                    "Available Quantity ",
                                    style: TextStyle(
                                        fontSize: 20.0, color: Colors.grey),
                                  ),
                                  const Text(
                                    "20 ",
                                    style: TextStyle(
                                        fontSize: 20.0, color: Colors.black),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => addMoreTickets()),);

                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                Colors.white, // Background colo// r
                          ),
                          child: Text(
                            '+ Add more tickets',
                            style: TextStyle(color: Colors.blueAccent),
                          ),
                        ),
                      ),
                    ],
                    if (buttonAddons) ...[],
                    if (buttonPromoCode) ...[
                      ElevatedButton(onPressed: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => addPromoCode()),);

                      }, child: Text('Add a code')),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: DataTable(columns: [
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
                          DataRow(cells: [
                            DataCell(Text('911223')),
                            DataCell(Text('Applies discount')),
                            DataCell(Text('\$12.00')),
                            DataCell(Text('0/unlimited')),
                            DataCell(Text('Active')),
                            DataCell(                                  PopupMenuButton<SampleItem>(
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
                                  value: SampleItem.itemThree,
                                  child: Text('delete'),
                                ),
                              ],
                            ),),
                          ]),





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
        )));
  }
}
