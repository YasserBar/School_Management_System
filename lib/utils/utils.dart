import 'package:flutter/material.dart';
import 'package:another_flushbar/flushbar.dart';
import 'package:another_flushbar/flushbar_route.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Utils { 



//////////////// focus next felid in form ///////////////////
  static void fieldFocusChange(BuildContext context , FocusNode current , FocusNode nextFocus){
    current.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

//////////////// Text Direction by input text ////////////////////////////
  static TextDirection getDirection(String v) {
  final string = v.trim();
  if (string.isEmpty) return TextDirection.ltr;
  final firstUnit = string.codeUnitAt(0);
  if (firstUnit > 0x0600 && firstUnit < 0x06FF ||
      firstUnit > 0x0750 && firstUnit < 0x077F ||
      firstUnit > 0x07C0 && firstUnit < 0x07EA ||
      firstUnit > 0x0840 && firstUnit < 0x085B ||
      firstUnit > 0x08A0 && firstUnit < 0x08B4 ||
      firstUnit > 0x08E3 && firstUnit < 0x08FF ||
      firstUnit > 0xFB50 && firstUnit < 0xFBB1 ||
      firstUnit > 0xFBD3 && firstUnit < 0xFD3D ||
      firstUnit > 0xFD50 && firstUnit < 0xFD8F ||
      firstUnit > 0xFD92 && firstUnit < 0xFDC7 ||
      firstUnit > 0xFDF0 && firstUnit < 0xFDFC ||
      firstUnit > 0xFE70 && firstUnit < 0xFE74 ||
      firstUnit > 0xFE76 && firstUnit < 0xFEFC ||
      firstUnit > 0x10800 && firstUnit < 0x10805 ||
      firstUnit > 0x1B000 && firstUnit < 0x1B0FF ||
      firstUnit > 0x1D165 && firstUnit < 0x1D169 ||
      firstUnit > 0x1D16D && firstUnit < 0x1D172 ||
      firstUnit > 0x1D17B && firstUnit < 0x1D182 ||
      firstUnit > 0x1D185 && firstUnit < 0x1D18B ||
      firstUnit > 0x1D1AA && firstUnit < 0x1D1AD ||
      firstUnit > 0x1D242 && firstUnit < 0x1D244) {
    return TextDirection.rtl;
  }
  return TextDirection.ltr;
}


  static toastMessage(String message){
    Fluttertoast.showToast(
        msg: message,
    backgroundColor: Colors.black,
      textColor: Colors.white,

    );
  }

  static void flushBarErrorMessage(String message, BuildContext context){

  showFlushbar(context: context,
      flushbar: Flushbar(
        forwardAnimationCurve:Curves.decelerate,
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        padding: const EdgeInsets.all(15),
        message: message,
        duration: const Duration(seconds: 3),
        borderRadius: BorderRadius.circular(8),
        flushbarPosition: FlushbarPosition.TOP,
        backgroundColor: Colors.red,
        reverseAnimationCurve: Curves.easeInOut,
        positionOffset: 20,
        icon: const Icon(Icons.error , size: 28 , color: Colors.white,),
      )..show(context),
    );
  }


  static void flushBarSuccessfulMessage(String message, BuildContext context){

    showFlushbar(context: context,
      flushbar: Flushbar(
        forwardAnimationCurve:Curves.decelerate,
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        padding: const EdgeInsets.all(15),
        message: message,
        duration: const Duration(seconds: 3),
        borderRadius: BorderRadius.circular(8),
        flushbarPosition: FlushbarPosition.TOP,
        backgroundColor: Colors.green,
        reverseAnimationCurve: Curves.easeInOut,
        positionOffset: 20,
        icon: const Icon(Icons.check_circle , size: 28 , color: Colors.white,),
      )..show(context),
    );
  }
}