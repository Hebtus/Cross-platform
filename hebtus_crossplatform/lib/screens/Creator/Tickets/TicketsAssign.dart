import 'package:flutter/material.dart';
import 'package:hebtus_crossplatform/screens/Creator/Components/CreatorComponents.dart';

String pageTitle='hello';
bool  buttonAdmission=true;
bool  buttonAddons=false;
bool  buttonPromoCode=false;
bool  buttonHold=false;
bool  buttonSettings=false;
class Tickets extends StatefulWidget {
  const Tickets({Key? key}) : super(key: key);

  @override
  State<Tickets> createState() => _TicketsState();
}

class _TicketsState extends State<Tickets> {
  final GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomSheet: Container(
          width: MediaQuery.of(context).size.width,
          child: ElevatedButton(onPressed: () {  }, child: Text('hello'),),
        ),
        key: _globalKey,
        appBar: appBarModule(),
        drawer: appDrawer(context),
        body: SingleChildScrollView(
            child: Column(children: [

            sideMenuModule(_globalKey, pageTitle),
              SizedBox(
                height: 10,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    ElevatedButton(onPressed: (){
                      setState(() {
                         buttonAdmission=true;
                         buttonAddons=  buttonAddons?false:false;
                         buttonPromoCode= buttonPromoCode?false:false;
                         buttonHold=buttonHold?false:false;
                         buttonSettings=buttonSettings?false:false;
                         pageTitle='Tickets';
                      });

                    },
                        child: Text('Admission'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                      )



                    ),
                    ElevatedButton(onPressed: (){
                      setState(() {
                        buttonAdmission=buttonAdmission?false:false;
                        buttonAddons=  true;
                        buttonPromoCode= buttonPromoCode?false:false;
                        buttonHold=buttonHold?false:false;
                        buttonSettings=buttonSettings?false:false;
                        pageTitle='Add-ons';
                      });

                    },
                        child: Text('Add-ons'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                        )



                    ),
                    ElevatedButton(onPressed: (){
                      setState(() {
                        buttonAdmission=buttonAdmission?false:false;
                        buttonAddons=  buttonAddons?false:false;
                        buttonPromoCode= true;
                        buttonHold=buttonHold?false:false;
                        buttonSettings=buttonSettings?false:false;
                        pageTitle='Promo code';
                      });

                    },
                        child: Text('Promo code'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                        )



                    ),
                    ElevatedButton(onPressed: (){
                      setState(() {
                        buttonAdmission=buttonAdmission?false:false;
                        buttonAddons=  buttonAddons?false:false;
                        buttonPromoCode= buttonPromoCode?false:false;
                        buttonHold=true;
                        buttonSettings=buttonSettings?false:false;
                        pageTitle='Holds';
                      });

                    },
                        child: Text('Holds'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                        )



                    ),
                    ElevatedButton(onPressed: (){
                      setState(() {
                        buttonAdmission=buttonAdmission?false:false;
                        buttonAddons=  buttonAddons?false:false;
                        buttonPromoCode= buttonPromoCode?false:false;
                        buttonHold=buttonHold?false:false;
                        buttonSettings=true;
                        pageTitle='Settings';
                      });

                    },
                        child: Text('Settings'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                        )



                    ),








                  ],

                ),
              ),
              if (buttonAdmission) ...[],
              if (buttonAddons) ...[],
              if (buttonPromoCode) ...[],
              if (buttonHold) ...[],
              if (buttonSettings) ...[




              ],




        ]
            )
        )
    );
  }
}
