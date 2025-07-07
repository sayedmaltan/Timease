import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void changeStatusBarColor() {
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: Colors.white24,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.dark,
    ),
  );
}