import 'location.dart';

class AttendeeEvent {
  final String eventID;
  final String eventName;
  final String imgURL;
  final DateTime startTime;
  final DateTime endTime;
  final Location location;
  final String locationName;
  final String? description;
  final String category;
  final bool? isOnline;
  final List<String>? tags;
  final bool? privacy;

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
    this.privacy,
  );
  AttendeeEvent.fromJson(Map<String, dynamic> json)
      : eventID = json['_id'],
        eventName = json['name'],
        imgURL = json['img_url'],
        startTime = DateTime.parse(json['startDate']),
        endTime = DateTime.parse(json['endDate']),
        location = Location.fromJson(json['location']),
        locationName = json['locationName'],
        description =
            json.containsKey('description') ? json['description'] : null,
        category = json['category'],
        isOnline = json.containsKey('online') ? json['online'] : false,
        tags =
            json.containsKey('tags') ? List<String>.from(json['tags']) : null,
        privacy = json.containsKey('privacy') ? json['privacy'] : false;
}
