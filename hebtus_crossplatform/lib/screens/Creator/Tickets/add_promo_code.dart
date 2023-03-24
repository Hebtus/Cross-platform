import 'package:flutter/material.dart';

class addPromoCode extends StatefulWidget {
  const addPromoCode({Key? key}) : super(key: key);

  @override
  State<addPromoCode> createState() => _addPromoCodeState();
}

class _addPromoCodeState extends State<addPromoCode> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add code'),
        backgroundColor: Colors.white,
        elevation: 1,
      ),
    );
  }
}
