import 'package:flutter/material.dart';

class OrDivider extends StatelessWidget {
  const OrDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: [
          Divider(thickness: 1),
          Center(
              child: Container(
            color: Colors.white,
            padding: EdgeInsets.only(left: 5, right: 5),
            child: Text("OR", style: TextStyle(fontWeight: FontWeight.bold)),
          )),
        ],
      ),
    );
  }
}
