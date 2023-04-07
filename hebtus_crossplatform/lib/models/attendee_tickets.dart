class AttendeeTicket {
  final String ticketID;
  final String name;
  final String type;
  final int price;
  final int currentReservations;
  final int capacity;
  final DateTime sellingEndTime;

  AttendeeTicket(
    this.ticketID,
    this.name,
    this.type,
    this.price,
    this.currentReservations,
    this.capacity,
    this.sellingEndTime,
  );

  AttendeeTicket.fromJson(Map<String, dynamic> json)
      : ticketID = json['ticketID'],
        name = json['name'],
        type = json['type'],
        price = json['price'],
        currentReservations = json['currentReservations'],
        capacity = json['capacity'],
        sellingEndTime = DateTime.parse(json['sellingEndTime']);
}
