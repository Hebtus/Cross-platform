import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:hebtus_crossplatform/constants.dart';
import 'package:hebtus_crossplatform/models/user.dart';
import 'package:hebtus_crossplatform/services/auth_service.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'login_test.mocks.dart';

// Generate a MockClient using the Mockito package.
// Create new instances of this class in each test.
@GenerateMocks([http.Client])
void main() {
  group('AuthServices', () {
    test('returns a User when the login call is successful', () async {
      final client = MockClient();

      // Use Mockito to return a successful response when it calls the
      // provided http.Client.
      final vari = when(client.post(
        Uri.parse('$urlString/api/v1/login'),
        headers: anyNamed('headers'),
        body: anyNamed('body'),
      )).thenAnswer((_) async => http.Response(
          jsonEncode({
            "status": "success",
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
          await authService.login("email@gmail.com", "password"), isA<User>());
    });
    test('returns user information correctly on successful login', () async {
      final client = MockClient();

      // Use Mockito to return a successful response when it calls the
      // provided http.Client.
      final vari = when(client.post(
        Uri.parse('$urlString/api/v1/login'),
        headers: anyNamed('headers'),
        body: anyNamed('body'),
      )).thenAnswer((_) async => http.Response(
          jsonEncode({
            "status": "success",
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
      var response = await authService.login("email@gmail.com", "password");
      expect(response.firstName, "name");
      expect(response.lastName, "lastname");
      expect(response.locationName, "Faculty of Engineering, Cairo University");
      expect(response.email, "email@gmail.com");
      expect(response.userID, "11");
    });

    test('throws an exception if the http call completes with an error', () {
      final client = MockClient();

      // Use Mockito to return an unsuccessful response when it calls the
      // provided http.Client.
      when(client.post(
        Uri.parse('$urlString/api/v1/login'),
        headers: anyNamed('headers'),
        body: anyNamed('body'),
      )).thenAnswer((_) async => http.Response('Not Found', 404));
      AuthService authService = AuthService(client);
      expect(authService.login("email@gmail.com", "password"), throwsException);
    });
  });
}
