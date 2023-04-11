class Location {
  final double longitude;
  final double latitude;

  Location({required this.longitude, required this.latitude});

  Location.fromJson(Map<String, dynamic> json)
      : longitude = json['longitude'],
        latitude = json['latitude'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['longitude'] = longitude;
    data['latitude'] = latitude;
    return data;
  }
}
