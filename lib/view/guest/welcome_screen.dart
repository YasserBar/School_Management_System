import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tr_app/res/components/exit_app.dart';
import 'package:tr_app/utils/utils.dart';
import 'package:tr_app/view/guest/affiliation/tybe_affiliation.dart';
import 'package:tr_app/view/guest/login/tybe_login.dart';
import 'package:tr_app/res/color.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;  
    return ExitApp(
      child: SizedBox(
        height: size.height,
        width: double.infinity,
        child: Scaffold(
          appBar: AppBar(
           backgroundColor: primaryColorS,
            title: const Center(
              child: Text(
                "Welcome",
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
                    SizedBox(height: size.height * 0.0),
                    Image.asset("assets/images/2.png", height: size.height * 0.5),
                    SizedBox(height: size.height * 0.04),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: MaterialButton(
                        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                        color: primaryColorS,
                        onPressed: () {
                          Get.to(TypeLogin());
                        },
                        minWidth: size.width * 0.8,
                        child: const Text("Login", style: TextStyle(color: Colors.white)),
                      ),
                    ),
                    SizedBox(height: size.height * 0.04),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: MaterialButton(
                        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                        color: primarylightColorS,
                        onPressed: () {
                          Get.to(TypeAffiliation());
                        },
                        minWidth: size.width * 0.8,
                        child: const Text("Affiliation", style: TextStyle(color: Colors.black)),
                      ),
                    ),
                    SizedBox(height: size.height * 0.07),
                  ],
                ),
              ),
            ),
          ),
      ),
    );
  }
}
