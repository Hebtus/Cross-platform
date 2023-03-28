import 'package:flutter/material.dart';
import 'package:hebtus_crossplatform/screens/Creator/Components/creator_components.dart';
class Details extends StatefulWidget {
  const Details({Key? key}) : super(key: key);

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
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
                  sideMenuModule(_globalKey,'Details'),
                ])
        )




    );
  }
}
