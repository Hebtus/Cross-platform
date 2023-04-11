import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class EventInfo extends StatelessWidget {
  const EventInfo({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(26),
            child: Text("Apr 13"),
          ),
          const Padding(
            padding: EdgeInsets.all(12),
            child: Text(
              "Ramadan Business Talks",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(12),
            child: Text(
                "Ramadan Business Talks Meetup is a networking event that takes place during the holy month of Ramadan."),
          ),
          Container(
            margin: EdgeInsets.all(30),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color:Color.fromARGB(255, 234, 247, 255)),
            width: MediaQuery.of(context).size.width * 0.68,
            height: 100,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Center(
                  child: Padding(
                    padding: EdgeInsets.only(top:12,left:12,bottom:5),
                    child: Text("By Hekouky",style: TextStyle(color: Colors.blue),),
                  ),
                ),
                Center(
                  child: Padding(
                    padding: EdgeInsets.only(top: 4,left:4),
                    child: Text("18 followers", style: TextStyle(fontSize: 12)),
                  ),
                ),
                
              ],
            ),
          ),
        ],
      ),
    );
  }
}
