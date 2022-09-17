import 'dart:convert';

List<Subject> subjectFromJson(String str) => List<Subject>.from(
    json.decode(str).map((x) => Subject.fromJson(x)));


class Subject {
  String? subject;

  Subject({this.subject});

  Subject.fromJson(Map<String, dynamic> json) {
    subject = json['subject'];
  }
}
