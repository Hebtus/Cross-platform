class TicketBooking {
  final String ticketName;
  final String ticketType;
  final String bookingID;
  final String prefix;
  final Name name;
  final int cellphone;
  final String guestEmail;
  final String homeAddress;
  final String shippingAddress;
  final int price;
  final int quantity;
  final DateTime purchasedOn;

  TicketBooking(
    this.ticketName,
    this.ticketType,
    this.bookingID,
    this.prefix,
    this.name,
    this.cellphone,
    this.guestEmail,
    this.homeAddress,
    this.shippingAddress,
    this.price,
    this.quantity,
    this.purchasedOn,
  );

  TicketBooking.fromJson(Map<String, dynamic> json)
      : ticketName = json['ticketName'],
        ticketType = json['ticketType'],
        bookingID = json['bookingID'],
        prefix = json['prefix'],
        name = Name.fromJson(json['name']),
        cellphone = json['cellphone'],
        guestEmail = json['guestEmail'],
        homeAddress = json['homeAddress'],
        shippingAddress = json['shippingAddress'],
        price = json['price'],
        quantity = json['quantity'],
        purchasedOn = DateTime.parse(json['purchasedOn']);
}

class Name {
  final String firstName;
  final String lastName;

  Name(
    this.firstName,
    this.lastName,
  );

  Name.fromJson(Map<String, dynamic> json)
      : firstName = json['firstName'],
        lastName = json['lastName'];
}
