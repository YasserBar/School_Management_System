import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tr_app/controller/get_teacher_controller.dart';
import 'package:tr_app/view/Master/drower_master.dart';
import 'package:tr_app/res/color.dart';
import 'package:tr_app/utils/utils.dart';
import 'package:tr_app/view/Master/teacher/teacher_tile.dart';

class TeachersList extends StatelessWidget {
  final ValueNotifier<TextDirection> _textDir =
      ValueNotifier(TextDirection.ltr);

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  var teachercontroller = Get.put(TeachersController());
  @override
  Widget build(BuildContext context) {
    teachercontroller.context = context;
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Teachers",
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
      drawer: MyDrowerMaster(
        initi: 1,
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
                      teachercontroller.index.value = input.length;
                      teachercontroller.getteachers();
                      if (input.trim().length < 2) {
                        final dir = Utils.getDirection(input);
                        if (dir != value) _textDir.value = dir;
                      }
                    },
                    autofocus: true,
                    textAlign: TextAlign.start,
                    controller: teachercontroller.textcontroller,
                    style: const TextStyle(fontSize: 20),
                    keyboardType: TextInputType.name,
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
            if (teachercontroller.isloding.value) {
              return const Center(
                  child: CircularProgressIndicator(
                color: primaryColorS,
              ));
            }
            return Expanded(
              child: ListView.separated(
                  shrinkWrap: true,
                  itemBuilder: (context, i) {
                    if (teachercontroller.index.value != 0) {
                      return Teacher_tile(teachercontroller.teacherlist[i]);
                    }
                    return Container();
                  },
                  separatorBuilder: (context, i) {
                    if (teachercontroller.index.value != 0) {
                      return const Divider(
                        color: primaryColorS,
                      );
                    }
                    return Container();
                  },
                  itemCount: teachercontroller.teacherlist.length),
            );
          }),
        ],
      ),
    );
  }
}
