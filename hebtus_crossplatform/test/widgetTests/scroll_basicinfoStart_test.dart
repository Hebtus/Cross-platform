
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hebtus_crossplatform/current_user.dart';
import 'package:hebtus_crossplatform/models/creator_events.dart';
import 'package:hebtus_crossplatform/screens/Creator/BasicInfo/basic_info_start.dart';
import 'package:hebtus_crossplatform/models/location.dart';
void main() {
  CurrentUser currentUser = CurrentUser();
  currentUser.currentUser.firstName='xas';
  currentUser.currentUser.lastName='asdx';
  DateTime start=DateTime(2000);
  DateTime end=DateTime(2100);
  Location egypt=Location(longitude: 1, latitude: 2);
  final CreatorEvent eventdetails=CreatorEvent(eventID: '1', eventName:' eventName', imgURL: 'imgURL', startTime: start, endTime: end, location: egypt, locationName: 'locationName', category: 'category', isDraft: true);

  group("scrollTestingWidget", () {
    testWidgets("should scroll ", (WidgetTester tester) async {
      await tester.pumpWidget( MaterialApp(home: BasicInfoStart()));

      await tester.drag(find.byType(Scaffold), const Offset(0, -200));
      await tester.pump();
    });
  });
}
