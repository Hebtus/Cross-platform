class User {
  String userID;
  List<dynamic> coordinates;
  String firstName;
  String lastName;
  String locationName;
  String email;

  User(
      {required this.userID,
      required this.email,
      required this.firstName,
      required this.lastName,
      required this.locationName,
      required this.coordinates});

  User.fromJson(Map<String, dynamic> json)
      : userID = json["user"]["_id"],
        coordinates = json["user"]["location"]["coordinates"],
        firstName = json["user"].containsKey('name')
            ? json["user"]["name"]["firstName"]
            : "",
        lastName = json["user"].containsKey('name')
            ? json["user"]["name"]["lastName"]
            : "",
        locationName = json["user"]["locationName"],
        email = json["user"]["email"];
}
