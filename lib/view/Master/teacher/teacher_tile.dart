import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tr_app/model/teacher_model.dart';
import 'package:tr_app/res/color.dart';
import 'package:tr_app/view/Master/absent&late/set_absent_teacher.dart';

class Teacher_tile extends StatelessWidget {
  final EmployeeModel liststudent;

  const Teacher_tile(this.liststudent);
  @override
  Widget build(BuildContext context) {
    return Center(
        child: MaterialButton(
      onPressed: () {
        Get.to(() => Absenteacher(),
            arguments: [liststudent.id, liststudent.fullName]);
      },
      child: Container(
        height: 60,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              liststudent.fullName,
              style: const TextStyle(
                  fontSize: 20,
                  color: Colors.black87,
                  fontWeight: FontWeight.bold),
            ),
            const Icon(
              Icons.person,
              size: 35,
              color: primaryColorS,
            )
          ],
        ),
      ),
    ));
  }
}
