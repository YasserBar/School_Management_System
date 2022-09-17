import 'dart:convert';

List<ModelValyation> modelValyationFromJson(String str) =>
    List<ModelValyation>.from(
        json.decode(str).map((x) => ModelValyation.fromJson(x)));

String modelValyationToJson(List<ModelValyation> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ModelValyation {
  ModelValyation({
    required this.description,
    required this.teacherId,
    required this.lecture,
    required this.subject,
    required this.createdAt,
    required this.id,
  });

  String description;
  int teacherId;
  String lecture;
  String subject;
  DateTime createdAt;
  int id;

  factory ModelValyation.fromJson(Map<String, dynamic> json) => ModelValyation(
        description: json["description"],
        teacherId: json["teacher_id"],
        lecture: json["lecture"],
        subject: json["subject"],
        createdAt: DateTime.parse(json["created_at"]),
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "description": description,
        "teacher_id": teacherId,
        "lecture": lecture,
        "subject": subject,
        "created_at": createdAt.toIso8601String(),
        "id": id,
      };
}
