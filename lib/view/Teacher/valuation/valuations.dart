import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tr_app/view/Teacher/drower_taecher.dart';
import 'package:tr_app/controller/set_valuation_controller.dart';
import 'package:tr_app/view/Teacher/valuation/valuation_tile.dart';
import 'package:tr_app/res/color.dart';

class ValuationClass extends StatefulWidget {
  @override
  State<ValuationClass> createState() => _ValuationClassState();
}

class _ValuationClassState extends State<ValuationClass> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  var valuationcontroller = Get.put(ValuationController());
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    valuationcontroller.context = context;
    return Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            "Valuations",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          backgroundColor: primaryColorS,
          automaticallyImplyLeading: false,
          actions: <Widget>[
            Obx(() {
              if (valuationcontroller.chick.value) {
                return const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Center(
                      child: CircularProgressIndicator(
                    color: Colors.white,
                  )),
                );
              }
              return IconButton(
                onPressed: () async {
                  await valuationcontroller.send();
                  Future.delayed(const Duration(seconds: 3), () {
                    if(!valuationcontroller.wrong.value){
                      Get.close(1);
                    }
                  });
                },
                icon: const Icon(Icons.send_outlined, size: 30),
              );
            })
          ],
          leading: IconButton(
            onPressed: () {
              _scaffoldKey.currentState!.openDrawer();
            },
            icon: const Icon(Icons.menu),
          ),
        ),
        drawer: MyDrowerTeacher(
          initi: 4,
          onMenueTap: (page) {
            Get.off;
          },
        ),
        body: Obx(() {
          if (valuationcontroller.isloading.value) {
            return const Center(
                child: CircularProgressIndicator(
              color: primaryColorS,
            ));
          }
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: 40,
                width: size.width,
                child: Expanded(
                  child: FittedBox(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          valuationcontroller.lecture.toString(),
                          style: const TextStyle(
                              color: primaryColorS,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              const Divider(
                color: primaryColorS,
                thickness: 2,
              ),
              Form(
                key: valuationcontroller.valuationkey,
                child: Expanded(
                  child: ListView.separated(
                      shrinkWrap: true,
                      itemCount: valuationcontroller.valuationlist.length,
                      itemBuilder: (context, i) {
                        return Valuation_tile(
                          valuationcontroller.valuationlist[i],
                          valuationcontroller.valuationcontroller[i]);
                      },
                      separatorBuilder: (context, i) {
                        return const Divider(
                          color: primaryColorS,
                        );
                      },
                    ),
                ),
              ),
            ],
          );
        }));
  }
}
