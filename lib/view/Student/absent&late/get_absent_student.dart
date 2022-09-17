import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tr_app/controller/get_absent_student_controller.dart';
import 'package:tr_app/view/Student/absent&late/absent_tile.dart';
import 'package:tr_app/view/Student/drower_student.dart';
import 'package:tr_app/data/network_api_service.dart';
import 'package:tr_app/res/color.dart';

class GetAbsent extends StatefulWidget {
  const GetAbsent({Key? key}) : super(key: key);

  @override
  _GetAbsentState createState() => _GetAbsentState();
}

class _GetAbsentState extends State<GetAbsent> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  var controller = Get.put(AbsentController());
  NetworkApiService head = NetworkApiService();
  @override
  Widget build(BuildContext context) {
    controller.context = context;
    Size size = MediaQuery.of(context).size;
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
      drawer: MyDrowerStudent(
        initi: 1,
        onMenueTap: (page) {
          Get.off;
        },
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          Image.asset(
            "assets/images/student23.png",
            width: size.width * 0.8,
          ),
          const Divider(
            color: primaryColorS,
            thickness: 2,
          ),
          Obx(() {
            if (controller.isloading.value) {
              return const Center(
                  child: CircularProgressIndicator(
                color: primaryColorS,
              ));
            }
            return ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, i) {
                  return Absent_tile(controller.absentlist[i]);
                },
                separatorBuilder: (context, i) {
                  return const Divider(
                    color: primarylightColorS,
                  );
                },
                itemCount: controller.absentlist.length);
          })
        ]),
      ),
    );
  }
}
