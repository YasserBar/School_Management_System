import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tr_app/controller/login_controller.dart';
import 'package:tr_app/res/api_url.dart';
import 'package:tr_app/view/Master/absent&late/type_absent.dart';
import 'package:tr_app/view/Master/home_master.dart';
import 'package:tr_app/view/Master/note/type_note.dart';
import 'package:tr_app/view/Master/class/classes.dart';
import 'package:tr_app/data/network_api_service.dart';
import 'package:tr_app/res/color.dart';

class MyDrowerMaster extends StatefulWidget {
  final Function(int) onMenueTap;
  int initi = 0;
  MyDrowerMaster({
    Key? key,
    required this.onMenueTap,
    required this.initi,
  }) : super(key: key);

  @override
  State<MyDrowerMaster> createState() => _MyDrowerMasterState(initi);
}

class _MyDrowerMasterState extends State<MyDrowerMaster> {
  var loginController = Get.put(LoginController(EndPointGuest.loginEmployee,EndPointGuest.logoutEmployee));
  NetworkApiService head = NetworkApiService();
  final activeTextStyle = const TextStyle(color: Colors.white);

  final inactiveTextStyle = const TextStyle(color: Colors.black);

  final activeDecoration = BoxDecoration(
    borderRadius: BorderRadius.circular(8),
    color: primaryColorS,
  );

  final List fragments = const [
    HomeMaster(),
    TypeAbsent(),
    TypeNote(),
    ClassScreenFile(),
    ClassScreenMark(),
    ClassScreenTimeTable(),
  ];

  List<String> menus = [
    "Home",
    "Absent&Late",
    "Notes",
    "Files",
    "Marks",
    "Time Table",
  ];

  final List<IconData> icon = [
    Icons.home_outlined,
    Icons.dnd_forwardslash_outlined,
    Icons.note_alt_outlined,
    Icons.file_upload_outlined,
    Icons.task,
    Icons.calendar_month_outlined,
  ];


  _MyDrowerMasterState(initi);

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
                const SizedBox(height: 30,),
                
            // generate menus

            SingleChildScrollView(
              child: Column(
                children: List.generate(
                  menus.length,
                  (index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 10.0),
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.decelerate,
                        decoration:  widget.initi == index
                            ? activeDecoration
                            : const BoxDecoration(),
                        child: ListTile(
                          onTap: () {
                            widget.initi = index;
                            widget.onMenueTap(index);
                            Get.until(
                                (route) => Get.currentRoute == '/homeMaster');
                            Get.to(fragments[index], arguments: index);
                          },
                          title: Text(
                            menus[index],
                            style: widget.initi  == index
                                ? activeTextStyle
                                : inactiveTextStyle,
                          ),
                          leading: Icon(
                            icon[index],
                            color: widget.initi  == index
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
                    middleText: "Are you sure you want to Logout !!",
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
            const SizedBox(height: 10,),
          ],
        ),
      ),
    );
  }
}