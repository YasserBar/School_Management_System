import 'package:cached_network_image/cached_network_image.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tr_app/res/api_url.dart';
import 'package:tr_app/view/Student/drower_student.dart';
import 'package:tr_app/controller/profile_controller.dart';
import 'package:tr_app/data/network_api_service.dart';
import 'package:tr_app/res/color.dart';

class ProfileStudent extends StatefulWidget {
  const ProfileStudent({Key? key}) : super(key: key);
  @override
  State<ProfileStudent> createState() => _ProfileStudentState();
}

class _ProfileStudentState extends State<ProfileStudent> {
  var controll = Get.put(ProfileSController());
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  NetworkApiService tok = NetworkApiService();
  late TransformationController controller;
  TapDownDetails? tapDownDetails;

  @override
  void initState() {
    super.initState();
    controller = TransformationController();
  }

  pickFiles() async {
    controll.result = await FilePicker.platform
        .pickFiles(type: FileType.image, allowMultiple: false);
    if (controll.result == null) return;
    controll.file = controll.result!.files.first;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    controll.context = context;
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Profile",
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
        initi: Get.arguments,
        onMenueTap: (page) {
          Get.off;
        },
      ),
      body: Obx(() {
        if (controll.isloading.value) {
          return const Center(
              child: CircularProgressIndicator(
            color: primaryColorS,
          ));
        }
        return SingleChildScrollView(
          child: Center(
            child: Column(
              children: <Widget>[
                SizedBox(height: size.height * 0.03),
                Stack(children: [
                  Obx(() {
                    if (controll.chickimage.value) {
                      return CircleAvatar(
                        radius: 80.0,
                        child: GestureDetector(
                          onTap: () => _showSecondPage,
                          child: Hero(
                            tag: 'show',
                            child: InteractiveViewer(
                              transformationController: controller,
                              clipBehavior: Clip.none,
                              minScale: 1,
                              maxScale: 10,
                              panEnabled: false,
                              child: AspectRatio(
                                aspectRatio: 1,
                                child: CachedNetworkImage(
                                  imageUrl: EndPointGuest.baseUrl +
                                      EndPointStudent.getImageProfile,
                                  httpHeaders: tok.setHeaders(tok.token),
                                  fit: BoxFit.cover,
                                  placeholder: (context, url) =>
                                      const CircularProgressIndicator(
                                    color: primaryColorS,
                                  ),
                                  errorWidget: (context, url, error) =>
                                      const Icon(Icons.error),
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    } else {
                      return const CircleAvatar(
                          radius: 80.0,
                          child: FittedBox(child: Icon(Icons.person)));
                    }
                  }),
                  Positioned(
                      left: size.width * 0.33,
                      top: size.height * 0.19,
                      child: IconButton(
                        onPressed: () async {
                          await pickFiles();
                          if (controll.file != null) {
                            await controll.sendimage();
                            await controll.get_profil();
                            setState(() {});
                          }
                        },
                        icon: const Icon(Icons.camera),
                        color: primaryColorS,
                      ))
                ]),
                SizedBox(height: size.height * 0.03),
                Text(
                  controll.model.fullName,
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.deepPurple[900]),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: size.height * 0.03),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  width: size.width * 0.8,
                  decoration: BoxDecoration(
                    color: primarylightColorS,
                    borderRadius: BorderRadius.circular(29),
                  ),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.date_range_outlined,
                        color: primaryColorS,
                      ),
                      Text(
                        "level :${controll.model.level}",
                        textAlign: TextAlign.right,
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  width: size.width * 0.8,
                  decoration: BoxDecoration(
                    color: primarylightColorS,
                    borderRadius: BorderRadius.circular(29),
                  ),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.date_range_outlined,
                        color: primaryColorS,
                      ),
                      Text(
                        "class : ${controll.model.roomName}",
                        textAlign: TextAlign.right,
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  width: size.width * 0.8,
                  decoration: BoxDecoration(
                    color: primarylightColorS,
                    borderRadius: BorderRadius.circular(29),
                  ),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.date_range_outlined,
                        color: primaryColorS,
                      ),
                      Text(
                        "class : ${controll.model.roomName}",
                        textAlign: TextAlign.right,
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  width: size.width * 0.8,
                  decoration: BoxDecoration(
                    color: primarylightColorS,
                    borderRadius: BorderRadius.circular(29),
                  ),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.phone,
                        color: primaryColorS,
                      ),
                      Text(
                        "phone : ${controll.model.phone}",
                        textAlign: TextAlign.right,
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  width: size.width * 0.8,
                  decoration: BoxDecoration(
                    color: primarylightColorS,
                    borderRadius: BorderRadius.circular(29),
                  ),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.phone,
                        color: primaryColorS,
                      ),
                      Text(
                        "parent phone : ${controll.model.parentPhone}",
                        textAlign: TextAlign.right,
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  width: size.width * 0.4,
                  decoration: BoxDecoration(
                    color: primarylightColorS,
                    borderRadius: BorderRadius.circular(29),
                  ),
                  child: Row(
                    children: const [
                      Icon(
                        Icons.account_balance_outlined,
                        color: primaryColorS,
                      ),
                      Text(
                        "address",
                        textAlign: TextAlign.left,
                      )
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  width: size.width * 0.8,
                  decoration: BoxDecoration(
                    color: primarylightColorS,
                    borderRadius: BorderRadius.circular(29),
                  ),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.safety_check,
                        color: primaryColorS,
                      ),
                      Text(
                        "city : ${controll.model.city}",
                        textAlign: TextAlign.right,
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  width: size.width * 0.8,
                  decoration: BoxDecoration(
                    color: primarylightColorS,
                    borderRadius: BorderRadius.circular(29),
                  ),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.safety_check,
                        color: primaryColorS,
                      ),
                      Text(
                        "region : ${controll.model.region}",
                        textAlign: TextAlign.right,
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  width: size.width * 0.8,
                  decoration: BoxDecoration(
                    color: primarylightColorS,
                    borderRadius: BorderRadius.circular(29),
                  ),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.safety_check,
                        color: primaryColorS,
                      ),
                      Text(
                        "street : ${controll.model.street}",
                        textAlign: TextAlign.right,
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  width: size.width * 0.8,
                  decoration: BoxDecoration(
                    color: primarylightColorS,
                    borderRadius: BorderRadius.circular(29),
                  ),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.bungalow_outlined,
                        color: primaryColorS,
                      ),
                      Text(
                        "bulid number : ${controll.model.bulidNum}",
                        textAlign: TextAlign.right,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: size.height * 0.05),
              ],
            ),
          ),
        );
      }),
    );
  }

  void _showSecondPage(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (ctx) => Scaffold(
              backgroundColor: primarylightColorS,
              body: Center(
                child: Hero(
                  tag: 'show',
                  child: GestureDetector(
                    onDoubleTapDown: (details) => tapDownDetails = details,
                    onDoubleTap: () {
                      final position = tapDownDetails!.localPosition;
                      const double scale = 2;
                      final x = -position.dx * (scale - 1);
                      final y = -position.dy * (scale - 1);
                      final zoom = Matrix4.identity()
                        ..translate(x, y)
                        ..scale(scale);
                      final value = controller.value.isIdentity()
                          ? zoom
                          : Matrix4.identity();
                      controller.value = value;
                    },
                    child: InteractiveViewer(
                      transformationController: controller,
                      clipBehavior: Clip.none,
                      minScale: 1,
                      maxScale: 10,
                      panEnabled: false,
                      child: AspectRatio(
                        aspectRatio: 1,
                        child: Obx(() {
                          if (controll.chickimage.value == true) {
                            return CachedNetworkImage(
                              imageUrl: EndPointGuest.baseUrl +
                                  EndPointStudent.getImageProfile,
                              httpHeaders: tok.setHeaders(tok.token),
                              fit: BoxFit.cover,
                            );
                          } else {
                            return const Icon(Icons.person);
                          }
                        }),
                      ),
                    ),
                  ),
                ),
              ),
            )));
  }
}
