class PromoCodes {
  final String eventID;
  final String codeName;
  final int discountOrPercentage;
  final double discountAmount;
  final double percentageAmount;
  final int limit;

  PromoCodes(this.eventID, this.codeName, this.discountOrPercentage,
      this.discountAmount, this.percentageAmount, this.limit);

  PromoCodes.fromJson(Map<String, dynamic> json)
      : eventID = json['eventID'],
        codeName = json['codeName'],
        discountOrPercentage = json['discountOrPercentage'],
        discountAmount = json['discountAmount'],
        percentageAmount = json['percentageAmount'],
        limit = json['limit'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['eventID'] = eventID;
    data['codeName'] = codeName;
    data['discountOrPercentage'] = discountOrPercentage;
    data['discountAmount'] = discountAmount;
    data['percentageAmount'] = percentageAmount;
    data['limit'] = limit;
    return data;
  }
}
