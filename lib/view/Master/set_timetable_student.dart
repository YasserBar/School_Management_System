import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:open_file/open_file.dart';
import 'package:tr_app/controller/set_timetable_controller.dart';
import 'package:tr_app/view/Master/drower_master.dart';
import 'package:tr_app/res/color.dart';

import '../../utils/utils.dart';

class SendTimeTable extends StatefulWidget {
  const SendTimeTable({Key? key}) : super(key: key);

  @override
  _SendTimeTableState createState() => _SendTimeTableState();
}

class _SendTimeTableState extends State<SendTimeTable> {
  var controller = Get.put(TimeTableController());
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      key:_scaffoldKey,
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Upload Files",
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
        initi: 5,
        onMenueTap: (page) {
          Get.off;
        },
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: size.height * 0.001,
          ),
          Container(
            padding: const EdgeInsets.only(left: 40),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(150),
              color: primarylightColorS),
            child: Image.asset(
              "assets/images/student7.png",
              width: size.width * 0.8,
            ),
          ),

          const Divider(
            color: primarylightColorS,
            thickness: 2,
          ),
          MaterialButton(
            color: primaryColorS,
            elevation: 6,
            onPressed: () async {
              pickFiles();
            },
            child: const Text(
              'Pick File',
              style: TextStyle(color: primarylightColorS),
            ),
          ),
          if (controller.file != null) buildFile(controller.file!),
          if (controller.file != null)
            Obx(() {
              if (controller.chick.value) {
                return const Padding(
                  padding: EdgeInsets.only(bottom: 25.0),
                  child: Center(
                      child: CircularProgressIndicator(
                    color: primaryColorS,
                  )),
                );
              }
              return Padding(
                padding: const EdgeInsets.only(bottom: 25.0),
                child: MaterialButton(
                  color: primaryColorS,
                  onPressed: () async {
                    await controller.send(context);
                    if (!controller.chick.value) {
                      Utils.flushBarSuccessfulMessage("${controller.level}  ${controller.classname}\nDone add the schedule successfully", context); 
                    }
                  },
                  elevation: 6,
                  child: const Text(
                    'Upload File',
                    style: TextStyle(color: primarylightColorS),
                  ),
                ),
              );
            })
        ],
      ),
    );
  }

  Widget buildFile(PlatformFile file) {
    final kb = file.size / 1024;
    final mb = kb / 1024;
    final size = (mb >= 1)
        ? '${mb.toStringAsFixed(2)} MB'
        : '${kb.toStringAsFixed(2)} KB';
    return InkWell(
      onTap: () => viewFile(file),
      child: ListTile(
        leading: (file.extension == 'jpg' || file.extension == 'png')
            ? Image.file(
                File(file.path.toString()),
                width: 80,
                height: 80,
              )
            : const SizedBox(
                width: 80,
                height: 80,
              ),
        title: Text(file.name),
        subtitle: Text('${file.extension}'),
        trailing: Text(
          size,
          style: const TextStyle(fontWeight: FontWeight.w700),
        ),
      ),
    );
  }

  void pickFiles() async {
    controller.result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['jpg', 'jpeg', 'png'],
        allowMultiple: false);
    if (controller.result == null) return;
    controller.file = controller.result!.files.first;
    setState(() {});
  }

  // open the picked file
  void viewFile(PlatformFile file) {
    OpenFile.open(file.path);
  }
}





// Get.snackbar("برنامج الدوام", "تم اضافة برنامج الدوام بنجاح",
//                           duration: const Duration(seconds: 5),
//                           snackStyle: SnackStyle.FLOATING,
//                           barBlur: 30,
//                           dismissDirection: DismissDirection.horizontal,
//                           messageText: const Text(
//                             "تم اضافة برنامج الدوام بنجاح",
//                             textDirection: TextDirection.rtl,
//                             style: TextStyle(
//                               color: primaryColorS,
//                               fontSize: 20,
//                             ),
//                           ),
//                           padding: const EdgeInsets.only(left: 30, right: 10),
//                           icon: const Icon(
//                             Icons.cloud_upload_outlined,
//                             size: 25,
//                             color: Colors.white,
//                           ),
//                           titleText: Text(
//                             "${controller.level}  ${controller.classname}",
//                             textDirection: TextDirection.rtl,
//                             style: const TextStyle(
//                               color: Colors.white,
//                               fontSize: 25,
//                             ),
//                           ));