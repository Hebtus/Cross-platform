class AttendeeBooking {
  final String eventID;
  final String promoCode;
  final Name name;
  final String guestEmail;
  final String phoneNumber;
  final String gender;
  final List<Booking> bookings;

  AttendeeBooking(
      {required this.eventID,
      required this.name,
      required this.guestEmail,
      required this.phoneNumber,
      required this.gender,
      required this.bookings,
      required this.promoCode});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['eventID'] = eventID;
    data['name'] = name.toJson();
    data['guestEmail'] = guestEmail;
    data['phoneNumber'] = phoneNumber;
    data['promoCode'] = promoCode;
    data['gender'] = gender;
    data['bookings'] = bookings.map((booking) => booking.toJson()).toList();
    return data;
  }
}

class Name {
  final String firstName;
  final String lastName;

  Name(
    this.firstName,
    this.lastName,
  );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['firstName'] = firstName;
    data['lastName'] = lastName;

    return data;
  }
}

class Booking {
  final String ticketID;
  final int price;
  final int quantity;
  Booking(this.ticketID, this.price, this.quantity);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['ticketID'] = ticketID;
    data['price'] = price;
    data['quantity'] = quantity;

    return data;
  }
}
