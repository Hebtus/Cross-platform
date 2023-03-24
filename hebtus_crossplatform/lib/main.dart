import 'package:flutter/material.dart';
import 'package:hebtus_crossplatform/theme/style.dart';
import 'route/router.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hebtus_crossplatform/screens/landingpage/landing_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context , child) {return MaterialApp(
      debugShowCheckedModeBanner: false,
        theme: appTheme(context),
        home: const Landingpagescreen(),
      );}
    );
  }
}


