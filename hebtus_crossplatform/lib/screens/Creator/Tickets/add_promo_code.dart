import 'package:flutter/material.dart';
import 'package:hebtus_crossplatform/screens/Creator/Components/creator_components.dart';
bool checkListRevealHiddenTickets = false;

enum PromoCodeStart { now, scheduledTime }

PromoCodeStart? _character = PromoCodeStart.now;

enum PromoCodeEnd { ticketEnd, scheduledTim }

PromoCodeEnd? _character2 = PromoCodeEnd.ticketEnd;

enum ApplyCode { allVisible, onlyCertine }

ApplyCode? _character3 = ApplyCode.allVisible;

class AddPromoCode extends StatefulWidget {
  const AddPromoCode({Key? key}) : super(key: key);

  @override
  State<AddPromoCode> createState() => _AddPromoCodeState();
}

class _AddPromoCodeState extends State<AddPromoCode> {
  String dropdownvalue = 'Ticket limit:Unlimited';

  // List of items in our dropdown menu
  var items = ['Ticket limit:Unlimited', 'Ticket limit:limited to'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add code'),
        backgroundColor: Colors.white,
        elevation: 1,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Code name',
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              const Text('Customers can also access this code via custom URL'),
              const SizedBox(
                height: 10,
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
              const SizedBox(
                height: 5,
              ),
              const Text(
                  'Total number of tickets that can be purchased with this code'),
              const SizedBox(
                height: 10,
              ),
              CheckboxListTile(
                title: const Text("Display number of tickets remaining."),
                value: checkListRevealHiddenTickets,
                onChanged: (newValue) {
                  setState(() {
                    checkListRevealHiddenTickets = newValue!;
                  });
                },
                controlAffinity:
                    ListTileControlAffinity.leading, //  <-- leading Checkbox
              ),
              const Text(
                'Discount amount',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextFormField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: '\$',
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Center(
                child: Text(
                  'or',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: '%',
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'Promo code starts',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              ListTile(
                title: const Text('Now'),
                leading: Radio<PromoCodeStart>(
                  value: PromoCodeStart.now,
                  groupValue: _character,
                  onChanged: (PromoCodeStart? value) {
                    setState(() {
                      _character = value;
                    });
                  },
                ),
              ),
              ListTile(
                title: const Text('Scheduled time'),
                leading: Radio<PromoCodeStart>(
                  value: PromoCodeStart.scheduledTime,
                  groupValue: _character,
                  onChanged: (PromoCodeStart? value) {
                    setState(() {
                      _character = value;
                    });
                  },
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'Promo code ends',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              ListTile(
                title: const Text('when tickets sales end'),
                leading: Radio<PromoCodeEnd>(
                  value: PromoCodeEnd.ticketEnd,
                  groupValue: _character2,
                  onChanged: (PromoCodeEnd? value) {
                    setState(() {
                      _character2 = value;
                    });
                  },
                ),
              ),
              ListTile(
                title: const Text('Scheduled time'),
                leading: Radio<PromoCodeEnd>(
                  value: PromoCodeEnd.scheduledTim,
                  groupValue: _character2,
                  onChanged: (PromoCodeEnd? value) {
                    setState(() {
                      _character2 = value;
                    });
                  },
                ),
              ),
              const Text(
                'Apply code to:',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              ListTile(
                title: const Text('All visible tickets'),
                leading: Radio<ApplyCode>(
                  value: ApplyCode.allVisible,
                  groupValue: _character3,
                  onChanged: (ApplyCode? value) {
                    setState(() {
                      _character3 = value;
                    });
                  },
                ),
              ),
              ListTile(
                title: const Text('Only certain visible tickets'),
                leading: Radio<ApplyCode>(
                  value: ApplyCode.onlyCertine,
                  groupValue: _character3,
                  onChanged: (ApplyCode? value) {
                    setState(() {
                      _character3 = value;
                    });
                  },
                ),
              ),
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
      ),
    );
  }
}
