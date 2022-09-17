import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/state_manager.dart';
import 'package:tr_app/data/network_api_service.dart';
import 'package:tr_app/model/student_model.dart';
import 'package:tr_app/res/api_url.dart';
import 'package:tr_app/utils/utils.dart';

class ValuationController extends GetxController {
  var isloading = true.obs;
  var valuationlist = <StudentModel>[].obs;
  var valuationcontroller = <TextEditingController>[];
  final GlobalKey<FormState> valuationkey = GlobalKey<FormState>();
  String classid = Get.arguments[0];
  String lecture = Get.arguments[1];
  var chick = false.obs;
  var wrong = false.obs;
  late BuildContext context;


  String? validateMark(String value) {
    if (value.isEmpty) {
      return "         ___________";
    }
    return null;
  }

  Future<String> getMySubject() async {
    NetworkApiService response = NetworkApiService();
    try {
      var body = await response.getdata(EndPointTeacher.getMySubject);
      String se = body["data"];
      return se;
    } catch (e) {
      rethrow;
    }
  }

  send() async {
    NetworkApiService request = NetworkApiService();
    Map<String, Object> data;
    try{
      for (var i = 0; i < valuationlist.length; i++) {
        if (valuationcontroller[i].text.isNotEmpty) {
          data = {
            "subject": await getMySubject(),
            "lecture": lecture,
            "student_id": valuationlist[i].id.toString(),
            "description": valuationcontroller[i].text
          };
          var datajson = jsonEncode(data);
          await request.postdata(datajson, EndPointTeacher.setValuation);
          chick.value = true;
        }
      }
    } catch(e){
      Utils.flushBarErrorMessage(e.toString(), context);
      if(kDebugMode){
        print(e.toString());
      }
    }
    wrong.value = false;
    if (chick.value) {
      Utils.flushBarSuccessfulMessage('Done add valuations seccessfully\n$lecture', context);
    }else if(!chick.value){
      Utils.flushBarErrorMessage('Please enter at least one mark', context);
      wrong.value = true;
    }
    
    chick.value = false;
  }

  @override
  void onInit() {
    getstudents();
    super.onInit();
  }

  getstudents() async {
    NetworkApiService response = NetworkApiService();
    String ide = classid;
    Class_id id = Class_id(classroomid: ide);
    var dataa = classidToJson(id);
    try {
      isloading(true);
      var body = await response.postdata(dataa, EndPointTeacher.getClassById);
      var se = body["data"];
      var re = se["student"]!;
      var bd = jsonEncode(re);
      valuationlist.value = listStudentModelFromJson(bd);
      for (var i = 0; i < valuationlist.length; i++) {
        valuationcontroller.insert(i, TextEditingController());
      }
    } catch(e){
      Utils.flushBarErrorMessage(e.toString(), context);
      if(kDebugMode){
        print(e.toString());
      }
    } finally {
      isloading(false);
    }
  }
}













// if (chick.value) {
//       Get.snackbar("Valuations", "Done add valuations seccessfully",
//           backgroundColor: Colors.white,
//           duration: const Duration(seconds: 5),
//           snackStyle: SnackStyle.FLOATING,
//           barBlur: 30,
//           dismissDirection: DismissDirection.horizontal,
//           messageText: const Text(
//             "Done add valuations seccessfully",
//             style: TextStyle(
//               color: primaryColorS,
//               fontSize: 20,
//             ),
//           ),
//           padding: const EdgeInsets.only(left: 30, right: 10),
//           icon: const Icon(
//             Icons.check_circle,
//             size: 25,
//             color: Color.fromARGB(255, 21, 160, 26),
//           ),
//           titleText: Text(
//             lecture,
//             style: const TextStyle(
//               color: primaryColorS,
//               fontSize: 25,
//             ),
//           ));
//     } else if (!chick.value) {
//       Get.snackbar("Error", "Please enter at least one mark",
//           duration: const Duration(seconds: 4),
//           barBlur: 30,
//           colorText: Colors.red,
//           titleText: const Text(
//             "invalid submit",
//             style: TextStyle(color: Colors.black, fontSize: 20),
//           ));
//     }