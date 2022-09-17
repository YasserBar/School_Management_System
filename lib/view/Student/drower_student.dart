import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tr_app/controller/login_controller.dart';
import 'package:tr_app/res/api_url.dart';
import 'package:tr_app/view/Student/absent&late/get_absent_student.dart';
import 'package:tr_app/view/Student/file/get_files_student.dart';
import 'package:tr_app/view/Student/home_student.dart';
import 'package:tr_app/view/Student/mark/get_marks.dart';
import 'package:tr_app/view/Student/note/type_note.dart';
import 'package:tr_app/view/Student/valuation/valuationstudent.dart';
import 'package:tr_app/view/Student/profile.dart';
import 'package:tr_app/view/Student/timetable_student.dart';
import 'package:tr_app/data/network_api_service.dart';
import 'package:tr_app/res/color.dart';

class MyDrowerStudent extends StatefulWidget {
  final Function(int) onMenueTap;
  int initi = 0;
  MyDrowerStudent({
    Key? key,
    required this.initi,
    required this.onMenueTap,
  }) : super(key: key);

  @override
  State<MyDrowerStudent> createState() => _MyDrowerStudentState(initi);
}

class _MyDrowerStudentState extends State<MyDrowerStudent> {
  
  var loginController = Get.put(LoginController(EndPointGuest.loginStudent, EndPointGuest.logoutStudent));
  NetworkApiService head = NetworkApiService();

  final activeTextStyle = const TextStyle(color: Colors.white);

  final inactiveTextStyle = const TextStyle(color: Colors.black);

  final activeDecoration = BoxDecoration(
    borderRadius: BorderRadius.circular(8),
    color: primaryColorS,
  );

  final List fragments = const [
    HomeStudent(),
    GetAbsent(),
    TypeNoteStudent(),
    GetMark(),
    GetValuation(),
    FilesTudent(),
    GetTimeTable(),
    ProfileStudent(),
  ];

  List<String> menus = [
    "Home",
    "Absent&Late",
    "Notes",
    "Marks",
    "valutaion",
    "Files",
    "Time Table",
    "Profile",
  ];

  final List<IconData> icon = [
    Icons.home_outlined,
    Icons.dnd_forwardslash_outlined,
    Icons.note_alt_outlined,
    Icons.task,
    Icons.text_increase_outlined,
    Icons.file_download_outlined,
    Icons.calendar_month_outlined,
    Icons.person_outline_outlined,
  ];
  
  _MyDrowerStudentState(initi);

  late TransformationController controller;
  TapDownDetails? tapDownDetails;
  
  @override
  void initState() {
    super.initState();
    controller = TransformationController();
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.only(
        top: 50,
        right: 10,
        left: 10,
      ),
      width: MediaQuery.of(context).size.width * 0.8,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
                Container(
                  alignment : Alignment.topRight,
                  child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.close),
                    iconSize: 25,
                    color: Colors.black54,
                  ),
                ),
            const SizedBox(
              height: 20,
            ),
            
            // generate menus

            SingleChildScrollView(
              child: Column(
                children: List.generate(
                  menus.length,
                  (index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 4.0),
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.decelerate,
                        decoration: widget.initi == index
                            ? activeDecoration
                            : const BoxDecoration(),
                        child: ListTile(
                          onTap: () {
                            widget.initi = index;
                            widget.onMenueTap(index);
                            Get.until(
                                (route) => Get.currentRoute == '/homeStudent');
                            Get.to(fragments[index], arguments: index);
                          },
                          title: Text(
                            menus[index],
                            style: widget.initi == index
                                ? activeTextStyle
                                : inactiveTextStyle,
                          ),
                          leading: Icon(
                            icon[index],
                            color: widget.initi == index
                                ? Colors.white
                                : Colors.black54,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            const Divider(
              color: Colors.black54,
              thickness: 0.5,
            ),
            ListTile(
              onTap: () {
                Get.defaultDialog(
                    title: "Logout",
                    middleText: "are you sure you want to Logout !!",
                    titleStyle: TextStyle(color: Colors.red[400]),
                    buttonColor: primaryColorS,
                    cancelTextColor: Colors.black,
                    onConfirm: () {
                      loginController.logout(context);
                    },
                    confirmTextColor: Colors.white,
                    textCancel: "cancel",
                    textConfirm: "Ok");
              },
              title: const Text(
                "Logout",
                style: TextStyle(
                  color: Colors.red,
                ),
              ),
              leading: const Icon(Icons.logout, color: Colors.red),
            ),
          ],
        ),
      ),
    );
  }
}