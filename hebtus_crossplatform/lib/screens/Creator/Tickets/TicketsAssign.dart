import 'package:flutter/material.dart';
import 'package:hebtus_crossplatform/screens/Creator/Components/CreatorComponents.dart';
class Tickets extends StatefulWidget {
  const Tickets({Key? key}) : super(key: key);

  @override
  State<Tickets> createState() => _TicketsState();
}

class _TicketsState extends State<Tickets> {
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
    sideMenuModule(_globalKey,'Tickets'),






])

    )




    );
  }
}
