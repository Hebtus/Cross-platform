import 'package:flutter/material.dart';
import 'package:hebtus_crossplatform/screens/all_screens.dart';

import 'components/filter_events_bttn.dart';

class CreatorEventsScreen extends StatefulWidget {
  const CreatorEventsScreen({super.key});

  @override
  State<CreatorEventsScreen> createState() => _CreatorEventsScreenState();
}

class _CreatorEventsScreenState extends State<CreatorEventsScreen> {
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return Scaffold(
      appBar: appBarModule(context),
      body: SingleChildScrollView(
        child: Center(
          child: SizedBox(
            width: mediaQuery.size.width * 0.9,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text("Hey There,",
                      style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold)), //TODO: add user name
                ),
                FilterEventsBttn(),
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black, width: 1)),
                  child: Column(children: const [Text("insert list here")]),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
