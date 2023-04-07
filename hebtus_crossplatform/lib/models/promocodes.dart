class PromoCodes {
  final String promocodeID;
  final String code;
  final int percentage;
  final int limit;
  final int uses;

  PromoCodes(
    this.promocodeID,
    this.code,
    this.percentage,
    this.limit,
    this.uses,
  );

  PromoCodes.fromJson(Map<String, dynamic> json)
      : promocodeID = json['promoCodeID'],
        code = json['code'],
        percentage = json['precentage'],
        limit = json['limit'],
        uses = json['uses'];
}
