class VoterModel {
  //String id;
  String? voterID;
  String? fullname;
  String? maritalstatus;
  String? sex;
  String DOB;
  String phone;
  String email;
  String address;
  String lga;
  String state;
  String occupation;
  String educational_qualification;
  String image;

  VoterModel({
   // required this.id,
    required this.voterID,
    required this.fullname,
    required this.maritalstatus,
    required this.sex,
    required this.DOB,
    required this.phone,
    required this.email,
    required this.address,
    required this.lga,
    required this.state,
    required this.occupation,
    required this.educational_qualification,
    required this.image,
  });

  factory VoterModel.fromJson(Map<String, dynamic> json) => VoterModel(
      //  id: json["id"],
        voterID: json["voterID"],
        fullname: json["fullname"],
        maritalstatus: json["maritalstatus"],
        sex: json["sex"],
        DOB: json["DOB"],
        phone: json["phone"],
        email: json["email"],
        address: json["address"],
        lga: json["lga"],
        state: json["state"],
        occupation: json["occupation"],
        educational_qualification: json["educational_qualification"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
       // "id": id,
        "voterID": voterID,
        "fullname": fullname,
        "maritalstatus": maritalstatus,
        "sex": sex,
        "DOB": DOB,
        "phone": phone,
        "email": email,
        "address": address,
        "lga": lga,
        "state": state,
        "occupation": occupation,
        "educational_qualification": educational_qualification,
        "image": image,

      };
}
