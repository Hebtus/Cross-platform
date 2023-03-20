import 'package:flutter/material.dart';
import 'package:hebtus_crossplatform/screens/Creator/Components/CreatorComponents.dart';
class OnlineEventPage extends StatefulWidget {
  const OnlineEventPage({Key? key}) : super(key: key);

  @override
  State<OnlineEventPage> createState() => _OnlineEventPageState();
}

class _OnlineEventPageState extends State<OnlineEventPage> {
  final GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _globalKey,
        appBar: appBarModule(),
        drawer: appDrawer(context),
        body: SingleChildScrollView(
            child: Column(
                children: [
                  sideMenuModule(_globalKey,'Online Event Page'),
                ])
        )




    );
  }
}
