import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tr_app/view/Master/drower_master.dart';
import 'package:tr_app/view/Master/subject/add_subject.dart';
import 'package:tr_app/controller/get_subject_controller.dart';
import 'package:tr_app/view/Master/Exams.dart';
import 'package:tr_app/res/color.dart';

class SubjectScreen extends StatefulWidget {
  @override
  State<SubjectScreen> createState() => _SubjectScreenState();
}

class _SubjectScreenState extends State<SubjectScreen> {
  var controller = Get.put(SubController());
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  
  @override
  void initState() {
    super.initState();
    SubController();
  }

  @override
  Widget build(BuildContext context) {
    controller.context = context;
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showModalBottomSheet(
              isScrollControlled: true,
              context: context,
              builder: (context) => SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).viewInsets.bottom),
                  child: AddSubjectScreen((newSubjectTitle) {}),
                ),
              ),
            );
          },
          backgroundColor: primaryColorS,
          child: const Icon(Icons.add),
        ),
        key: _scaffoldKey,
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            "subject",
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
          initi: 4,
          onMenueTap: (page) {
            Get.off;
          },
        ),
        body: Obx(() {
          if (controller.isloading.value) {
            return const Center(
                child: CircularProgressIndicator(
              color: primaryColorS,
            ));
          }
          return Container(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 50),
            child: ListView.builder(
              itemBuilder: (context, i) {
                return Container(
                  height: 80,
                  width: size.width,
                  padding: const EdgeInsets.all(10),
                  child: TextButton(
                      onPressed: () {
                        Get.to(() => TypeExam(), arguments: [
                          controller.classid.toString(),
                          controller.subjects[i].subject.toString()
                        ]);
                      },
                      style: TextButton.styleFrom(
                        side: const BorderSide(color: primaryColorS, width: 2.0),
                        primary: primaryColorS,
                        backgroundColor: primarylightColorS,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          FittedBox(
                            child: Text(
                              controller.subjects[i].subject!,
                              style: const TextStyle(
                                  fontSize: 20,
                                  color: Colors.black87,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      )),
                );
              },
              itemCount: controller.subjects.length,
            ),
          );
        }));
  }
}
