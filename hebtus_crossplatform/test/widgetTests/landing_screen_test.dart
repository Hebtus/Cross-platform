// import 'package:flutter/material.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:hebtus_crossplatform/screens/LandingPage/components/categories.dart';
// import 'package:hebtus_crossplatform/screens/all_screens.dart';

// void main() {
//   Widget makeTestableWidget({required Widget child}) {
//     return MaterialApp(
//       home: child,
//     );
//   }

//   testWidgets("search for the categories tabs on different screen sizes",
//       (WidgetTester tester) async {
//     await tester
//         .pumpWidget(makeTestableWidget(child: const LandingPageScreen()));
//     //find category widgets
//     Finder categoryCards = find.byType(Card);
//     //verify that all cards exists
//     expect(categoryCards, findsNWidgets(14));

//     //resize the window and test again
//     await tester.binding.setSurfaceSize(const Size(40, 40));

//     //verify no overflow in specific categories box

//     final healthCategoryCard = tester.renderObject(find.text("Health"));

//     expect((healthCategoryCard as RenderBox).size,
//         equals(healthCategoryCard.paintBounds.size));
//   });
// }
