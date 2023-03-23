import 'package:flutter/material.dart';
import 'package:hebtus_crossplatform/screens/Creator/Tickets/tickets_assign.dart';
import 'package:hebtus_crossplatform/theme/style.dart';
import 'package:provider/provider.dart';
import 'screens/all_screens.dart';
import 'package:hebtus_crossplatform/screens/Creator/BasicInfo/basic_info.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: appTheme(context),
      home: Tickets(),
    );
  }
}
