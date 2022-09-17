import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:tr_app/model/exam_model.dart';
import 'package:tr_app/data/network_api_service.dart';
import 'package:tr_app/res/api_url.dart';
import 'package:tr_app/utils/utils.dart';

class TypeController extends GetxController {
  var isloading = true.obs;
  var exams = <Exam>[].obs;
  var classid = Get.arguments[0];
  var subject = Get.arguments[1];
  late BuildContext context;

  void addExam(String newExam) {
    exams.add(Exam(exam: newExam));
  }

   @override
  void onInit() {
    getexam();
    super.onInit();
  }

  getexam() async {
    NetworkApiService response = NetworkApiService();

    try {
      isloading(true);
      var body = await response.getdata(EndPointMaster.getExams);
      var se = body["data"];
      var bd = jsonEncode(se);
      exams.value = examFromJson(bd);
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
