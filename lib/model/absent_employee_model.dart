
import 'dart:convert';

List<ModelAbsent> modelAbsentFromJson(String str) => List<ModelAbsent>.from(
    json.decode(str).map((x) => ModelAbsent.fromJson(x)));

class ModelAbsent {
  ModelAbsent({
    required this.id,
    required this.type,
    required this.employeeId,
    required this.createdAt,
    required this.updatedAt
  });

  int id;
  String type;
  int employeeId;
  String createdAt;
  String updatedAt;


  factory ModelAbsent.fromJson(Map<String, dynamic> json) => ModelAbsent(
    id: json["id"],
    type: json["type"],
    employeeId: json["employee_id"],
    createdAt: json["created_at"],
    updatedAt: json["updated_at"],
  );
}
