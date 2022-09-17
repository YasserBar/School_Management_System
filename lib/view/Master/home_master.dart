import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tr_app/res/components/BouncingButton.dart';
import 'package:tr_app/res/components/DashboardCards.dart';
import 'package:tr_app/res/components/exit_app.dart';
import 'package:tr_app/view/Master/absent&late/type_absent.dart';
import 'package:tr_app/view/Master/note/type_note.dart';
import 'package:tr_app/view/Master/class/classes.dart';
import 'package:tr_app/view/Master/drower_master.dart';
import 'package:tr_app/res/color.dart';

class HomeMaster extends StatefulWidget {
  const HomeMaster({Key? key}) : super(key: key);

  @override
  State<HomeMaster> createState() => _HomeMasterState();
}

class _HomeMasterState extends State<HomeMaster> with SingleTickerProviderStateMixin {

  final List fragments = const [
    TypeAbsent(),
    TypeNote(),
    ClassScreenFile(),
    ClassScreenMark(),
    ClassScreenTimeTable(),
  ];



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
  
  int indexPage = 0;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;

    animationController.forward();
    return ExitApp(
      child: AnimatedBuilder(
        animation: animationController,
        builder: (BuildContext context, Widget? child) {
          return Scaffold(
            key: _scaffoldKey,
            appBar: AppBar(
              centerTitle: true,
              title: const Text(
                "Home",
                style: TextStyle(
                  color: primarylightColorS,
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
              initi: 0,
              onMenueTap: (page) {
                Get.off;
              },
            ),
            body: Padding(
              padding: const EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 0.0),
              child: ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(30.0, 10, 30, 10),
                    child: Container(
                      alignment: const Alignment(1.0, 0.0),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 10.0, right: 20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Transform(
                              transform: Matrix4.translationValues(
                                  muchDelayedAnimation.value * width, 0, 0),
                              child: Bouncing(
                                onPress: (){
                                  Get.to(fragments[0],arguments: 1);
                                },
                                child: const DashboardCard(
                                  name: "Absent&Late",
                                  imgpath: "17.jpg",
                                ),
                              ),
                            ),
                            Transform(
                              transform: Matrix4.translationValues(
                                  delayedAnimation.value * width, 0, 0),
                              child: Bouncing(
                                onPress: (){
                                  Get.to(fragments[1],arguments: 2);
                                },
                                child: const DashboardCard(
                                  name: "Notes",
                                  imgpath: "18.png",
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(30.0, 10, 30, 10),
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
                                onPress: (){
                                  Get.to(fragments[2],arguments: 3);
                                },
                                child: const DashboardCard(
                                  name: "Files",
                                  imgpath: "library.png",
                                ),
                              ),
                            ),
                            Transform(
                              transform: Matrix4.translationValues(
                                  delayedAnimation.value * width, 0, 0),
                              child: Bouncing(
                                onPress: (){
                                  Get.to(fragments[3],arguments: 4);
                                },
                                child: const DashboardCard(
                                  name: "Marks",
                                  imgpath: "exam.png",
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(30.0, 10, 30, 10),
                    child: Container(
                      alignment: const Alignment(1.0, 0),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 10.0, right: 20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Transform(
                              transform: Matrix4.translationValues(
                                  muchDelayedAnimation.value * width, 0, 0),
                              child: Bouncing(
                                onPress: (){
                                  Get.to(fragments[4],arguments: 5);
                                },
                                child: const DashboardCard(
                                  name: "Time Table",
                                  imgpath: "calendar.png",
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
            ),
          );
        },
      ),
    );
  }
}
