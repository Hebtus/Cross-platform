import 'package:flutter/material.dart';
import 'package:hebtus_crossplatform/theme/style.dart';
import 'package:provider/provider.dart';
import 'package:hebtus_crossplatform/screens/SignUp/signup_screen.dart';
import 'package:hebtus_crossplatform/screens/Creator/BasicInfo/BasicInfo.dart';


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
      home: SignupScreen(),
    );
  }
}
