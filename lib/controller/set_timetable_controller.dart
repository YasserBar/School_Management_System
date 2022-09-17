import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:tr_app/data/network_api_service.dart';
import 'package:tr_app/res/api_url.dart';
import 'package:tr_app/utils/utils.dart';

class TimeTableController extends GetxController {
  FilePickerResult? result;
  PlatformFile? file;
  NetworkApiService request = NetworkApiService();
  String classid = Get.arguments[0];
  String level = Get.arguments[1];
  String classname = Get.arguments[2];
  var chick = false.obs;

  send(BuildContext context) async {
    chick.value = true;
    try{
      await request.uploadtimetable(
        EndPointMaster.addImageProgramClass, file!.path.toString(), classid);
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
