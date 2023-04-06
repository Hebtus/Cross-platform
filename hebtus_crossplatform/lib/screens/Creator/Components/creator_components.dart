import 'package:flutter/material.dart';
import 'package:hebtus_crossplatform/screens/Creator/Tickets/tickets_assign.dart';
import 'package:hebtus_crossplatform/screens/Creator/BasicInfo/basic_info.dart';
import 'package:hebtus_crossplatform/screens/Creator/Details/details.dart';
import 'package:hebtus_crossplatform/screens/Creator/OnlineEventPage/online_event_page.dart';
import 'package:hebtus_crossplatform/screens/Creator/Publish/publish.dart';
import 'package:go_router/go_router.dart';
///description:this methode will draw the upper appbar for all the event making pages
///return type:AppBar
AppBar appBarModule(BuildContext context) {
  return AppBar(
    automaticallyImplyLeading: false,
    title: Padding(
      padding: const EdgeInsets.only(left:16),
      child: TextButton(
        style: TextButton.styleFrom(
          textStyle: const TextStyle(
              fontSize: 25, fontWeight: FontWeight.bold, color: Colors.orange),
        ),
        onPressed: () {
          return context.go("/home"); // navigates to homescreen when hebtus is clicked
        },
        child: const Text('Hebtus'),),
    ), // Image.asset('assets/hebtus.jpg', fit: BoxFit.contain, scale: 4),
    backgroundColor: Colors.white,
    elevation: 0,
    actions: [
      IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.visibility,
            color: Colors.grey[400],
            size: 35,
          )), //on pressed needs an annonymus function or a normal one can be used
      IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.apps,
            color: Colors.grey[400],
            size: 35,
          )),
      IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.more_vert,
            color: Colors.grey[400],
            size: 35,
          )),
      const CircleAvatar(
        backgroundColor: Colors.blue,
        radius: 15,
        child: Text(
          'YK',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      const SizedBox(
        width: 10,
      ),
    ],

    titleSpacing: 0,

    //this will
  );
}

///description:this methode will make the side bar for all pages to navigate between them
///return type:Drawer
Drawer appDrawer(BuildContext context,String nameModule) {
  return Drawer(
    child: ListView(
      // Important: Remove any padding from the ListView.
      padding: EdgeInsets.zero,
      children: [
        const DrawerHeader(
          decoration: BoxDecoration(
            color: Colors.white,
          ),
          child: Text('Drawer Header'),
        ),
        ListTile(
          leading: Icon(
            Icons.circle,
            color: nameModule=="basicInfo"?Colors.orange:Colors.grey,
          ),
          title: const Text('Basic info'),
          onTap: () {
            return context.go("/basicinfo");
          },
        ),
        ListTile(
          leading: Icon(
            Icons.circle,
            color: nameModule=="Details"?Colors.orange:Colors.grey,
          ),
          title: const Text('Details'),
          onTap: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => const Details()));
          },
        ),
        ListTile(
          leading: Icon(
            Icons.circle,
            color: nameModule=="Online event page"?Colors.orange:Colors.grey,

          ),
          title: const Text('Online event page'),
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const OnlineEventPage()));
          },
        ),
        ListTile(
          leading:  Icon(
            Icons.circle,
            color: nameModule=="Tickets"?Colors.orange:Colors.grey,

          ),
          title: const Text('Tickets'),
          onTap: () {
            return context.go("/tickets");
          },
        ),
        ListTile(
          leading: Icon(
            Icons.circle,
            color: nameModule=="publish"?Colors.orange:Colors.grey,
          ),
          title: const Text('Publish'),
          onTap: () {
            return context.go("/publish");
          },
        ),
      ],
    ),
  );
}

///description:this function opens the drawer of the app bar to make the side menu apperar when a specific button other than the standered is pressed
///return type:material
Material sideMenuModule(
    final GlobalKey<ScaffoldState> globalKey, String fieldName) {
  return Material(
    elevation: 2.0,
    child: Container(
      width: double.infinity,
      child: Row(
        children: [
          IconButton(
              onPressed: () {
                globalKey.currentState!.openDrawer();
              },
              icon: Icon(
                Icons.menu,
                color: Colors.grey[400],
                size: 35,
              )),
          Text(
            '$fieldName',
            style: const TextStyle(
              //fontWeight: FontWeight.bold,
              fontSize: 25,
            ),
          )
        ],
      ),
    ),
  );
}
