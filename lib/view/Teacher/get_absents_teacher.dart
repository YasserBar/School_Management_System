import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tr_app/controller/get_absent_teacher_controller.dart';
import 'package:tr_app/res/components/convertToDate.dart';
import 'package:tr_app/view/Teacher/drower_taecher.dart';
import 'package:tr_app/res/color.dart';

class AbsentsScreenT extends StatefulWidget {
  const AbsentsScreenT({Key? key}) : super(key: key);

  @override
  State<AbsentsScreenT> createState() => _AbsentsScreenTState();
}

class _AbsentsScreenTState extends State<AbsentsScreenT> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  var absentcontroller = Get.put(AbsentController());
  @override
  Widget build(BuildContext context) {
    absentcontroller.context = context;
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Absent&Late",
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
        initi: 1,
        onMenueTap: (page) {
          Get.off;
        },
      ),
      body: Obx(() {
        if (absentcontroller.isloading.value) {
          return const Center(
              child: CircularProgressIndicator(
            color: primaryColorS,
          ));
        }
        return Column(mainAxisSize: MainAxisSize.min, children: [
          const SizedBox(
            height: 5,
          ),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  child: ListView.separated(
                      shrinkWrap: true,
                      itemBuilder: (context, i) {
                        return Center(
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Icon(
                                  Icons.dnd_forwardslash_outlined,
                                  size: 20.0,
                                ),
                                Text(
                                  absentcontroller.absentlist[i].type,
                                  style: const TextStyle(
                                      fontSize: 20,
                                      color: Colors.black87,
                                      fontWeight: FontWeight.w400),
                                ),
                                Text(
                                  ConvertToDate.formattedDate(
                                      absentcontroller.absentlist[i].createdAt),
                                  style: const TextStyle(
                                      fontSize: 12,
                                      color: Colors.black87,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                      separatorBuilder: (context, i) {
                        return const Divider(
                          color: primaryColorS,
                        );
                      },
                      itemCount: absentcontroller.absentlist.length),
                )
              ])
        ]);
      }),
    );
  }
}
