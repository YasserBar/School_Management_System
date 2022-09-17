import 'dart:convert';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tr_app/data/network_api_service.dart';
import 'package:tr_app/res/api_url.dart';

import '../model/profile_model.dart';
import '../utils/utils.dart';

class ProfileSController extends GetxController {
  FilePickerResult? result;
  var isloading = true.obs;
  PlatformFile? file;
  var info = {};
  var model;
  var chickimage = false.obs;
  late BuildContext context;

  @override
  void onInit() {
    get_profil();
    super.onInit();
  }

  sendimage() async {
    NetworkApiService request = NetworkApiService();

    try{
    await request.uploadimageprofile(
        EndPointStudent.setImageProfile, file!.path.toString());
    print("uploaded");
    }catch(e){
      Utils.flushBarErrorMessage(e.toString(), context);
      if(kDebugMode){
        print(e.toString());
      }
    }
  }

  get_profil() async {
    NetworkApiService request = NetworkApiService();

    try{
    isloading(true);
    var response = await request.getdata(EndPointStudent.profile);
    var data = response["data"];
    var ge = jsonEncode(data);
    model = modelStudentProfileFromJson(ge);
    if (model.image != null) {
      chickimage.value = true;
    }
    }catch(e){
      Utils.flushBarErrorMessage(e.toString(), context);
      if(kDebugMode){
        print(e.toString());
      }
    }finally{
      isloading(false);
    }
  }
}
