import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tr_app/controller/get_lecture_controller.dart';
import 'package:tr_app/res/color.dart';

class AddLecture extends StatelessWidget {
  final Function addLectureCallback;

  AddLecture(this.addLectureCallback);

  var exa = Get.put(LectureController());
TextEditingController newLectureTitle = TextEditingController(); 
  @override
  Widget build(BuildContext context) {
  
    return Container(
      padding: const EdgeInsets.all(30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text('Lecture',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 30,
                color: primaryColorS,
                fontWeight: FontWeight.bold,
              )),
          TextField(
            autofocus: true,
            textAlign: TextAlign.center,
            controller: newLectureTitle,
          ),
          const SizedBox(height: 30),
          TextButton(
            onPressed: () {
              if(newLectureTitle.text.isEmpty){
                Get.back();
              }
              exa.addLecture(newLectureTitle.text);
              Get.back();
            },
            style: TextButton.styleFrom(
              backgroundColor: primaryColorS,
              primary: Colors.white,
            ),
            child: const Text('Add'),
          ),
        ],
      ),
    );
  }
}
