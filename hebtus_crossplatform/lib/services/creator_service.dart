import 'dart:convert';
import 'package:hebtus_crossplatform/current_user.dart';
import 'package:http/http.dart' as http;

import '../constants.dart';
import '../models/creator_events.dart';
import '../models/creator_tickets.dart';

class CreatorService {
  Future<String> createEvent(CreatorEvent event) async {
    Uri url = Uri.parse('$urlString/api/v1/events/');

    //headers sent
    CurrentUser currentUser = CurrentUser();
    final Map<String, String> createEventHeaders = {
      "Content-Type": "application/json",
      "Accept": "application/json",
      'ngrok-skip-browser-warning': '1',
      'token': currentUser.getToken(),
    };
    //createEventHeaders['cookie'] = currentUser.getToken();

    http.Response response;
    try {
      response = await http.post(url,
          body: jsonEncode(event.toJson()), headers: createEventHeaders);
    } catch (e) {
      throw ("Something Went Wrong, Please Try Again Later");
    }
    if (response.statusCode >= 200 || response.statusCode < 300) {
      return jsonDecode(response.body)["message"];
    } else {
      throw Exception(jsonDecode(response.body)["message"]);
    }
  }

  Future<CreatorEvent> getOneEvent(int eventID) async {
    Uri url = Uri.parse('$urlString/api/v1/creators/events/$eventID');

    //headers sent
    CurrentUser currentUser = CurrentUser();
    final Map<String, String> getEventHeaders = {
      "Content-Type": "application/json",
      "Accept": "application/json",
      'ngrok-skip-browser-warning': '1',
      'token': currentUser.getToken(),
    };
    //getEventHeaders['cookie'] = currentUser.getToken();

    http.Response response;
    try {
      response = await http.get(url, headers: getEventHeaders);
    } catch (e) {
      throw ("Something Went Wrong, Please Try Again Later");
    }
    if (response.statusCode >= 200 && response.statusCode < 300) {
      Map eventDataResponse = jsonDecode(response.body);
      dynamic eventData = eventDataResponse["data"]["event"];
      return CreatorEvent.fromJson(eventData);
    } else {
      throw Exception(jsonDecode(response.body)["message"]);
    }
  }

  Future<List<CreatorEvent>> getMultipleEvents(
      {int? limit, int? page, String? time, required bool csv}) async {
    var queryParams = {'limit': limit, 'page': page, 'csv': csv, "time": time};
    queryParams.removeWhere((key, value) => value == null);
    Uri url = Uri.parse('$urlString/api/v1/creators/events');
    if (queryParams.isNotEmpty) {
      url = Uri.parse(
          "$urlString/api/v1/creators/events/?${queryParams.entries.map((e) => '${e.key}=${e.value}').join('&')}");
    }
    //headers sent
    CurrentUser currentUser = CurrentUser();
    final Map<String, String> getEventsHeaders = {
      "Content-Type": "application/json",
      "Accept": "application/json",
      'ngrok-skip-browser-warning': '1',
      'token': currentUser.getToken(),
    };
    //getEventsHeaders['cookie'] = currentUser.getToken();

    http.Response response;
    try {
      response = await http.get(url, headers: getEventsHeaders);
    } catch (e) {
      throw ("Something Went Wrong, Please Try Again Later");
    }

    if (response.statusCode >= 200 && response.statusCode < 300) {
      Map getEventsResponse = jsonDecode(response.body);
      final data = getEventsResponse["data"]["events"] as List;
      return data.map((json) => CreatorEvent.fromJson(json)).toList();
    } else {
      throw Exception(jsonDecode(response.body)["message"]);
    }
  }

  Future<List<CreatorTicket>> getCreatorEventTickets({
    required String eventID,
    int? limit,
    int? page,
  }) async {
    var queryParams = {'limit': limit, 'page': page};
    queryParams.removeWhere((key, value) => value == null);

    Uri url = Uri.parse(
        "$urlString/api/v1/creators/events/$eventID/tickets/?${queryParams.entries.map((e) => '${e.key}=${e.value}').join('&')}");

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
      return data.map((json) => CreatorTicket.fromJson(json)).toList();
    } else {
      throw Exception(jsonDecode(response.body)["message"]);
    }
  }

  Future<String> createTicket(CreatorTicket ticket, String eventID) async {
    Uri url = Uri.parse('$urlString/api/v1/tickets/');
    //headers sent
    CurrentUser currentUser = CurrentUser();
    final Map<String, String> createTicketHeaders = {
      "Content-Type": "application/json",
      "Accept": "application/json",
      'ngrok-skip-browser-warning': '1',
      'token': currentUser.getToken(),
    };
    //createTicketHeaders['cookie'] = currentUser.getToken();

    Map<String, dynamic> ticketMap = ticket.toJson();
    ticketMap['eventID'] = eventID;

    http.Response response;
    try {
      response = await http.post(url,
          body: jsonEncode(ticketMap), headers: createTicketHeaders);
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
