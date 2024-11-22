import 'package:flutter/material.dart';
import 'package:timease_mobile/constants.dart';

abstract class Styles {

  static const textStyleFullButton=TextStyle(
      color: Colors.white,
      fontSize: 18,
      fontWeight: FontWeight.w400);
  static const textStyleSpaceButton=TextStyle(
    color: kPrimaryColor,
    fontSize: 18,
  );
  static const customRowTextStyle = TextStyle(
      fontSize: 22,
      fontWeight: FontWeight.w700,
      color: kPrimaryColor
  );

  static const textStyle40 = TextStyle(
    fontSize: 42,
    fontWeight: FontWeight.w800,
  );

}
