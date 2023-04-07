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
        json['totalNetSales'], json['totalGrossSales'], salesByTypeList);
  }
}

class SalesByType {
  final String ticketID;
  final String ticketName;
  final String ticketType;
  final int price;
  final int sold;
  final int capacity;

  SalesByType(this.ticketID, this.ticketName, this.ticketType, this.price,
      this.sold, this.capacity);

  SalesByType.fromJson(Map<String, dynamic> json)
      : ticketID = json["ticketID"],
        ticketName = json["ticketName"],
        ticketType = json["TicketType"],
        price = json["Price"],
        sold = json["sold"],
        capacity = json["capacity"];
}
