import 'dart:convert';
import 'package:http/http.dart' as http;
import '../constants.dart';
import '../current_user.dart';
import '../models/attendee_event.dart';
import '../models/attendee_tickets.dart';

class AttendeeService {
  //the parameters are named meaning that when you call the function you have to pass named parameter ex category: "all"
  Future<List<AttendeeEvent>> getEvents(
      {String? category,
      int? limit,
      int? page,
      double? latitude,
      double? longitude,
      int? free,
      int? online,
      DateTime? startDate,
      DateTime? endDate}) async {
    var queryParams = {
      'category': category,
      'location': longitude == null ? null : "$latitude,$longitude",
      'limit': limit,
      'page': page,
      'free': free,
      'online': online,
      'startDate': startDate?.toUtc(),
      'endDate': endDate?.toUtc()
    };
    queryParams.removeWhere((key, value) => value == null);

    Uri url = Uri.parse(
        "$urlString/api/v1/events/?${queryParams.entries.map((e) => '${e.key}=${e.value}').join('&')}");
    final Map<String, String> getEventsHeaders = {
      "Content-Type": "application/json",
      "Accept": "application/json",
      'ngrok-skip-browser-warning': '1',
    };

    http.Response response;
    try {
      response = await http.get(url, headers: getEventsHeaders);
    } catch (e) {
      throw ("Something Went Wrong, Please Try Again Later");
    }

    if (response.statusCode >= 200 && response.statusCode < 300) {
      Map getEventsResponse = jsonDecode(response.body);
      final data = getEventsResponse["data"] as List;
      return data.map((json) => AttendeeEvent.fromJson(json)).toList();
    } else {
      throw Exception(jsonDecode(response.body)["message"]);
    }
  }

  Future<AttendeeEvent> getEventByID(int eventID) async {         
    Uri url = Uri.parse("$urlString/api/v1/events/$eventID");
    final Map<String, String> getEventHeaders = {
      "Content-Type": "application/json",
      "Accept": "application/json",
      'ngrok-skip-browser-warning': '1',
    };

    http.Response response;
    try {
      response = await http.get(url, headers: getEventHeaders);
    } catch (e) {
      throw ("Something Went Wrong, Please Try Again Later");
    }

    if (response.statusCode >= 200 && response.statusCode < 300) {
      Map getEventsResponse = jsonDecode(response.body);
      dynamic data = getEventsResponse["data"];
      return AttendeeEvent.fromJson(data);
    } else {
      throw Exception(jsonDecode(response.body)["message"]);
    }
  }

  Future<List<AttendeeTicket>> getAttendeeEventTickets(
    int eventID,
    int? limit,
    int? page,
  ) async {
    var queryParams = {'limit': limit, 'page': page};
    queryParams.removeWhere((key, value) => value == null);

    Uri url = Uri.parse(
        "$urlString/api/v1/events/$eventID/tickets/?${queryParams.entries.map((e) => '${e.key}=${e.value}').join('&')}");

    //headers sent
    final Map<String, String> getTicketsHeaders = {
      "Content-Type": "application/json",
      "Accept": "application/json",
      'ngrok-skip-browser-warning': '1',
    };
    CurrentUser currentUser = CurrentUser();
    getTicketsHeaders['cookie:'] = currentUser.getToken();

    http.Response response;
    try {
      response = await http.get(url, headers: getTicketsHeaders);
    } catch (e) {
      throw ("Something Went Wrong, Please Try Again Later");
    }

    if (response.statusCode >= 200 && response.statusCode < 300) {
      Map getTicketsResponse = jsonDecode(response.body);
      final data = getTicketsResponse["data"]["tickets"] as List;
      return data.map((json) => AttendeeTicket.fromJson(json)).toList();
    } else {
      throw Exception(jsonDecode(response.body)["message"]);
    }
  }
}
