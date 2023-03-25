import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hebtus_crossplatform/main.dart';
import 'package:hebtus_crossplatform/screens/all_screens.dart';

void main() {
  Widget makeTestableWidget({required Widget child}) {
    return MaterialApp(
      home: child,
    );
  }

  testWidgets("email and password fields are empty, does not log in",
      (WidgetTester tester) async {
    //build the login screen
    await tester.pumpWidget(makeTestableWidget(child: const LoginScreen()));
    //tap the login button
    await tester.tap(find.byKey(const Key("LogIn")));
    //verify that log in did not go through
    expect(find.byKey(const Key("LogInTitle")), findsOneWidget);
  });

  testWidgets(
      "email and password fields are not empty, but invalid email, does not log in",
      (WidgetTester tester) async {
    //build the login screen
    await tester.pumpWidget(makeTestableWidget(child: const LoginScreen()));
    //enter text in email and password fields
    Finder emailField = find.byKey(const Key("loginEmailField"));
    await tester.enterText(emailField, "invalidemailtest123");
    Finder passwordField = find.byKey(const Key("loginPassField"));
    await tester.enterText(passwordField, "invalidemailtest123");
    //tap the login button
    await tester.tap(find.byKey(const Key("LogIn")));
    //verify that log in did not go through
    expect(find.byKey(const Key("LogInTitle")), findsOneWidget);
  });

  testWidgets(
      "email and password fields are not empty, but invalid email, does not log in",
      (WidgetTester tester) async {
    //build the login screen
    await tester.pumpWidget(makeTestableWidget(child: const LoginScreen()));
    //enter text in email and password fields
    Finder emailField = find.byKey(const Key("loginEmailField"));
    await tester.enterText(emailField, "invalidemailtest123");
    Finder passwordField = find.byKey(const Key("loginPassField"));
    await tester.enterText(passwordField, "invalidemailtest123");
    //tap the login button
    await tester.tap(find.byKey(const Key("LogIn")));
    //verify that log in did not go through
    expect(find.byKey(const Key("LogInTitle")), findsOneWidget);
  });

  testWidgets("email and password fields are not empty,valid email,logs in",
      (WidgetTester tester) async {
    //build the login screen
    await tester.pumpWidget(const MyApp());
    //enter text in email and password fields
    Finder emailField = find.byKey(const Key("loginEmailField"));
    await tester.enterText(emailField, "validemail@gmail.com");
    Finder passwordField = find.byKey(const Key("loginPassField"));
    await tester.enterText(passwordField, "somepassword");
    //tap the login button
    await tester.tap(find.byKey(const Key("LogIn")));
    await tester.pumpAndSettle(const Duration(seconds: 2));
    //verify that log in went through
    expect(find.byKey(const Key("LogInTitle")), findsNothing);
  });
}
