import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:tr_app/main.dart';

class Authmidleware extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    if (prefs!.getString('token') != null) {
      if(prefs!.getInt('type') == 1){
        return const RouteSettings(name:'/homeStudent');
      }else if(prefs!.getInt('type') == 2){
        return const RouteSettings(name:'/homeTeacher');
      }else if(prefs!.getInt('type') == 3){
        return const RouteSettings(name: '/homeMaster');
      }
    }
    return null;
  }
}
