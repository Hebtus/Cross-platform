class Notifications {
  String creatorFirstName;
  String creatorLastName;
  String attendeeFirstName;
  String attendeeLastName;
  String eventName;

  Notifications(
      {required this.creatorFirstName,
      required this.creatorLastName,
      required this.attendeeFirstName,
      required this.attendeeLastName,
      required this.eventName});

  Notifications.fromJson(Map<String, dynamic> json)
      : creatorFirstName = json["creatorName"]["firstName"],
        creatorLastName = json["creatorName"]["lastName"],
        attendeeFirstName = json["attendeeName"]["firstName"],
        attendeeLastName = json["attendeeName"]["lastName"],
        eventName = json["eventName"];
}
