import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tr_app/model/class_model.dart';
import 'package:tr_app/data/network_api_service.dart';
import 'package:tr_app/utils/utils.dart';

class ClassController extends GetxController {
  var isloding = true.obs;
  var classlist = <ModelClass>[].obs;
  String endpoint;
  late BuildContext context;

  ClassController(this.endpoint);

  @override
  void onInit() {
    getclasses();
    super.onInit();
  }

  getclasses() async {
    NetworkApiService response = NetworkApiService();
    isloding(true);
    try {
      var body = await response.getdata(endpoint);
      var se = body["data"];
      var bd = jsonEncode(se);
      classlist.value = modelClassFromJson(bd);
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
