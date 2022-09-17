import 'dart:ffi';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tr_app/data/network_api_service.dart';
import 'package:tr_app/utils/utils.dart';

class Filecontorller extends GetxController {
  FilePickerResult? result;
  List<PlatformFile>? file;
  NetworkApiService request = NetworkApiService();
  String classid = Get.arguments[0];
  String level = Get.arguments[1];
  String classname = Get.arguments[2];
  var chick = false.obs;
  String endpoint;

  Filecontorller(this.endpoint);

  send(BuildContext context) async {
    chick.value = true;
    try{
      for (var item in file!) {
        chick.value = !await request.uploadfile(endpoint,
            item.path.toString(), classid, item.name.toString());
      }
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
