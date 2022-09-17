import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tr_app/res/api_url.dart';
import 'package:tr_app/view/guest/login/login_screen.dart';
import 'package:tr_app/res/color.dart';

class TypeLogin extends StatefulWidget {
  @override
  State<TypeLogin> createState() => _TypeLoginState();
}

class _TypeLoginState extends State<TypeLogin> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
         automaticallyImplyLeading: false, 
         backgroundColor: primaryColorS,
          title: const Center(
            child: Text(
              "Login",
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
              Image.asset("assets/images/4.png", height: size.height * 0.45),
              SizedBox(height: size.height * 0.01),
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: MaterialButton(
                  padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                  color: primaryColorS,
                  onPressed: () {
                    Get.to(LoginScreen(),arguments: [EndPointGuest.loginStudent,EndPointGuest.logoutStudent,"Hello Student","assets/images/6.png"]);
                  },
                  minWidth: size.width * 0.8,
                  child:
                      const Text("Student", style: TextStyle(color: Colors.white)),
                ),
              ),
              SizedBox(height: size.height * 0.02),
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: MaterialButton(
                  padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                  color: primarylightColorS,
                  onPressed: () {
                    Get.to(LoginScreen(),arguments: [EndPointGuest.loginEmployee,EndPointGuest.logoutEmployee,"Hello Teacher","assets/images/7.png"]);
                  },
                  minWidth: size.width * 0.8,
                  child:
                      const Text("Teacher", style: TextStyle(color: Colors.black)),
                ),
              ),
              SizedBox(height: size.height * 0.02),
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: MaterialButton(
                  padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                  color: primarylightColorS,
                  onPressed: () {
                    Get.to(LoginScreen(),arguments: [EndPointGuest.loginEmployee,EndPointGuest.logoutEmployee,"Hello Master","assets/images/8.jpg"]);
                  },
                  minWidth: size.width * 0.8,
                  child:
                      const Text("Master", style: TextStyle(color: Colors.black)),
                ),
              ),
              SizedBox(height: size.height * 0.07),
            ],
          ),
        ),
      ),
    );
  }
}
