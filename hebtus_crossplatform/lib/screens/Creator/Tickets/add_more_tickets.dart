import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hebtus_crossplatform/models/creator_tickets.dart';
import 'package:hebtus_crossplatform/screens/Creator/Components/creator_components.dart';

import '../../../services/creator_service.dart';
//notes for testing team
//the fields should be field so the request can be made
//the time should be written by hand in the formate 2:00 for example
//choosing Regular or VIP will change the type internally but they both have the save fields
// click on the add button to make the request

TextEditingController _date = TextEditingController();
DateTime selectedDate = DateTime.now();

TextEditingController _date2 = TextEditingController();
DateTime selectedDate2 = DateTime.now();

bool displayStartTime = false;
bool displayEndTime = false;
bool buttonRegular = true;
bool buttonVIP = false;

CreatorService creatorData = CreatorService();

TextEditingController nameController = TextEditingController();
TextEditingController priceController = TextEditingController();
TextEditingController quntatityController = TextEditingController();
TextEditingController startDateController = TextEditingController();
TextEditingController endDateController = TextEditingController();
TextEditingController startTimeController = TextEditingController();
TextEditingController endTimeController = TextEditingController();

class AddMoreTickets extends StatefulWidget {
  AddMoreTickets({Key? key, required this.eventID}) : super(key: key);
  final String eventID;
  @override
  State<AddMoreTickets> createState() => _AddMoreTicketsState();
}

class _AddMoreTicketsState extends State<AddMoreTickets> {
  String dropdownvalue = 'Date & time';

  // List of items in our dropdown menu
  var items = ['Date & time', 'When sales end'];
  Future _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(1900),
        lastDate: DateTime(2100));
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        _date.value =
            TextEditingValue(text: "${selectedDate.toLocal()}".split(' ')[0]);
      });
    }
  }

  Future _selectDate2(BuildContext context) async {
    final DateTime? picked2 = await showDatePicker(
        context: context,
        initialDate: selectedDate2,
        firstDate: DateTime(1900),
        lastDate: DateTime(2100));
    if (picked2 != null && picked2 != selectedDate2) {
      setState(() {
        selectedDate2 = picked2;
        _date2.value =
            TextEditingValue(text: "${selectedDate2.toLocal()}".split(' ')[0]);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add tickets'),
        backgroundColor: Colors.white,
        elevation: 1,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          buttonRegular = true;
                          buttonVIP = false;
                        });
                      },
                      child: const Text('Regular'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          buttonRegular = false;
                          buttonVIP = true;
                        });
                      },
                      child: const Text('VIP'),
                    ),
                  ],
                ),
              ),
              if (buttonRegular) ...[
                Text(
                  "Regular"
                ),
                TextFormField(
                  controller: nameController,
                  maxLength: 50,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Name',
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: priceController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Price \$',
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: quntatityController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Available quantity',
                  ),
                ),
                DropdownButton(
                  isExpanded: true,
                  value: dropdownvalue,
                  icon: const Icon(Icons.keyboard_arrow_down),
                  items: items.map((String items) {
                    return DropdownMenuItem(
                      value: items,
                      child: Text(items),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      dropdownvalue = newValue!;
                    });
                  },
                ),
                TextFormField(
                  controller: _date,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    hintText: 'Event starts',
                    prefixIcon: IconButton(
                      icon: const Icon(Icons.calendar_today),
                      onPressed: () {
                        _selectDate(context);
                      },
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: startTimeController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Start time',
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: _date2,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    hintText: 'Event ends',
                    prefixIcon: IconButton(
                      icon: const Icon(Icons.calendar_today),
                      onPressed: () {
                        _selectDate2(context);
                      },
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: endTimeController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'End time',
                  ),
                ),
              ],
              if (buttonVIP) ...[
                Text("VIP"),
                TextFormField(
                  controller: nameController,
                  maxLength: 50,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Name',
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.allow(RegExp(r'[0-9]'))
                  ],
                  controller: priceController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Price \$',
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.allow(RegExp(r'[0-9]'))
                  ],
                  controller: quntatityController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Available quantity',
                  ),
                ),
                DropdownButton(
                  isExpanded: true,
                  value: dropdownvalue,
                  icon: const Icon(Icons.keyboard_arrow_down),
                  items: items.map((String items) {
                    return DropdownMenuItem(
                      value: items,
                      child: Text(items),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      dropdownvalue = newValue!;
                    });
                  },
                ),
                TextFormField(
                  controller: _date,
                  readOnly: true,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    hintText: 'Event starts',
                    prefixIcon: IconButton(
                      icon: const Icon(Icons.calendar_today),
                      onPressed: () {
                        _selectDate(context);
                      },
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: startTimeController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Start time',
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: _date2,
                  readOnly: true,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    hintText: 'Event ends',
                    prefixIcon: IconButton(
                      icon: const Icon(Icons.calendar_today),
                      onPressed: () {
                        _selectDate2(context);
                      },
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: endTimeController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'End time',
                  ),
                ),
              ],
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: ElevatedButton(
                  onPressed: () async {
                    DateTime startDate = new DateTime(
                        selectedDate.year,
                        selectedDate.month,
                        selectedDate.day,
                        int.parse(startTimeController.text.substring(0, 1)),
                        int.parse(startTimeController.text.substring(3, 4)),
                        0,
                        0);
                    DateTime endDate = DateTime(
                        selectedDate2.year,
                        selectedDate2.month,
                        selectedDate2.day,
                        int.parse(endTimeController.text.substring(0, 1)),
                        int.parse(endTimeController.text.substring(3, 4)),
                        0,
                        0);
                    CreatorTicket ticketData = CreatorTicket(
                        name: nameController.text,
                        type: buttonRegular ? "Regular" : "VIP",
                        price: int.parse(priceController.text),
                        capacity: int.parse(quntatityController.text),
                        sellingStartTime: startDate,
                        sellingEndTime: endDate);
                    String result = await creatorData.createTicket(
                        ticketData, widget.eventID);
                    print(result);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white, // Background colo// r
                  ),
                  child: const Text(
                    'Add',
                    style: TextStyle(color: Colors.blueAccent),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
