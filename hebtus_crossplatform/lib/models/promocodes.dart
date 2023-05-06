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
        discountOrPercentage =
            json['discountOrPercentage'].toString() == false ? 0 : 1,
        discountAmount = double.parse(json['discountAmount'].toString()),
        percentageAmount = double.parse(json['percentage'].toString()),
        limit = int.parse(json['limits'].toString());

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['eventID'] = eventID;
    data['codeName'] = codeName;
    data['discountOrPercentage'] = discountOrPercentage;
    data['discountAmount'] = discountAmount;
    data['percentage'] = percentageAmount;
    data['limits'] = limit;
    return data;
  }
}
