/*import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hebtus_crossplatform/screens/EventsPage/components/events_get_ticket.dart';

void main() {
  group('TicketBottomSheet widget test', () {
    testWidgets('should display correct ticket count', (tester) async {
      // Set up the widget
      await tester.pumpWidget(MaterialApp(
          home: Scaffold(
              body: Container(),
              bottomSheet: SizedBox(height: 200, child: TicketBottomSheet()))));

      // Find the widget that displays the ticket count
      final ticketNumberWidget = find.byKey(const Key('TicketNumber'));

      // Verify that the widget displays the initial ticket count of 0
      expect(ticketNumberWidget, findsOneWidget);
      expect(tester.widget<Text>(ticketNumberWidget).data, '0');

      // Tap the increment button
      final incrementButton = find.byKey(const Key('IncrementTicketCount'));
      await tester.tap(incrementButton);
      await tester.pump();

      // Verify that the widget displays the updated ticket count of 1
      expect(tester.widget<Text>(ticketNumberWidget).data, '1');

      // Tap the decrement button
      final decrementButton = find.byKey(const Key('DecrementTicketCount'));
      await tester.tap(decrementButton);
      await tester.pump();

      // Verify that the widget displays the updated ticket count of 0
      expect(tester.widget<Text>(ticketNumberWidget).data, '0');
    });
  });
}*/
