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
  final String category;
  final bool? isOnline;
  final bool? isPrivate;
  final DateTime? goPublicDate;
  final int? ticketsSold;
  final String? ticketsAvailable;
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
      required this.category,
      this.isOnline,
      required this.isDraft,
      this.isPrivate,
      this.goPublicDate,
      this.ticketsSold,
      this.ticketsAvailable,
      this.tags});

  CreatorEvent.fromJson(Map<String, dynamic> json)
      : eventID = json['_id'],
        eventName = json['name'],
        imgURL = json['img_url'],
        startTime = DateTime.parse(json['startDate']),
        endTime = DateTime.parse(json['endDate']),
        location = Location.fromJson(json['location']),
        locationName = json['locationName'],
        category = json['category'],

        //optional fields
        description =
            json.containsKey('description') ? json['description'] : null,
        isOnline = json.containsKey('online') ? json['online'] : false,
        isDraft = json.containsKey('draft') ? json['draft'] : false,
        isPrivate = json.containsKey('privacy') ? json['privacy'] : false,
        goPublicDate = json.containsKey('goPublicDate')
            ? DateTime.parse(json['goPublicDate'])
            : null,
        ticketsSold =
            json.containsKey('ticketsSold') ? json['ticketsSold'] : null,
        ticketsAvailable = json.containsKey('ticketsAvailable')
            ? json['ticketsAvailable']
            : null,
        tags = json.containsKey('tags')
            ? (json['tags'] == null ? null : List<String>.from(json['tags']))
            : null;

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
    data['category'] = category;
    //optional fields
    if (description != null) data['description'] = description;
    if (isOnline != null) data['online'] = isOnline;
    if (isPrivate != null) data['privacy'] = isPrivate;
    if (goPublicDate != null) data['goPublicDate'] = goPublicDate;
    if (tags != null) data['tags'] = tags;

    return data;
  }
}
