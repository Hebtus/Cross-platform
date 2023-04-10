import 'location.dart';

class CreatorEvent {
  final String eventID;
  final String eventName;
  final String imgURL;
  final DateTime startTime;
  final DateTime endTime;
  final Location location;
  final String locationName;
  final bool isDraft;
  final String? description;
  final String? category;
  final bool? isOnline;
  final bool? isPrivate;
  final DateTime? goPublicDate;
  final int? ticketsSold;
  final List<String>? tags;

  //uses named parameters
  CreatorEvent(
      {required this.eventID,
      required this.eventName,
      required this.imgURL,
      required this.startTime,
      required this.endTime,
      required this.location,
      required this.locationName,
      this.description,
      this.category,
      this.isOnline,
      required this.isDraft,
      this.isPrivate,
      this.goPublicDate,
      this.ticketsSold,
      this.tags});

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

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    //mandatory fields
    data['eventName'] = eventName;
    data['img_url'] = imgURL;
    data['startTime'] = startTime;
    data['endTime'] = endTime;
    data['location'] = location.toJson();
    data['locationName'] = locationName;
    data['draft'] = isDraft;
    //optional fields
    if (description != null) data['description'] = description;
    if (category != null) data['category'] = category;
    if (isOnline != null) data['online'] = isOnline;
    if (isPrivate != null) data['privacy'] = isPrivate;
    if (goPublicDate != null) data['goPublicDate'] = goPublicDate;
    if (tags != null) data['tags'] = tags;

    return data;
  }
}
