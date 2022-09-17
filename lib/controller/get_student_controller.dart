import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:tr_app/model/student_model.dart';
import 'package:tr_app/data/network_api_service.dart';
import 'package:tr_app/utils/utils.dart';

class StudentsnController extends GetxController {
  var isloading = false.obs;
  var studentlist = <StudentModel>[].obs;
  RxInt index = 0.obs;
  TextEditingController textcontroller = TextEditingController();
  String endpoint;
  late BuildContext context;

  StudentsnController(this.endpoint);

  @override
  void onInit() {
    getstudents();
    super.onInit();
  }

  getstudents() async {
    NetworkApiService response = NetworkApiService();
    if (index.value != 0) {
      var data = {"full_name": textcontroller.text};
      var datajson = jsonEncode(data);
      try {
        isloading(true);
        var body = await response.postdata(datajson, endpoint);
        var se = body["data"];
        var bd = jsonEncode(se);
        studentlist.value = listStudentModelFromJson(bd);
      }catch(e){
        Utils.flushBarErrorMessage(e.toString(), context);
        if(kDebugMode){
          print(e.toString());
        }
      } finally {
        isloading(false);
      }
    }
  }
}
