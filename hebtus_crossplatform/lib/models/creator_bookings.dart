class CreatorBooking {
  final String ticketName;
  final String ticketType;
  final String bookingID;
  final String prefix;
  final Name name;
  final String cellphone;
  final String guestEmail;
  final String homeAddress;
  final String shippingAddress;
  final int price;
  final int quantity;
  final DateTime purchasedOn;

  CreatorBooking(
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

  CreatorBooking.fromJson(Map<String, dynamic> json)
      : ticketName = json['ticketID'],
        ticketType = json['_id'],
        bookingID = json['ticketID'],
        prefix = json['_id'],
        name = Name.fromJson(json['name']),
        cellphone = json['phoneNumber'],
        guestEmail = json['guestEmail'],
        homeAddress = json['_id'],
        shippingAddress = json['_id'],
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
