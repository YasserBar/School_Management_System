import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tr_app/controller/get_class_controller.dart';
import 'package:tr_app/res/api_url.dart';
import 'package:tr_app/res/color.dart';
import 'package:tr_app/view/Master/class/class_tile.dart';
import 'package:tr_app/view/Master/drower_master.dart';

class ClassScreen extends StatefulWidget {
  String type;
  ClassScreen(this.type);

  @override
  State<ClassScreen> createState() => _ClassScreenState();
}

class _ClassScreenState extends State<ClassScreen> {

  var classController = Get.put(ClassController(EndPointMaster.getMyClasses));
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    classController.context = context;
    return Scaffold(
        key: _scaffoldKey,
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Classes",
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
        initi: Get.arguments,
        onMenueTap: (page) {
          Get.off;
        },
      ),
        body: Obx(() {
          if (classController.isloding.value) {
            return const Center(
                child: CircularProgressIndicator(
              color: primaryColorS,
            ));
          }
          return ListView.builder(
              itemBuilder: (context, i) {
                return Claatile(classController.classlist[i], widget.type);
              },
              itemCount: classController.classlist.length);
        }));
  }
}
class ClassScreenFile extends StatefulWidget {
  const ClassScreenFile({Key? key}) : super(key: key);

  @override
  State<ClassScreenFile> createState() => _ClassScreenFileState();
}

class _ClassScreenFileState extends State<ClassScreenFile> {
  @override
  Widget build(BuildContext context) {
    return ClassScreen('file');
  }
}    


class ClassScreenTimeTable extends StatefulWidget {
  const ClassScreenTimeTable({Key? key}) : super(key: key);

  @override
  State<ClassScreenTimeTable> createState() => _ClassScreenTimeTableState();
}

class _ClassScreenTimeTableState extends State<ClassScreenTimeTable> {
  @override
  Widget build(BuildContext context) {
    return ClassScreen('timetable');
  }
}   

class ClassScreenMark extends StatefulWidget {
  const ClassScreenMark({Key? key}) : super(key: key);

  @override
  State<ClassScreenMark> createState() => _ClassScreenMarkState();
}

class _ClassScreenMarkState extends State<ClassScreenMark> {
  @override
  Widget build(BuildContext context) {
    return ClassScreen("mark");
  }
}   

