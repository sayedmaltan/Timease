import 'package:flutter/material.dart';
import '../../../constants.dart';

BoxDecoration customBoxDecoration() {
  return BoxDecoration(
    border: Border.all(color: kSecPrimaryColor.shade400),
    boxShadow: [
      BoxShadow(
        color: Colors.grey,
        offset: Offset(0, 0),
        blurRadius: 20.0,
        spreadRadius: -7.0,
      ),
      BoxShadow(
        color: Colors.white,
        offset: Offset(0, 0),
        blurRadius: 20.0,
        spreadRadius: 0.0,
      ),
      BoxShadow(
        color: Colors.white,
      ),
    ],
    borderRadius: BorderRadius.circular(5),
  );
}
