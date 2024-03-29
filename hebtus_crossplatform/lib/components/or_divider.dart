import 'package:flutter/material.dart';

///Divider with "OR" text in the middle, to be inserted between blocks or widgets
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
          const Divider(thickness: 1),
          Center(
              child: Container(
            color: Colors.white,
            padding: const EdgeInsets.only(left: 5, right: 5),
            child:
                const Text("OR", style: TextStyle(fontWeight: FontWeight.bold)),
          )),
        ],
      ),
    );
  }
}
