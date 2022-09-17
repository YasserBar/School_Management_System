// Press Back Button again to exit app

import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';


class ExitApp extends StatefulWidget {
  final Widget child;
  const ExitApp({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  State<ExitApp> createState() => _ExitAppState();
}


class _ExitAppState extends State<ExitApp> {

  DateTime timeBackPressed = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final difference = DateTime.now().difference(timeBackPressed);
        final isExitWarning = difference >= const Duration(seconds: 2);
        
        timeBackPressed = DateTime.now();

        if(isExitWarning){
          const message = 'Press back again to exit';
          Fluttertoast.showToast(msg: message, fontSize: 14);

          return false;
        }else{
          Fluttertoast.cancel();
          return true;
        }
      },
      child: widget.child,
    );
  }
}
