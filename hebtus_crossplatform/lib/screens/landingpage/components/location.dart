import 'package:flutter/material.dart';

///This class returns textfield for entering location
class Location extends StatelessWidget {
  const Location({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return Container(
      width: double.infinity,
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(top:8),
            child: IconButton(
              onPressed: () {},
              iconSize: 50,
              icon: const Padding(
                padding: EdgeInsets.only(left:4),
                child: Icon(
                  Icons.arrow_drop_down_sharp,
                  color: Color.fromARGB(255, 122, 190, 245),
                ),
              ),
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              hoverColor: Colors.transparent,
            ),
          ),
          Flexible(
            child: Container(
              width: MediaQuery.of(context).size.width * 0.28,
              child: const TextField(
                decoration: InputDecoration(
                  hintText: "Enter location",
                  hintStyle: TextStyle(fontSize: 15),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
