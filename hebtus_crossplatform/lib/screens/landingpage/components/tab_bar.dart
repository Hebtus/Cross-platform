// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class Tabbar extends StatelessWidget {

  List<Tab>tablist =[
   const Tab(child: Text("All",style: TextStyle(color: Colors.black),),),
   const Tab(child: Text("For You",style: TextStyle(color: Colors.black)),),
   const Tab(child: Text("Online",style: TextStyle(color: Colors.black)),),
   const Tab(child: Text("Today",style: TextStyle(color: Colors.black)),),
   const Tab(child: Text("This Weekend",style: TextStyle(color: Colors.black)),),
   const Tab(child: Text("Women`s history month",style: TextStyle(color: Colors.black)),),
   const Tab(child: Text("Free",style: TextStyle(color: Colors.black)),),
   const Tab(child: Text("Music",style: TextStyle(color: Colors.black)),),
   const Tab(child: Text("Food & Drink",style: TextStyle(color: Colors.black)),),
   const Tab(child: Text("Charity & Causes",style: TextStyle(color: Colors.black)),),
  ];

  Tabbar({super.key});
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(length: tablist.length, child: 
    Container(
      margin: const EdgeInsets.only(top:20,left:10),
      child: TabBar(tabs: tablist,isScrollable: true,)),);
  }
}