// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:hebtus_crossplatform/components/app_bar.dart';

class EventsScreen extends StatelessWidget {
  const EventsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: MainAppBar(context),
      ),
    );
  }
}
