import 'package:flutter/material.dart';
import 'package:tr_app/model/note_model.dart';

import '../../../res/color.dart';

class NoteStTile extends StatelessWidget {
  final ModelNote listnote;

  const NoteStTile(this.listnote);
  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();
    controller.text = listnote.note;
    return Center(
        child: Container(
      height: 60,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
      child: Row(
        children: [
          Expanded(
            flex: 4,
            child: Center(
              child: Text(listnote.note,
                  maxLines: 4,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: primaryColorS,
                  )),
            ),
          ),
          const Expanded(
            flex: 1,
            child: SizedBox(),
          ),
          Expanded(
            flex: 2,
            child: Center(
              child: Row(
                children: [
                  Text(listnote.createdAt.toString().substring(0, 10),
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
    ));
  }
}
