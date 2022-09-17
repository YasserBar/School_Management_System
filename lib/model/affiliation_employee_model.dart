import 'dart:convert';

AffiliationEmployeeModel affiliationEmployeeModelFromJson(String str) =>
    AffiliationEmployeeModel.fromJson(json.decode(str));

String affiliationEmployeeModelToJson(AffiliationEmployeeModel data) =>
    json.encode(data.toJson());

class AffiliationEmployeeModel {
  AffiliationEmployeeModel(
      {required this.name,
      required this.phone,
      required this.nameDegree,
      required this.targetJob,
      required this.subjectTarget});

  String name;
  String phone;
  String nameDegree;
  String targetJob;
  String subjectTarget;

  factory AffiliationEmployeeModel.fromJson(Map<String, dynamic> json) =>
      AffiliationEmployeeModel(
          name: json["name"],
          phone: json["phone"],
          nameDegree: json["name_degree"],
          targetJob: json["target_job"],
          subjectTarget: json["subject_target"]);

  Map<String, dynamic> toJson() => {
        "name": name,
        "phone": phone,
        "name_degree": nameDegree,
        "target_job": targetJob,
        "subject_target": subjectTarget
      };
}
