import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tr_app/controller/get_subject_controller.dart';
import 'package:tr_app/res/color.dart';

class AddSubjectScreen extends StatefulWidget {
  final Function addSubjectCallback;

  AddSubjectScreen(this.addSubjectCallback);

  @override
  State<AddSubjectScreen> createState() => _AddSubjectScreenState();
}

class _AddSubjectScreenState extends State<AddSubjectScreen> {
  var subj = Get.put(SubController());
  TextEditingController newSubjectTitle = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text('Subject',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 30,
                color: primaryColorS,
                fontWeight: FontWeight.bold,
              )),
          TextFormField(
            autofocus: true,
            textAlign: TextAlign.center,
            controller: newSubjectTitle,
          ),
          const SizedBox(height: 30),
          TextButton(
            onPressed: () {
              if (newSubjectTitle.text.isEmpty) {
                Get.back();
              }
              subj.addSubject(newSubjectTitle.text);
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
