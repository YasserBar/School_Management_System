import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tr_app/controller/set_mark_controller.dart';
import 'package:tr_app/model/student_model.dart';
import 'package:tr_app/res/color.dart';

class Student_tile extends StatelessWidget {
  final StudentModel liststudent;
  final TextEditingController textcontroller;
  const Student_tile(this.liststudent, this.textcontroller);
  @override
  Widget build(BuildContext context) {
  var markcontroller = Get.put(MarkController());
    Size size = MediaQuery.of(context).size;

    return Center(
        child: Container(
      height: 60,
      width: size.width,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Expanded(
            flex: 2,
            child: Icon(
              Icons.person,
              color: primaryColorS,
            ),
          ),
          Expanded(
            flex: 4,
            child: Container(
              height: 40,
              width: 80,
              decoration: BoxDecoration(
                color: primarylightColorS,
                borderRadius: BorderRadius.circular(20),
              ),
              child: TextFormField(
                textAlign: TextAlign.center,
                controller: textcontroller,
                keyboardType: TextInputType.number,
                cursorColor: primaryColorS,
                decoration: const InputDecoration(border: InputBorder.none),
                validator: (val) {
                  return markcontroller.validateMark(val!);
                },
                textInputAction: TextInputAction.next,
              ),
            ),
          ),
          Expanded(
            flex: 6,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: FittedBox(
                alignment: Alignment.center,
                child: Text(
                  liststudent.fullName,
                  style: const TextStyle(
                      color: Colors.black87,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
