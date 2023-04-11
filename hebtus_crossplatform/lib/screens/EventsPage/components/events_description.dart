import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/widgets.dart';

class EventDescription extends StatelessWidget {
  const EventDescription({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return Container(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.all(14),
          child: Text(
            "About this event ",
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
                  Icons.punch_clock,
                  color: Colors.blue,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text("3 hours"),
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
                    Icons.airplane_ticket,
                    color: Colors.blue,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text("Mobile eTicket"),
              ),
            ],
          ),
        ),
        Container(
            width: MediaQuery.of(context).size.width * 0.8,
            margin: EdgeInsets.all(10),
            child: Column(
              children: const [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                      "Join us for the upcoming Ramadan Business Talks Meetup where we will be discussing the latest trends and strategies for success in the business world during this holy month."),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                      "Ramadan Business Talks Meetup is a networking event that takes place during the holy month of Ramadan. This event is designed for business professionals to connect with each other, share ideas, and explore new opportunities. The event is organized by Hekouky at Sultan Hussein Kamel's palace and held in the evening after iftar."),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                      "The objective of the Ramadan Business Talks Meetup is to provide a platform for entrepreneurs, executives, and professionals to meet, share their experiences, and discuss business trends and opportunities in a relaxed and informal setting. It is a great opportunity for individuals to expand their network, find potential business partners, or simply learn about the latest industry developments."),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                      "During the event, attendees can hear from guest speakers who are experts in their respective fields. These speakers share insights and strategies on topics related to business growth, entrepreneurship, and innovation to build meaningful connections and gain new insights into attendees' Businesses."),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                      "Overall, the Ramadan Business Talks Meetup is an excellent opportunity for business professionals to connect, learn, and grow. It is a time to reflect on their achievements and set new goals for the upcoming months. Whether you are an entrepreneur looking to start a new venture or an executive seeking to expand your network, this event provides a great community for business growth and personal development."),
                ),
              ],
            )),
            Padding(
              padding: const EdgeInsets.only(top:10 ,left:12),
              child: Image(image: NetworkImage("https://img.evbuc.com/https%3A%2F%2Fcdn.evbuc.com%2Fimages%2F488431879%2F1238997120003%2F1%2Foriginal.20230409-012252?w=940&auto=format%2Ccompress&q=75&sharp=10&rect=10%2C0%2C580%2C290&s=00b9593f0d2fa626a36f0ae6015d6164"),width: MediaQuery.of(context).size.width*0.85,),
            )
      ],
    ));
  }
}
