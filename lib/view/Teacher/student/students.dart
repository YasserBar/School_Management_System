import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tr_app/controller/get_student_controller.dart';
import 'package:tr_app/res/api_url.dart';
import 'package:tr_app/view/Teacher/student/student_tile.dart';
import 'package:tr_app/view/Teacher/drower_taecher.dart';
import 'package:tr_app/res/color.dart';

import '../../../utils/utils.dart';

class StudentnsClass extends StatelessWidget {
  final ValueNotifier<TextDirection> _textDir =
      ValueNotifier(TextDirection.ltr);
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  String type;
  StudentnsClass(this.type);
  var studentcontroller = Get.put(StudentsnController(EndPointTeacher.getStudentByname));
  
  @override
  Widget build(BuildContext context) {
    studentcontroller.context = context;
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Students",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: primaryColorS,
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            _scaffoldKey.currentState!.openDrawer();
          },
          icon: const Icon(Icons.menu),
        ),
      ),
      drawer: MyDrowerTeacher(
        initi: 2,
        onMenueTap: (page) {
          Get.off;
        },
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                height: 60,
                width: 300,
                padding: const EdgeInsets.only(left: 5.0, top: 4.0, right: 14.0),
                decoration: BoxDecoration(
                  color: primarylightColorS,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: ValueListenableBuilder<TextDirection>(
                  valueListenable: _textDir,
                  builder: (context, value, child) =>
                  TextFormField(
                    textDirection: value,
                    onChanged: (input) {
                      studentcontroller.index.value = input.length;
                      studentcontroller.getstudents();
                      if (input.trim().length < 2) {
                        final dir = Utils.getDirection(input);
                        if (dir != value) _textDir.value = dir;
                      }
                    },
                    textAlign: TextAlign.start,
                    controller: studentcontroller.textcontroller,
                    style: const TextStyle(fontSize: 20),
                    keyboardType: TextInputType.name,
                    autofocus: true,
                    cursorColor: primaryColorS,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: "Search here...",
                      hintStyle: TextStyle(color: primaryColorS),
                      icon: Icon(
                        Icons.search,
                        size: 50,
                        color: primaryColorS,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          const Divider(
            color: primaryColorS,
            thickness: 1.0,
          ),
          Obx(() {
            if (studentcontroller.isloading.value) {
              return const Center(
                  child: CircularProgressIndicator(
                color: primaryColorS,
              ));
            }
            return Expanded(
              child: ListView.separated(
                  shrinkWrap: true,
                  itemBuilder: (context, i) {
                    if (studentcontroller.index.value != 0) {
                      return Studentn_tile(
                          studentcontroller.studentlist[i], type);
                    }
                    return Container();
                  },
                  separatorBuilder: (context, i) {
                    if (studentcontroller.index.value != 0) {
                      return const Divider(
                        color: primaryColorS,
                      );
                    }
                    return Container();
                  },
                  itemCount: studentcontroller.studentlist.length),
            );
          }),
        ],
      ),
    );
  }
}
