import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hebtus_crossplatform/screens/all_screens.dart';

void main() {
  Widget makeTestableWidget({required Widget child}) {
    return MaterialApp(
      home: child,
    );
  }

  testWidgets("empty fields, does not sign up", (WidgetTester tester) async {
    //build the signup screen
    await tester.pumpWidget(makeTestableWidget(child: const SignupScreen()));
    //tap the signup button
    await tester.tap(find.byKey(const Key("SignUp")));
    //verify that signup did not go through
    expect(find.byKey(const Key("SignUpTitle")), findsOneWidget);
  });

  testWidgets("passwords dont match, does not sign up",
      (WidgetTester tester) async {
    //build the signup screen
    await tester.pumpWidget(makeTestableWidget(child: const SignupScreen()));
    //enter information in the text fields
    Finder emailField = find.byKey(const Key("signupEmailField"));
    await tester.enterText(emailField, "validemail@gmail.com");
    Finder firstNameField = find.byKey(const Key("firstNameField"));
    await tester.enterText(firstNameField, "somename");
    Finder lastNameField = find.byKey(const Key("lastNameField"));
    await tester.enterText(lastNameField, "somelastname");
    Finder passwordField = find.byKey(const Key("signupPassField"));
    await tester.enterText(passwordField, "validpassword123");
    Finder confirmPasswordField = find.byKey(const Key("signupConfirmField"));
    await tester.enterText(confirmPasswordField, "doesn'tmatch123");
    //tap the signup button
    await tester.tap(find.byKey(const Key("SignUp")));
    //verify that signup did not go through
    expect(find.byKey(const Key("SignUpTitle")), findsOneWidget);
  });

  testWidgets("first name is empty, does not sign up",
      (WidgetTester tester) async {
    //build the signup screen
    await tester.pumpWidget(makeTestableWidget(child: const SignupScreen()));
    //enter information in the text fields
    Finder emailField = find.byKey(const Key("signupEmailField"));
    await tester.enterText(emailField, "validemail@gmail.com");
    Finder firstNameField = find.byKey(const Key("firstNameField"));
    await tester.enterText(firstNameField, "");
    Finder lastNameField = find.byKey(const Key("lastNameField"));
    await tester.enterText(lastNameField, "somelastname");
    Finder passwordField = find.byKey(const Key("signupPassField"));
    await tester.enterText(passwordField, "validpassword123");
    Finder confirmPasswordField = find.byKey(const Key("signupConfirmField"));
    await tester.enterText(confirmPasswordField, "validpassword123");
    //tap the signup button
    await tester.tap(find.byKey(const Key("SignUp")));
    //verify that signup did not go through
    expect(find.byKey(const Key("SignUpTitle")), findsOneWidget);
  });
}
