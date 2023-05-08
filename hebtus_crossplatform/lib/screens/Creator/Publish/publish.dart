import 'package:flutter/material.dart';
import 'package:hebtus_crossplatform/screens/Creator/Components/creator_components.dart';

import '../../../models/creator_events.dart';
import 'dart:convert';
import 'dart:developer';
import 'package:go_router/go_router.dart';
import 'package:hebtus_crossplatform/screens/all_screens.dart';
import 'package:http/http.dart' as http;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io' show File, Platform;
import 'package:hebtus_crossplatform/models/creator_events.dart';
import 'package:hebtus_crossplatform/models/location.dart';

enum radioButton { publicEv, privateEv }

radioButton? _character = radioButton.publicEv;

enum radioButton2 { publicEv2, privateEv2 }

radioButton2? _character2 = radioButton2.publicEv2;
String? _dropDownValue = "Any one with link";

TextEditingController _date = TextEditingController();
DateTime selectedDatePublish = DateTime.now();
bool enableDate = false;

class Publish extends StatefulWidget {
  Publish({Key? key, required this.eventdetails}) : super(key: key);
  final CreatorEvent eventdetails;

  @override
  State<Publish> createState() => _PublishState();
}

class _PublishState extends State<Publish> {
  final GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();
  Future _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDatePublish,
        firstDate: DateTime(1900),
        lastDate: DateTime(2100));
    if (picked != null && picked != selectedDatePublish) {
      setState(() {
        selectedDatePublish = picked;
        _date.value = TextEditingValue(
            text: "${selectedDatePublish.toLocal()}".split(' ')[0]);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _globalKey,
        appBar: appBarModule(context),
        drawer: appDrawer(context, "publish", widget.eventdetails),
        body: SingleChildScrollView(
            child: Column(children: [
          sideMenuModule(_globalKey, 'Publish'),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GridView.count(
                  childAspectRatio: 0.85,
                  crossAxisCount: (MediaQuery.of(context).orientation ==
                          Orientation.landscape)
                      ? 1
                      : 1,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    Container(
                        height: double.infinity,
                        child: Card(
                          child: InkWell(
                              splashColor:
                                  const Color.fromARGB(255, 250, 195, 188),
                              onTap: () {},
                              child: Container(
                                  height: double.infinity,
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 20),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            child: kIsWeb ||
                                                    widget.eventdetails.imgURL
                                                            .substring(0, 4) ==
                                                        "http"
                                                ? Image.network(
                                                    widget.eventdetails.imgURL,
                                                    fit: BoxFit.cover,
                                                    height: 200,
                                                  )
                                                : Image.file(
                                                    File(widget
                                                        .eventdetails.imgURL),
                                                    fit: BoxFit.cover,
                                                    height: 200,
                                                  ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(10.0),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                widget.eventdetails.eventName,
                                                style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              Text(
                                                widget.eventdetails.startTime
                                                    .toString(),
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                              SizedBox(
                                                height: 5,
                                              ),

                                              Text(
                                                widget
                                                    .eventdetails.locationName,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Text("Hebtus"),
                                              SizedBox(
                                                height: 10,
                                              ),

                                              // Row(
                                              //   crossAxisAlignment: CrossAxisAlignment.center,
                                              //   mainAxisAlignment: MainAxisAlignment.center,
                                              //   children: [
                                              //     TextButton(onPressed: (){},child: Text("Preview your event",
                                              //     style: TextStyle(color: Colors.blue),
                                              //
                                              //     ), ),
                                              //     Icon(Icons.open_in_new,color: Colors.blue,)
                                              //   ],
                                              // ),
                                            ],
                                          ),
                                        )
                                      ]))),
                        )),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  onPressed: () async {
                    String response = await creatorData.editEvent(
                        true,
                        widget.eventdetails.goPublicDate,
                        widget.eventdetails.eventID,
                        widget.eventdetails.description,
                        false) as String;
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('The event is now published')),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white, // Background color
                  ),
                  child: const Text(
                    'Publish The event',
                    style: TextStyle(color: Colors.blueAccent),
                  ),
                ),
                ElevatedButton(
                  onPressed: () async {
                    String response = await creatorData.editEvent(
                        false,
                        widget.eventdetails.goPublicDate,
                        widget.eventdetails.eventID,
                        widget.eventdetails.description,
                        false) as String;
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('The event is now public')),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white, // Background color
                  ),
                  child: const Text(
                    'Make the event public',
                    style: TextStyle(color: Colors.blueAccent),
                  ),
                ),
                ElevatedButton(
                  onPressed: () async {
                    String response = await creatorData.editEvent(
                        true,
                        widget.eventdetails.goPublicDate,
                        widget.eventdetails.eventID,
                        widget.eventdetails.description,
                        false) as String;
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('The event is private')),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white, // Background color
                  ),
                  child: const Text(
                    'Make The event private',
                    style: TextStyle(color: Colors.blueAccent),
                  ),
                ),
              ],
            ),
          ),
        ])));
  }
}
