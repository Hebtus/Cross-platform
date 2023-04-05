class User {
  String userName;
  String userID;
  int longitude;
  int latitude;
  String firstName;
  String lastName;
  String locationName;

  User.fromJson(Map<String, dynamic> json)
      : userName = json["user"]["userName"],
        userID = json["user"]["userID"],
        longitude = json["user"]["location"]["longitude"],
        latitude = json["user"]["location"]["latitude"],
        firstName = json["user"]["name"]["firstName"],
        lastName = json["user"]["name"]["lastName"],
        locationName = json["user"]["locationName"];
}
