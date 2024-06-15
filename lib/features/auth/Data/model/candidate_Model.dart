class CandidateModel {
  int? id;
  String? voterID;
  String? candidateID;
  String? candidateName;
  int? count;
  String? office;
  String? party;
  String? status;
  String? electionYear;
  String? createdAt;
  String? updatedAt;
  String? fullname;
  String? maritalstatus;
  String? sex;
  String? DOB;
  String? phone;
  String? email;
  String? address;
  String? lga;
  String? state;
  String? occupation;
  String? educationalQualification;
  Null emailVerifiedAt;
  String? image;

  CandidateModel(
      {
        required this.id,
     required this.voterID,
     required this.candidateID,
     required this.candidateName,
     required this.count,
     required this.office,
     required this.party,
     required this.status,
     required this.electionYear,
     required this.createdAt,
     required this.updatedAt,
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
     required this.educationalQualification,
     required this.image
     });

  CandidateModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    voterID = json['voterID'];
    candidateID = json['candidateID'];
    candidateName = json['candidateName'];
    count = json['count'];
    office = json['office'];
    party = json['party'];
    status = json['status'];
    electionYear = json['election_year'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    fullname = json['fullname'];
    maritalstatus = json['maritalstatus'];
    sex = json['sex'];
    DOB = json['DOB'];
    phone = json['phone'];
    email = json['email'];
    address = json['address'];
    lga = json['lga'];
    state = json['state'];
    occupation = json['occupation'];
    educationalQualification = json['educational_qualification'];
    emailVerifiedAt = json['email_verified_at'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['voterID'] = this.voterID;
    data['candidateID'] = this.candidateID;
    data['candidateName'] = this.candidateName;
    data['count'] = this.count;
    data['office'] = this.office;
    data['party'] = this.party;
    data['status'] = this.status;
    data['election_year'] = this.electionYear;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['fullname'] = this.fullname;
    data['maritalstatus'] = this.maritalstatus;
    data['sex'] = this.sex;
    data['DOB'] = this.DOB;
    data['phone'] = this.phone;
    data['email'] = this.email;
    data['address'] = this.address;
    data['lga'] = this.lga;
    data['state'] = this.state;
    data['occupation'] = this.occupation;
    data['educational_qualification'] = this.educationalQualification;
    data['email_verified_at'] = this.emailVerifiedAt;
    data['image'] = this.image;
    return data;
  }
}
