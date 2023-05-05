import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:hebtus_crossplatform/constants.dart';
import 'package:hebtus_crossplatform/current_user.dart';
import 'package:hebtus_crossplatform/services/auth_service.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'signup_test.mocks.dart';

// Generate a MockClient using the Mockito package.
// Create new instances of this class in each test.
@GenerateMocks([http.Client])
void main() {
  group('Sign Up tests', () {
    test('returns a User when the signup call is successful', () async {
      final client = MockClient();

      // Use Mockito to return a successful response when it calls the
      // provided http.Client.
      when(client.post(
        Uri.parse('$urlString/api/v1/signup'),
        headers: anyNamed('headers'),
        body: anyNamed('body'),
      )).thenAnswer((_) async => http.Response(
          jsonEncode({
            "status": "success",
            "token": "112",
            "message": "success",
            "data": {
              "user": {
                "_id": "11",
                "name": {"firstName": "name", "lastName": "lastname"},
                "email": "email@gmail.com",
                "locationName": "Faculty of Engineering, Cairo University",
                "location": {
                  "coordinates": [30.0594885, 31.2584644]
                }
              }
            }
          }),
          200));
      AuthService authService = AuthService(client);
      expect(
          await authService.signup(
              "name", "lastname", "email@gmail.com", "password", "password"),
          "success");
    });
    test('returns user information correctly on successful signup', () async {
      final client = MockClient();

      // Use Mockito to return a successful response when it calls the
      // provided http.Client.
      when(client.post(
        Uri.parse('$urlString/api/v1/signup'),
        headers: anyNamed('headers'),
        body: anyNamed('body'),
      )).thenAnswer((_) async => http.Response(
          jsonEncode({
            "status": "success",
            "message": "success",
            "data": {
              "user": {
                "_id": "11",
                "name": {"firstName": "name", "lastName": "lastname"},
                "email": "email@gmail.com",
                "locationName": "Faculty of Engineering, Cairo University",
                "location": {
                  "coordinates": [30.0594885, 31.2584644]
                }
              }
            }
          }),
          200));
      AuthService authService = AuthService(client);
      await authService.signup(
          "name", "lastname", "email@gmail.com", "password", "password");
      CurrentUser currentUser = CurrentUser();
      expect(currentUser.currentUser.firstName, "name");
      expect(currentUser.currentUser.lastName, "lastname");
      expect(currentUser.currentUser.locationName,
          "Faculty of Engineering, Cairo University");
      expect(currentUser.currentUser.email, "email@gmail.com");
      expect(currentUser.currentUser.userID, "11");
    });

    test(
        'token is returned correctly in current user object on successful signup',
        () async {
      final client = MockClient();

      // Use Mockito to return a successful response when it calls the
      // provided http.Client.
      when(client.post(
        Uri.parse('$urlString/api/v1/signup'),
        headers: anyNamed('headers'),
        body: anyNamed('body'),
      )).thenAnswer((_) async => http.Response(
          jsonEncode({
            "status": "success",
            "message": "success",
            "token": "112",
            "data": {
              "user": {
                "_id": "11",
                "name": {"firstName": "name", "lastName": "lastname"},
                "email": "email@gmail.com",
                "locationName": "Faculty of Engineering, Cairo University",
                "location": {
                  "coordinates": [30.0594885, 31.2584644]
                }
              }
            }
          }),
          200));
      AuthService authService = AuthService(client);
      await authService.signup(
          "name", "lastname", "email@gmail.com", "password", "password");
      CurrentUser currentUser = CurrentUser();
      expect(currentUser.token, "112");
    });
  });
}
