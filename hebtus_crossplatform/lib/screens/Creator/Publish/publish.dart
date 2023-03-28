import 'package:flutter/material.dart';
import 'package:hebtus_crossplatform/screens/Creator/Components/creator_components.dart';
class Publish extends StatefulWidget {
  const Publish({Key? key}) : super(key: key);

  @override
  State<Publish> createState() => _PublishState();
}

class _PublishState extends State<Publish> {
  final GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _globalKey,
        appBar: appBarModule(context),
        drawer: appDrawer(context),
        body: SingleChildScrollView(
            child: Column(
                children: [
                  sideMenuModule(_globalKey,'Publish'),
                ])
        )




    );
  }
}
