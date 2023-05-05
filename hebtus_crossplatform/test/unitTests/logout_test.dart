import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:hebtus_crossplatform/constants.dart';
import 'package:hebtus_crossplatform/current_user.dart';
import 'package:hebtus_crossplatform/models/user.dart';
import 'package:hebtus_crossplatform/services/auth_service.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'logout_test.mocks.dart';

// Generate a MockClient using the Mockito package.
// Create new instances of this class in each test.
@GenerateMocks([http.Client])
void main() {
  group('Logout tests', () {
    test(
        'returns a success message when logout request goes through successfully',
        () async {
      final client = MockClient();

      // Use Mockito to return a successful response when it calls the
      // provided http.Client.
      CurrentUser currentUser = CurrentUser();
      currentUser.setToken("11");
      when(client.get(
        Uri.parse('$urlString/api/v1/logout'),
        headers: anyNamed('headers'),
      )).thenAnswer((_) async => http.Response(
          jsonEncode({"status": "success", "message": "success"}), 200));
      AuthService authService = AuthService(client);
      expect(await authService.logout(), "success");
    });

    test(
        'throws an exception with a failure message when forgot password request doesnt go through',
        () async {
      final client = MockClient();

      // Use Mockito to return a successful response when it calls the
      // provided http.Client.
      when(client.post(
        Uri.parse('$urlString/api/v1/logout'),
        headers: anyNamed('headers'),
        body: anyNamed('body'),
      )).thenAnswer((_) async => http.Response(
          jsonEncode({"status": "fail", "message": "fail"}), 404));
      AuthService authService = AuthService(client);
      try {
        await authService.forgotPassword("email@gmail.com");
      } catch (e) {
        //catching the error
        expect(e.toString(),
            contains('Something Went Wrong, Please Try Again Later'));
      }
    });
  });
}
