import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tr_app/view/Student/file/file_tile.dart';
import 'package:tr_app/controller/get_files_controller.dart';
import 'package:tr_app/view/Student/drower_student.dart';
import 'package:tr_app/data/network_api_service.dart';
import 'package:tr_app/res/color.dart';

class FilesTudent extends StatefulWidget {
  const FilesTudent({Key? key}) : super(key: key);

  @override
  _FilesTudentState createState() => _FilesTudentState();
}

class _FilesTudentState extends State<FilesTudent> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  var controller = Get.put(FileController());
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
          "Files",
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
        initi: 5,
        onMenueTap: (page) {
          Get.off;
        },
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          Image.asset(
            "assets/images/student.png",
            width: size.width * 0.8,
          ),
          const Divider(
            color: primarylightColorS,
            thickness: 2,
          ),
          Obx(() {
            if (controller.chick.value) {
              return const Center(
                  child: CircularProgressIndicator(
                color: primaryColorS,
              ));
            }
            return ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, i) {
                  return File_tile(controller.filelist[i]);
                },
                separatorBuilder: (context, i) {
                  return const Divider(
                    color: primarylightColorS,
                  );
                },
                itemCount: controller.filelist.length);
          })
        ]),
      ),
    );
  }
}
