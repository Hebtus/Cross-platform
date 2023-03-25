// ignore_for_file: must_be_immutable, sized_box_for_whitespace

import 'package:flutter/material.dart';

class NavBar extends StatelessWidget {
  List<Widget> tablist = [
    Container(
        width: 60,
        child: const Tab(
          child: Text(
            "All",
            style: TextStyle(color: Colors.black),
          ),
        )),
    Container(
        width: 60,
        child: const Tab(
          child: Text("For You", style: TextStyle(color: Colors.black)),
        )),
    Container(
        width: 60,
        child: const Tab(
          child: Text("Online", style: TextStyle(color: Colors.black)),
        )),
    Container(
        width: 60,
        child: const Tab(
          child: Text("Today", style: TextStyle(color: Colors.black)),
        )),
    Container(
        width: 60,
        child: const Tab(
          child: Text("This Weekend", style: TextStyle(color: Colors.black)),
        )),
    Container(
        width: 60,
        child: const Tab(
          child: Text("Women`s history month",
              style: TextStyle(color: Colors.black)),
        )),
    Container(
        width: 60,
        child: const Tab(
          child: Text("Free", style: TextStyle(color: Colors.black)),
        )),
    Container(
        width: 60,
        child: const Tab(
          child: Text("Music", style: TextStyle(color: Colors.black)),
        )),
    Container(
        width: 60,
        child: const Tab(
          child: Text("Food & Drink", style: TextStyle(color: Colors.black)),
        )),
    Container(
        width: 60,
        child: const Tab(
          child:
              Text("Charity & Causes", style: TextStyle(color: Colors.black)),
        )),
  ];

  NavBar({super.key});
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tablist.length,
      child: Container(
          width: MediaQuery.of(context).size.width * 0.9,
          margin: const EdgeInsets.only(top: 20, left: 10),
          child: Scrollbar(
              child: TabBar(
            tabs: tablist,
            isScrollable: true,
            padding: const EdgeInsets.only(right: 10),
          ))),
    );
  }
}
