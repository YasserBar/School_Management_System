import 'dart:convert';

AffiliationStudentModel affiliationStudentModelFromJson(String str) =>
    AffiliationStudentModel.fromJson(json.decode(str));

String affiliationStudentModelToJson(AffiliationStudentModel data) =>
    json.encode(data.toJson());

class AffiliationStudentModel {
  AffiliationStudentModel(
      {required this.name,
      required this.phone,
      required this.lastLevel,
      required this.lastLevelDegree,
      required this.targetLevel});

  String name;
  String phone;
  String lastLevel;
  String lastLevelDegree;
  String targetLevel;

  factory AffiliationStudentModel.fromJson(Map<String, dynamic> json) =>
      AffiliationStudentModel(
          name: json["name"],
          phone: json["phone"],
          lastLevel: json["last-level"],
          lastLevelDegree: json["last-level-degree"],
          targetLevel: json["target-level"]);

  Map<String, dynamic> toJson() => {
        "name": name,
        "phone": phone,
        "last_level": lastLevel,
        "last_level_degree": lastLevelDegree,
        "target_level": targetLevel
      };
}
