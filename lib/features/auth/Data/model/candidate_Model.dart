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
<<<<<<< HEAD
=======
  Null rememberToken;
>>>>>>> 11ebb2a1b0dcbb64b358f416895129cb04960c92
  String? createdAt;
  String? updatedAt;
  String? fullname;
  String? maritalstatus;
  String? sex;
<<<<<<< HEAD
  String? DOB;
=======
  String? dOB;
>>>>>>> 11ebb2a1b0dcbb64b358f416895129cb04960c92
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
<<<<<<< HEAD
        required this.id,
=======
     required this.id,
>>>>>>> 11ebb2a1b0dcbb64b358f416895129cb04960c92
     required this.voterID,
     required this.candidateID,
     required this.candidateName,
     required this.count,
     required this.office,
     required this.party,
     required this.status,
     required this.electionYear,
<<<<<<< HEAD
=======
     required this.rememberToken,
>>>>>>> 11ebb2a1b0dcbb64b358f416895129cb04960c92
     required this.createdAt,
     required this.updatedAt,
     required this.fullname,
     required this.maritalstatus,
     required this.sex,
<<<<<<< HEAD
     required this.DOB,
=======
     required this.dOB,
>>>>>>> 11ebb2a1b0dcbb64b358f416895129cb04960c92
     required this.phone,
     required this.email,
     required this.address,
     required this.lga,
     required this.state,
     required this.occupation,
     required this.educationalQualification,
<<<<<<< HEAD
     required this.image
     });
=======
     required this.emailVerifiedAt,
     required this.image
      });
>>>>>>> 11ebb2a1b0dcbb64b358f416895129cb04960c92

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
<<<<<<< HEAD
=======
    rememberToken = json['remember_token'];
>>>>>>> 11ebb2a1b0dcbb64b358f416895129cb04960c92
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    fullname = json['fullname'];
    maritalstatus = json['maritalstatus'];
    sex = json['sex'];
<<<<<<< HEAD
    DOB = json['DOB'];
=======
    dOB = json['DOB'];
>>>>>>> 11ebb2a1b0dcbb64b358f416895129cb04960c92
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
<<<<<<< HEAD
=======
    data['remember_token'] = this.rememberToken;
>>>>>>> 11ebb2a1b0dcbb64b358f416895129cb04960c92
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['fullname'] = this.fullname;
    data['maritalstatus'] = this.maritalstatus;
    data['sex'] = this.sex;
<<<<<<< HEAD
    data['DOB'] = this.DOB;
=======
    data['DOB'] = this.dOB;
>>>>>>> 11ebb2a1b0dcbb64b358f416895129cb04960c92
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
