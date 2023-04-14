import 'package:flutter/material.dart';
import 'package:hebtus_crossplatform/screens/Creator/Components/creator_components.dart';

import '../../../Models/creator_events.dart';

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
                                        Image(
                                          image: AssetImage(
                                              "assets/images/temp2.jpg"),
                                          fit: BoxFit.cover,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(10.0),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "testing website",
                                                style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              Text(
                                                "Saturday, April 15, 2023 at 7:00 PM EET",
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                              SizedBox(
                                                height: 5,
                                              ),

                                              Text(
                                                "online event",
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Row(
                                                children: [
                                                  Icon(Icons.attach_money),
                                                  SizedBox(
                                                    width: 10,
                                                  ),
                                                  Text("Free-\$0.01"),
                                                  SizedBox(
                                                    width: 20,
                                                  ),
                                                  Icon(Icons.person),
                                                  SizedBox(
                                                    width: 10,
                                                  ),
                                                  Text("30"),
                                                ],
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
                Text(
                  "Who can see the event?",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                ListTile(
                  title: const Text('Public'),
                  leading: Radio<radioButton>(
                    value: radioButton.publicEv,
                    groupValue: _character,
                    onChanged: (radioButton? value) {
                      setState(() {
                        _character = value;
                      });
                    },
                  ),
                ),
                ListTile(
                  title: const Text('Private'),
                  leading: Radio<radioButton>(
                    value: radioButton.privateEv,
                    groupValue: _character,
                    onChanged: (radioButton? value) {
                      setState(() {
                        _character = value;
                      });
                    },
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  "Choose your audience",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                DropdownButton(
                  hint: _dropDownValue == null
                      ? Text('Any one with link')
                      : Text(
                          _dropDownValue!,
                          style: TextStyle(color: Colors.blue),
                        ),
                  isExpanded: true,
                  iconSize: 30.0,
                  style: TextStyle(color: Colors.blue),
                  items: ['Any one with link', 'only people with the password']
                      .map(
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
                        _dropDownValue = val;
                      },
                    );
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                if (_dropDownValue == 'only people with the password') ...[
                  TextFormField(
                    maxLength: 50,
                    onChanged: (String value) {
                      setState(() {});
                    },
                    decoration: InputDecoration(
                      labelText:
                          'Password', //hint addressa dispappers while the lable remains
                      border: const OutlineInputBorder(),
                    ),
                  ),
                ],
                SizedBox(
                  height: 30,
                ),
                Text(
                  "Will this event ever be public?",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                ListTile(
                  title: const Text('No, keep it private'),
                  leading: Radio<radioButton2>(
                    value: radioButton2.privateEv2,
                    groupValue: _character2,
                    onChanged: (radioButton2? value) {
                      setState(() {
                        _character2 = value;
                      });
                    },
                  ),
                ),
                ListTile(
                  title: const Text('Yes, schedule to share publicly'),
                  leading: Radio<radioButton2>(
                    value: radioButton2.publicEv2,
                    groupValue: _character2,
                    onChanged: (radioButton2? value) {
                      setState(() {
                        _character2 = value;
                      });
                    },
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                if (_character2 == radioButton2.privateEv2) ...[
                  TextFormField(
                    enabled: false,
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
                    enabled: false,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Start time',
                    ),
                  ),
                ],
                if (_character2 == radioButton2.publicEv2) ...[
                  TextFormField(
                    enabled: true,
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
                    enabled: true,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Start time',
                    ),
                  ),
                ],
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "Time zone is the same as your event's",
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
              ],
            ),
          ),
        ])));
  }
}
