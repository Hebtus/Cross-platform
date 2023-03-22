import 'package:flutter/material.dart';
import 'package:hebtus_crossplatform/screens/Creator/Components/CreatorComponents.dart';

int eventNameCount = 0;
int tagsCount = 0;
bool buttonVenue = false;
bool buttonOnlineEvent = false;
bool buttonToBeAnnounced = false;
bool buttonSingleEvent=false;
bool buttonRecurringEvent=false;
TextEditingController _date = new TextEditingController();
DateTime selectedDate = DateTime.now();
bool DisplayStartTime=false;
bool DisplayEndTime=false;




class BasicInfo extends StatefulWidget {
  const BasicInfo({super.key});

  @override
  State<BasicInfo> createState() => _BasicInfoState();

}

class _BasicInfoState extends State<BasicInfo> {

  final GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();


  Future _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(1900),
        lastDate: DateTime(2100));
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        _date.value = TextEditingValue(
            text: "${selectedDate.toLocal()}".split(' ')[0]);
      });
    }
  }
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
        SizedBox(
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
        Row(
          children: [
            OutlinedButton(
                onPressed: () {
                  setState(() {
                    buttonVenue = true;
                    buttonOnlineEvent=buttonVenue?false:false;
                    buttonToBeAnnounced = buttonToBeAnnounced?false:false;
                  });
                },
                child: const Text('Venue')),
           const SizedBox(
              width: 10,
            ),
            OutlinedButton(
                onPressed: () {
                  setState(() {
                    buttonOnlineEvent =  true;
                    buttonVenue = buttonVenue?false:false;
                    buttonToBeAnnounced = buttonToBeAnnounced?false:false;

                  });
                },
                child: const Text('Online event')),
            const SizedBox(
              width: 10,
            ),
            OutlinedButton(
                onPressed: () {
                  setState(() {
                    buttonToBeAnnounced =  true;
                    buttonVenue = buttonVenue?false:false;
                    buttonOnlineEvent=buttonVenue?false:false;
                  });
                },
                child: const Text('To be annonced')),
          ],
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
        const Text(
          'Tell event-goers when your event starts and ends so they can make plans to attend.',
          style: TextStyle(
            fontSize: 13,
          ),
        ),
        Row(
          children: [
            OutlinedButton(
                onPressed: () {
                  setState(() {
                    buttonSingleEvent = !buttonSingleEvent;
                    buttonRecurringEvent=buttonRecurringEvent?false:false;
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
                    buttonSingleEvent = buttonSingleEvent?false:false;
                  });
                },
                child: const Text('Recurring Event')),

          ],
        ),
        const SizedBox(
          height: 20,
        ),

        if (buttonSingleEvent) ...[
          Text(
              'Single event happens once and can last multiple days '
          ),

          const SizedBox(
            height: 20,
          ),
          TextFormField(
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
            controller: _date,
            decoration: InputDecoration(
              border: const OutlineInputBorder(),
              hintText: 'Start time',
            ),
          ),


          const SizedBox(
            height: 20,
          ),


          TextFormField(
            controller: _date,
            decoration: InputDecoration(
              border: const OutlineInputBorder(),
              hintText: 'Event ends',
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
            controller: _date,
            decoration: InputDecoration(
              border: const OutlineInputBorder(),
              hintText: 'End time',
            ),
          ),
          CheckboxListTile(
            title: Text("Display start time"),
            value: DisplayStartTime,
            onChanged: (newValue) {
              setState(() {
                DisplayStartTime = newValue!;
              });
            },
            controlAffinity: ListTileControlAffinity.leading,  //  <-- leading Checkbox
          ),
          CheckboxListTile(
            title: Text("Display end time"),
            value: DisplayEndTime,
            onChanged: (newValue) {
              setState(() {
                DisplayEndTime = newValue!;
              });
            },
            controlAffinity: ListTileControlAffinity.leading,  //  <-- leading Checkbox
          ),

          TextFormField(
            controller: _date,
            decoration: InputDecoration(
              border: const OutlineInputBorder(),
              hintText: 'Time zone',
            ),
          ),
          TextFormField(
            controller: _date,
            decoration: InputDecoration(
              border: const OutlineInputBorder(),
              hintText: 'Event page languge',
            ),
          ),


        ],


        if (buttonRecurringEvent) ...[
          Text(
              'You’ll be able to set a schedule for your recurring event in the next step. Event details and ticket types will apply to all instances.'
          ),
          CheckboxListTile(
            title: Text("Display end time"),
            value: DisplayEndTime,
            onChanged: (newValue) {
              setState(() {
                DisplayEndTime = newValue!;
              });
            },
            controlAffinity: ListTileControlAffinity.leading,  //  <-- leading Checkbox
          ),

          TextFormField(
            controller: _date,
            decoration: InputDecoration(
              border: const OutlineInputBorder(),
              hintText: 'Time zone',
            ),
          ),
          TextFormField(
            controller: _date,
            decoration: InputDecoration(
              border: const OutlineInputBorder(),
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
      key: _globalKey,
      appBar: appBarModule(),
      drawer: appDrawer(context),
      body: SingleChildScrollView(
        child: Column(
          children: [
            sideMenuModule(_globalKey,'Basic info'),

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
