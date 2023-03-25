import 'package:flutter/material.dart';
import'package:flutter_test/flutter_test.dart';
import 'package:hebtus_crossplatform/screens/Creator/BasicInfo/basic_info.dart';
import 'package:hebtus_crossplatform/screens/Creator/Tickets/tickets_assign.dart';
void main(){

  group("scrollTestingWidget",(){
    testWidgets("should scroll ", (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(home: BasicInfo(

      )
      )
      );

      await tester.drag(find.byType(Scaffold), Offset(0, -200));
      await tester.pump();



    });


  });


}
