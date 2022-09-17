import 'dart:convert';

List<ModelNote> modelNoteFromJson(String str) =>
    List<ModelNote>.from(json.decode(str).map((x) => ModelNote.fromJson(x)));

String modelNoteToJson(List<ModelNote> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ModelNote {
  ModelNote({
    required this.id,
    required this.note,
    required this.employeeId,
    required this.createdAt,
  });

  int id;
  String note;
  int employeeId;
  DateTime createdAt;

  factory ModelNote.fromJson(Map<String, dynamic> json) => ModelNote(
        id: json["id"],
        note: json["note"],
        employeeId: json["employee_id"],
        createdAt: DateTime.parse(json["created_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "note": note,
        "employee_id": employeeId,
        "created_at": createdAt.toIso8601String(),
      };
}
