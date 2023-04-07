import 'location.dart';

class CreatorEvent {
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
  final bool isDraft;
  final bool isPrivate;
  final DateTime goPublicDate;
  final int ticketsSold;
  final List<String> tags;

  CreatorEvent(
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
      this.isDraft,
      this.isPrivate,
      this.goPublicDate,
      this.ticketsSold,
      this.tags);

  CreatorEvent.fromJson(Map<String, dynamic> json)
      : eventID = json['eventid'],
        eventName = json['eventName'],
        imgURL = json['img_url'],
        startTime = DateTime.parse(json['startTime']),
        endTime = DateTime.parse(json['endTime']),
        location = Location.fromJson(json['location']),
        locationName = json['locationName'],
        description = json['description'],
        category = json['category'],
        isOnline = json['online'],
        isDraft = json['draft'],
        isPrivate = json['private'],
        goPublicDate = DateTime.parse(json['goPublicDate']),
        ticketsSold = int.parse(json['ticketsSold']),
        tags = List<String>.from(json['tags']);
}
