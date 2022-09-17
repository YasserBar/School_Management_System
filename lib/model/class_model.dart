import 'dart:convert';

List<ModelClass> modelClassFromJson(String str) =>
    List<ModelClass>.from(json.decode(str).map((x) => ModelClass.fromJson(x)));

String modelClassToJson(List<ModelClass> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ModelClass {
  ModelClass({
    required this.id,
    required this.roomName,
    required this.date,
    required this.image,
    required this.level,
    required this.masterId,
  });

  int id;
  String roomName;
  String date;
  dynamic image;
  String level;
  int masterId;

  factory ModelClass.fromJson(Map<String, dynamic> json) => ModelClass(
      id: json["id"],
      roomName: json["room_name"],
      date: json["date"],
      image: json["image"],
      level: json["level"],
      masterId: json["master_id"]);

  Map<String, dynamic> toJson() => {
        "id": id,
        "room_name": roomName,
        "date": date,
        "image": image,
        "level": level,
        "master_id": masterId,
      };
}
