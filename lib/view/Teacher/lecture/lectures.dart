import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tr_app/controller/get_lecture_controller.dart';
import 'package:tr_app/view/Teacher/drower_taecher.dart';
import 'package:tr_app/view/Teacher/lecture/add_lecture.dart';
import 'package:tr_app/view/Teacher/valuation/valuations.dart';
import 'package:tr_app/res/color.dart';

class LecturesList extends StatefulWidget {
  @override
  State<LecturesList> createState() => _LecturesListState();
}

class _LecturesListState extends State<LecturesList> {
  var controller = Get.put(LectureController());
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
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
                  child: AddLecture((newLectureTitle) {}
                  ),
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
          "lectures",
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
        initi: 4,
        onMenueTap: (page) {
          Get.off;
        },
      ),
      body:Obx((){
        if (controller.isloding.value) {
            return const Center(
                child: CircularProgressIndicator(
              color: primaryColorS,
            ));
          }
        return Container(
          padding: const EdgeInsets.fromLTRB(0, 0, 0, 50),
          child: ListView.builder(
            itemBuilder: (context, i) {
              return Center(
                child: Container(
                  height: 80,
                padding: const EdgeInsets.all(10),
                child: TextButton(
                    onPressed: () {
                      Get.to(() => ValuationClass(), arguments: [
                        controller.classid.toString(),
                        controller.lectures[i].lecture.toString(),
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
                                  controller.lectures[i].lecture!,
                                  style: const TextStyle(
                                      fontSize: 20,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ),
                      ],
                    )
                  ),
                )
              );
            },
            itemCount: controller.lectures.length,
          ),
        );
        }
      ),
    );
  }
}




          