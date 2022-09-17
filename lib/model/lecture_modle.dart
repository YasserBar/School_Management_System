import 'dart:convert';

List<Lecture> lectureFromJson(String str) => List<Lecture>.from(
    json.decode(str).map((x) => Lecture.fromJson(x)));


class Lecture {
  String? lecture;

  Lecture({this.lecture});

  Lecture.fromJson(Map<String, dynamic> json) {
    lecture = json['lecture'];
  }
}
