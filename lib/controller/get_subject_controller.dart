import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:tr_app/model/subject_model.dart';
import 'package:tr_app/data/network_api_service.dart';
import 'package:tr_app/res/api_url.dart';
import 'package:tr_app/utils/utils.dart';

class SubController extends GetxController {
  var isloading = true.obs;
  var subjects = <Subject>[].obs;
  var classid = Get.arguments;
  late BuildContext context;

  void addSubject(String newSubject) {
    subjects.add(Subject(subject: newSubject));
  }

   @override
  void onInit() {
    getsubject();
    super.onInit();
  }

  getsubject() async {
    NetworkApiService response = NetworkApiService();

    try {
      isloading(true);
      var body = await response.getdata(EndPointMaster.getSubjects);
      var se = body["data"];
      var bd = jsonEncode(se);
      subjects.value = subjectFromJson(bd);
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
