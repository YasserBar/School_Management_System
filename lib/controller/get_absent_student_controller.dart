import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tr_app/model/absent_student_model.dart';
import 'package:tr_app/data/network_api_service.dart';
import 'package:tr_app/res/api_url.dart';
import 'package:tr_app/utils/utils.dart';

class AbsentController extends GetxController {
  var absentlist = <ModelAbsent>[].obs;
  var isloading = false.obs;
  late BuildContext context;
 
  @override
  void onInit() {
    getAbsents();
    super.onInit();
  }

  getAbsents() async {
    NetworkApiService response = NetworkApiService();
    try {
      isloading(true);
      var body = await response.getdata(EndPointStudent.getAbsenceOrLate);
      var se = body["data"];
      var bd = jsonEncode(se);
      absentlist.value = modelAbsentFromJson(bd) ;
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
