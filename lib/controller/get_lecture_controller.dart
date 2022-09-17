import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tr_app/model/lecture_modle.dart';
import 'package:tr_app/data/network_api_service.dart';
import 'package:tr_app/res/api_url.dart';
import 'package:tr_app/utils/utils.dart';


class LectureController extends GetxController {
  var lectures = <Lecture>[].obs;
  var isloding = true.obs;
  var classid = Get.arguments;
  late BuildContext context;

  void addLecture(String newLecture) {
    lectures.add(Lecture(lecture: newLecture));
  }

  @override
  void onInit() {
    getlectures();
    super.onInit();
  }

  getlectures() async {
    NetworkApiService response = NetworkApiService();

    try {
      isloding(true);
      var body = await response.getdata(EndPointTeacher.getLectures);
      var se = body["data"];
      var bd = jsonEncode(se);
      lectures.value = lectureFromJson(bd);
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

