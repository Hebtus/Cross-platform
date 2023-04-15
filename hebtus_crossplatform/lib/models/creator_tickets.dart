import 'package:intl/intl.dart';

class CreatorTicket {
  final String? ticketID;
  final String name;
  final String type;
  final int price;
  final int? currentReservations;
  final int capacity;
  final DateTime sellingStartTime;
  final DateTime sellingEndTime;

  //uses named parameters
  CreatorTicket({
    this.ticketID,
    required this.name,
    required this.type,
    required this.price,
    this.currentReservations,
    required this.capacity,
    required this.sellingStartTime,
    required this.sellingEndTime,
  });

  CreatorTicket.fromJson(Map<String, dynamic> json)
      : ticketID = json['ticketID'],
        name = json['name'],
        type = json['type'],
        price = json['price'],
        currentReservations = json['currentReservations'],
        capacity = json['capacity'],
        sellingStartTime = DateTime.parse(json['sellingStartTime']),
        sellingEndTime = DateTime.parse(json['sellingEndTime']);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['type'] = type;
    data['price'] = price;
    data['capacity'] = capacity;
    data['sellingStartTime'] =
        DateFormat('yyyy-MM-dd HH:mm:ss').format(sellingStartTime);
    data['sellingEndTime'] =
        DateFormat('yyyy-MM-dd HH:mm:ss').format(sellingEndTime);
    return data;
  }
}
