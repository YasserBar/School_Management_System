import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tr_app/data/network_api_service.dart';
import 'package:tr_app/utils/utils.dart';

class NoteController extends GetxController {
  TextEditingController textnotcontroller = TextEditingController();
  var isloading = false.obs;
  final GlobalKey<FormState> notekey = GlobalKey<FormState>();
  String endpoint;

  NoteController(this.endpoint);

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

  send(id,BuildContext context) async {
    NetworkApiService request = NetworkApiService();
    isloading.value = true;
    var data = {"note": textnotcontroller.text, "student_id": id};
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
