import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tr_app/res/components/BouncingButton.dart';
import 'package:tr_app/res/components/DashboardCards.dart';
import 'package:tr_app/view/Student/note/get_note_class.dart';
import 'package:tr_app/view/Student/note/get_note_student.dart';
import 'package:tr_app/view/Student/drower_student.dart';
import 'package:tr_app/res/color.dart';

class TypeNoteStudent extends StatefulWidget {
  const TypeNoteStudent({Key? key}) : super(key: key);

  @override
  State<TypeNoteStudent> createState() => _TypeNoteStudentState();
}

class _TypeNoteStudentState extends State<TypeNoteStudent>
    with SingleTickerProviderStateMixin {
  late Animation animation, delayedAnimation, muchDelayedAnimation, LeftCurve;
  late AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(duration: const Duration(milliseconds: 1200), vsync: this);
    animation = Tween(begin: -1.0, end: 0.0).animate(CurvedAnimation(
        parent: animationController, curve: Curves.fastOutSlowIn));

    delayedAnimation = Tween(begin: -1.0, end: 0.0).animate(CurvedAnimation(
        parent: animationController,
        curve: const Interval(0.5, 1.0, curve: Curves.fastOutSlowIn)));

    muchDelayedAnimation = Tween(begin: -1.0, end: 0.0).animate(CurvedAnimation(
        parent: animationController,
        curve: const Interval(0.8, 1.0, curve: Curves.fastOutSlowIn)));

    LeftCurve = Tween(begin: -1.0, end: 0.0).animate(CurvedAnimation(
        parent: animationController,
        curve: const Interval(0.5, 1.0, curve: Curves.easeInOut)));
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;

    animationController.forward();
    return AnimatedBuilder(
      animation: animationController,
      builder: (BuildContext context, Widget? child) {
        return Scaffold(
          key: _scaffoldKey,
          appBar: AppBar(
            centerTitle: true,
            title: const Text(
              "Notes",
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
          body: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(200.0, 100, 20, 50),
                child: Container(
                  alignment: const Alignment(1.0, 0),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10.0, right: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Transform(
                          transform: Matrix4.translationValues(
                              delayedAnimation.value * width, 0, 0),
                          child: Bouncing(
                            onPress: () {
                              Get.to(() => const GetNoteStudent(), arguments: Get.arguments );
                            },
                            child: const DashboardCard(
                              name: "My Notes",
                              imgpath: "studentf.png",
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(70.0, 10, 30, 10),
                child: Container(
                  alignment: const Alignment(1.0, 0),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10.0, right: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Transform(
                          transform: Matrix4.translationValues(
                              muchDelayedAnimation.value * width, 0, 0),
                          child: Bouncing(
                            onPress: () {
                              Get.to(() => const GetNoteClass(), arguments: Get.arguments);
                            },
                            child: const DashboardCard(
                              name: "Class Notes",
                              imgpath: "classroom.png",
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
