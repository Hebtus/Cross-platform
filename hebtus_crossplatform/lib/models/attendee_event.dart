import 'location.dart';

class AttendeeEvent {
  final String eventID;
  final String eventName;
  final String imgURL;
  final DateTime startTime;
  final DateTime endTime;
  final Location location;
  final String locationName;
  final String description;
  final String category;
  final bool isOnline;
  final List<String> tags;

  AttendeeEvent(
    this.eventID,
    this.eventName,
    this.imgURL,
    this.startTime,
    this.endTime,
    this.location,
    this.locationName,
    this.description,
    this.category,
    this.isOnline,
    this.tags,
  );
  AttendeeEvent.fromJson(Map<String, dynamic> json)
      : eventID = json['eventID'],
        eventName = json['eventName'],
        imgURL = json['img_url'],
        startTime = DateTime.parse(json['startTime']),
        endTime = DateTime.parse(json['endTime']),
        location = Location.fromJson(json['location']),
        locationName = json['locationName'],
        description = json['description'],
        category = json['category'],
        isOnline = json['online'],
        tags = List<String>.from(json['tags']);
}
