import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tr_app/model/affiliation_employee_model.dart';
import 'package:tr_app/data/network_api_service.dart';
import 'package:tr_app/res/api_url.dart';
import 'package:tr_app/utils/utils.dart';

class AffilationEmployeeController extends GetxController {
  var isloading = false.obs;
  final GlobalKey<FormState> affikey = GlobalKey<FormState>();
  TextEditingController namecolntroller = TextEditingController();
  TextEditingController phonecolntroller = TextEditingController();
  TextEditingController namedegreecontroller = TextEditingController();
  TextEditingController targetjobcontroller = TextEditingController();
  TextEditingController targetsubjectcontroller = TextEditingController();

  send(BuildContext context) async {
    isloading.value = true;
    AffiliationEmployeeModel model = AffiliationEmployeeModel(
        name: namecolntroller.text,
        phone: phonecolntroller.text,
        nameDegree: namedegreecontroller.text,
        targetJob: targetjobcontroller.text,
        subjectTarget: targetsubjectcontroller.text);
    NetworkApiService request = NetworkApiService();
  try{
      await request.postlogindata(
        affiliationEmployeeModelToJson(model), EndPointGuest.affiliationEmployee);
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

  String? validatenamedegre(String value) {
    if (value.isEmpty) {
      return "the name degre is requierd";
    }
    return null;
  }

  String? validatetargetjob(String value) {
    if (value.isEmpty) {
      return "the target job is requierd";
    }
    return null;
  }

  String? validatetargetsubject(String value) {
    if (value.isEmpty) {
      return "the target subject is requierd";
    }
    return null;
  }
}
