import 'package:flutter/material.dart';
bool checkListRevealHiddenTickets=false;
enum promoCodeStart { now, scheduledTime }
promoCodeStart? _character = promoCodeStart.now;

enum promoCodeEnd { ticketEnd, scheduledTim }
promoCodeEnd? _character2 = promoCodeEnd.ticketEnd;

enum applyCode { allVisible, onlyCertine }
applyCode? _character3 = applyCode.allVisible;

class addPromoCode extends StatefulWidget {
  const addPromoCode({Key? key}) : super(key: key);

  @override
  State<addPromoCode> createState() => _addPromoCodeState();
}

class _addPromoCodeState extends State<addPromoCode> {
  String dropdownvalue = 'Ticket limit:Unlimited';

  // List of items in our dropdown menu
  var items = [
    'Ticket limit:Unlimited',
    'Ticket limit:limited to'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add code'),
        backgroundColor: Colors.white,
        elevation: 1,
      ),
      body:Padding(
     padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(

                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  hintText: 'Code name',
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Text('Customers can also access this code via custom URL'),
              SizedBox(
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
              SizedBox(
                height: 5,
              ),
              Text('Total number of tickets that can be purchased with this code'),
              SizedBox(
                height: 10,
              ),
              CheckboxListTile(
                title: Text("Display number of tickets remaining."),
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

                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  hintText: '\$',
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Center(
                child: const Text(
                  'or',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(

                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  hintText: '%',
                ),
              ),
              SizedBox(
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
                leading: Radio<promoCodeStart>(
                  value: promoCodeStart.now,
                  groupValue: _character,
                  onChanged: (promoCodeStart? value) {
                    setState(() {
                      _character = value;
                    });
                  },
                ),
              ),
              ListTile(
                title: const Text('Scheduled time'),
                leading: Radio<promoCodeStart>(
                  value:promoCodeStart.scheduledTime,
                  groupValue: _character,
                  onChanged: (promoCodeStart? value) {
                    setState(() {
                      _character = value;
                    });
                  },
                ),
              ),

              SizedBox(
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
                leading: Radio<promoCodeEnd>(
                  value: promoCodeEnd.ticketEnd,
                  groupValue: _character2,
                  onChanged: (promoCodeEnd? value) {
                    setState(() {
                      _character2 = value;
                    });
                  },
                ),
              ),
              ListTile(
                title: const Text('Scheduled time'),
                leading: Radio<promoCodeEnd>(
                  value:promoCodeEnd.scheduledTim,
                  groupValue: _character2,
                  onChanged: (promoCodeEnd? value) {
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
                leading: Radio<applyCode>(
                  value: applyCode.allVisible,
                  groupValue: _character3,
                  onChanged: (applyCode? value) {
                    setState(() {
                      _character3 = value;
                    });
                  },
                ),
              ),
              ListTile(
                title: const Text('Only certain visible tickets'),
                leading: Radio<applyCode>(
                  value:applyCode.onlyCertine,
                  groupValue: _character3,
                  onChanged: (applyCode? value) {
                    setState(() {
                      _character3 = value;
                    });
                  },
                ),
              ),


















            ],



          ),
        ),
      ) ,
    );
  }
}
