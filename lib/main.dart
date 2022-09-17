import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tr_app/view/Master/home_master.dart';
import 'package:tr_app/view/Student/home_student.dart';
import 'package:tr_app/view/Teacher/home_teacher.dart';
import 'package:tr_app/res/color.dart';
import 'package:get/get.dart';
import 'package:flutter/services.dart';
import 'package:tr_app/view/guest/welcome_screen.dart';
import 'middleware/auth_middleware.dart';

SharedPreferences? prefs;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  WidgetsFlutterBinding.ensureInitialized();
  prefs = await SharedPreferences.getInstance();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Myschool',
      theme: ThemeData(
        primaryColor: primaryColorS,
        scaffoldBackgroundColor: Colors.white,
      ),
      initialRoute: "/",
      getPages: [
        GetPage(
          name: "/",
          page: () => WelcomeScreen(),
          middlewares: [Authmidleware()]),
        GetPage(
          name: "/homeMaster",
          page: () => const HomeMaster(),
        ),
        GetPage(
          name: "/homeTeacher",
          page: () => const HomeTeacher(),
        ),
        GetPage(
          name: "/homeStudent",
          page: () => const HomeStudent(),
        ),
      ],
    );
  }
}
