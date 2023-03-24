import 'package:flutter/material.dart';


TextEditingController _date = new TextEditingController();
DateTime selectedDate = DateTime.now();
bool DisplayStartTime=false;
bool DisplayEndTime=false;
bool buttonPaid=true;
bool buttonFree=false;
bool buttonDonation=false;

class addMoreTickets extends StatefulWidget {
  const addMoreTickets({Key? key}) : super(key: key);

  @override
  State<addMoreTickets> createState() => _addMoreTicketsState();
}

class _addMoreTicketsState extends State<addMoreTickets> {
  String dropdownvalue = 'Date & time';

  // List of items in our dropdown menu
  var items = [
    'Date & time',
    'When sales end'
  ];
  Future _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(1900),
        lastDate: DateTime(2100));
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        _date.value = TextEditingValue(
            text: "${selectedDate.toLocal()}".split(' ')[0]);
      });
    }
  }





  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add tickets'),
        backgroundColor: Colors.white,
        elevation: 1,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Row(
              children: [
                ElevatedButton(onPressed: (){
                  setState(() {
                    buttonPaid=true;
                    buttonFree=false;
                    buttonDonation=false;

                  });

                }, child:Text('Paid'
                ),
                ),
                ElevatedButton(onPressed: (){
                  setState(() {
                    buttonPaid=false;
                    buttonFree=true;
                    buttonDonation=false;

                  });
                }, child:Text('Free'
                ),
                ),
                ElevatedButton(onPressed: (){
                  setState(() {

                    buttonFree=false;
                    buttonPaid=false;
                    buttonDonation=true;

                  });

                }, child:Text('Donation'
                ),
                ),
              ],
            ),


            if(buttonPaid)...[
              TextFormField(
                maxLength: 50,

                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  hintText: 'Name',
                ),
              ),
              SizedBox(
                height: 10 ,
              ),
              TextFormField(

                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  hintText: 'Price \$',
                ),
              ),
              SizedBox(
                height: 10 ,
              ),
              TextFormField(

                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
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
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
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
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  hintText: 'End time',
                ),
              ),

            ],
            if(buttonFree)...[
              TextFormField(
                maxLength: 50,

                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  hintText: 'Name',
                ),
              ),
              SizedBox(
                height: 10 ,
              ),
              TextFormField(
enabled: false,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  hintText: 'Price \$(free)',
                ),
              ),
              SizedBox(
                height: 10 ,
              ),
              TextFormField(

                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
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
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
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
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  hintText: 'End time',
                ),
              ),

            ],
            if(buttonDonation)...[
              TextFormField(
                maxLength: 50,

                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  hintText: 'Name',
                ),
              ),
              SizedBox(
                height: 10 ,
              ),
              TextFormField(
                enabled: false,

                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
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
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
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
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  hintText: 'End time',
                ),
              ),

            ],




          ],


        ),
      ),


    );
  }
}


