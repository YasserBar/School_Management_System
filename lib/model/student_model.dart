import 'dart:convert';


String classidToJson(Class_id data) => json.encode(data.toJson());

class Class_id {
  Class_id({
    required this.classroomid,
  });

  String classroomid;

  Map<String, dynamic> toJson() => {"classroom_id": classroomid};
}
///////////////
///
List<StudentModel> listStudentModelFromJson(String str) =>
  List<StudentModel>.from(json.decode(str).map((x) => StudentModel.fromJson(x)));

String listStudentModelToJson(List<StudentModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));
///////////////
///
StudentModel studentModelFromJson(String str) => StudentModel.fromJson(json.decode(str));

String studentModelToJson(StudentModel data) => json.encode(data.toJson());
///////////////
///
class StudentModel {
  StudentModel({
    required this.id,
    required this.fName,
    required this.mName,
    required this.lName,
    required this.fullName,
    required this.motherName,
    required this.image,
    required this.addressId,
    required this.birthday,
    required this.phone,
    required this.email,
    required this.parentPhone,
    required this.classRoomId,
    required this.address,
  });

  int id;
  String fName;
  String mName;
  String lName;
  String fullName;
  String motherName;
  dynamic image;
  int addressId;
  String birthday;
  String phone;
  dynamic email;
  String parentPhone;
  int classRoomId;
  Address address;

  factory StudentModel.fromJson(Map<String, dynamic> json) => StudentModel(
      id: json["id"],
      fName: json["f_name"],
      mName: json["m_name"],
      lName: json["l_name"],
      fullName: json["full_name"],
      motherName: json["mother_name"],
      image: json["image"],
      addressId: json["address_id"],
      birthday: json["birthday"],
      phone: json["phone"],
      email: json["email"],
      parentPhone: json["parent_phone"],
      classRoomId: json["class_room_id"],
      address : json["address"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "f_name": fName,
        "m_name": mName,
        "l_name": lName,
        "full_name": fullName,
        "mother_name": motherName,
        "image": image,
        "address_id": addressId,
        "birthday": birthday,
        "phone": phone,
        "email": email,
        "parent_phone": parentPhone,
        "class_room_id": classRoomId
      };
}
class Address {
  int id;
  String city;
  String region;
  String street;
  String bulidNum;
  String createdAt;
  String updatedAt;

  Address({
    required this.id,
    required this.city,
    required this.region,
    required this.street,
    required this.bulidNum,
    required this.createdAt,
    required this.updatedAt,
  });

  fromJson(Map<String, dynamic> json) {
    id = json['id'];
    city = json['city'];
    region = json['region'];
    street = json['street'];
    bulidNum = json['bulid_num'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['city'] = city;
    data['region'] = region;
    data['street'] = street;
    data['bulid_num'] = bulidNum;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}