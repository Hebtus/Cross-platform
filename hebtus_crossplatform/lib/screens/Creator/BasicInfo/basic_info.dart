import 'package:flutter/material.dart';
import 'package:hebtus_crossplatform/screens/Creator/Components/creator_components.dart';

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
class BasicInfo extends StatefulWidget {
  const BasicInfo({super.key});

  @override
  State<BasicInfo> createState() => _BasicInfoState();
}

class _BasicInfoState extends State<BasicInfo> {
  final GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();

  ///Description:add a calender with start and end date to an icon
  ///return type:non
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
        OutlinedButton(
          onPressed: () {},
          style: OutlinedButton.styleFrom(),
          child: const Text(
            'Add',
            style: TextStyle(color: Colors.black),
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
              OutlinedButton(
                  onPressed: () {
                    setState(() {
                      buttonToBeAnnounced = true;
                      buttonVenue = buttonVenue ? false : false;
                      buttonOnlineEvent = buttonVenue ? false : false;
                    });
                  },
                  child: const Text('To be annonced')),
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
            enabled: enableVar,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'serch for venue or address',
              prefix: Icon(Icons.search),
            ),
          ),
        ],
        if (buttonOnlineEvent) ...[
          const Text(
              'Online events have unique event pages where you can add links to livestreams and more'),
        ],
        if (buttonToBeAnnounced) ...[],
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
              OutlinedButton(
                  onPressed: () {
                    setState(() {
                      buttonRecurringEvent = !buttonRecurringEvent;
                      buttonSingleEvent = buttonSingleEvent ? false : false;
                    });
                  },
                  child: const Text('Recurring Event')),
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
          TextFormField(
            enabled: enableVar,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Start time',
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          TextFormField(
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
          TextFormField(
            enabled: enableVar,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'End time',
            ),
          ),
          CheckboxListTile(
            title: const Text("Display start time"),
            value: displayStartTime,
            onChanged: (newValue) {
              setState(() {
                displayStartTime = newValue!;
              });
            },
            controlAffinity:
                ListTileControlAffinity.leading, //  <-- leading Checkbox
          ),
          CheckboxListTile(
            title: const Text("Display end time"),
            value: displayEndTime,
            onChanged: (newValue) {
              setState(() {
                displayEndTime = newValue!;
              });
            },
            controlAffinity:
                ListTileControlAffinity.leading, //  <-- leading Checkbox
          ),
          TextFormField(
            enabled: enableVar,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Time zone',
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          TextFormField(
            enabled: enableVar,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Event page languge',
            ),
          ),
        ],
        if (buttonRecurringEvent) ...[
          const Text(
              'You’ll be able to set a schedule for your recurring event in the next step. Event details and ticket types will apply to all instances.'),
          CheckboxListTile(
            title: const Text("Display end time"),
            value: displayEndTime,
            onChanged: (newValue) {
              setState(() {
                displayEndTime = newValue!;
              });
            },
            controlAffinity:
                ListTileControlAffinity.leading, //  <-- leading Checkbox
          ),
          TextFormField(
            enabled: enableVar,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Time zone',
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          TextFormField(
            enabled: enableVar,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Event page languge',
            ),
          ),
        ],
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: ElevatedButton(
          onPressed: () {
            setState(() {
              enableVar = false;
            });
          },
          child: const Text('Save'),
        ),
      ),
      key: _globalKey,
      appBar: appBarModule(context),
      drawer: appDrawer(context, "basicInfo"),
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
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
