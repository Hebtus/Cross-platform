class Location {
  late final double longitude;
  late final double latitude;

  Location({required this.longitude, required this.latitude});

  Location.fromJson(Map<String, dynamic> json)
      : longitude = json["coordinates"][0].toDouble(),
        latitude = json["coordinates"][1].toDouble();

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["coordinates"][0] = longitude;
    data["coordinates"][1] = latitude;
    return data;
  }
}
