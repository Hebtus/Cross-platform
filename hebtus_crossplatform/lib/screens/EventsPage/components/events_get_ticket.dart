// ignore_for_file: unnecessary_import, implementation_imports, unused_import

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:hebtus_crossplatform/globals/globals.dart';

import '../../../models/attendee_event.dart';

class TicketBottomSheet extends StatefulWidget {
  const TicketBottomSheet({super.key});

  @override
  State<TicketBottomSheet> createState() => _TicketBottomSheetState();
}

class _TicketBottomSheetState extends State<TicketBottomSheet> {
  int _number = 0;
  void _incrementnumber() {
    _number++;
    setState(() {});
  }

  void _decrementnumber() {
    if (_number > 0) {
      _number--;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height * 0.25,
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 10, left: 5, right: 5, bottom: 5),
              height: MediaQuery.of(context).size.height * 0.15,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(color: Colors.blue, width: 3),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 8.0, left: 2),
                    child: Text("General Admission"),
                  ),
                  Container(
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 8),
                          child: IconButton(
                            onPressed: _incrementnumber,
                            icon: const Icon(Icons.add),
                            color: Colors.blue,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(3),
                          child: Text("$_number"),
                        ),
                        IconButton(
                          onPressed: _decrementnumber,
                          icon: const Icon(Icons.minimize),
                          color: Colors.blue,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 5),
              width: mediaQuery.size.width * 0.5,
              child: ElevatedButton(
                onPressed: () {},
                child: const Text("Reserve a spot"),
              ),
            )
          ],
        ));
  }
}
