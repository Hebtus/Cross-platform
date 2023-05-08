import 'dart:convert';
import 'dart:developer';
import 'package:go_router/go_router.dart';
import 'package:hebtus_crossplatform/models/promocodes.dart';
import 'package:hebtus_crossplatform/screens/all_screens.dart';
import 'package:http/http.dart' as http;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hebtus_crossplatform/screens/Creator/Components/creator_components.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io' show File, Platform;
import 'package:hebtus_crossplatform/models/creator_events.dart';
import 'package:hebtus_crossplatform/models/location.dart';

import '../../../current_user.dart';
import '../../../models/creator_bookings.dart';
import '../../../models/creator_tickets.dart';
import '../../../models/sales.dart';
//notes for testing team:
//this is where the event making will start
//the user can write the event name only within the given limit
//category is choosen from a drop down menu and has a defult value
//tags are optional and are not nedded to move forward
//the location uses geofiy api to auto complete and if the event has venu choosen then it is need to move forward
//in choosing time, recurring event doesnt need the data and is used to move forward without entering the date
//on choosing single event the date should be choosen by pressing the calender icon and the time from the drop down box
//the upload image option is used by pressing the button and navigating to the gallery or taking an image
//NOTE THAT :if you pressed return without choosing an image it will cause an exception we know the error and are working on it
//descrptuion field is also optional and is not required to move forward
//press save to save the basic info and move to the navigation screen with tickets and publish tabs
//moving forwared the basic info will only be viewed and cant be edited
// the field to filled will highlight red if not filled

///extract widget look it up
int eventNameCount = 0;
int tagsCount = 0;
bool buttonVenue = true;
bool buttonOnlineEvent = false;
bool buttonToBeAnnounced = false;
bool buttonSingleEvent = true;
bool buttonRecurringEvent = false;
TextEditingController _date = TextEditingController();
DateTime selectedDate = DateTime.now();
TextEditingController _date2 = TextEditingController();
DateTime selectedDate2 = DateTime.now();
bool displayStartTime = false;
bool displayEndTime = false;
bool enableVar = true;
bool imageUploudedCheck = false;

TextEditingController tagsController = TextEditingController();
TextEditingController descriptionController = TextEditingController();

late ImagePicker picker;
String imageUrl = '';
String? filePath;
File? imageObj;
late var img;

String _dropDownValue = "Music";
String _dropDownValueStartTime = "02:00";
String _dropDownValueEndTime = "02:00";

//////////////////////////////passed values to basic info
TextEditingController eventName = TextEditingController();

final _controller = TextEditingController();
List<String> _suggestions = [];
double _latitude = 0;
double _longitude = 0;

final apiKey = '8c0ae3cbd8fc449aab02e760ef906a5d';

DateTime start = DateTime(2000);
DateTime end = DateTime(2100);
Location egypt = Location(longitude: 1, latitude: 2);
CreatorEvent eventdetails = CreatorEvent(
    eventID: '1',
    eventName: ' eventName',
    imgURL: 'imgURL',
    startTime: start,
    endTime: end,
    location: egypt,
    locationName: 'locationName',
    category: 'category',
    isDraft: true);

///name:_selectDate
///Description:add a calender with start and end date to an icon
///return type:non
///--------------------------------------------------------
///name:basicInfoField()
///Description:this method contains the basic info field in the page,contains only textfieldform
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
class BasicInfoStart extends StatefulWidget {
  const BasicInfoStart({super.key});

  @override
  State<BasicInfoStart> createState() => _BasicInfoStartState();
}

class _BasicInfoStartState extends State<BasicInfoStart> {
  final GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();
  final TextEditingController _searchController = TextEditingController();
  String _responseText = '';
  final _formKey = GlobalKey<FormState>();
  String _inputValue = '';

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
                      imageUploudedCheck = true;
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
                        print(imageUploudedCheck);
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

  Future<List<String>> getAutocompleteSuggestions(
      String input, String apiKey) async {
    final url =
        'https://api.geoapify.com/v1/geocode/autocomplete?text=$input&apiKey=$apiKey';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      final features = json['features'] as List<dynamic>;
      final suggestions =
          features.map((f) => f['properties']['formatted'] as String).toList();
      return suggestions;
    } else {
      throw Exception('Failed to load autocomplete suggestions');
    }
  }

  Future<void> getCoordinates(String location, String apiKey) async {
    final url =
        'https://api.geoapify.com/v1/geocode/search?text=$location&apiKey=$apiKey';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      final features = json['features'] as List<dynamic>;

      if (features.isNotEmpty) {
        final geometry = features[0]['geometry'] as Map<String, dynamic>;
        final coordinates = geometry['coordinates'] as List<dynamic>;
        setState(() {
          _latitude = coordinates[1];
          _longitude = coordinates[0];
        });
      } else {
        setState(() {
          _latitude = 0;
          _longitude = 0;
        });
      }
    } else {
      setState(() {
        _latitude = 0;
        _longitude = 0;
      });
    }
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
          controller: eventName,
          validator: (value) {
            if (value != null && value.isEmpty) {
              return 'Please enter event name ';
            }
            return null;
          },
          enabled: enableVar,
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
        DropdownButton(
          hint: _dropDownValue == null
              ? Text('Music')
              : Text(
                  _dropDownValue!,
                  style: TextStyle(color: Colors.blue),
                ),
          isExpanded: true,
          iconSize: 30.0,
          style: TextStyle(color: Colors.blue),
          items: ['Music', 'Charity & Causes', 'Food &drinks'].map(
            (val) {
              return DropdownMenuItem<String>(
                value: val,
                child: Text(val),
              );
            },
          ).toList(),
          onChanged: (val) {
            setState(
              () {
                _dropDownValue = val!;
              },
            );
          },
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
          controller: tagsController,
          enabled: enableVar,
          maxLength: 25,
          onChanged: (String value) {
            setState(() {
              tagsCount = value.length;
            });
          },
          decoration: InputDecoration(
            labelText:
                'Add search keywords to your event', //hint addressa dispappers while the lable remains
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
          Column(
            children: [
              TextFormField(
                validator: (value) {
                  if ((value != null && value.isEmpty) && buttonVenue == true) {
                    return 'Please enter event location';
                  }
                  return null;
                },
                controller: _controller,
                onChanged: (input) async {
                  final suggestions =
                      await getAutocompleteSuggestions(input, apiKey);
                  setState(() {
                    _suggestions = suggestions;
                  });
                },
              ),
              if (_suggestions.isNotEmpty)
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: _suggestions.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(_suggestions[index]),
                      onTap: () async {
                        await getCoordinates(_suggestions[index], apiKey);
                        _controller.text = _suggestions[index];
                        setState(() {
                          _suggestions = [];
                        });
                      },
                    );
                  },
                ),
              if (_latitude != null && _longitude != null)
                Text(
                    'Latitude: ${_latitude!.toStringAsFixed(6)}, Longitude: ${_longitude!.toStringAsFixed(6)}'),
            ],
          )
        ],
        if (buttonOnlineEvent) ...[
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
            validator: (value) {
              if ((value != null && value.isEmpty) &&
                  buttonSingleEvent == true) {
                return 'Please enter event start date ';
              }
              return null;
            },
            readOnly: true,
            enabled: enableVar,
            controller: _date,
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
          DropdownButton(
            hint: _dropDownValueStartTime == null
                ? Text('02:00')
                : Text(
                    _dropDownValueStartTime!,
                    style: TextStyle(color: Colors.blue),
                  ),
            isExpanded: true,
            iconSize: 30.0,
            style: TextStyle(color: Colors.blue),
            items: [
              '01:00',
              '01:30',
              '02:00',
              '02:30',
              '03:00',
              '03:30',
              '04:00',
              '04:30',
              '05:00',
              '05:30',
              '06:00',
              '06:30',
              '07:00',
              '07:30',
              '08:00',
              '08:30',
              '09:00',
              '09:30',
              '10:00',
              '10:30',
              '11:30',
              '11:30',
              '12:30',
              '13:00',
              '13:30',
              '14:00',
              '14:30',
              '15:00',
              '15:30',
              '16:00',
              '16:30',
              '17:00',
              '17:30',
              '18:00',
              '18:30',
              '19:00',
              '19:30',
              '20:00',
              '20:30',
              '21:00',
              '21:30',
              '22:00',
              '22:30',
              '23:00',
              '23:30'
            ].map(
              (val) {
                return DropdownMenuItem<String>(
                  value: val,
                  child: Text(val),
                );
              },
            ).toList(),
            onChanged: (val) {
              setState(
                () {
                  _dropDownValueStartTime = val!;
                },
              );
            },
          ),
          const SizedBox(
            height: 20,
          ),
          TextFormField(
            validator: (value) {
              if (value != null && value.isEmpty) {
                return 'Please enter event end date ';
              }
              return null;
            },
            readOnly: true,
            enabled: enableVar,
            controller: _date2,
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
          DropdownButton(
            hint: _dropDownValueEndTime == null
                ? Text('02:00')
                : Text(
                    _dropDownValueEndTime!,
                    style: TextStyle(color: Colors.blue),
                  ),
            isExpanded: true,
            iconSize: 30.0,
            style: TextStyle(color: Colors.blue),
            items: [
              '01:00',
              '01:30',
              '02:00',
              '02:30',
              '03:00',
              '03:30',
              '04:00',
              '04:30',
              '05:00',
              '05:30',
              '06:00',
              '06:30',
              '07:00',
              '07:30',
              '08:00',
              '08:30',
              '09:00',
              '09:30',
              '10:00',
              '10:30',
              '11:30',
              '11:30',
              '12:30',
              '13:00',
              '13:30',
              '14:00',
              '14:30',
              '15:00',
              '15:30',
              '16:00',
              '16:30',
              '17:00',
              '17:30',
              '18:00',
              '18:30',
              '19:00',
              '19:30',
              '20:00',
              '20:30',
              '21:00',
              '21:30',
              '22:00',
              '22:30',
              '23:00',
              '23:30'
            ].map(
              (val) {
                return DropdownMenuItem<String>(
                  value: val,
                  child: Text(val),
                );
              },
            ).toList(),
            onChanged: (val) {
              setState(
                () {
                  _dropDownValueEndTime = val!;
                },
              );
            },
          ),

        ],

      ],
    );
  }

  Column imageUpload() {
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
        ElevatedButton(
          onPressed: () {
            myAlert();
            print(filePath);
          },
          child: Text('Upload Photo'),
        ),
        SizedBox(
          height: 10,
        ),
        imageUrl != ''
            ? Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: kIsWeb
                      ? Image.network(
                          imageUrl!,
                          fit: BoxFit.cover,
                          height: 200,
                        )
                      : Image.file(
                          File(imageUrl!),
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
      bottomSheet: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: ElevatedButton(
          onPressed: () async {
            setState(() {
              print(imageUploudedCheck);
              //enableVar = false;
              if (_formKey.currentState!.validate() &&
                  imageUploudedCheck == true&&selectedDate.isBefore(selectedDate2)) {
                _formKey.currentState?.save();
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) => BasicInfo(eventName: eventName.text,eventCategory: _dropDownValue) ,
                //   ),
                // );
                DateTime sendStart = DateTime(
                    selectedDate.year,
                    selectedDate.month,
                    selectedDate.day,
                    int.parse(_dropDownValueStartTime.substring(0, 2)),
                    int.parse(_dropDownValueStartTime.substring(3, 5))); //02:00
                DateTime sendEnd = DateTime(
                    selectedDate2.year,
                    selectedDate2.month,
                    selectedDate2.day,
                    int.parse(_dropDownValueEndTime.substring(0, 2)),
                    int.parse(_dropDownValueEndTime.substring(3, 5))); //02:00
                double? sendLong = _longitude;
                double? sendlat = _latitude;
                Location eventLocation =
                    Location(longitude: sendLong, latitude: sendlat);

                CreatorEvent Eventdata = CreatorEvent(
                  description: descriptionController.text,
                    tags: [tagsController.text],
                    eventID: '2',
                    eventName: eventName.text,
                    imgURL: imageUrl,
                    startTime: sendStart,
                    endTime: sendEnd,
                    location: eventLocation,
                    locationName: _controller.text,
                    isDraft: true,
                    category: _dropDownValue,
                    isOnline: buttonOnlineEvent);
                print(sendStart);

                eventdetails = Eventdata;
              }
            });
            eventdetails = await creatorData.createEvent(
                imageUrl, File(img.path), eventdetails);
            print(eventdetails);
            context.goNamed("basicinfo", extra: eventdetails);
          },
          child: const Text('Save'),
        ),
      ),
      key: _globalKey,
      appBar: appBarModule(context),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            children: [
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
                    imageUpload(),
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
                    TextField(
                      controller: descriptionController,
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
      ),
    );
  }
}
