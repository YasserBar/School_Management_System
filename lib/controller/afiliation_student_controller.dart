import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tr_app/model/affiliation_student_model.dart';
import 'package:tr_app/data/network_api_service.dart';
import 'package:tr_app/res/api_url.dart';
import 'package:tr_app/utils/utils.dart';

class AffilationStudentController extends GetxController {
  var isloading = false.obs;
  final GlobalKey<FormState> affikey = GlobalKey<FormState>();
  TextEditingController namecolntroller = TextEditingController();
  TextEditingController phonecolntroller = TextEditingController();
  TextEditingController lastlevelcontroller = TextEditingController();
  TextEditingController lastleveldegreecontroller = TextEditingController();
  TextEditingController targetlevelctcontroller = TextEditingController();

  send(BuildContext context) async {
    isloading.value = true;
    AffiliationStudentModel model = AffiliationStudentModel(
        name: namecolntroller.text,
        phone: phonecolntroller.text,
        lastLevel: lastlevelcontroller.text,
        lastLevelDegree: lastleveldegreecontroller.text,
        targetLevel: targetlevelctcontroller.text);
    NetworkApiService request = NetworkApiService();
    try{
      await request.postlogindata(
        affiliationStudentModelToJson(model), EndPointGuest.affiliationStudent);
    
      Get.offAllNamed('/');
    }catch(e){
      Utils.flushBarErrorMessage(e.toString(), context);
      if(kDebugMode){
        print(e.toString());
      }
    }finally{
    isloading.value = false;
    }
  }

  bool chickAffiliation() {
    final isvalid = affikey.currentState!.validate();
    if (!isvalid) {
      return false;
    }
    return true;
  }

  String? validatename(String value) {
    if (value.isEmpty) {
      return "the name is requierd";
    }
    return null;
  }

  String? validatephone(String value) {
    if (value.isEmpty) {
      return "the phone is requierd";
    }
    return null;
  }

  String? validatelastlevel(String value) {
    if (value.isEmpty) {
      return "the last level is requierd";
    }
    return null;
  }

  String? validatelastleveldegree(String value) {
    if (value.isEmpty) {
      return "the last level degre is requierd";
    }
    return null;
  }

  String? validatetargetlevel(String value) {
    if (value.isEmpty) {
      return "the target level is requierd";
    }
    return null;
  }
}
