import 'package:flutter/material.dart';


class Location extends StatelessWidget {
  const Location({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.arrow_drop_down_sharp,
            color: Color.fromARGB(255, 122, 190, 245),
            size: 47,
          ),
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          hoverColor: Colors.transparent,
        ),
        Container(
          margin: const EdgeInsets.only(left: 20),
          width: 170,
          child: const TextField(
            decoration: InputDecoration(
              hintText: "Enter your location",hintStyle: TextStyle(fontSize: 15),
            ),
          ),
        )
      ],
    );
  }
}
