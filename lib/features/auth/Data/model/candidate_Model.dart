class CandidateModel {
  String? fullname;
  String? phone;
  String? email;
  String? occupation;
  String? voterID;
  String? candidateID;
  int? count;
  String? office;
  String party;
  String status;
  String election_year;
  String image;

  CandidateModel({
    required this.fullname,
    required this.phone,
    required this.email,
    required this.occupation,
    required this.voterID,
    required this.candidateID,
    required this.count,
    required this.office,
    required this.party,
    required this.status,
    required this.election_year,
        required this.image,

  });

  factory CandidateModel.fromJson(Map<String, dynamic> json) => CandidateModel(
        fullname: json["fullname"],
        phone: json["phone"],
        email: json["email"],
        occupation: json["occupation"],
        voterID: json["voterID"],
        candidateID: json["candidateID"],
        count: json["count"],
        office: json["office"],
        party: json["party"],
        status: json["status"],
        election_year: json["election_year"],
                image: json["image"],

      );
  Map<String, dynamic> toJson() => {
        "fullname": fullname,
        "phone": phone,
        "email": email,
        "occupation": occupation,
        "voterID": voterID,
        "candidateID": candidateID,
        "count": count,
        "office": office,
        "party": party,
        "status": status,
        "election_year": election_year,
        "image": image,

      };
}
