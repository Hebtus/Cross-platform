import 'package:flutter/material.dart';

TextEditingController _date = TextEditingController();
DateTime selectedDate = DateTime.now();
bool displayStartTime = false;
bool displayEndTime = false;
bool buttonPaid = true;
bool buttonFree = false;
bool buttonDonation = false;

class AddMoreTickets extends StatefulWidget {
  const AddMoreTickets({Key? key}) : super(key: key);

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
        child: Column(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        buttonPaid = true;
                        buttonFree = false;
                        buttonDonation = false;
                      });
                    },
                    child: const Text('Paid'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        buttonPaid = false;
                        buttonFree = true;
                        buttonDonation = false;
                      });
                    },
                    child: const Text('Free'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        buttonFree = false;
                        buttonPaid = false;
                        buttonDonation = true;
                      });
                    },
                    child: const Text('Donation'),
                  ),
                ],
              ),
            ),
            if (buttonPaid) ...[
              TextFormField(
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
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Price \$',
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
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
                controller: _date,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Start time',
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: _date,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  hintText: 'Event ends',
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
                controller: _date,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'End time',
                ),
              ),
            ],
            if (buttonFree) ...[
              TextFormField(
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
                enabled: false,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Price \$(free)',
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
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
                controller: _date,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Start time',
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: _date,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  hintText: 'Event ends',
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
                controller: _date,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'End time',
                ),
              ),
            ],
            if (buttonDonation) ...[
              TextFormField(
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
                enabled: false,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Available quantity(unlimited)',
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
                controller: _date,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Start time',
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: _date,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  hintText: 'Event ends',
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
                controller: _date,
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
                onPressed: () {
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                  Colors.white, // Background colo// r
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
    );
  }
}
