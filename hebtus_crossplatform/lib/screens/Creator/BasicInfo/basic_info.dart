  import 'dart:convert';
import 'dart:developer';
import 'package:hebtus_crossplatform/constants.dart';
import 'package:http/http.dart' as http;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hebtus_crossplatform/screens/Creator/Components/creator_components.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io' show File, Platform;
import 'package:hebtus_crossplatform/models/creator_events.dart';
import 'package:hebtus_crossplatform/models/location.dart';

///extract widget look it up
int eventNameCount = 0;
int tagsCount = 0;
bool buttonVenue = false;
bool buttonOnlineEvent = false;
bool buttonToBeAnnounced = false;
bool buttonSingleEvent = false;
bool buttonRecurringEvent = false;
TextEditingController _date = TextEditingController();
DateTime selectedDate = DateTime.now();
TextEditingController _date2 = TextEditingController();
DateTime selectedDate2 = DateTime.now();
bool displayStartTime = false;
bool displayEndTime = false;
bool enableVar = true;

late ImagePicker picker;
String? imageUrl;
String? filePath;
File? imageObj;

///name:_selectDate
///Description:add a calender with start and end date to an icon
///return type:non
///--------------------------------------------------------
///name:basicInfoField()
///Description:this method contains the b info field in the page,contains only textfieldform
///Return Type:Column
///---------------------------------------------------------
///name:tagsfield
///Description:this method contains the Tags module ,textfieldform & an add button
///Return Type:Column
///---------------------------------------------------------
///name:locationField
///Description:This methode has 3 buttons that change the field according to th button pressed
///Return Type:Column
///---------------------------------------------------------
///name:dateAndtime
///Description:This methode has 3 buttons that change the field according to th button pressed
///Return Type:Column
class BasicInfo extends StatefulWidget {
  BasicInfo({Key? key, required this.eventdetails}) : super(key: key);
  final CreatorEvent eventdetails;

  @override
  State<BasicInfo> createState() => _BasicInfoState();
}

class _BasicInfoState extends State<BasicInfo> {
  final GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();
  final TextEditingController _searchController = TextEditingController();
  String _responseText = '';

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  ///Description:add a calender with start and end date to an icon
  ///return type:non
  @override
  void initState() {
    super.initState();
    picker = ImagePicker();
  }

  Future getImage() async {
    late var img;

    img = await picker.pickImage(source: ImageSource.gallery);
    imageObj = File(img.path);
    filePath = imageObj?.path;

    setState(() {
      imageUrl = img?.path;
    });
  }

  void myAlert() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            title: Text('Please choose media to select'),
            content: Container(
              height: MediaQuery.of(context).size.height / 6,
              child: Column(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                      getImage();
                    },
                    child: Row(
                      children: [
                        Icon(Icons.image),
                        Text('From Gallery'),
                      ],
                    ),
                  ),
                  if (!kIsWeb)
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                        getImage();
                      },
                      child: Row(
                        children: [
                          Icon(Icons.camera),
                          Text('From Camera'),
                        ],
                      ),
                    ),
                ],
              ),
            ),
          );
        });
  }

  Future _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(1900),
        lastDate: DateTime(2100));
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        _date.value =
            TextEditingValue(text: "${selectedDate.toLocal()}".split(' ')[0]);
      });
    }
  }

  Future _selectDate2(BuildContext context) async {
    final DateTime? picked2 = await showDatePicker(
        context: context,
        initialDate: selectedDate2,
        firstDate: DateTime(1900),
        lastDate: DateTime(2100));
    if (picked2 != null && picked2 != selectedDate2) {
      setState(() {
        selectedDate2 = picked2;
        _date2.value =
            TextEditingValue(text: "${selectedDate2.toLocal()}".split(' ')[0]);
      });
    }
  }

  ///Description:this method contains the basic info field in the page,contains only textfieldform
  ///Return Type:Column
  Column basicInfoField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Basic info',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        const Text(
          'Name your event and tell event-goers why they should come. Add details that highlight what makes it unique.',
          style: TextStyle(
            fontSize: 13,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        TextFormField(
          enabled: false,
          initialValue: widget.eventdetails.eventName,
          maxLength: 75,
          onChanged: (String value) {
            setState(() {
              eventNameCount = value.length;
            });
          },
          decoration: InputDecoration(
            labelText:
                'Event name', //hint addressa dispappers while the lable remains
            border: const OutlineInputBorder(),
            counterText: '$eventNameCount/75',
          ),
        ),
        TextFormField(
          enabled: false,
          initialValue: widget.eventdetails.category,
          decoration: InputDecoration(
            labelText:
                'Category', //hint addressa dispappers while the lable remains
            border: const OutlineInputBorder(),
          ),
        ),
      ],
    );
  }

  ///Description:this method contains the Tags module ,textfieldform & an add button
  ///Return Type:Column
  Column tagsField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Tags',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        const Text(
          'Improve discoverability of your event by adding tags relevant to the subject matter.',
          style: TextStyle(
            fontSize: 13,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
    TextFormField(
    initialValue: widget.eventdetails.tags?.isNotEmpty == true ? widget.eventdetails.tags![0] : '',
    enabled: enableVar,
    maxLength: 25,
    onChanged: (String value) {
    setState(() {
    tagsCount = value.length;
    });
    },
    decoration: InputDecoration(
    labelText: 'Add search keywords to your event',
    border: const OutlineInputBorder(),
    counterText: '$tagsCount/25',
    ),
    ),
      ],
    );
  }

  ///Description:This methode has 3 buttons that change the field according to th button pressed
  ///Return Type:Column
  Column locationsField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Location',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        const Text(
          'Help people in the area discover your event and let attendees know where to show up.',
          style: TextStyle(
            fontSize: 13,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              OutlinedButton(
                  onPressed: () {
                    setState(() {
                      buttonVenue = true;
                      buttonOnlineEvent = buttonVenue ? false : false;
                      buttonToBeAnnounced = buttonToBeAnnounced ? false : false;
                    });
                  },
                  child: const Text('Venue')),
              const SizedBox(
                width: 10,
              ),
              OutlinedButton(
                  onPressed: () {
                    setState(() {
                      buttonOnlineEvent = true;
                      buttonVenue = buttonVenue ? false : false;
                      buttonToBeAnnounced = buttonToBeAnnounced ? false : false;
                    });
                  },
                  child: const Text('Online event')),
              const SizedBox(
                width: 10,
              ),

            ],
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        if (buttonVenue) ...[
          const Text('Venue Location'),
          const SizedBox(
            height: 10,
          ),
          TextFormField(
            enabled: false,
            initialValue: widget.eventdetails.locationName,
            decoration: InputDecoration(
              hintText: 'Enter a search query',
              contentPadding: EdgeInsets.all(16.0),
            ),
          ),
        ],
        if (widget.eventdetails.isOnline == true) ...[
          const Text(
              'Online events have unique event pages where you can add links to livestreams and more'),
        ],

        const Divider(
          thickness: 1,
        ),
      ],
    );
  }

  ///Description:This methode has 3 buttons that change the field according to th button pressed
  ///Return Type:Column
  Column dateAndTimeField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Date and time',
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
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              OutlinedButton(
                  onPressed: () {
                    setState(() {
                      buttonSingleEvent = !buttonSingleEvent;
                      buttonRecurringEvent =
                          buttonRecurringEvent ? false : false;
                    });
                  },
                  child: const Text('Single event')),
              const SizedBox(
                width: 10,
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        if (buttonSingleEvent) ...[
          const Text('Single event happens once and can last multiple days '),
          const SizedBox(
            height: 20,
          ),
          TextFormField(
            enabled: false,
            initialValue:
                widget.eventdetails.startTime.toString().substring(0, 10),
            decoration: InputDecoration(
              border: const OutlineInputBorder(),
              hintText: 'Event starts',
              prefixIcon: IconButton(
                icon: const Icon(Icons.calendar_today),
                onPressed: () {
                  _selectDate(context);
                },
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          TextFormField(
            initialValue: widget.eventdetails.startTime.hour.toString() +
                ":" +
                widget.eventdetails.startTime.minute.toString(),
            enabled: false,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Start time',
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          TextFormField(
            enabled: false,
            initialValue:
                widget.eventdetails.endTime.toString().substring(0, 10),
            decoration: InputDecoration(
              border: const OutlineInputBorder(),
              hintText: 'Event ends',
              prefixIcon: IconButton(
                icon: const Icon(Icons.calendar_today),
                onPressed: () {
                  _selectDate2(context);
                },
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          TextFormField(
            enabled: false,
            initialValue: widget.eventdetails.endTime.hour.toString() +
                ":" +
                widget.eventdetails.endTime.minute.toString(),
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'End time',
            ),
          ),


        ],
      ],
    );
  }

  Column imageUpload(String img) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const Text(
          'Image upload',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        // ElevatedButton(
        //   onPressed: () {
        //     myAlert();
        //     print(filePath);
        //   },
        //   child: Text('Upload Photo'),
        // ),
        SizedBox(
          height: 10,
        ),
        img != null
            ? Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: kIsWeb ||
                          widget.eventdetails.imgURL.substring(0, 4) == "http"
                      ? Image.network(
                          img!,
                          fit: BoxFit.cover,
                          height: 200,
                        )
                      : Image.file(
                          File(img),
                          fit: BoxFit.cover,
                          height: 200,
                        ),
                ),
              )
            : Container(),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _globalKey,
      appBar: appBarModule(context),
      drawer: appDrawer(context, "basicInfo", widget.eventdetails),
      body: SingleChildScrollView(
        child: Column(
          children: [
            sideMenuModule(_globalKey, 'Basic info'),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  basicInfoField(),
                  tagsField(),
                  const SizedBox(
                    height: 20,
                  ),
                  const Divider(
                    thickness: 1,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  locationsField(),
                  const SizedBox(
                    height: 20,
                  ),
                  dateAndTimeField(),
                  const Divider(
                    thickness: 1,
                  ),
                  //////////////////////////////////////////////////////////////////////////
                  imageUpload(widget.eventdetails.imgURL),
                  const SizedBox(
                    height: 20,
                  ),
                  const Divider(
                    thickness: 1,
                  ),
                  const Text(
                    'Description',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    initialValue: widget.eventdetails.description!=null?widget.eventdetails.description:' ',

                    decoration: InputDecoration(
                      labelText: 'Description',
                      hintText: 'Enter a description',
                      border: OutlineInputBorder(),
                    ),
                    maxLines:
                        null, // allows the user to enter multiple lines of text
                    keyboardType: TextInputType
                        .multiline, // allows the keyboard to show a multiline input
                    onChanged: (value) {
                      // handle the input value here
                    },
                  ),

                  const SizedBox(
                    height: 50,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
