import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tr_app/model/mark_model.dart';
import 'package:tr_app/data/network_api_service.dart';
import 'package:tr_app/res/api_url.dart';
import 'package:tr_app/utils/utils.dart';

class MarkController extends GetxController {
  var marklist = <ModelMark>[].obs;
  var chick = false.obs;
  late BuildContext context;
  
  @override
  void onInit() {
    get();
    super.onInit();
  }

  get() async {
    NetworkApiService request = NetworkApiService();
    chick.value = true;
    try{
    var body = await request.getdata(EndPointStudent.getMarks);
    var data = body['data'];
    var marks = jsonEncode(data);
    marklist.value = modelMarkFromJson(marks);
    } catch(e){
      Utils.flushBarErrorMessage(e.toString(), context);
      if(kDebugMode){
        print(e.toString());
      }
    } finally {
      chick(false);
    }
  }

}
