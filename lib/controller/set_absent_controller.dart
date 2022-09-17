import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:tr_app/data/network_api_service.dart';
import 'package:tr_app/utils/utils.dart';

class SetAbsentController extends GetxController {
  var isloading = false.obs;
  var val = "Absent".obs;
  var iteam = ["Late", "Absent"];
  String key;
  String endpoint;
  SetAbsentController(this.key, this.endpoint);

  send(id, BuildContext context) async {
    NetworkApiService request = NetworkApiService();
    isloading.value = true;
    var data = {"type": val.value, key: id};
    var datajson = jsonEncode(data);
    try{
      await request.postdata(datajson, endpoint);
    }catch(e){
      Utils.flushBarErrorMessage(e.toString(), context);
      if(kDebugMode){
        print(e.toString());
      }
    }finally{
      isloading.value = false;
    }
  }
}
