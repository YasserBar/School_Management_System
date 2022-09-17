import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tr_app/view/Master/mark/set_marks.dart';
import 'package:tr_app/view/Master/drower_master.dart';
import 'package:tr_app/controller/get_exams_controller.dart';
import 'package:tr_app/res/color.dart';

class TypeExam extends StatefulWidget {
  @override
  State<TypeExam> createState() => _TypeExamState();
}

class _TypeExamState extends State<TypeExam> {
  TextEditingController newExamTitle = TextEditingController();
  var controller = Get.put(TypeController());
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    TypeController();
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
                  child: Container(
                    padding: const EdgeInsets.all(30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const Text('Exams',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 30,
                              color: primaryColorS,
                              fontWeight: FontWeight.bold,
                            )),
                        TextField(
                          autofocus: true,
                          textAlign: TextAlign.center,
                          controller: newExamTitle,
                        ),
                        const SizedBox(height: 30),
                        TextButton(
                          onPressed: () {
                            if (newExamTitle.text.isEmpty) {
                              Get.back();
                            }
                            controller.addExam(newExamTitle.text);
                            Get.back();
                          },
                          style: TextButton.styleFrom(
                            backgroundColor: primaryColorS,
                            primary: Colors.white,
                          ),
                          child: const Text('Add'),
                        ),
                      ],
                    ),
                  )),
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
          "Exams",
          style: TextStyle(
            color: primarylightColorS,
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
                        Get.to(() => MarksClass(), arguments: [
                          controller.classid.toString(),
                          controller.subject.toString(),
                          controller.exams[i].exam.toString(),
                        ]);
                      },
                      style: TextButton.styleFrom(
                        side: const BorderSide(color: primaryColorS, width: 2.0),
                        primary: primaryColorS,
                        backgroundColor: primarylightColorS,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Expanded(
                            flex: 2,
                            child: FittedBox(
                              child: Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Icon(
                                  Icons.menu_book_rounded,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 8,
                            child: FittedBox(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  controller.exams[i].exam ?? "",
                                  style: const TextStyle(
                                      fontSize: 20,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ),
                        ],
                      )),
                );
              },
              itemCount: controller.exams.length),
        );
      }),
    );
  }
}
