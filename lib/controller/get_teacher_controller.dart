import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:tr_app/data/network_api_service.dart';
import 'package:tr_app/model/teacher_model.dart';
import 'package:tr_app/res/api_url.dart';
import 'package:tr_app/utils/utils.dart';

class TeachersController extends GetxController {
  var isloding = false.obs;
  var teacherlist = <EmployeeModel>[].obs;
  RxInt index = 0.obs;
  TextEditingController textcontroller = TextEditingController();
  late BuildContext context;


  @override
  void onInit() {
    getteachers();
    super.onInit();
  }

  getteachers() async {
    NetworkApiService response = NetworkApiService();
    if (index.value != 0) {
      var data = {"full_name": textcontroller.text};
      var datajson = jsonEncode(data);
      try {
        isloding(true);
        var body = await response.postdata(datajson, EndPointMaster.getTeacherByname);
        var se = body["data"];
        var bd = jsonEncode(se);
        teacherlist.value = listEmployeeModelFromJson(bd);
      } catch(e){
        Utils.flushBarErrorMessage(e.toString(), context);
        if(kDebugMode){
          print(e.toString());
        }
      } finally {
        isloding(false);
      }
    }
  }
}
