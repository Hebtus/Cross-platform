class User {
  String userID;
  List<dynamic> coordinates;
  String firstName;
  String lastName;
  String locationName;
  String email;

  User.fromJson(Map<String, dynamic> json)
      : userID = json["user"]["_id"],
        coordinates = json["user"]["location"]["coordinates"],
        firstName = json["user"]["name"]["firstName"],
        lastName = json["user"]["name"]["lastName"],
        locationName = json["user"]["locationName"],
        email = json["user"]["email"];
}
