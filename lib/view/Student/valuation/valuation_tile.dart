import 'package:flutter/material.dart';
import 'package:tr_app/model/valuation_model.dart';

class Valuation_tile extends StatelessWidget {
  final ModelValyation valuationlist;
  const Valuation_tile(this.valuationlist);
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
          child: Text(valuationlist.subject,
              maxLines: 1,
              style: TextStyle(
                overflow: TextOverflow.ellipsis,
                fontWeight: FontWeight.bold,
                color: Colors.deepPurple[900],
              )),
        ),
      ),
      Expanded(
        flex: 4,
        child: FittedBox(
          child: Text(valuationlist.lecture,
              maxLines: 1,
              style: const TextStyle(
                overflow: TextOverflow.ellipsis,
                color: Colors.deepPurple,
              )),
        ),
      ),
      Expanded(
        flex: 2,
        child: FittedBox(
          child: Text(valuationlist.description,
              maxLines: 1,
              style: TextStyle(
                overflow: TextOverflow.ellipsis,
                fontWeight: FontWeight.bold,
                color: Colors.deepPurple[900],
              )),
        ),
      ),
      Expanded(
        flex: 3,
        child: FittedBox(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(valuationlist.createdAt.toString().substring(0, 10),
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
