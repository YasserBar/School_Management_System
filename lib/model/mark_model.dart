import 'dart:convert';

List<ModelMark> modelMarkFromJson(String str) =>
  List<ModelMark>.from(json.decode(str).map((x) => ModelMark.fromJson(x)));

String modelMarkToJson(List<ModelMark> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ModelMark {
  ModelMark({
    required this.id,
    required this.mark,
    required this.subject,
    required this.type,
    required this.studentId,
    required this.createdAt,
  });

  int id;
  String mark;
  String subject;
  String type;
  int studentId;
  DateTime createdAt;

  factory ModelMark.fromJson(Map<String, dynamic> json) => ModelMark(
      id: json["id"],
      mark: json["mark"],
      subject: json["subject"],
      type: json["type"],
      studentId: json["student_id"],
      createdAt: DateTime.parse(json["created_at"]));

  Map<String, dynamic> toJson() => {
        "id": id,
        "mark": mark,
        "subject": subject,
        "type": type,
        "student_id": studentId,
        "created_at": createdAt.toIso8601String()
      };
}
