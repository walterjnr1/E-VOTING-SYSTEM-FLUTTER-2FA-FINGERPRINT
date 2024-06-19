import 'dart:convert';

List<CandidatePartyModel> getCandidatePartyModelListFromJson(String str) =>
    List<CandidatePartyModel>.from(
        json.decode(str).map((x) => CandidatePartyModel.fromJson(x)));
        
class CandidatePartyModel {
  int? id;
  String? fullname;
  String? voterID;
  String? candidateID;
  String? candidateName;
  int? count;
  String? office;
  String? party;
  String? status;
  String? electionYear;
  String? image;
  dynamic ? rememberToken;
  dynamic ? createdAt;
  dynamic ? updatedAt;
  String? name;
  String? logo;

  CandidatePartyModel(
      {this.id,
      this.fullname,
      this.voterID,
      this.candidateID,
      this.candidateName,
      this.count,
      this.office,
      this.party,
      this.status,
      this.electionYear,
      this.image,
      this.rememberToken,
      this.createdAt,
      this.updatedAt,
      this.name,
      this.logo});

  CandidatePartyModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fullname = json['fullname'];
    voterID = json['voterID'];
    candidateID = json['candidateID'];
    candidateName = json['candidateName'];
    count = json['count'];
    office = json['office'];
    party = json['party'];
    status = json['status'];
    electionYear = json['election_year'];
    image = json['image'];
    rememberToken = json['remember_token'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    name = json['name'];
    logo = json['logo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['fullname'] = this.fullname;
    data['voterID'] = this.voterID;
    data['candidateID'] = this.candidateID;
    data['candidateName'] = this.candidateName;
    data['count'] = this.count;
    data['office'] = this.office;
    data['party'] = this.party;
    data['status'] = this.status;
    data['election_year'] = this.electionYear;
    data['image'] = this.image;
    data['remember_token'] = this.rememberToken;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['name'] = this.name;
    data['logo'] = this.logo;
    return data;
  }
}
