import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tr_app/controller/set_valuation_controller.dart';
import 'package:tr_app/model/student_model.dart';
import 'package:tr_app/res/color.dart';

class Valuation_tile extends StatelessWidget {

  var valuationcontroller = Get.put(ValuationController());
  final StudentModel valuationlist;
  final TextEditingController textcontroller;

  Valuation_tile(this.valuationlist, this.textcontroller, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    valuationcontroller.context = context;
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
                  return valuationcontroller.validateMark(val!);
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
                  valuationlist.fullName,
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

