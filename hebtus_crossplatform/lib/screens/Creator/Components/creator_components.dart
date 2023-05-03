import 'package:flutter/material.dart';
import 'package:hebtus_crossplatform/screens/Creator/Tickets/tickets_assign.dart';
import 'package:hebtus_crossplatform/screens/Creator/BasicInfo/basic_info.dart';
import 'package:hebtus_crossplatform/screens/Creator/Publish/publish.dart';
import 'package:hebtus_crossplatform/services/creator_service.dart';
import 'package:hebtus_crossplatform/services/auth_service.dart';

import 'package:go_router/go_router.dart';
import 'package:hebtus_crossplatform/models/creator_events.dart';

import '../../../current_user.dart';

///description:this methode will draw the upper appbar for all the event making pages
///return type:AppBar
CurrentUser currentUser = CurrentUser();
String initialName1 = currentUser.currentUser.firstName.isEmpty ? "" : currentUser.currentUser.firstName.substring(0, 1);
String intialName2 = currentUser.currentUser.lastName.isEmpty ? "" : currentUser.currentUser.lastName.substring(0, 1);

enum SampleItem2 {
  itemOne,
  itemTwo,
}

AppBar appBarModule(BuildContext context) {
  return AppBar(
    automaticallyImplyLeading: false,
    title: Padding(
      padding: const EdgeInsets.only(left: 16),
      child: TextButton(
        key: Key("hebtusButton"),
        style: TextButton.styleFrom(
          textStyle: const TextStyle(
              fontSize: 25, fontWeight: FontWeight.bold, color: Colors.orange),
        ),
        onPressed: () {
          return context
              .go("/home"); // navigates to homescreen when hebtus is clicked
        },
        child: const Text('Hebtus'),
      ),
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
          onPressed: () {
            print(currentUser);
          },
          icon: Icon(
            Icons.apps,
            color: Colors.grey[400],
            size: 35,
          )),
      PopupMenuButton<SampleItem2>(
        itemBuilder: (BuildContext context) {
          return <PopupMenuEntry<SampleItem2>>[
            PopupMenuItem<SampleItem2>(
              value: SampleItem2.itemOne,
              child: Text(
                'Switch to attende',
                style: TextStyle(fontSize: 12),
              ),
            ),
            PopupMenuItem<SampleItem2>(
              value: SampleItem2.itemTwo,
              child: Text(
                'Logout',
                style: TextStyle(fontSize: 12),
              ),
            ),
          ];
        },
        onSelected: (SampleItem2 item) async {
          if (item == SampleItem2.itemTwo) {
            AuthService authService = AuthService();
            try {
              String message = await authService.logout();
              currentUser.logout();
              print(message);
              return context.go("/");
            } catch (e) {
              showDialog(
                  barrierDismissible: true,
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text("Error"),
                      content: Text(e.toString()),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text('OK'),
                        ),
                      ],
                    );
                  });
            }
          }

          if (item == SampleItem2.itemOne) {
            return context.go("/home");
          }
        },
      ),
      CircleAvatar(
        backgroundColor: Colors.blue,
        radius: 20,
        child: initialName1  !=''&&initialName1  !=null
            ? Text(
                '$initialName1$intialName2',
                style: TextStyle(
                  color: Colors.white,
                ),
              )
            : Text(
                ' ',
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
Drawer appDrawer(
    BuildContext context, String nameModule, CreatorEvent eventdetails) {
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
            color: nameModule == "basicInfo" ? Colors.orange : Colors.grey,
          ),
          title: const Text('Basic info'),
          onTap: () {
            context.goNamed("basicinfo", extra: eventdetails);
          },
        ),
        // ListTile(
        //   leading: Icon(
        //     Icons.circle,
        //     color: nameModule=="Details"?Colors.orange:Colors.grey,
        //   ),
        //   title: const Text('Details'),
        //   onTap: () {
        //     Navigator.of(context)
        //         .push(MaterialPageRoute(builder: (context) => const Details()));
        //   },
        // ),
        // ListTile(
        //   leading: Icon(
        //     Icons.circle,
        //     color: nameModule=="Online event page"?Colors.orange:Colors.grey,
        //
        //   ),
        //   title: const Text('Online event page'),
        //   onTap: () {
        //     Navigator.of(context).push(MaterialPageRoute(
        //         builder: (context) => const OnlineEventPage()));
        //   },
        // ),
        ListTile(
          leading: Icon(
            Icons.circle,
            color: nameModule == "Tickets" ? Colors.orange : Colors.grey,
          ),
          title: const Text('Tickets'),
          onTap: () {
            context.goNamed("tickets", extra: eventdetails);
          },
        ),
        ListTile(
          leading: Icon(
            Icons.circle,
            color: nameModule == "publish" ? Colors.orange : Colors.grey,
          ),
          title: const Text('Publish'),
          onTap: () {
            context.goNamed("publish", extra: eventdetails);
          },
        ),
        ListTile(
          leading: Icon(
            Icons.circle,
            color: nameModule == "dashboard" ? Colors.orange : Colors.grey,
          ),
          title: const Text('dashboard'),
          onTap: () {
            context.goNamed("dashboard", extra: eventdetails);
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
