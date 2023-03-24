import 'package:flutter/material.dart';
import 'package:hebtus_crossplatform/theme/style.dart';
import 'package:google_fonts/google_fonts.dart';
import 'route/router.dart';

void main() {
  //disabling Http fetching for google fonts
  GoogleFonts.config.allowRuntimeFetching = false;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: appTheme(context),
      routerConfig: AppRouter().router,
    );
  }
}
