import 'dart:convert';
import 'package:http/http.dart' as http;
import '../constants.dart';
import '../current_user.dart';
import '../models/attendee_bookings.dart';
import '../models/attendee_event.dart';
import '../models/attendee_tickets.dart';

///class that contains all the attendee services and functions that make api calls
class AttendeeService {
  //the parameters are named meaning that when you call the function you have to pass named parameter ex category: "all"
  Future<List<AttendeeEvent>> getEvents(
      {String? category,
      int? limit,
      int? page,
      double? latitude,
      double? longitude,
      bool? free,
      bool? online,
      DateTime? startDate,
      DateTime? endDate}) async {
    if (category != null) {
      category = category.replaceAll('&', '%26');
    }

    var queryParams = {
      'category': category,
      'location': longitude == null ? null : "$longitude,$latitude",
      'limit': limit,
      'page': page,
      'free': free,
      'online': online,
      'startDate': startDate?.toUtc(),
      'endDate': endDate?.toUtc()
    };
    queryParams.removeWhere((key, value) => value == null);
    Uri url = Uri.parse("$urlString/api/v1/events/");
    if (queryParams.isNotEmpty) {
      url = Uri.parse(
          "$urlString/api/v1/events/?${queryParams.entries.map((e) => '${e.key}=${e.value}').join('&')}");
    }
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
      final data = getEventsResponse["data"]["events"] as List;
      return data.map((json) => AttendeeEvent.fromJson(json)).toList();
    } else {
      throw Exception(jsonDecode(response.body)["message"]);
    }
  }

  Future<AttendeeEvent> getEventByID(String eventID) async {
    Uri url = Uri.parse("$urlString/api/v1/events/$eventID");
    final Map<String, String> getEventHeaders = {
      "Content-Type": "application/json",
      "Accept": "application/json",
      'ngrok-skip-browser-warning': '1',
    };
    CurrentUser currentUser = CurrentUser();
    getEventHeaders['token'] = currentUser.getToken();

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

  Future<List<AttendeeTicket>> getAttendeeEventTickets({
    required String eventID,
    int? limit,
    int? page,
  }) async {
    var queryParams = {'page': page, 'limit': limit};
    queryParams.removeWhere((key, value) => value == null);

    Uri url = Uri.parse(
        "$urlString/api/v1/events/$eventID/tickets/?${queryParams.entries.map((e) => '${e.key}=${e.value}').join('&')}");

    //headers sent
    CurrentUser currentUser = CurrentUser();
    final Map<String, String> getTicketsHeaders = {
      "Content-Type": "application/json",
      "Accept": "application/json",
      'ngrok-skip-browser-warning': '1',
      'token': currentUser.getToken(),
    };
    //getTicketsHeaders['cookie'] = currentUser.getToken();

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

  Future<String> createBooking(AttendeeBooking booking) async {
    Uri url = Uri.parse('$urlString/api/v1/bookings/');
    //headers sent
    CurrentUser currentUser = CurrentUser();
    final Map<String, String> createBookingHeader = {
      "Content-Type": "application/json",
      "Accept": "application/json",
      'ngrok-skip-browser-warning': '1',
      'token': currentUser.getToken(),
    };
    Map<String, dynamic> bookingMap = booking.toJson();

    http.Response response;
    try {
      response = await http.post(url,
          body: jsonEncode(bookingMap), headers: createBookingHeader);
    } catch (e) {
      throw ("Something Went Wrong, Please Try Again Later");
    }

    if (response.statusCode >= 200 && response.statusCode < 300) {
      return jsonDecode(response.body)["message"];
    } else {
      throw Exception(jsonDecode(response.body)["message"]);
    }
  }
}
