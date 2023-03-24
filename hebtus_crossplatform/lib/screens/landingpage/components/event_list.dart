import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:hebtus_crossplatform/Models/events.dart';

class eventcard extends StatelessWidget {
  int num;
  eventcard({super.key, required this.num});

  List<events> eventlist = [
    events(
        "https://img.evbuc.com/https%3A%2F%2Fcdn.evbuc.com%2Fimages%2F379763539%2F987590164623%2F1%2Foriginal.20221025-041417?w=940&auto=format%2Ccompress&q=75&sharp=10&rect=0%2C14%2C1200%2C600&s=bdac27032911508738b2393efb19700e",
        "Celebrating Century:Presidency University",
        "Today at 7:00 PM",
        "The Great Pyramid of Giza",
        "EZZ event riders",
        "20k followers"),
    events(
        "https://img.evbuc.com/https%3A%2F%2Fcdn.evbuc.com%2Fimages%2F475145889%2F233874568789%2F1%2Foriginal.20230322-150839?w=940&auto=format%2Ccompress&q=75&sharp=10&rect=1%2C73%2C1920%2C960&s=811d9ff34cd2fc51c47619c31a387c9f",
        "Open doors:come and win free course-GOMYCODE Egypt",
        "Tue,Mar28,2:00 PM",
        "GOMYCODE DOkki",
        "GoMyCode",
        "26k followers"),
    events(
        "https://img.evbuc.com/https%3A%2F%2Fcdn.evbuc.com%2Fimages%2F474978729%2F233874568789%2F1%2Foriginal.20230322-114746?w=940&auto=format%2Ccompress&q=75&sharp=10&rect=0%2C60%2C1920%2C960&s=b148c1afd8caf71155ccd3f239c9b4be",
        "Free workshop: build your own chatbot in 21h",
        "sun,Mar26,2:00 PM",
        "GOMYCODE DOkki",
        "GoMyCode",
        "26k followers"),
    events(
        "https://img.evbuc.com/https%3A%2F%2Fcdn.evbuc.com%2Fimages%2F474950379%2F1432415879683%2F1%2Foriginal.20230322-105839?w=940&auto=format%2Ccompress&q=75&sharp=10&rect=0%2C0%2C2160%2C1080&s=fc25501da772b08802240c110acf41a0",
        "Canada Immigration : Live Q&A",
        "thus,Mar30,1:00 PM",
        "Gizza governorate",
        "free organizers",
        "26k followers"),
    events(
        "https://img.evbuc.com/https%3A%2F%2Fcdn.evbuc.com%2Fimages%2F468839829%2F218374360562%2F1%2Foriginal.20230314-182611?w=940&auto=format%2Ccompress&q=75&sharp=10&rect=0%2C0%2C2160%2C1080&s=f0841b85e68cd2b650f01f96b9a6aa08",
        "AfricArena 2023 VC Unconference Weekend",
        "sat,apr 29,3:00 PM",
        "Lazib Inn resort and spa",
        "AfricArena",
        "16k followers"),
    events(
        "https://img.evbuc.com/https%3A%2F%2Fcdn.evbuc.com%2Fimages%2F400015689%2F248532170773%2F1%2Foriginal.20221126-024449?w=940&auto=format%2Ccompress&q=75&sharp=10&rect=0%2C67%2C1920%2C960&s=dccc36dee7d667436cb581a66581b6b8",
        "Egypt stargate pilgrimage golden universe temples",
        "sat,nov 3,4:00 PM",
        "Egypt,Giza",
        "Jennifer Ashira Ra",
        "606 followers"),
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(left: 10, right: 30),
        height: double.infinity,
        child: Card(
          clipBehavior: Clip.hardEdge,
          color: Color.fromARGB(255, 255, 249, 249),
          child: InkWell(
              splashColor: Color.fromARGB(255, 250, 195, 188),
              onTap: () {},
              child: Flexible(
                child: Container(
                    height: double.infinity,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image(
                            image: NetworkImage(eventlist[num].eventimage),
                            fit: BoxFit.cover,
                          ),
                          SizedBox(
                            width: 250,
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  top: 10, left: 9, right: 8),
                              child: FittedBox(
                                  fit: BoxFit.fitWidth,
                                  child: Text(
                                    eventlist[num].eventname,
                                    style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold),
                                  )),
                            ),
                          ),
                          SizedBox(
                            width: 90,
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  top: 7, left: 9, right: 8),
                              child: FittedBox(
                                  fit: BoxFit.fitWidth,
                                  child: Text(
                                    eventlist[num].eventtime,
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                        color: Color.fromARGB(255, 238, 97, 2)),
                                  )),
                            ),
                          ),
                          SizedBox(
                            width: 100,
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  top: 7, left: 9, right: 8),
                              child: FittedBox(
                                  fit: BoxFit.fitWidth,
                                  child: Text(
                                    eventlist[num].eventlocation,
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                        color:
                                            Color.fromARGB(255, 138, 136, 136)),
                                  )),
                            ),
                          ),
                          SizedBox(
                            width: 90,
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  top: 7, left: 9, right: 8),
                              child: FittedBox(
                                  fit: BoxFit.scaleDown,
                                  child: Text(
                                    eventlist[num].eventorg,
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black),
                                  )),
                            ),
                          ),
                          SizedBox(
                            width: 90,
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  top: 7, left: 9, right: 8),
                              child: FittedBox(
                                  fit: BoxFit.contain,
                                  child: Text(
                                    eventlist[num].eventfollowers,
                                  )),
                            ),
                          ),
                        ])),
              )),
        ));
  }
}
