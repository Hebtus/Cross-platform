import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hebtus_crossplatform/screens/Creator/BasicInfo/basic_info.dart';
import 'package:hebtus_crossplatform/screens/Creator/Tickets/tickets_assign.dart';
import 'package:hebtus_crossplatform/screens/Creator/Publish/publish.dart';


void main() {
  group("scrollTestingWidget", () {
    testWidgets("should scroll ", (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: Publish()));

      await tester.drag(find.byType(Scaffold), const Offset(0, -200));
      await tester.pump();
      final firstField = find.text("Time zone is the same as your event's");
      expect(firstField, findsWidgets);
    });
  });

  group("change page", () {
    testWidgets("should go to home page", (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: Publish()));

      await tester.tap(find.byKey(const Key("hebtusButton")));
      //verify that log in did not go through

    });
  });
}
