import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tr_app/model/student_model.dart';
import 'package:tr_app/view/Teacher/note/set_note_student.dart';
import 'package:tr_app/res/color.dart';

class Studentn_tile extends StatelessWidget {
  String type;
  final StudentModel liststudent;
  Studentn_tile(this.liststudent, this.type, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Center(
        child: MaterialButton(
      onPressed: () {
        if (type == "note") {
          Get.off(() => NoteStudent(),
              arguments: [liststudent.id, liststudent.fullName]);
        }
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
