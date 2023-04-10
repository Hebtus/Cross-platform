import 'dart:convert';
import 'package:http/http.dart' as http;

import '../constants.dart';
import '../models/creator_events.dart';
import '../models/creator_tickets.dart';

class CreatorService {
  Future<String> createEvent(CreatorEvent event) async {
    Uri url = Uri.parse('$urlString/api/v1/events/');

    //headers sent
    final Map<String, String> createEventHeaders = {
      "Content-Type": "application/json",
      "Accept": "application/json",
      'ngrok-skip-browser-warning': '1',
    };

    http.Response response = await http.post(url,
        body: jsonEncode(event.toJson()), headers: createEventHeaders);
    if (response.statusCode == 200 || response.statusCode == 201) {
      return jsonDecode(response.body)["message"];
    } else {
      throw Exception(response.statusCode);
    }
  }

  Future<CreatorEvent> getOneEvent(int eventID) async {
    Uri url = Uri.parse('$urlString/api/v1/events/$eventID');

    //headers sent
    final Map<String, String> getEventHeaders = {
      "Content-Type": "application/json",
      "Accept": "application/json",
      'ngrok-skip-browser-warning': '1',
    };

    http.Response response = await http.get(url, headers: getEventHeaders);
    if (response.statusCode == 200 || response.statusCode == 201) {
      Map eventDataResponse = jsonDecode(response.body);
      dynamic eventData = eventDataResponse["data"]["event"];
      return CreatorEvent.fromJson(eventData);
    } else {
      throw Exception(response.statusCode);
    }
  }

  Future<List<CreatorEvent>> getMultipleEvents(int eventID) async {
    Uri url = Uri.parse('$urlString/api/v1/events/$eventID');

    //headers sent
    final Map<String, String> getEventsHeaders = {
      "Content-Type": "application/json",
      "Accept": "application/json",
      'ngrok-skip-browser-warning': '1',
    };

    http.Response response = await http.get(url, headers: getEventsHeaders);
    if (response.statusCode == 200 || response.statusCode == 201) {
      Map getEventsResponse = jsonDecode(response.body);
      final data = getEventsResponse["data"]["events"] as List;
      return data.map((json) => CreatorEvent.fromJson(json)).toList();
    } else {
      throw Exception(response.statusCode);
    }
  }

  Future<List<CreatorTicket>> getCreatorEventTickets(
    int eventID,
    int? limit,
    int? page,
  ) async {
    var queryParams = {'limit': limit, 'page': page};
    queryParams.removeWhere((key, value) => value == null);

    Uri url = Uri.parse(
        "$urlString/api/v1/creators/events/$eventID/tickets/?${queryParams.entries.map((e) => '${e.key}=${e.value}').join('&')}");

    //headers sent
    final Map<String, String> getTicketsHeaders = {
      "Content-Type": "application/json",
      "Accept": "application/json",
      'ngrok-skip-browser-warning': '1',
    };
    http.Response response = await http.get(url, headers: getTicketsHeaders);
    if (response.statusCode == 200 || response.statusCode == 201) {
      Map getTicketsResponse = jsonDecode(response.body);
      final data = getTicketsResponse["data"]["tickets"] as List;
      return data.map((json) => CreatorTicket.fromJson(json)).toList();
    } else {
      throw Exception(response.statusCode);
    }
  }

  Future<String> createTicket(CreatorTicket ticket, int eventID) async {
    Uri url = Uri.parse('$urlString/api/v1/tickets/');
    //headers sent
    final Map<String, String> createTicketHeaders = {
      "Content-Type": "application/json",
      "Accept": "application/json",
      'ngrok-skip-browser-warning': '1',
    };

    Map<String, dynamic> ticketMap = ticket.toJson();
    ticketMap['eventID'] = eventID;

    http.Response response = await http.post(url,
        body: jsonEncode(ticketMap), headers: createTicketHeaders);
    if (response.statusCode == 200 || response.statusCode == 201) {
      return jsonDecode(response.body)["message"];
    } else {
      throw Exception(response.statusCode);
    }
  }
}
