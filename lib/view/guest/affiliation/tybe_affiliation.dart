import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tr_app/view/guest/affiliation/affiliation_employe.dart';
import 'package:tr_app/view/guest/affiliation/affiliation_student.dart';
import 'package:tr_app/res/color.dart';

class TypeAffiliation extends StatefulWidget {
  @override
  State<TypeAffiliation> createState() => _TypeAffiliationState();
}

class _TypeAffiliationState extends State<TypeAffiliation> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SizedBox(
      height: size.height,
      width: size.width,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: primaryColorS,
          title: const Center(
            child: Text(
              "Affiliation",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: size.height * 0.04),
                Image.asset("assets/images/16.jpg", height: size.height * 0.45),
                SizedBox(height: size.height * 0.1),
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: FlatButton(
                    padding: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 40),
                    color: primaryColorS,
                    onPressed: () {
                      Get.to(() => AffiliationStudent());
                    },
                    minWidth: size.width * 0.8,
                    child: const Text("Student",
                        style: TextStyle(color: Colors.white)),
                  ),
                ),
                SizedBox(height: size.height * 0.04),
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: FlatButton(
                    padding: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 40),
                    color: primarylightColorS,
                    onPressed: () {
                      Get.to(() => AffiliationEmploye());
                    },
                    minWidth: size.width * 0.8,
                    child: const Text("Employe",
                        style: TextStyle(color: Colors.black)),
                  ),
                ),
                SizedBox(height: size.height * 0.07),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
