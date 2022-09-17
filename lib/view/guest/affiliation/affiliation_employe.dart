import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tr_app/controller/affiliation_employee_controller.dart';
import 'package:tr_app/view/guest/login/tybe_login.dart';
import 'package:tr_app/res/color.dart';

class AffiliationEmploye extends StatefulWidget {
  @override
  State<AffiliationEmploye> createState() => _AffiliationEmployeState();
}

class _AffiliationEmployeState extends State<AffiliationEmploye> {
  var controller = Get.put(AffilationEmployeeController());

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
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
        child: Form(
          autovalidateMode: AutovalidateMode.always,
          key: controller.affikey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
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
                child: TextFormField(
                  keyboardType: TextInputType.text,
                  controller: controller.namecolntroller,
                  validator: (value) {
                    return controller.validatename(value!);
                  },
                  decoration: const InputDecoration(
                      icon: Icon(
                        Icons.person,
                        color: primaryColorS,
                      ),
                      hintText: "name",
                      border: InputBorder.none),
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
                child: TextFormField(
                  keyboardType: TextInputType.phone,
                  controller: controller.phonecolntroller,
                  validator: (value) {
                    return controller.validatephone(value!);
                  },
                  decoration: const InputDecoration(
                      icon: Icon(
                        Icons.phone,
                        color: primaryColorS,
                      ),
                      hintText: "phone",
                      border: InputBorder.none),
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
                child: TextFormField(
                  keyboardType: TextInputType.text,
                  controller: controller.namedegreecontroller,
                  validator: (value) {
                    return controller.validatenamedegre(value!);
                  },
                  decoration: const InputDecoration(
                      icon: Icon(
                        Icons.account_balance_outlined,
                        color: primaryColorS,
                      ),
                      hintText: "name degre",
                      border: InputBorder.none),
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
                child: TextFormField(
                  keyboardType: TextInputType.text,
                  controller: controller.targetsubjectcontroller,
                  validator: (value) {
                    return controller.validatetargetsubject(value!);
                  },
                  decoration: const InputDecoration(
                      icon: Icon(
                        Icons.subject_outlined,
                        color: primaryColorS,
                      ),
                      hintText: "target subject",
                      border: InputBorder.none),
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
                child: TextFormField(
                  keyboardType: TextInputType.text,
                  controller: controller.targetjobcontroller,
                  validator: (value) {
                    return controller.validatetargetjob(value!);
                  },
                  decoration: const InputDecoration(
                      icon: Icon(
                        Icons.safety_check,
                        color: primaryColorS,
                      ),
                      hintText: "target job",
                      border: InputBorder.none),
                ),
              ),
              SizedBox(height: size.height * 0.05),
              Obx(() {
                if (controller.isloading.value) {
                  return const CircularProgressIndicator(
                    color: primaryColorS,
                  );
                }
                return ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: FlatButton(
                    padding: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 40),
                    color: primaryColorS,
                    onPressed: () {
                      controller.isloading.value ? null
                      : controller.chickAffiliation() ? controller.send(context) : null;
                    },
                    minWidth: size.width * 0.8,
                    child: const Text("Submit",
                        style: TextStyle(color: Colors.white)),
                  ),
                );
              }),
              SizedBox(height: size.height * 0.04),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Text(
                      "Already have an Account ? ",
                      style: TextStyle(color: primaryColorS),
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.until((route) => Get.currentRoute == '/');
                        Get.to(TypeLogin());
                      },
                      child: const Text(
                        "Login",
                        style: TextStyle(
                          color: primaryColorS,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ]),
              SizedBox(height: size.height * 0.07),
            ],
          ),
        ),
      ),
    );
  }
}
