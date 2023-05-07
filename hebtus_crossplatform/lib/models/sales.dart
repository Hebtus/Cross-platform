class Sales {
  final int totalNetSales;
  final int totalGrossSales;
  List<SalesByType> salesByType;

  Sales(
    this.totalNetSales,
    this.totalGrossSales,
    this.salesByType,
  );

  factory Sales.fromJson(Map<String, dynamic> json) {
    var list = json['salesByType'] as List;
    List<SalesByType> salesByTypeList =
        list.map((e) => SalesByType.fromJson(e)).toList();

    return Sales(
       json['totalNetSales'].toInt() , json['totalGrossSales'].toInt(), salesByTypeList);
  }
}

class SalesByType {
  final String ticketID;
  final String ticketName;
  final String ticketType;
  final int price;
  final int capacity;
  final int currentReservations;
  final String eventID;
  final DateTime sellingStartTime;
  final DateTime sellingEndTime;

  SalesByType(
      this.ticketID,
      this.ticketName,
      this.ticketType,
      this.price,
      this.capacity,
      this.currentReservations,
      this.eventID,
      this.sellingEndTime,
      this.sellingStartTime);

  SalesByType.fromJson(Map<String, dynamic> json)
      : ticketID = json["_id"],
        ticketName = json["name"],
        ticketType = json["type"],
        price = json["price"],
        capacity = json["capacity"],
        currentReservations = json["currentReservations"],
        eventID = json["eventID"],
        sellingStartTime = DateTime.parse(json['sellingStartTime']),
        sellingEndTime = DateTime.parse(json['sellingEndTime']);
}
