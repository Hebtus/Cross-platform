import 'package:flutter/material.dart';

class addMoreTickets extends StatefulWidget {
  const addMoreTickets({Key? key}) : super(key: key);

  @override
  State<addMoreTickets> createState() => _addMoreTicketsState();
}

class _addMoreTicketsState extends State<addMoreTickets> {
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
                ElevatedButton(onPressed: (){}, child:Text('Paid'
                ),
                ),
                ElevatedButton(onPressed: (){}, child:Text('Free'
                ),
                ),
                ElevatedButton(onPressed: (){}, child:Text('Donation'
                ),
                ),
              ],
            ),
            TextFormField(
              maxLength: 50,
            ),
            TextFormField(),
            TextFormField(),


          ],


        ),
      ),


    );
  }
}
