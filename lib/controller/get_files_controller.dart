import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tr_app/model/file_model.dart';
import 'package:tr_app/data/network_api_service.dart';
import 'package:tr_app/res/api_url.dart';
import 'package:tr_app/utils/utils.dart';

class FileController extends GetxController {
  var filelist = <ModelFile>[].obs;
  var chick = false.obs;
  late BuildContext context;

  send() async {
    NetworkApiService request = NetworkApiService();
    chick.value = true;
    try{
      var body = await request.getdata(EndPointStudent.getMyFile);
      var data = body['data'];
      var marks = jsonEncode(data);
      filelist.value = modelFileFromJson(marks);
    } catch(e){
      Utils.flushBarErrorMessage(e.toString(), context);
      if(kDebugMode){
        print(e.toString());
      }
    } finally {
      chick(false);
    }
  }

  @override
  void onInit() {
    send();
    super.onInit();
  }
}
