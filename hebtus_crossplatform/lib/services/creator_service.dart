import 'dart:convert';
import 'package:hebtus_crossplatform/current_user.dart';
import 'package:http/http.dart' as http;
import 'dart:io';
import '../constants.dart';
import '../models/creator_events.dart';
import '../models/creator_tickets.dart';
import '../models/sales.dart';
import 'package:path/path.dart';
import 'package:async/async.dart';
import '../models/promocodes.dart';

import 'package:url_launcher/url_launcher_string.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:path_provider/path_provider.dart';

///class that contains all the creator services and functions that make api calls
///
class CreatorService {
  // Future<String> createEvent(CreatorEvent event) async {
  //   Uri url = Uri.parse('$urlString/api/v1/events/');
  //
  //   //headers sent
  //   CurrentUser currentUser = CurrentUser();
  //   final Map<String, String> createEventHeaders = {
  //     "Content-Type": "application/json",
  //     "Accept": "application/json",
  //     'ngrok-skip-browser-warning': '1',
  //     'token': currentUser.getToken(),
  //   };
  //   //createEventHeaders['cookie'] = currentUser.getToken();
  //
  //   http.Response response;
  //   try {
  //     response = await http.post(url,
  //         body: jsonEncode(event.toJson()), headers: createEventHeaders);
  //   } catch (e) {
  //     throw ("Something Went Wrong, Please Try Again Later");
  //   }
  //   if (response.statusCode >= 200 || response.statusCode < 300) {
  //     return jsonDecode(response.body)["message"];
  //   } else {
  //     throw Exception(jsonDecode(response.body)["message"]);
  //   }
  // }

  Future<CreatorEvent> getOneEvent(String eventID) async {
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
      "Accept": "'text/csv, application/json",
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
      if (csv) {
        final responseCsv = response.body;
        if (kIsWeb) {
          //final csvFile = const CsvToListConverter().convert(responseCsv);
          final content = base64Encode(responseCsv.codeUnits);
          final url = 'data:text/csv;base64,$content';

          await launchUrlString(url);
        } else {
          String dir =
              "${(await getExternalStorageDirectory())!.path}/mycsv.csv";
          String file = dir;

          File f = File(file);
          await f.writeAsString(responseCsv);
          print('CSV data written to file at ${f.path}');
        }
        return [];
      } else {
        Map getEventsResponse = jsonDecode(response.body);
        final data = getEventsResponse["data"]["events"] as List;
        return data.map((json) => CreatorEvent.fromJson(json)).toList();
      }
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

  Future<String> createEvent(
      String pathImage, File imageFile, CreatorEvent eventData) async {
    var request = http.MultipartRequest(
        'POST', Uri.parse('https://hebtus.me/api/v1/events/'));
    CurrentUser currentUser = CurrentUser();
    final Map<String, String> createTicketHeaders = {
      "Content-Type": "image/jpeg",
      'ngrok-skip-browser-warning': '1',
      'token': currentUser.getToken(),
    };
    request.headers.addAll(createTicketHeaders);

    request.fields.addAll({
      'locationName': eventData.locationName,
      'name': eventData.eventName,
      'startDate': eventData.startTime.toString(),
      'endDate': eventData.endTime.toString(),
      'category': eventData.category,
      'location': eventData.location.longitude.toString() +
          ',' +
          eventData.location.longitude.toString()
    });
    var stream = new http.ByteStream(DelegatingStream(imageFile.openRead()));
    var length = await imageFile.length();
    var multipartFile = new http.MultipartFile('image', stream, length,
        filename: basename(imageFile.path));
    //request.files.add(await http.MultipartFile.fromPath('image', pathImage));
    //print( http.MultipartFile.fromPath('image', pathImage));
    //ayausamakhalifa@gmail.com
    request.files.add(multipartFile);
    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
    } else {
      print(response.reasonPhrase);
    }
    return "help";
  }

  Future<List<CreatorTicket>> getCreatorPromoCode({
    required String eventID,
    int? limit,
    int? page,
  }) async {
    Uri url =
        Uri.parse("$urlString/api/v1/creators/events/$eventID/promocodes");

    //headers sent
    CurrentUser currentUser = CurrentUser();
    final Map<String, String> getPromoHeaders = {
      "Content-Type": "application/json",
      "Accept": "application/json",
      'ngrok-skip-browser-warning': '1',
      'token': currentUser.getToken(),
    };
    //getTicketsHeaders['cookie'] = currentUser.getToken();

    http.Response response;
    try {
      response = await http.get(url, headers: getPromoHeaders);
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

  Future<String> createPromoCode(PromoCodes Promo, String eventID) async {
    Uri url = Uri.parse('$urlString/api/v1/promocodes/');
    //headers sent
    CurrentUser currentUser = CurrentUser();
    final Map<String, String> createTicketHeaders = {
      "Content-Type": "application/json",
      "Accept": "application/json",
      'ngrok-skip-browser-warning': '1',
      'token': currentUser.getToken(),
    };
    //createTicketHeaders['cookie'] = currentUser.getToken();

    Map<String, dynamic> PromoMap = Promo.toJson();
    PromoMap['eventID'] = eventID;

    http.Response response;
    try {
      response = await http.post(url,
          body: jsonEncode(PromoMap), headers: createTicketHeaders);
    } catch (e) {
      throw ("Something Went Wrong, Please Try Again Later");
    }

    if (response.statusCode >= 200 && response.statusCode < 300) {
      return jsonDecode(response.body)["message"];
    } else {
      throw Exception(jsonDecode(response.body)["message"]);
    }
  }

  Future<Sales> getEventSales({
    required String eventID,
    int? limit,
    int? page,
  }) async {
    var queryParams = {'limit': limit, 'page': page};
    queryParams.removeWhere((key, value) => value == null);

    Uri url = Uri.parse(
        "$urlString/api/v1/creators/events/$eventID/sales/?${queryParams.entries.map((e) => '${e.key}=${e.value}').join('&')}");

    //headers sent
    CurrentUser currentUser = CurrentUser();
    final Map<String, String> getSalesHeaders = {
      "Content-Type": "application/json",
      "Accept": "application/json",
      'ngrok-skip-browser-warning': '1',
      'token': currentUser.getToken(),
    };

    http.Response response;
    try {
      response = await http.get(url, headers: getSalesHeaders);
    } catch (e) {
      throw ("Something Went Wrong, Please Try Again Later");
    }
    if (response.statusCode >= 200 && response.statusCode < 300) {
      Map getSalesResponse = jsonDecode(response.body);
      final data = getSalesResponse["data"];
      return Sales.fromJson(data);
    } else {
      throw Exception(jsonDecode(response.body)["message"]);
    }
  }

  Future<String> addAttendee({
    required String ticketID,
    required String eventID,
    required String firstName,
    required String lastName,
    required String phoneNumber,
    required String gender,
    required String guestEmail,
    required int price,
    required int quantity,
  }) async {
    Uri url = Uri.parse('$urlString/api/v1/bookings/');
    //the data sent
    final Map<String, dynamic> addAttendeeData = {
      'ticketID': ticketID,
      'eventID': eventID,
      'phoneNumber': phoneNumber,
      'gender': gender,
      'guestEmail': guestEmail,
      'price': price,
      'quantity': quantity,
      'name': {
        'firstName': firstName,
        'lastName': lastName,
      },
    };

    //headers sent
    CurrentUser currentUser = CurrentUser();
    final Map<String, String> addAttendeeHeader = {
      "Content-Type": "application/json",
      "Accept": "application/json",
      'ngrok-skip-browser-warning': '1',
      'token': currentUser.getToken(),
    };

    http.Response response;
    try {
      response = await http.post(url,
          body: jsonEncode(addAttendeeData), headers: addAttendeeHeader);
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
