import 'package:another_flushbar/flushbar_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:another_flushbar/flushbar.dart';

class Utils{

  static toastMessage(String message) {
    Fluttertoast.showToast(msg: message);
  }

  static void flushBarErrorMessage (String message, BuildContext context) {
    showFlushbar(context: context,
      flushbar: Flushbar(
        forwardAnimationCurve: Curves.decelerate,
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
        padding: const EdgeInsets.all(15),
        message: message,
        duration: const Duration(seconds: 3),
        borderRadius: BorderRadius.circular(20),
        flushbarPosition: FlushbarPosition.TOP,
        backgroundColor: Colors.red,
        reverseAnimationCurve: Curves.easeInOut,
        positionOffset: 20,
        icon: const Icon(Icons.error, size: 20, color: Colors.white,),
      )..show(context),
    );
  }

    static snackBar(String message, BuildContext context){
      return ScaffoldMessenger.of (context) . showSnackBar (
          SnackBar(
            backgroundColor: Colors.red,
            content: Text (message))
          );
    }

    static fieldFocus(
        BuildContext context,
        FocusNode currentFocus,
        FocusNode nextFocus) {

    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
    }

}

