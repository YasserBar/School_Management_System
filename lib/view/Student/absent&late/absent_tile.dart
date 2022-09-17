import 'package:flutter/material.dart';
import 'package:tr_app/model/absent_student_model.dart';
import 'package:tr_app/res/color.dart';

class Absent_tile extends StatelessWidget {
  final ModelAbsent absentlist;
  const Absent_tile(this.absentlist);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            flex: 2,
            child: Center(
              child: Text(absentlist.type,
                  style: const TextStyle(
                    fontSize: 20,
                    color: primaryColorS,
                  )),
            ),
          ),
          const Expanded(
            flex: 2,
            child: SizedBox(),
          ),
          Expanded(
            flex: 2,
            child: FittedBox(
              child: Row(
                children: [
                  Text(absentlist.createdAt.toString().substring(0, 10),
                      style: const TextStyle(
                        fontSize: 11,
                        color: primaryColorS,
                      )),
                  const SizedBox(
                    width: 2.0,
                  ),
                  const Icon(
                    Icons.date_range_sharp,
                    size: 15,
                    color: primaryColorS,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
