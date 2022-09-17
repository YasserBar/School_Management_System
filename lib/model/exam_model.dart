import 'dart:convert';

List<Exam> examFromJson(String str) => List<Exam>.from(
    json.decode(str).map((x) => Exam.fromJson(x)));


class Exam {
  String? exam;

  Exam({this.exam});

  Exam.fromJson(Map<String, dynamic> json) {
    exam = json['type'];
  }
}
