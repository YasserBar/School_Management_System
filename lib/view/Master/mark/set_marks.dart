import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tr_app/controller/set_mark_controller.dart';
import 'package:tr_app/view/Master/mark/mark_tile.dart';
import 'package:tr_app/view/Master/drower_master.dart';
import 'package:tr_app/res/color.dart';

import '../../../utils/utils.dart';

class MarksClass extends StatefulWidget {
  @override
  State<MarksClass> createState() => _MarksClassState();
}

class _MarksClassState extends State<MarksClass> {
  var studentcontroller = Get.put(MarkController());
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    studentcontroller.context = context;
    print(Get.arguments);
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            "Marks",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          actions: <Widget>[
            Obx(() {
              if (studentcontroller.check.value) {
                return const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Center(
                      child: CircularProgressIndicator(
                    color: Colors.white,
                  )),
                );
              }
              return IconButton(
                onPressed: () async {
                  if (studentcontroller.chickMark()) {
                    await studentcontroller.send();
                    if (!studentcontroller.check.value) {
                      Utils.flushBarSuccessfulMessage("${studentcontroller.subject}  ${studentcontroller.typeexam}\nDone add marks successfully",context);
                    }
                    Future.delayed(Duration(seconds: 3), () {
                      Get.close(1);
                    });
                  }
                },
                icon: const Icon(Icons.send_outlined, size: 30),
              );
            })
          ],
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
          if (studentcontroller.isloding.value) {
            return const Center(
                child: CircularProgressIndicator(
              color: primaryColorS,
            ));
          }
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: 40,
                width: size.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(
                      child: FittedBox(
                        alignment: Alignment.center,
                        child: Text(
                          studentcontroller.subject.toString(),
                          style: const TextStyle(
                              color: primaryColorS,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Expanded(
                      child: FittedBox(
                        alignment: Alignment.center,
                        child: Text(
                          studentcontroller.typeexam,
                          style: const TextStyle(
                              color: primaryColorS,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              const Divider(
                color: primaryColorS,
                thickness: 2,
              ),
              Form(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                key: studentcontroller.markkey,
                child: Expanded(
                  child: ListView.separated(
                      shrinkWrap: true,
                      itemBuilder: (context, i) {
                        return Student_tile(studentcontroller.studentlist[i],
                            studentcontroller.markcontroller[i]);
                      },
                      separatorBuilder: (context, i) {
                        return const Divider(
                          color: primaryColorS,
                        );
                      },
                      itemCount: studentcontroller.studentlist.length),
                ),
              ),
            ],
          );
        }
      )
    );
  }
}







// if (!studentcontroller.check.value) {
//                       Get.snackbar("Marks", "Done add maeks successfully",
//                           duration: const Duration(seconds: 5),
//                           snackStyle: SnackStyle.FLOATING,
//                           barBlur: 30,
//                           dismissDirection: DismissDirection.horizontal,
//                           messageText: const Text(
//                             "Done add maeks successfully",
//                             style: TextStyle(
//                               color: primaryColorS,
//                               fontSize: 20,
//                             ),
//                           ),
//                           padding: const EdgeInsets.only(left: 30, right: 10),
//                           icon: const Icon(
//                             Icons.check_circle,
//                             size: 25,
//                             color: Color.fromARGB(255, 21, 160, 26),
//                           ),
//                           titleText: Text(
//                             "${studentcontroller.subject}  ${studentcontroller.typeexam}",
//                             style: const TextStyle(
//                               color: primarylightColorS,
//                               fontSize: 20,
//                             ),
//                           ));
//                     }