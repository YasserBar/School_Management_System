import 'package:flutter/material.dart';
import 'package:tr_app/model/mark_model.dart';

class Mark_tile extends StatelessWidget {
  final ModelMark listmark;
  const Mark_tile(this.listmark);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
      child: Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Expanded(
        flex: 2,
        child: FittedBox(
          child: Text(listmark.subject,
              maxLines: 1,
              style: TextStyle(
                overflow: TextOverflow.ellipsis,
                fontWeight: FontWeight.bold,
                color: Colors.deepPurple[900],
              )),
        ),
      ),
      Expanded(
        flex: 5,
        child: FittedBox(
          child: Text(listmark.type,
              maxLines: 1,
              style: const TextStyle(
                overflow: TextOverflow.ellipsis,
                color: Colors.deepPurple,
              )),
        ),
      ),
      Expanded(
        flex: 1,
        child: Text(listmark.mark,
            maxLines: 1,
            style: TextStyle(
              overflow: TextOverflow.ellipsis,
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.deepPurple[800],
            )),
      ),
      Expanded(
        flex: 3,
        child: FittedBox(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(listmark.createdAt.toString().substring(0, 10),
                  style: TextStyle(
                    color: Colors.deepPurple[400],
                  )),
              const SizedBox(
                width: 2.0,
              ),
              Icon(
                Icons.date_range_sharp,
                color: Colors.deepPurple[300],
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
