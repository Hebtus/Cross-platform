class CreatorTicket {
  final String ticketID;
  final String name;
  final String type;
  final int price;
  final int currentReservations;
  final int capacity;
  final DateTime sellingStartTime;
  final DateTime sellingEndTime;

  CreatorTicket(
    this.ticketID,
    this.name,
    this.type,
    this.price,
    this.currentReservations,
    this.capacity,
    this.sellingStartTime,
    this.sellingEndTime,
  );

  CreatorTicket.fromJson(Map<String, dynamic> json)
      : ticketID = json['ticketID'],
        name = json['name'],
        type = json['type'],
        price = json['price'],
        currentReservations = json['currentReservations'],
        capacity = json['capacity'],
        sellingStartTime = DateTime.parse(json['sellingStartTime']),
        sellingEndTime = DateTime.parse(json['sellingEndTime']);
}
