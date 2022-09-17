import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tr_app/main.dart';
import 'package:tr_app/model/login_model.dart';
import 'package:tr_app/utils/utils.dart';
import 'package:tr_app/view/Master/home_master.dart';
import 'package:tr_app/view/Student/home_student.dart';
import 'package:tr_app/data/network_api_service.dart';
import 'package:tr_app/view/Teacher/home_teacher.dart';
import 'package:tr_app/view/guest/welcome_screen.dart';

class LoginController extends GetxController {
  TextEditingController fullnamecontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  final GlobalKey<FormState> loginkey = GlobalKey<FormState>();
  RxBool image = false.obs;
  String endpointlogin;
  String endpointlogout;
  RxBool isloading = false.obs;

  LoginController(this.endpointlogin, this.endpointlogout);

  String? validateFullname(String value) {
    if (value.isEmpty) {
      return "the full name is requierd";
    }
    return null;
  }

  String? validatepassword(String value) {
    if (value.isEmpty) {
      return "the password is requierd";
    }
    if (value.length < 8) {
      return "password must be of 8 char";
    }
    return null;
  }

  bool chicklog() {
    final isvalid = loginkey.currentState!.validate();
    if (!isvalid) {
      return false;
    }
    return true;
  }

  void logout(BuildContext context) async {
    isloading.value = true;
    NetworkApiService request = NetworkApiService();
    try{
      await request.getdata(endpointlogout);
      await prefs!.clear();
      Get.offAllNamed('/');
    }catch(e){
      Utils.flushBarErrorMessage(e.toString(), context);
     if(e.toString().contains('Unauthorised request')){
      await const Duration(seconds: 5);
      Get.off(WelcomeScreen());
     }
      if(kDebugMode){
        print(e.toString());
      }
    }finally{
      isloading.value = false;
    }
  }

  void login(BuildContext context) async {
    isloading.value = true;
    ModelLogin loginmodel = ModelLogin(
        fullName: fullnamecontroller.text, password: passwordcontroller.text);
    NetworkApiService request = NetworkApiService();
    try{
      var response = await request.postlogindata(
          modelLoginToJson(loginmodel), endpointlogin);
        var data = response["data"];
        prefs!.setString('token', response["message"].toString());
        image.value = (data["image"] != null ? true : false);
        if(data.containsKey("job_type") ?? false){
          bool isteacher = data["job_type"].toString() == "teacher" ? true : false;
          prefs!.setInt('type', isteacher ? 2 : 3);
          isteacher ? Get.offAll(() => const HomeTeacher()): Get.offAll(() => const HomeMaster());
        }else{
          prefs!.setInt('type', 1);
          Get.offAll(() => const HomeStudent());
        }
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
