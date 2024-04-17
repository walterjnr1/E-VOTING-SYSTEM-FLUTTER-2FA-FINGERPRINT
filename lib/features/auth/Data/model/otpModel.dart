class otpModel {
  late String code;
  late String datetime;
  late String voterID;

  otpModel() {
    this.code = code;
    this.datetime = datetime;
    this.voterID = voterID;
  }

  otpModel.fromJson(Map json)
      : code = json['code'],datetime = json['datetime'],voterID = json['voterID'];

  Map toJson() {
    return {
      'code': code,'datetime': datetime,'voterID': voterID};
  }
}
