import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

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
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: Wrap(
            //mainAxisAlignment: MainAxisAlignment.start,
            direction: Axis.horizontal,
            alignment: WrapAlignment.spaceBetween,
            runSpacing: 5,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(mainAxisSize: MainAxisSize.min, children: [
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
                      padding: const EdgeInsets.all(1.0),
                      child: Text(
                        _selectedOption,
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                        softWrap: true,
                        maxLines: 2,
                      ),
                    ),
                  ]),
                  FittedBox(
                    child: TextButton(
                        onPressed: () {},
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(Icons.download_rounded),
                            const SizedBox(width: 4),
                            Flexible(
                              child: Text(
                                "Export to CSV",
                                style: TextStyle(
                                  color: Theme.of(context).primaryColor,
                                ),
                              ),
                            ),
                          ],
                        )),
                  ),
                ],
              ),
              const Spacer(flex: 3),
              FittedBox(
                fit: BoxFit.scaleDown,
                child: ElevatedButton(
                  onPressed: () {
                    context.go("/basicinfoStart");
                  },
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                  child: const Text(
                    'Create Event',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
        Row(
          children: [],
        )
      ],
    );
  }
}
