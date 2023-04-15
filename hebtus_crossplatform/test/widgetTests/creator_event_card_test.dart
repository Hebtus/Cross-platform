// import 'package:flutter/material.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:hebtus_crossplatform/models/creator_events.dart';
// import 'package:hebtus_crossplatform/models/location.dart';

// import 'package:hebtus_crossplatform/screens/CreatorEvents/components/creator_event_card.dart';

// void main() {
//   Widget makeTestableWidget({required Widget child}) {
//     return MaterialApp(
//       home: child,
//     );
//   }

//   CreatorEvent event = CreatorEvent(
//       eventID: "123",
//       eventName: "eventName",
//       imgURL: "https://images6.alphacoders.com/337/337780.jpg",
//       startTime: DateTime.now(),
//       endTime: DateTime.now(),
//       location: Location(latitude: 12, longitude: 12),
//       locationName: "locationName",
//       category: "category",
//       isDraft: false);
//   testWidgets("event card renders the information correctly",
//       (WidgetTester tester) async {
//     //build the event card
//     await tester.pumpWidget(makeTestableWidget(
//         child: CreatorEventCard(
//       event: event,
//     )));

//     //verify that the objects exist
//     expect(find.byKey(const Key("SignUpTitle")), findsOneWidget);
//   });
// }
