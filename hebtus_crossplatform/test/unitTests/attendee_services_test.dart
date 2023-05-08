import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:hebtus_crossplatform/constants.dart';
import 'package:hebtus_crossplatform/current_user.dart';
import 'package:hebtus_crossplatform/models/attendee_event.dart';
import 'package:hebtus_crossplatform/services/attendee_service.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'attendee_services_test.mocks.dart';

// Generate a MockClient using the Mockito package.
// Create new instances of this class in each test.
@GenerateMocks([http.Client])
void main() {
  group('Attendee Services Tests', () {
    group('get multiple events tests', () {
      test(
          'the instance returned from the function call is a list of AttendeeEvent',
          () async {
        final client = MockClient();

        // Use Mockito to return a successful response when it calls the
        // provided http.Client.
        when(client.get(
          Uri.parse('$urlString/api/v1/events/'),
          headers: anyNamed('headers'),
        )).thenAnswer((_) async => http.Response(
            jsonEncode({
              "status": "success",
              "data": {
                "events": [
                  {
                    "_id": "123",
                    "name": "event1",
                    "img_url":
                        "https://www.pinterest.com/pin/1022106077904058079/",
                    "startDate": "2018-02-21 12:00:00",
                    "endDate": "2018-02-22 12:00:00",
                    "location": {
                      "coordinates": [123532.567, 123532.674]
                    },
                    "locationName": "Handasa University",
                    "description": "A7la event fel donya",
                    "category": "charity",
                    "online": false,
                    "draft": false,
                    "privacy": false,
                    "goPublicDate": "2018-02-04 12:00:00",
                    "ticketsSold": 20,
                    "tags": ["chill", "jazz", "music"]
                  },
                  {
                    "_id": "123",
                    "name": "event2",
                    "img_url":
                        "https://www.pinterest.com/pin/1022106077904058079/",
                    "startDate": "2018-02-21 12:00:00",
                    "endDate": "2018-02-22 12:00:00",
                    "location": {
                      "coordinates": [123532.567, 123532.674]
                    },
                    "locationName": "Handasa University",
                    "description": "A7la event fel donya",
                    "category": "charity",
                    "online": false,
                    "draft": false,
                    "privacy": false,
                    "goPublicDate": "2018-02-04 12:00:00",
                    "ticketsSold": 20,
                    "tags": ["chill", "jazz", "music"]
                  },
                ]
              }
            }),
            200));
        CurrentUser currentUser = CurrentUser();
        currentUser.token = "11";
        AttendeeService creatorService = AttendeeService(client);
        expect(await creatorService.getEvents(), isA<List<AttendeeEvent>>());
      });
      test(
          'the event information is returned correctly in the list of attendee events',
          () async {
        final client = MockClient();

        // Use Mockito to return a successful response when it calls the
        // provided http.Client.
        when(client.get(
          Uri.parse('$urlString/api/v1/events/'),
          headers: anyNamed('headers'),
        )).thenAnswer((_) async => http.Response(
            jsonEncode({
              "status": "success",
              "data": {
                "events": [
                  {
                    "_id": "123",
                    "name": "event1",
                    "img_url":
                        "https://www.pinterest.com/pin/1022106077904058079/",
                    "startDate": "2018-02-21 12:00:00",
                    "endDate": "2018-02-22 12:00:00",
                    "location": {
                      "coordinates": [123532.567, 123532.674]
                    },
                    "locationName": "Cairo University",
                    "description": "event test123",
                    "category": "music",
                    "online": false,
                    "draft": true,
                    "privacy": false,
                    "goPublicDate": "2018-02-04 12:00:00",
                    "ticketsSold": 20,
                    "tags": ["chill", "jazz", "music"]
                  },
                  {
                    "_id": "124",
                    "name": "event2",
                    "img_url":
                        "https://www.pinterest.com/pin/1022106077904058079/",
                    "startDate": "2018-02-21 12:00:00",
                    "endDate": "2018-02-22 12:00:00",
                    "location": {
                      "coordinates": [123532.567, 123532.674]
                    },
                    "locationName": "Cairo, Egypt",
                    "description": "event test123",
                    "category": "charity",
                    "online": false,
                    "draft": false,
                    "privacy": false,
                    "goPublicDate": "2018-02-04 12:00:00",
                    "ticketsSold": 20,
                    "tags": ["chill", "jazz", "music"]
                  },
                ]
              }
            }),
            200));
        CurrentUser currentUser = CurrentUser();
        currentUser.token = "11";
        AttendeeService creatorService = AttendeeService(client);
        List<AttendeeEvent> events = await creatorService.getEvents();

        expect(events[0].eventName, "event1");
        expect(events[1].eventName, "event2");
        expect(events[0].category, "music");
        expect(events[1].category, "charity");
        expect(events[0].eventID, "123");
        expect(events[1].eventID, "124");
        expect(events[0].locationName, "Cairo University");
        expect(events[1].locationName, "Cairo, Egypt");
      });
    });
  });
}
