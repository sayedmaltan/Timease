import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void customShowToast({required String msg}) {
  Fluttertoast.showToast(
    msg:  msg,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
    backgroundColor: Colors.green[2000],
    textColor: Colors.white,
  );
}
