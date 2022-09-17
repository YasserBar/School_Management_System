import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tr_app/controller/set_file_controller.dart';
import 'package:tr_app/res/api_url.dart';
import 'package:tr_app/view/Teacher/drower_taecher.dart';
import 'package:tr_app/res/color.dart';

import '../../res/components/file_component.dart';
import '../../utils/utils.dart';

class SendFile extends StatefulWidget {
  const SendFile({Key? key}) : super(key: key);

  @override
  _SendFileState createState() => _SendFileState();
}

class _SendFileState extends State<SendFile> {
  var controller = Get.put(Filecontorller(EndPointTeacher.addFileToClass));
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      key: _scaffoldKey,
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
      drawer: MyDrowerTeacher(
        initi: 3,
        onMenueTap: (page) {
          Get.off;
        },
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: size.height * 0.01,
          ),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(150),
                color: primarylightColorS),
            child: Image.asset(
              "assets/images/books1.png",
              width: size.width * 0.7,
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
              controller.file = await pickFiles(controller);
              if(controller.file != null) {
                setState(() {});
              }
            },
            child: const Text(
              'Pick File',
              style: TextStyle(color: primarylightColorS),
            ),
          ),
          if (controller.file != null) buildf(controller.file!),
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
                      Utils.flushBarSuccessfulMessage("${controller.level}  ${controller.classname}\nDone add the file successfully", context);
                    }
                    Future.delayed(const Duration(seconds: 3), () {
                      controller.file = null;
                      setState((){});
                    });
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
}
