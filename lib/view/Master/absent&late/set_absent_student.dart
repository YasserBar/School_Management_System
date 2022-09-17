import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tr_app/controller/set_absent_controller.dart';
import 'package:tr_app/res/api_url.dart';
import 'package:tr_app/utils/utils.dart';
import 'package:tr_app/view/Master/drower_master.dart';
import 'package:tr_app/view/Master/student/students.dart';
import 'package:tr_app/res/color.dart';

class AbsentStudent extends StatelessWidget {
  AbsentStudent({Key? key}) : super(key: key);
  
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  var controller = Get.put(SetAbsentController("student_id", EndPointMaster.setAbsenceOrLateSt));
  String fullname = Get.arguments[1];
  int id = Get.arguments[0];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Student Absent or Late",
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
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset(
                  "assets/images/exam.png",
                  height: 80,
                ),
                Text(
                  fullname,
                  style: const TextStyle(
                      fontSize: 20,
                      color: primaryColorS,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const Divider(
              color: primaryColorS,
            ),
            const SizedBox(
              height: 10,
            ),
            Obx(() {
              return Container(
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  decoration: BoxDecoration(
                    color: primarylightColorS,
                    borderRadius: BorderRadius.circular(29),
                  ),
                  child: DropdownButton(
                      value: controller.val.value,
                      items: controller.iteam.map((String type) {
                        return DropdownMenuItem(
                            value: type,
                            child: Text(
                              type,
                              style: const TextStyle(fontSize: 20,color: primaryColorS),
                            ));
                      }).toList(),
                      onChanged: (String? value) {
                        controller.val.value = value!;
                      }));
            }),
            const SizedBox(
              height: 50,
            ),
            Obx(() {
              if (controller.isloading.value) {
                return const Center(
                    child: CircularProgressIndicator(
                  color: primaryColorS,
                ));
              }
              return MaterialButton(
                padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                color: primarylightColorS,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                elevation: 10,
                onPressed: () async {
                  await controller.send(id, context);
                  if (!controller.isloading.value) {
                    Utils.flushBarSuccessfulMessage("Student : $fullname\nDone add the ${controller.val.value} successfully", context); 
                  }
                  Future.delayed(Duration(seconds: 3),(){
                    Get.close(1);
                  });
                },
                child:const Text("Submet", style: TextStyle(color: primaryColorS)),
              );
            }),
          ],
        ),
      ),
    );
  }
}






// Get.snackbar("ملاحظات", '',
//                         duration: const Duration(seconds: 10),
//                         snackStyle: SnackStyle.FLOATING,
//                         barBlur: 30,
//                         dismissDirection: DismissDirection.horizontal,
//                         messageText: Text(
//                           "تم تسجيل ال${controller.val.value} بنجاح ",
//                           textDirection: TextDirection.rtl,
//                           style: const TextStyle(
//                             color: primaryColorS,
//                             fontSize: 20,
//                           ),
//                         ),
//                         padding: const EdgeInsets.only(left: 30, right: 10),
//                         icon: const Icon(
//                           Icons.check_circle,
//                             size: 25,
//                             color: Color.fromARGB(255, 21, 160, 26),
//                         ),
//                         titleText: Text(
//                           "الطالب : $fullname",
//                           textDirection: TextDirection.rtl,
//                           style: const TextStyle(
//                             color: primarylightColorS,
//                             fontSize: 25,
//                           ),
//                         ));