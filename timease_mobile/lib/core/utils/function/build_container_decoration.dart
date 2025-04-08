import 'package:flutter/material.dart';

import '../../../constants.dart';

BoxDecoration buildContainerDecoration() {
  return BoxDecoration(
    border: Border(
      right: BorderSide(color: kSecPrimaryColor.shade300, width: 1),
      top: BorderSide(
        color: kSecPrimaryColor.shade300,
        width: 0.6,
      ),
      bottom: BorderSide(color: kSecPrimaryColor.shade300, width: 1.2),
      left: BorderSide(color: kSecPrimaryColor.shade300, width: 1),
    ),
    boxShadow: [
      BoxShadow(
        color: Colors.grey.shade200,
        offset: const Offset(
          10.0,
          10.0,
        ),
        blurRadius: 5.0,
        spreadRadius: -5.0,
      ),
      BoxShadow(
        color: Colors.grey.shade200,
        offset: const Offset(
          10.0,
          -10.0,
        ),
        blurRadius: 1.0,
        spreadRadius: -10.0,
      ),
      BoxShadow(
        color: Colors.white,
      ),
    ],
    borderRadius: BorderRadius.circular(10),
  );
}
