import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/state_manager.dart';
import 'package:tr_app/model/student_model.dart';
import 'package:tr_app/data/network_api_service.dart';
import 'package:tr_app/res/api_url.dart';
import 'package:tr_app/utils/utils.dart';

class MarkController extends GetxController {
  var isloding = true.obs;
  var check = false.obs;
  var studentlist = <StudentModel>[].obs;
  var markcontroller = <TextEditingController>[];
  final GlobalKey<FormState> markkey = GlobalKey<FormState>();
  String classid = Get.arguments[0];
  String subject = Get.arguments[1];
  String typeexam = Get.arguments[2];
  late BuildContext context;

  String? validateMark(String value) {
    if (value.isEmpty) {
      return "         ___________";
    }
    return null;
  }

  send() async {
    check.value = true;
    NetworkApiService request = NetworkApiService();
    for (var i = 0; i < studentlist.length; i++) {
      var data = {
        "subject": subject,
        "type": typeexam,
        "student_id": studentlist[i].id,
        "mark": markcontroller[i].text
      };
      var datajson = jsonEncode(data);
      try{
        await request.postdata(datajson, EndPointMaster.setMarkForClass);
      }catch(e){
        Utils.flushBarErrorMessage(e.toString(), context);
        if(kDebugMode){
        print(e.toString());
        }
      }finally{
        check.value = false;
      }
    }
  }

  bool chickMark() {
    final isvalid = markkey.currentState!.validate();
    if (!isvalid) {
      return false;
    }
    return true;
  }

  @override
  void onInit() {
    getstudents();
    super.onInit();
  }

  getstudents() async {
    NetworkApiService response = NetworkApiService();
    String ide = Get.arguments[0];
    Class_id id = Class_id(classroomid: ide);
    var dataa = classidToJson(id);
    try {
      var body = await response.postdata(dataa, EndPointMaster.getClassById);
      var se = body["data"];
      var re = se["student"]!;
      var bd = jsonEncode(re);
      studentlist.value = listStudentModelFromJson(bd);
      for (var i = 0; i < studentlist.length; i++) {
        markcontroller.insert(i, TextEditingController());
      }
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
