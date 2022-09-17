import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tr_app/controller/login_controller.dart';
import 'package:tr_app/view/guest/affiliation/affiliation_student.dart';
import 'package:tr_app/view/guest/affiliation/tybe_affiliation.dart';
import 'package:tr_app/res/color.dart';
import 'package:tr_app/utils/utils.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final ValueNotifier<TextDirection> _textDir =
      ValueNotifier(TextDirection.ltr);
  var loginController = Get.put(LoginController(Get.arguments[0], Get.arguments[1]));
  bool a = true;
  FocusNode fullnameFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    bool suc = false;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        shadowColor: const Color(0X00FFFFFF),
        backgroundColor: const Color(0X00FFFFFF),
        title: Center(
          child: Text(
            Get.arguments[2],
            style: const TextStyle(
              color: Colors.black,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: loginController.loginkey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: size.height * 0.03),
                Image.asset(
                  Get.arguments[3],
                  height: size.height * 0.35,
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
                  child: ValueListenableBuilder<TextDirection>(
                    valueListenable: _textDir,
                    builder: (context, value, child) =>
                    TextFormField(
                      textDirection: value,
                      onChanged: (input) {
                        if (input.trim().length < 2) {
                          final dir = Utils.getDirection(input);
                          if (dir != value) _textDir.value = dir;
                        }
                      },
                      keyboardType: TextInputType.text,
                      controller: loginController.fullnamecontroller,
                      validator: (value) {
                        return loginController.validateFullname(value!);
                      },
                      decoration: const InputDecoration(
                          icon: Icon(
                            Icons.person,
                            color: primaryColorS,
                          ),
                          hintText: "full name",
                          border: InputBorder.none),
                      focusNode: fullnameFocusNode,
                      onFieldSubmitted: (valu) {   ///// Or jast use "textInputAction : TextInputAction.next,"
                        Utils.fieldFocusChange(
                          context, fullnameFocusNode, passwordFocusNode);
                      },
                    ),
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
                    textDirection: TextDirection.ltr,
                    obscureText: a,
                    keyboardType: TextInputType.text,
                    controller: loginController.passwordcontroller,
                    validator: (value) {
                      return loginController.validatepassword(value!);
                    },
                    decoration: InputDecoration(
                      icon: const Icon(
                        Icons.lock,
                        color: primaryColorS,
                      ),
                      hintText: "password",
                      border: InputBorder.none,
                      suffixIcon: InkWell(
                        onTap: () {
                          setState(() {
                            a = !a;
                          });
                        },
                        child: Icon(
                            color: a ? primaryColorS : Colors.grey,
                            a ? Icons.visibility : Icons.visibility_off),
                      ),
                    ),
                    focusNode: passwordFocusNode,
                  ),
                ),
                SizedBox(height: size.height * 0.05),
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child:Obx((){ return MaterialButton(
                    padding: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 40),
                    color: primaryColorS,
                    onPressed: () {
                      loginController.isloading.value ? null 
                      : loginController.chicklog() ? loginController.login(context): null;
                    },
                    minWidth: size.width * 0.8,
                    child: loginController.isloading.value?  
                      const CircularProgressIndicator(
                        color: Colors.white,
                      ):
                      const Text('Login',style: TextStyle(color: Colors.white)),
                  );})
                ),
                SizedBox(height: size.height * 0.03),
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Text(
                        "Do not have an Account ? ",
                        style: TextStyle(color: primaryColorS),
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.until((route) => Get.currentRoute == '/');
                          Get.to(TypeAffiliation());
                          Get.to(AffiliationStudent());
                        },
                        child: const Text(
                          "Affilition",
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
      ),
    );
  }
}
