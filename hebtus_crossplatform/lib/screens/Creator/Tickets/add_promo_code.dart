import 'package:flutter/material.dart';
import 'package:hebtus_crossplatform/models/promocodes.dart';
import 'package:hebtus_crossplatform/screens/Creator/Components/creator_components.dart';
import 'package:hebtus_crossplatform/screens/all_screens.dart';

bool checkListRevealHiddenTickets = false;

enum PromoCodeStart { now, scheduledTime }

PromoCodeStart? _character = PromoCodeStart.now;

enum PromoCodeEnd { ticketEnd, scheduledTim }

PromoCodeEnd? _character2 = PromoCodeEnd.ticketEnd;

enum ApplyCode { allVisible, onlyCertine }

ApplyCode? _character3 = ApplyCode.allVisible;
bool priceButton = true;
bool percntagebutton = false;
TextEditingController codeNameController = TextEditingController();
TextEditingController priceController = TextEditingController();
TextEditingController percentageController = TextEditingController();
TextEditingController usesController = TextEditingController();

class AddPromoCode extends StatefulWidget {
  const AddPromoCode({Key? key, required this.eventID}) : super(key: key);
  final String eventID;
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
                controller: codeNameController,
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
              TextFormField(
                controller: usesController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Number of uses',
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              const Text(
                  'Total number of tickets that can be purchased with this code'),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'Discount amount',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                children: [
                  ElevatedButton(
                      onPressed: () {
                        setState(() {
                          priceButton = true;
                          percntagebutton = false;
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                      ),
                      child: const Text('Price')),
                  ElevatedButton(
                      onPressed: () {
                        setState(() {
                          priceButton = false;
                          percntagebutton = true;
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                      ),
                      child: const Text('Percentage')),
                ],
              ),
              if (priceButton) ...[
                TextFormField(
                  controller: priceController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: '\$',
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
              if (percntagebutton) ...[
                TextFormField(
                  controller: percentageController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: '%',
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: ElevatedButton(
                  onPressed: () async {
                    PromoCodes promo = PromoCodes(
                        widget.eventID,
                        codeNameController.text,
                        priceButton ? 1 : 0,
                        double.parse(priceController.text),
                        double.parse(percentageController.text),
                        int.parse(usesController.text));
                    String result = await creatorData.createPromoCode(
                        promo, widget.eventID);
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
