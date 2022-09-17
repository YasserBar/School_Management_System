import 'dart:convert';

ModelStudentProfile modelStudentProfileFromJson(String str) =>
    ModelStudentProfile.fromJson(json.decode(str));

String modelStudentProfileToJson(ModelStudentProfile data) =>
    json.encode(data.toJson());

class ModelStudentProfile {
  ModelStudentProfile({
    required this.fullName,
    required this.motherName,
    required this.image,
    required this.addressId,
    required this.birthday,
    required this.phone,
    required this.email,
    required this.parentPhone,
    required this.classRoomId,
    required this.city,
    required this.region,
    required this.street,
    required this.bulidNum,
    required this.roomName,
    required this.level,
  });

  String fullName;
  String motherName;
  dynamic image;
  int addressId;
  String birthday;
  String phone;
  String email;
  String parentPhone;
  int classRoomId;
  String city;
  String region;
  String street;
  String bulidNum;
  String roomName;
  String level;

  factory ModelStudentProfile.fromJson(Map<String, dynamic> json) =>
      ModelStudentProfile(
        fullName: json["full_name"],
        motherName: json["mother_name"],
        image: json["image"],
        addressId: json["address_id"],
        birthday: json["birthday"],
        phone: json["phone"],
        email: json["email"],
        parentPhone: json["parent_phone"],
        classRoomId: json["class_room_id"],
        city: json["city"],
        region: json["region"],
        street: json["street"],
        bulidNum: json["bulid_num"],
        roomName: json["room_name"],
        level: json["level"],
      );

  Map<String, dynamic> toJson() => {
        "full_name": fullName,
        "mother_name": motherName,
        "image": image,
        "address_id": addressId,
        "birthday": birthday,
        "phone": phone,
        "email": email,
        "parent_phone": parentPhone,
        "class_room_id": classRoomId,
        "city": city,
        "region": region,
        "street": street,
        "bulid_num": bulidNum,
        "room_name": roomName,
        "level": level,
      };
}
