import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tr_app/view/Student/valuation/valuation_tile.dart';
import 'package:tr_app/controller/get_valuations_controller.dart';
import 'package:tr_app/view/Student/drower_student.dart';

import 'package:tr_app/res/color.dart';

class GetValuation extends StatefulWidget {
  const GetValuation({Key? key}) : super(key: key);

  @override
  _GetValuationState createState() => _GetValuationState();
}

class _GetValuationState extends State<GetValuation> {
  var controller = Get.put(VluController());
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    controller.context = context;
    Size size = MediaQuery.of(context).size;
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
      body: SingleChildScrollView(
        child: Column(children: [
          Image.asset(
            "assets/images/student22.png",
            width: size.width * 0.8,
          ),
          Divider(
            color: Colors.deepPurple[100],
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
                  return Valuation_tile(controller.valuationlist[i]);
                },
                separatorBuilder: (context, i) {
                  return Divider(
                    color: Colors.deepPurple[100],
                  );
                },
                itemCount: controller.valuationlist.length);
          })
        ]),
      ),
    );
  }
}
