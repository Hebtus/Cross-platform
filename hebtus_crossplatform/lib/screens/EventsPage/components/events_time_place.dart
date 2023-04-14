import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/widgets.dart';
import 'package:hebtus_crossplatform/globals/globals.dart';

class EventTimePlace extends StatelessWidget {
  const EventTimePlace({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    if (ad != null) {
      return Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.all(12),
              child: Text(
                "When and Where ",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    width: 70,
                    height: 40,
                    decoration: BoxDecoration(
                        color: Color.fromARGB(255, 234, 247, 255),
                        borderRadius: BorderRadius.circular(10)),
                    child: const Icon(
                      Icons.calendar_month,
                      color: Colors.blue,
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text("Date and Time"),
                    ),
                    Text(
                      ad!.startTime.toString(),
                      style: TextStyle(fontSize: 10),
                    )
                  ],
                ),
              ],
            ),
            FittedBox(
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      width: 70,
                      height: 40,
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 234, 247, 255),
                          borderRadius: BorderRadius.circular(10)),
                      child: const Icon(
                        Icons.pin_drop,
                        color: Colors.blue,
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: Text("Location"),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.8,
                        child: Text(
                          ad!.locationName.toString(),
                          style: TextStyle(fontSize: 10),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            Row(
              children: [
                GestureDetector(
                  onTap: () {},
                  child: const Padding(
                    padding: EdgeInsets.only(top: 12, left: 10),
                    child: Text('Show map',
                        style: TextStyle(
                            color: Color.fromARGB(255, 11, 114, 199),
                            fontSize: 12)),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 12),
                  child: Icon(
                    Icons.arrow_drop_down,
                    color: Color.fromARGB(255, 11, 114, 199),
                  ),
                )
              ],
            ),
          ],
        ),
      );
    } else {
      return Container();
    }
  }
}
