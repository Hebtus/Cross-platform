import 'package:flutter/material.dart';

class FilterEventsBttn extends StatefulWidget {
  const FilterEventsBttn({super.key});

  @override
  State<FilterEventsBttn> createState() => _FilterEventsBttnState();
}

class _FilterEventsBttnState extends State<FilterEventsBttn> {
  Color _buttonColor = Colors.black;
  String _selectedOption = "Upcoming Events";
  final dropDownMenuOptions = [
    const PopupMenuItem<String>(
      value: "Upcoming Events",
      child: Text("Upcoming Events"),
    ),
    const PopupMenuItem<String>(
      value: "Past Events",
      child: Text("Past Events"),
    ),
    const PopupMenuItem<String>(
      value: "Drafts",
      child: Text("Drafts"),
    ),
    const PopupMenuItem<String>(
      value: "All Events",
      child: Text("All Events"),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        PopupMenuButton<String>(
            initialValue: _selectedOption,
            onSelected: (value) {
              if (value == "Upcoming Events") {
                _buttonColor = Colors.black;
              } else {
                _buttonColor = Theme.of(context).primaryColor;
              }
              setState(() {
                _selectedOption = value;
              });
            },
            icon: Icon(Icons.filter_list, color: _buttonColor),
            itemBuilder: (context) {
              return dropDownMenuOptions;
            }),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            _selectedOption,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
