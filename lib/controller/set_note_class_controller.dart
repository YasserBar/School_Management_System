import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:tr_app/data/network_api_service.dart';
import 'package:tr_app/utils/utils.dart';

class ClassNoteController extends GetxController {
  String level = Get.arguments[1];
  String name = Get.arguments[2];
  String id = Get.arguments[0];

  TextEditingController textcontroller = TextEditingController();
  var isloading = false.obs;
  final GlobalKey<FormState> notekey = GlobalKey<FormState>();
  String endpoint;
  ClassNoteController(this.endpoint);

  String? validateNote(String value) {
    if (value.isEmpty) {
      return "______________________________________________";
    }
    return null;
  }

  bool chickNote() {
    final isvalid = notekey.currentState!.validate();
    if (!isvalid) {
      return false;
    }
    return true;
  }

  send(BuildContext context) async {
    NetworkApiService request = NetworkApiService();
    isloading.value = true;
    var data = {"note": textcontroller.text, "class_room_id": id};
    var datajson = jsonEncode(data);
    try{
      await request.postdata(datajson, endpoint);
    }catch(e){
      Utils.flushBarErrorMessage(e.toString(), context);
      if(kDebugMode){
        print(e.toString());
      }
    } finally{
      isloading.value = false;
    }
  }
}



