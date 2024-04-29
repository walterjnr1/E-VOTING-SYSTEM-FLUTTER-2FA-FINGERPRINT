class PartyModel {
  String? name;
  String? logo;

  PartyModel({
    required this.name,
    required this.logo,
  });

  factory PartyModel.fromJson(Map<String, dynamic> json) => PartyModel(
        name: json["name"],
        logo: json["logo"],
      );
  Map<String, dynamic> toJson() => {
        "name": name,
        "logo": logo,
      };
}
