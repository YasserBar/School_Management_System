import 'dart:convert';

List<ModelAbsent> modelAbsentFromJson(String str) => List<ModelAbsent>.from(
    json.decode(str).map((x) => ModelAbsent.fromJson(x)));

String modelAbsentToJson(List<ModelAbsent> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ModelAbsent {
  ModelAbsent({
    required this.id,
    required this.type,
    required this.studentId,
    required this.createdAt,
  });

  int id;
  String type;
  int studentId;
  DateTime createdAt;

  factory ModelAbsent.fromJson(Map<String, dynamic> json) => ModelAbsent(
        id: json["id"],
        type: json["type"],
        studentId: json["student_id"],
        createdAt: DateTime.parse(json["created_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "type": type,
        "student_id": studentId,
        "created_at": createdAt.toIso8601String(),
      };
}
